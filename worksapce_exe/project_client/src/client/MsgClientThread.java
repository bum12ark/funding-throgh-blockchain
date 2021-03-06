package client;

import java.io.File;
import java.util.StringTokenizer;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

import client.path.Path;
import client.util.Protocol;
import client.util.StringUtil;

public class MsgClientThread extends Thread {
	public Login login = null;
	private FileView fileView = null;
	boolean isStop = false;

	public MsgClientThread(Login login) {
		this.login = login;
	}

	@Override
	public void run() {
		System.out.println("MsgClientThread run메소드");
		String msg = null;
		while (!isStop) {
			try {
				msg = (String) login.ois.readObject();
				StringTokenizer stz = null;
				int protocol = 0;
				if (msg != null) {
					stz = new StringTokenizer(msg, Protocol.seperator);
					protocol = Integer.parseInt(stz.nextToken());
					System.out.println("프로토콜 : " + protocol);
				}
				switch (protocol) {
				case Protocol.LOGIN: {
					String loginResult = stz.nextToken();
					String isWalletExist = stz.nextToken();
					System.out.println("loginResult : " + loginResult);
					if ("0".equals(loginResult)) {
						JOptionPane.showMessageDialog(login, "아이디나 비밀번호를 확인하세요.");
					} else if ("중복로그인".equals(loginResult)) {
						JOptionPane.showMessageDialog(login, "중복 로그인입니다. 실패");
					} else { // 로그인이 됬을 경우
						login.setVisible(false);
						login.jtf_id.setText("");
						login.jpf_pw.setText("");
						fileView = new FileView(login);
						fileView.setTitle("Funding Through BlockChain");
						// 지갑 X
						if ("0".equals(isWalletExist)) {
							fileView.setWalletExist(false);
							fileView.jtf_public.setText("지갑을 생성하세요.");
							fileView.jtf_private.setText("지갑을 생성하세요.");
							// 지갑이 존재 할 경우 publicKey를 보내줌
						} else {
							fileView.setWalletExist(true);
							// 파일 뷰의 공개키 부분 텍스트 초기화
							fileView.jtf_public.setText(isWalletExist);
							fileView.jtf_private.setText("개인키를 입력하세요.");
						}

					}
				}
					break;
				case Protocol.EXIT: {
					isStop = true;
					if (login.ois != null)
						login.ois.close();
					if (login.oos != null)
						login.oos.close();
					if (login.mySocket != null)
						login.mySocket.close();
				}
					break;
				case Protocol.CHAIN_AUTHENTICATE_START: {
					String loginID = stz.nextToken();
					login.oos.writeObject(Protocol.CHAIN_AUTHENTICATE_START + Protocol.seperator + loginID);
				}
					break;
				case Protocol.BASE64_DECODE_EXCEPTION: {
					String loginID = stz.nextToken();
					int result = JOptionPane.showConfirmDialog(fileView, "클라이언트의 체인 파일이 손상되었습니다.\n 체인을 재 다운로드 받으시겠습니까?",
							"Confirm", JOptionPane.YES_NO_OPTION);
					if (result == JOptionPane.YES_OPTION) {
						// 서버의 체인 다운로드 진행 - 끝
						FileTransfer fileTransfer = new FileTransfer();
						fileTransfer.chainDown(loginID);
						fileTransfer = null;
						JOptionPane.showMessageDialog(fileView, "파일 다운이 완료 되었습니다.");
					}
				}
					break;
				case Protocol.NOT_HASH_VALID: {
					String loginID = stz.nextToken();
					int result = JOptionPane.showConfirmDialog(fileView,
							"클라이언트의 체인 해쉬값이 손상되었습니다.\n 체인을 재 다운로드 받으시겠습니까?", "Confirm", JOptionPane.YES_NO_OPTION);
					if (result == JOptionPane.YES_OPTION) {
						// 서버의 체인 다운로드 진행 - 끝
						FileTransfer fileTransfer = new FileTransfer();
						fileTransfer.chainDown(loginID);
						JOptionPane.showMessageDialog(fileView, "파일 다운이 완료 되었습니다.");
					}
				}
					break;
				case Protocol.ALREADY_SYNC: {
					JOptionPane.showMessageDialog(null, "이미 최신화된 체인입니다.", "Already", JOptionPane.INFORMATION_MESSAGE);
				}
					break;
				case Protocol.ADD_BLOCK: {
					String loginID = stz.nextToken();
					int result = JOptionPane.showConfirmDialog(null, "블록이 정상적으로 추가되었습니다.\n 해당 체인을 다운로드 받으시겠습니까?",
							"Confirm", JOptionPane.YES_NO_OPTION);
					if (result == JOptionPane.YES_OPTION) {
						FileTransfer fileTransfer = new FileTransfer();
						fileTransfer.chainDown(loginID);
						fileTransfer = null;
					} else {
						JOptionPane.showMessageDialog(null, "파일 다운로드에 실패했습니다.");
					}
				}
					break;
				case Protocol.DAMAGED_PRIVATE_KEY: {
					JOptionPane.showMessageDialog(fileView, "개인키가 손상되었습니다.");
				}
					break;
				case Protocol.VALIDATED_KEYS: {
					String privateBase64 = stz.nextToken();
					JOptionPane.showMessageDialog(fileView, "개인키가 성공적으로 입력되었습니다.");
					fileView.jtf_private.setText(privateBase64);
				}
					break;
				case Protocol.UNVERIFIED_KEY: {
					JOptionPane.showMessageDialog(fileView, "공개키와 개인키의 쌍이 맞지않습니다.");
				}
					break;
				case Protocol.SEND_NEW_KEYS: {
					String publicBase64 = stz.nextToken();
					String privateBase64 = stz.nextToken();
					int result = Integer.parseInt(stz.nextToken());
					StringUtil stringUtil = new StringUtil();
					stringUtil.mkDir(Path.KEY_DIRECTORY);
					// 저장
					if (result == 1) {
						JFileChooser jfc = new JFileChooser();
						jfc.setCurrentDirectory(new File("C:\\FTBC"));
						jfc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
						int ret = jfc.showDialog(fileView, "개인키 저장");
						if (ret == JFileChooser.APPROVE_OPTION) {
							StringBuilder path = new StringBuilder();
							path.append(jfc.getSelectedFile().toString());
							path.append("\\");
							path.append(login.loginID);
							stringUtil.saveTxt(publicBase64, path + ".puk");
							stringUtil.saveTxt(privateBase64, path + ".prk");
						}
						JOptionPane.showMessageDialog(fileView, "지갑이 성공적으로 생성되었습니다.");
						fileView.jtf_public.setText(publicBase64);
						fileView.jtf_private.setText(privateBase64);
						fileView.setWalletExist(true);
					} else if (result == 0) {
						JOptionPane.showMessageDialog(fileView, "일시적인 오류 발생. 다시 한번 시도해주세요.");
					}
				}
					break;
				case Protocol.AUTOSYNC_UPLOAD_START: {
					FileTransfer fct = new FileTransfer();
					fct.autoSyncChainUpload(login.loginID, this);
					fct = null;
				}
					break;
				// 자동동기화버튼 - 마지막 파일을 업로드할 경우
				case Protocol.AUTOSYNC_UPLOAD_START_LAST: {
					FileTransfer fileTransfer = new FileTransfer();
					fileTransfer.autoSyncChainUploadLast(login.loginID, this);
					fileTransfer = null;
				}
					break;
				case Protocol.AUTOSYNC_CHAIN_DOWNLOAD: {
					FileTransfer fileTransfer = new FileTransfer();
					fileTransfer.chainDown(login.loginID);
					fileTransfer = null;
				}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
