package client;

import java.awt.Color;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import client.path.Path;
import client.util.Protocol;

public class Login extends JFrame implements ActionListener, KeyListener {
	// private ImageIcon ig = new ImageIcon(FilePath.SrcPath+"main.PNG");
	//폰트 추가하기
	private JPanel jp_main = new JPanel();
	
	JTextField jtf_id = new JTextField();
	JPasswordField jpf_pw = new JPasswordField();
	private JButton jbtn_login = new JButton(new ImageIcon(Path.LOGIN_SKIN_DIRECTORY+"FTBC_login.png"));
	private JButton jbtn_exit = new JButton(new ImageIcon(Path.LOGIN_SKIN_DIRECTORY+"FTBC_exit.png"));
	private JLabel jl_logo = new JLabel();
	private JLabel jl_id = new JLabel("ID");
	private JLabel jl_pw = new JLabel("PW");
	
	
	public String loginID = null;
	private String passward = null;
	
	public Socket mySocket = null;
	public ObjectOutputStream oos = null;
	public ObjectInputStream ois = null;
	public MsgClientThread mct = null;

	public Login() {
		initDisplay();
	}
	public void initDisplay() {
		jbtn_exit.addActionListener(this);
		jbtn_login.addActionListener(this);
		jtf_id.addKeyListener(this);
		jpf_pw.addKeyListener(this);
		this.addKeyListener(this);
		
		jbtn_login.setBorderPainted(false);
		jbtn_login.setContentAreaFilled(false);
		jbtn_exit.setBorderPainted(false);
		jbtn_exit.setContentAreaFilled(false);
		
		ImageIcon img = new ImageIcon(Path.FILE_SKIN_DIRECTORY+"FTBC_logo.png");
		Image originImg = img.getImage();
		jp_main.setLayout(null);
		jl_logo.setIcon(new ImageIcon(originImg));
		
		jl_logo.setBounds(75, 0, 250, 400);
		jtf_id.setBounds(110, 400, 200, 40);
		jpf_pw.setBounds(110, 445, 200, 40);
		jl_id.setBounds(70, 405, 30, 30);
		jl_pw.setBounds(70, 450, 30, 30);
		jbtn_login.setBounds(90, 500, 100, 30);
		jbtn_exit.setBounds(205, 500, 100, 30);
		jp_main.setBackground(Color.white);
		jp_main.add(jbtn_login);
		jp_main.add(jbtn_exit);
		jp_main.add(jl_logo);
		jp_main.add(jtf_id);
		jp_main.add(jpf_pw);
		jp_main.add(jl_id);
		jp_main.add(jl_pw);
		ImageIcon topLogo = new ImageIcon(Path.LOGIN_SKIN_DIRECTORY+"FTBC_topLogo.png");
		Image topLogoimg = topLogo.getImage();
		this.setIconImage(topLogoimg);
		this.add(jp_main);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(400, 650);
		this.setTitle("Funding Through BlockChain");
		this.setVisible(true);
		this.setLocation(800, 250);
		
	}
	//** 로그인 처리 메소드
	public void login() {
		//사용자가 입력한 아이디와 비밀번호 가져오기3
		loginID = jtf_id.getText();
		passward = jpf_pw.getText();
		
		if (loginID==null || loginID.length()==0) {
			JOptionPane.showMessageDialog(this, "아이디를 입력하세요.");
			return;
		}
		else if (passward==null || passward.length()==0) {
			JOptionPane.showMessageDialog(this, "비번을 입력하세요.");
			return;
		}
		this.connect_process();
	}
	//서버로 접속하는 메소드
	public void connect_process() {
		//통신은 지연이 발생할 수 있으므로 항상 예외처리 할 것.
		try {
			mySocket = new Socket(Path.SERVER_IP, Path.MSG_SERVER_PORT);
			ois = new ObjectInputStream(mySocket.getInputStream());
			oos = new ObjectOutputStream(mySocket.getOutputStream());
			oos.writeObject(Protocol.LOGIN
					        +Protocol.seperator+loginID
					        +Protocol.seperator+passward
					       );
			mct = new MsgClientThread(this);
			mct.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//// **** 이벤트 처리부 ****////
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj==jbtn_login) {
			login();
		} else if(obj==jbtn_exit) {
			System.exit(0);
		}
	}
	///////////////////
	public static void main(String[] args) {
		new Login();
	}
	@Override
	public void keyPressed(KeyEvent e) {
		if(e.getKeyCode() == KeyEvent.VK_ENTER) {
			Login.this.login();
		}
	}
	
	
	@Override
	public void keyReleased(KeyEvent e) {
		
	}
	@Override
	public void keyTyped(KeyEvent e) {
		
	}
}
