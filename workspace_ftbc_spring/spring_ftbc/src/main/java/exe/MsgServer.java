package exe;

import java.awt.Color;
import java.awt.Font;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import exe.util.Path;

public class MsgServer extends JFrame implements Runnable {
	ServerSocket sSocket = null;
	Socket cSocket = null;
	ServerMapping serverMapping = null;
	MsgServerThread mst = null;
	Map<String, MsgServerThread> globalMaps = new HashMap<>();
	// 파일 전송 시 자동체크박스가 되어있는 사람들을 관리하는 리스트
	// - FileView에 isCheck가 있지만 따로 만든 이유는 일정 주기마다 파일을 다운로드해야하는데
	// - 이곳에 추가하는 경우 파일을 업로드하고 다운로드하는 과정에서 시점 차이가 발생할 수 있기 때문
	public List<String> syncClientList = null;
	JTextArea jta_log = new JTextArea();
	JScrollPane jsp_log = new JScrollPane(jta_log);
	boolean isStop = false;
	
	public MsgServer(ServerMapping serverMapping) {
		this.initDisplay();
		this.serverMapping = serverMapping;
		new Thread(this).start();
	}
	
	public void initDisplay() {
		jta_log.setFont(new Font("SansSerif", Font.PLAIN, 20));
		jta_log.setEditable(false);
		jta_log.getCaret().setSelectionVisible(true);
		jta_log.setCaretColor(Color.white);
		jta_log.getCaret().setBlinkRate(300);
		jta_log.getCaret().setVisible(true);
		jta_log.setForeground(Color.white);
		jta_log.setBackground(Color.black);
		jta_log.append("Microsoft Windows [Version 10.0.17763.615]"+"\n");
		jta_log.append("(c) 2019 FTBC Corporation. All rights reserved.sangbum go soju"+"\n");
        jta_log.append("\n");
		this.add(jsp_log);
		this.setTitle("메세지 서버 측 로그 출력창");
		this.setSize(900, 800);
		this.setLocation(800, 0);
		this.setVisible(true);
	}

	@Override
	public void run() {
		try {
			sSocket = new ServerSocket(Path.MSG_SERVER_PORT);
			jta_log.setCaretPosition(jta_log.getDocument().getLength());
			while(!isStop) {
//				jta_log.append("MsgServer wating...\n");
				cSocket = sSocket.accept();
				mst = new MsgServerThread(this);
				mst.start();
//				jta_log.append("C:\\\\MsgServer> 접속: "+cSocket.toString()+"\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
