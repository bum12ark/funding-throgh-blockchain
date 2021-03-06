package client;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.Socket;

import client.path.Path;
import client.util.Protocol;

public class FileTransfer {
	private int bufferSize = 4092;
	
	// 파일 업로드
	public void autoSyncChainUpload(String loginID, MsgClientThread mct) {
		try {
			System.out.println("##autoSyncChainUpload");
			Socket fileSocket = new Socket(Path.SERVER_IP, Path.FILE_SERVER_PORT);
			DataInputStream dis = new DataInputStream(new BufferedInputStream(fileSocket.getInputStream()));
			DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(fileSocket.getOutputStream()));
			FileClientThread fct = new FileClientThread(fileSocket, dis, dos);
			fct.start();
			//
			dos.writeUTF(Protocol.AUTOSYNC_CHAIN_UPLOAD
					+Protocol.seperator+loginID);
			dos.flush();
			// 파일 사이즈 보내기
			File file = new File(Path.CHAIN_DIRECTORY+loginID+"_Chain.ftbc");
			dos.writeLong(file.length());
			dos.flush();
			//
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
	}
	// 체인 동기화 버튼 - 체인 업로드
	public void chainSyncUpload(String loginID) {
		try {
			System.out.println("##chainSyncUpload");
			Socket fileSocket = new Socket(Path.SERVER_IP, Path.FILE_SERVER_PORT);
			DataInputStream dis = new DataInputStream(new BufferedInputStream(fileSocket.getInputStream()));
			DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(fileSocket.getOutputStream()));
			FileClientThread fct = new FileClientThread(fileSocket, dis, dos);
			fct.start();
			//
			dos.writeUTF(Protocol.CHAIN_SYNC_UPLOAD
					+Protocol.seperator+loginID);
			dos.flush();
			// 파일 사이즈 보내기
			File file = new File(Path.CHAIN_DIRECTORY+loginID+"_Chain.ftbc");
			dos.writeLong(file.length());
			dos.flush();
			//
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
	}
	// 자동 동기화 체크박스 체크 되있을 시 업로드 마지막 파일
	public void autoSyncChainUploadLast(String loginID, MsgClientThread mct) {
		try {
			System.out.println("##autoSyncChainUploadLast");
			Socket fileSocket = new Socket(Path.SERVER_IP, Path.FILE_SERVER_PORT);
			DataInputStream dis = new DataInputStream(new BufferedInputStream(fileSocket.getInputStream()));
			DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(fileSocket.getOutputStream()));
			FileClientThread fct = new FileClientThread(fileSocket, dis, dos);
			fct.start();
			//
			dos.writeUTF(Protocol.AUTOSYNC_CHAIN_UPLOAD_END
					+Protocol.seperator+loginID);
			dos.flush();
			
			// 파일 사이즈 보내기
			File file = new File(Path.CHAIN_DIRECTORY+loginID+"_Chain.ftbc");
			dos.writeLong(file.length());
			dos.flush();
			//
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
	}
	
	// 클라이언트가 서버로 공유 체인을 요구
	public void chainDown(String loginID) {
		try {
			System.out.println("##chainDown");
			Socket fileSocket = new Socket(Path.SERVER_IP, Path.FILE_SERVER_PORT);
			DataInputStream dis = new DataInputStream(new BufferedInputStream(fileSocket.getInputStream()));
			DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(fileSocket.getOutputStream()));
			FileClientThread fct = new FileClientThread(fileSocket, dis, dos);
			fct.start();
			dos.writeUTF(Protocol.CHAIN_SYNC_DOWNLOAD
					+Protocol.seperator+loginID);
			dos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
