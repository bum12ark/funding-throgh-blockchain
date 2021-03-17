package client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.Socket;
import java.util.StringTokenizer;

import client.path.Path;
import client.util.Protocol;

public class FileClientThread extends Thread {
	private Socket socket;
	private DataInputStream dis;
	private DataOutputStream dos;
	private boolean isStop = false;
	private String msg;
	private StringTokenizer stz;
	private int protocol;
	private int bufferSize = 4092;
	
	public FileClientThread(Socket socket, DataInputStream dis, DataOutputStream dos) {
		this.socket = socket;
		this.dis = dis;
		this.dos = dos;
		System.out.println("FileClientThread 생성자");
	}
	private void uploadEnd() {
		try {
			isStop = true;
			if(dis != null) dis.close();
			if(dos != null) dos.close();
			if(socket != null) socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void run() {
		while (!isStop) {
			try {
				msg = dis.readUTF();
				if (msg != null && msg.length() > 0) {
					System.out.println("메세지 : " + msg + "\n");
					stz = new StringTokenizer(msg, Protocol.seperator);
					protocol = Integer.parseInt(stz.nextToken());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			switch (protocol) {
			case Protocol.CHAIN_SYNC_DOWNLOAD: {
				try {
					String loginID = stz.nextToken();
					System.out.println("##CHAIN_SYNC_DOWNLOAD");
					
					long fileSize = dis.readLong();
					byte[] buffer = new byte[bufferSize];
					int len = 0;
					System.out.println("fileSize : "+fileSize);
					
					File file = new File(Path.CHAIN_DIRECTORY+loginID+"_Chain.ftbc");
					FileOutputStream fos = new FileOutputStream(file);
					
					while(fileSize > 0
							&& (len = dis.read(buffer, 0, (int)Math.min(buffer.length, fileSize))) != -1) {
						fos.write(buffer, 0, len);
						fileSize -= len;
					}
					fos.flush();
					fos.close();
					
					dos.writeUTF(Protocol.DOWNLOAD_END + Protocol.seperator + loginID);
					
					isStop = true;
					dos.flush();
					if(dos != null) dos.close();
					if(dos != null) dis.close();
					if(socket != null) socket.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				break;
			case Protocol.UPLOAD_END: {
				System.out.println("##파일클라이언트 스레드_UPLOAD_END");
				this.uploadEnd();
				System.out.println(socket.toString()+"연결 종료");
			}
				break;
			}

		}
	}
}