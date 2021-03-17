package client.util;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;

import javax.swing.JOptionPane;

import client.FileClientThread;
import client.FileView;
import client.Login;
import client.MsgClientThread;
import client.path.Path;

public class StringUtil {
	public void mkDir(String path) {
		File Folder = new File(path);
		if(!Folder.exists()) {
			try {
				Folder.mkdir();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}
	public boolean isFile(String loginID, String path) {
		System.out.println("[isFile] : "+path+loginID+"_Chain.ftbc");
		File blockChainFile = new File(path+loginID+"_Chain.ftbc");
		if(!blockChainFile.isFile()) {
			return false;
		} else {
			return true;
		}
		
	}
	public String importPrivateKey(String userID, String path) throws NullPointerException, IOException {
		FileInputStream fileStream = null;
		try {
			fileStream = new FileInputStream(path);
			byte[] readBuffer = new byte[fileStream.available()];
			while (fileStream.read(readBuffer) != -1) {}
			String base64 = new String(readBuffer);
			return base64;
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			fileStream.close();
		}
		return null;
	}
	public void saveTxt(String targetStr, String path) throws IOException {
		// 문자열 txt파일로 저장
		String afterPath = path;
		System.out.println("path : "+path);
		if(path.contains(".puk") || path.contains(".prk")) {
			String str = afterPath.substring(afterPath.indexOf("."), afterPath.lastIndexOf("."));
			afterPath = afterPath.replace(str, "");
		}
		System.out.println("afterPath : "+afterPath);
		BufferedOutputStream bufferedOutputStream = null;
		try {
			bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(afterPath));
			bufferedOutputStream.write(targetStr.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			bufferedOutputStream.close();
		}
	}
}
