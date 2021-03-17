package exe;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.StringTokenizer;

import exe.util.Protocol;

public class MsgServletThread extends Thread {
	Socket alertSocket = null;
	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	boolean isStop = false;
	
	public MsgServletThread(Socket alertSocket, ObjectOutputStream oos, ObjectInputStream ois) {
		this.alertSocket = alertSocket;
		this.oos = oos;
		this.ois = ois;
	}
	
	@Override
	public void run() {
		String msg = null;
		StringTokenizer stz = null;
		int protocol = 0;
		while(!isStop) {
			try {
				msg = (String) ois.readObject();
				if (msg != null) {
					stz = new StringTokenizer(msg, Protocol.seperator);
					protocol = Integer.parseInt(stz.nextToken());
				}
				switch (protocol) {
				case Protocol.SERVLET_DISCONNECT:
					isStop = true;
					if(ois != null) ois.close();
					if(oos != null) oos.close();
					if(alertSocket != null) alertSocket.close();
					System.out.println("##서블릿 스레드 종료");
				}
				break;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
