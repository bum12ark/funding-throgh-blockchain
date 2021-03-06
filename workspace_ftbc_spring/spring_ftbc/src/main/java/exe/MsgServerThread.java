package exe;

import java.io.File;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;

import org.apache.commons.io.FileUtils;

import blockchain.AuthChain;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.StringUtil;
import exe.mvc.ExeController;
import exe.util.Path;
import exe.util.Protocol;
import vo.MemberVO;

public class MsgServerThread extends Thread {
	MsgServer msgServer = null;
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	String loginID = null;
	boolean isStop = false;
	// 자동 체크박스 동기화 유무 확인 - 초기값은 항상 체크되있다.
	boolean isCheck = true;
	
	public MsgServerThread(MsgServer msgServer) {
		this.msgServer = msgServer;
		try {
			oos = new ObjectOutputStream(msgServer.cSocket.getOutputStream());
			ois = new ObjectInputStream(msgServer.cSocket.getInputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void send(String msg) {
		try {
			oos.writeObject(msg);
			oos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void servletDisconnect() {
		try {
			isStop = true;
			if (ois != null)
				ois.close();
			if (oos != null)
				oos.close();
			if (msgServer.cSocket != null)
				msgServer.cSocket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void appendLog(String msg) {
		msgServer.jta_log.append("C:\\\\MsgServer> "+msg + "\n");
	}

	@Override
	public void run() {
		try {
			while (!isStop) {
				String msg = (String) ois.readObject();
				int protocol = 0;
				StringTokenizer stz = null;
				if (msg != null) {
					stz = new StringTokenizer(msg, "|");
					protocol = Integer.parseInt(stz.nextToken());
				}
				switch (protocol) {
				case Protocol.LOGIN: {
					this.loginID = stz.nextToken();
					String password = stz.nextToken();
					password = StringUtil.applySha256(password);
					ExeController exeController = new ExeController(ExeController.EXE_LOGIN);
					MemberVO memberVO = new MemberVO();
					memberVO.setMem_email(loginID);
					memberVO.setMem_pw(password);
					exeController.send(memberVO);
					String loginResult = memberVO.getResult();
					String isWalletExist = memberVO.getIsWalletExist();
					if (loginID.equals(loginResult)) {
						// 로그인 할 시 자동 체크박스 활성화
						isCheck = true;
						Object keys[] = msgServer.globalMaps.keySet().toArray();
						for (int i = 0; i < msgServer.globalMaps.size(); i++) {
							if (keys[i].equals(loginID)) {
								loginResult = "중복로그인";
								break;
							}
						}
						msgServer.globalMaps.put(loginID, this);
						System.out.println("글로벌 맵 사이즈 : " + msgServer.globalMaps.size());
					}
					this.send(Protocol.LOGIN + Protocol.seperator + loginResult + Protocol.seperator + isWalletExist);
					memberVO = null;
					exeController = null;
				}
					break;
				case Protocol.EXIT: {
					msgServer.globalMaps.remove(loginID);
					this.send(Protocol.EXIT+Protocol.seperator+loginID);
					isStop = true;
					if (oos != null)
						oos.close();
					if (ois != null)
						ois.close();
					if (msgServer.cSocket != null)
						msgServer.cSocket.close();
				}
					break;
				case Protocol.CHAIN_AUTHENTICATE_START: {
					boolean isHashValid = false;
					boolean isEqual = false;
					AuthChain authChain = new AuthChain();
					// 파일 검사 부
					try {
						authChain.decodeInitialization(loginID);
					} catch (Exception e) {
						this.send(Protocol.BASE64_DECODE_EXCEPTION + Protocol.seperator + loginID);
						break;
					}
					try {
						isHashValid = authChain.isHashValid();
						if (isHashValid == false) {
							this.send(Protocol.NOT_HASH_VALID + Protocol.seperator + loginID);
							break;
						}
						// 두 체인의 사이즈 비교
						isEqual = authChain.isChainComparation(loginID);
						if (isEqual) {
							this.send(Protocol.ALREADY_SYNC + Protocol.seperator + loginID);
						} else {
							this.send(Protocol.ADD_BLOCK + Protocol.seperator + loginID);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				case Protocol.SEND_KEY_PAIR: {
					String publicBase64 = stz.nextToken();
					String privateBase64 = stz.nextToken();
					// 공개키와 개인키의 짝이 맞는지 확인후 박아주기
					PublicKey publicKey = null;
					PrivateKey privateKey = null;
					try {
						publicKey = (PublicKey) Base64Conversion.decodeBase64(publicBase64);
						privateKey = (PrivateKey) Base64Conversion.decodeBase64(privateBase64);
					} catch (Exception e) {
						// 사용자가 보낸 개인키가 올바르지 않을 경우
						this.send(Protocol.DAMAGED_PRIVATE_KEY + Protocol.seperator);
					}
					if (StringUtil.isValidKeys(publicKey, privateKey)) {
						this.send(Protocol.VALIDATED_KEYS + Protocol.seperator + privateBase64);
					} else {
						this.send(Protocol.UNVERIFIED_KEY + Protocol.seperator);
					}
				}
					break;
				case Protocol.CREATE_NEW_WALLET: {
					// 지갑 생성
					Wallet wallet = new Wallet();
					wallet.generateKeyPair();
					// base64 코드 보내기
					String publicBase64 = Base64Conversion.encodePublicKey(wallet.getPublicKey());
					String privateBase64 = Base64Conversion.encodePrivateKey(wallet.getPrivateKey());
					ExeController exeController = new ExeController(ExeController.UPDATE_PUBLIC_KEY);
					MemberVO memberVO = new MemberVO();
					memberVO.setMem_email(this.loginID);
					memberVO.setMem_publickey(publicBase64);
					exeController.send(memberVO);
					int result = Integer.parseInt(memberVO.getResult());
					this.send(Protocol.SEND_NEW_KEYS 
							+ Protocol.seperator + publicBase64 
							+ Protocol.seperator + privateBase64
							+ Protocol.seperator + result);
				}
					break;
				case Protocol.CHECKBOX_CHECK: {
					this.isCheck = true;
					appendLog("클라이언트가 체크박스 선택!");
				}
					break;
				case Protocol.CHECKBOX_UNCHECK: {
					this.isCheck = false;
					appendLog("클라이언트가 체크박스 선택해제!");
				}
					break;
				case Protocol.ALERT_ADD_BLOCK: {
					appendLog("#1~2번. 서블릿에서 온 블록 추가 신호!!");
					// 커넥션을 맺은 Servlet과 연결 종료 (자원 반납)
					this.send(Protocol.SERVLET_DISCONNECT+Protocol.seperator);
					this.servletDisconnect();
					// globalMaps - 현재 블록체인에 접속해있는 사용자들의 스레드가 담겨있다.
					Map<String, MsgServerThread> globalMaps = msgServer.globalMaps;
					// syncClientList - 자동 동기화 체크박스가 되어있는 사용자들만 담아주는 컬렉션 선언
					msgServer.syncClientList = new Vector<>();
					if (globalMaps != null) {
						Object keys[] = globalMaps.keySet().toArray();
						msgServer.syncClientList = new Vector<String>();
						for (int i = 0; i < globalMaps.size(); i++) {
							MsgServerThread msgServerThread = globalMaps.get(keys[i]);
							if (msgServerThread.isCheck) { // 자동동기화 체크박스가 되어있니?
								msgServer.syncClientList.add(msgServerThread.loginID);
								if (i == globalMaps.size()-1) { // 마지막 파일일 경우
									this.appendLog("#3번. 마지막 노드에게 체인 업로드 알림 전송"); 
									msgServerThread.send(Protocol.AUTOSYNC_UPLOAD_START_LAST + Protocol.seperator
											+ msgServerThread.loginID);
									// 프로토콜이 가는 속도를 늦춤
									Thread.sleep(250);
								} else {
									this.appendLog("#3번. "+i+"번 째 노드 체인 업로드 알림전송"); 
									msgServerThread.send(Protocol.AUTOSYNC_UPLOAD_START + Protocol.seperator
											+ msgServerThread.loginID);
									Thread.sleep(250);
								}
							}
						}
					}
				}
					break;
				case Protocol.AUTOSYNC_CHAIN_DOWNLOAD_ALERT: {
					appendLog("#7번. 공유체인에 블록 추가 완료!");
					appendLog("#8번. 노드들에게 블록이 추가된 공유체인 다운로드 알림!!");
					this.send(Protocol.SERVLET_DISCONNECT+Protocol.seperator);
					this.servletDisconnect();
					// # 자동동기화 체크박스 되어잇는 사람들 체인 다운로드
					Map<String, MsgServerThread> globalMaps = msgServer.globalMaps;
					if (globalMaps != null) {
						Object keys[] = globalMaps.keySet().toArray();
						for (int i = 0; i < globalMaps.size(); i++) {
							MsgServerThread msgServerThread = globalMaps.get(keys[i]);
							if (msgServerThread.isCheck) {
								// 자동동기화 체크박스가 되있는 클라이언트들에게 파일 다운로드 - 다운로드 시킬때는 다 다운로드 시킨다.
								this.appendLog("#9번. "+i+" 번째 노드에게 공유체인 다운로드 알림.");
								msgServerThread.send(Protocol.AUTOSYNC_CHAIN_DOWNLOAD + Protocol.seperator);
								MsgServerThread.sleep(250);
							}
						}
					}
				}
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
