package exe;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;


import blockchain.util.MajorityElement;
import blockchain.util.URLConnection;
import exe.util.Path;
import exe.util.Protocol;

public class FileServerThread extends Thread {
	FileServer fserver = null;
	DataInputStream dis = null;
	DataOutputStream dos = null;
	
	String loginID = null;
	boolean isStop = false;
	int bufferSize = 4092;
	///
	public FileServerThread(FileServer fserver) {
		this.fserver = fserver;
		try {
			dis = new DataInputStream(new BufferedInputStream(fserver.fcSocket.getInputStream()));
			dos = new DataOutputStream(new BufferedOutputStream(fserver.fcSocket.getOutputStream()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void appendLog(String msg) {
		fserver.jta_log.append("C:\\\\FileServer> "+msg + "\n");
	}
	public void msgServerSend(String msg) {
		try {
			// 파일 무결성 검사를 위한 통신
			Map<String, MsgServerThread> msgMaps = fserver.serverMapping.msgServer.globalMaps;
			Object keys[] = msgMaps.keySet().toArray();
			for (int i = 0; i < msgMaps.size(); i++) {
				if (loginID.equals(keys[i])) {
					MsgServerThread msgThread = msgMaps.get(keys[i]);
					msgThread.oos.writeObject(msg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		StringTokenizer stz = null;
		int protocol = 0;
		while (!isStop) {
			try {
				String msg = dis.readUTF();
				if (msg != null) {
					// fserver.jta_log.append("메세지 : " + msg + "\n");
					stz = new StringTokenizer(msg, "|");
					protocol = Integer.parseInt(stz.nextToken());
				}
				switch (protocol) {
				case Protocol.CHAIN_SYNC_UPLOAD: {
					try {
						this.loginID = stz.nextToken();
						///
						long fileSize = dis.readLong();
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						File file = new File(Path.CLIENT_CHAIN_PATH + loginID + "_Chain.ftbc");
						FileOutputStream fos = new FileOutputStream(file);

						while (fileSize > 0
								&& (len = dis.read(buffer, 0, (int) Math.min(buffer.length, fileSize))) != -1) {
							fos.write(buffer, 0, len);
							fileSize -= len;
						}
						fos.flush();
						fos.close();
						dos.writeUTF(Protocol.UPLOAD_END + Protocol.seperator + loginID);
						isStop = true;
						dos.flush();
						dos.close();
						dis.close();
						fserver.fcSocket.close();
						this.msgServerSend(Protocol.CHAIN_AUTHENTICATE_START + Protocol.seperator + loginID);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				// 서버의 체인을 클라이언트에 다운로드 시킬 때
				case Protocol.CHAIN_SYNC_DOWNLOAD: {
					try {
						loginID = stz.nextToken();
						appendLog("#10번. 노드에서 온 체인파일 요청.");
						dos.writeUTF(Protocol.CHAIN_SYNC_DOWNLOAD + Protocol.seperator + loginID);
						appendLog("#11번. 노드에게 공유체인 파일 전송.");
						File file = new File(Path.SERVER_ABSOLUTE_PATH);
						dos.writeLong(file.length());
						dos.flush();
						
						FileInputStream fis = new FileInputStream(file);
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						
						while((len = fis.read(buffer)) != -1) {
							dos.write(buffer, 0, len);
						}
						dos.flush();
						fis.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				} //////////////// end of FILE DOWNLOAD
					break;
				case Protocol.DOWNLOAD_END: {
					// fserver.jta_log.append("##DOWNLOAD_END \n");
					isStop = true;
					if(dis != null) dis.close();
					if(dos != null) dos.close();
					if(fserver.fcSocket != null) fserver.fcSocket.close();
					// fserver.jta_log.append(fserver.fcSocket.toString()+" 연결 종료 \n");
				}
					break;
				case Protocol.AUTOSYNC_CHAIN_UPLOAD: {
					try {
						this.loginID = stz.nextToken();
						appendLog("#4번. 서버에 노드의 체인 업로드");
						///
						long fileSize = dis.readLong();
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						File file = new File(Path.MAJORITY_CHAINS + loginID + "_Chain.ftbc");
						FileOutputStream fos = new FileOutputStream(file);

						while (fileSize > 0
								&& (len = dis.read(buffer, 0, (int) Math.min(buffer.length, fileSize))) != -1) {
							fos.write(buffer, 0, len);
							fileSize -= len;
						}
						fos.flush();
						fos.close();
						dos.writeUTF(Protocol.UPLOAD_END + Protocol.seperator + loginID);
						isStop = true;
						dos.flush();
						dos.close();
						dis.close();
						fserver.fcSocket.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				case Protocol.AUTOSYNC_CHAIN_UPLOAD_END: {
					try {
						this.loginID = stz.nextToken();
						appendLog("#4번. 서버에 마지막 노드의 체인 업로드");
						///
						long fileSize = dis.readLong();
						byte[] buffer = new byte[bufferSize];
						int len = 0;
						File file = new File(Path.MAJORITY_CHAINS + loginID + "_Chain.ftbc");
						FileOutputStream fos = new FileOutputStream(file);

						while (fileSize > 0
								&& (len = dis.read(buffer, 0, (int) Math.min(buffer.length, fileSize))) != -1) {
							fos.write(buffer, 0, len);
							fileSize -= len;
						}
						fos.flush();
						fos.close();
						dos.writeUTF(Protocol.UPLOAD_END + Protocol.seperator + loginID);
						isStop = true;
						dos.flush();
						dos.close();
						dis.close();
						fserver.fcSocket.close();
						//
						if (fileSize == 0) {
							appendLog("#5번. 모든 노드들의 체인 업로드가 완료되었습니다.");
							List<String> syncClientList = fserver.serverMapping.msgServer.syncClientList;
							MajorityElement me = new MajorityElement();
							appendLog("#5번. Boyer-Moore 과반수 알고리즘 적용 중.");
							if(me.majorityElement(syncClientList)) appendLog("#5번. 과반수 체인이 채택되었습니다.");
							fserver.serverMapping.msgServer.syncClientList = null;
							URLConnection urlConnection = URLConnection.getInstance();
							urlConnection.URLCall("restchain/addBlock.ftbc");
							appendLog("#6번. 공유 체인이 채택! Servlet으로 체인에 블록 추가 알림 전송.");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}