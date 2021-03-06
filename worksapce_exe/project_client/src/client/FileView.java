package client;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.URI;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import client.path.Path;
import client.util.Protocol;
import client.util.StringUtil;

public class FileView extends JFrame implements ActionListener {
	//
	JLabel jl_logo          = new JLabel();
	JLabel jl_public        = new JLabel("공개키");
	JLabel jl_private       = new JLabel("개인키");
	JTextField jtf_public   = new JTextField();
	JTextField jtf_private  = new JTextField();
	JButton jbtn_sync       = new JButton(new ImageIcon(Path.FILE_SKIN_DIRECTORY+"FTBC_chainSync.png"));
	JCheckBox jcb_check     = new JCheckBox("자동동기화", true);
	JButton jbtn_wallet     = new JButton(new ImageIcon(Path.FILE_SKIN_DIRECTORY+"FTBC_createWallet.png"));
	JButton jbtn_uploadKey  = new JButton(new ImageIcon(Path.FILE_SKIN_DIRECTORY+"FTBC_uploadKey.png"));
	
	JPanel jp_main = new JPanel();
	// #로그인 시 DB에 publicKey가 있을 경우(지갑이 있다는 뜻) true로 바꿔준다.
	// 해당 변수가 true일 경우에만 지갑이 생성되게 할 것.
	private boolean isWalletExist = false;
	public void setWalletExist(boolean isWalletExist) {
		this.isWalletExist = isWalletExist;
	}
	public FileClientThread fileClientThread = null;
	// 개인키를 받기위해 추가
	JFileChooser jfc = new JFileChooser();
	//
	StringUtil stringUtil = new StringUtil();
	Login login = null;
	
	public FileView(Login login) {
		this.login = login;
		initDisplay();
		if(!(stringUtil.isFile(login.loginID, Path.CHAIN_DIRECTORY))) {
			stringUtil.mkDir(Path.CHAIN_DIRECTORY);
			FileTransfer fileTransfer = new FileTransfer();
			fileTransfer.chainDown(login.loginID);
			fileTransfer = null;
			JOptionPane.showMessageDialog(this, "체인 파일이 존재하지 않습니다.\n공유 체인 다운로드 되었습니다.");
		}
		// 폴더 생성
		// 파일이 있는 경우 - 클라이언트의 체인 업로드 후 디코딩
		if(stringUtil.isFile(login.loginID, Path.CHAIN_DIRECTORY)) {
			JOptionPane.showMessageDialog(this, "사용자님의 체인을 검사 중입니다.");
			// 클라의 체인 업로드 진행
			FileTransfer fileTransfer = new FileTransfer();
			fileTransfer.chainSyncUpload(login.loginID);
			fileTransfer = null;
		}
		// 파일이 없는 경우
		else {
			// 서버의 체인 다운로드 진행 - 끝
			FileTransfer fileTransfer = new FileTransfer();
			fileTransfer.chainDown(login.loginID);
			fileTransfer = null;
			JOptionPane.showMessageDialog(this, "현재 공유 체인 다운이 완료 되었습니다.");
		}
	}
	public void send(String msg) {
		try {
			login.oos.writeObject(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void initDisplay() {
		// #로고 마우스 클릭 이벤트
		jl_logo.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				super.mouseClicked(e);
				int result = JOptionPane.showConfirmDialog(FileView.this, "FTBC 홈페이지로 이동하시겠습니까?", "홈페이지 이동", JOptionPane.YES_NO_OPTION);
				if(result == JOptionPane.YES_OPTION) {
					try {
						Desktop.getDesktop().browse(new URI("http://"+Path.SERVER_IP+":8000/FTBC.com"));
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}
		});
		// # 공개키 라벨 마우스 클릭 이벤트
		jtf_public.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				super.mouseClicked(e);
				String text = jtf_public.getText();
				if("지갑을 생성하세요.".equals(text)) {
					JOptionPane.showMessageDialog(FileView.this, "지갑을 생성해주세요.");
				} else {
					int result = JOptionPane.showConfirmDialog(FileView.this, "공개키를 복사하시겠습니까?", "공개키 복사", JOptionPane.YES_NO_OPTION);
					if(result == JOptionPane.YES_OPTION) {
						Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
						String copyString = jtf_public.getText();
						if(copyString != null) {
							StringSelection contents = new StringSelection(copyString);
							clipboard.setContents(contents, null);
						}
					}
				}
			}
		});
		// # 개인키 라벨 마우스 클릭 이벤트
		jtf_private.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				super.mouseClicked(e);
				String text = jtf_private.getText();
				if("개인키를 입력하세요.".equals(text)) {
					JOptionPane.showMessageDialog(FileView.this, "개인키 파일(.prk)을 입력해주세요");
				} 
				else if("지갑을 생성하세요.".equals(text)) {
					int result = JOptionPane.showConfirmDialog(FileView.this, "지갑을 생성하시겠습니까?", "지갑 생성", JOptionPane.YES_NO_OPTION);
					if(result == JOptionPane.YES_OPTION) {
						FileView.this.send(Protocol.CREATE_NEW_WALLET
								+Protocol.seperator);
					}
					
				} else {
					int result = JOptionPane.showConfirmDialog(FileView.this, "개인키를 복사하시겠습니까?", "개인키 복사", JOptionPane.YES_NO_OPTION);
					if(result == JOptionPane.YES_OPTION) {
						Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
						String copyString = jtf_private.getText();
						if(copyString != null) {
							StringSelection contents = new StringSelection(copyString);
							clipboard.setContents(contents, null);
						}
					}
				}
			}
		});
		jcb_check.addActionListener(this);
		// #체크박스 선택 이벤트
		jcb_check.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.SELECTED) {
					FileView.this.send(Protocol.CHECKBOX_CHECK
							+Protocol.seperator);
				} else if(e.getStateChange() == ItemEvent.DESELECTED) {
					FileView.this.send(Protocol.CHECKBOX_UNCHECK
							+Protocol.seperator);
				}
			}
		});
		jbtn_wallet.addActionListener(this);
		jbtn_uploadKey.addActionListener(this);
		jbtn_sync.addActionListener(this);
		// #해당 프레임을 나갈 경우 로그 아웃 처리
		this.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				super.windowClosing(e);
				FileView.this.send(Protocol.EXIT+Protocol.seperator+login.loginID);
				System.exit(0);
			}
		});
		// #화면 처리부
		jtf_public.setEditable(false);
		jtf_private.setEditable(false);
		jbtn_sync.setBorderPainted(false);
		jbtn_sync.setContentAreaFilled(false);
		jbtn_wallet.setBorderPainted(false);
		jbtn_wallet.setContentAreaFilled(false);
		jbtn_uploadKey.setBorderPainted(false);
		jbtn_uploadKey.setContentAreaFilled(false);
		ImageIcon img = new ImageIcon(Path.FILE_SKIN_DIRECTORY+"FTBC_logo.png");
		Image originImg = img.getImage();
		jl_logo.setIcon(new ImageIcon(originImg));
		ImageIcon topLogo = new ImageIcon(Path.LOGIN_SKIN_DIRECTORY+"FTBC_topLogo.png");
		Image topLogoimg = topLogo.getImage();
		this.setIconImage(topLogoimg);
		jp_main.setLayout(null);
		jcb_check.setBackground(Color.white);
		jp_main.setBackground(Color.white);
		jp_main.add(jl_logo);
		jp_main.add(jl_public);
		jp_main.add(jl_private);
		jp_main.add(jbtn_sync);
		jp_main.add(jcb_check);
		jp_main.add(jbtn_wallet);
		jp_main.add(jtf_public);
		jp_main.add(jtf_private);
		jp_main.add(jbtn_uploadKey);
		jl_logo.setBounds(75, 0, 250, 400);
		jl_public.setBounds(50, 400, 100, 22);
		jtf_public.setBounds(100, 400, 250, 25);
		jl_private.setBounds(50, 460, 100, 22);
		jtf_private.setBounds(100, 460, 220, 25);
		jbtn_uploadKey.setBounds(325, 460, 30, 25);
		jbtn_sync.setBounds(80, 500, 100, 50);
		jbtn_wallet.setBounds(200, 500, 100, 50);
		jcb_check.setBounds(150, 550, 100, 50);
		this.add(jp_main);
		this.setVisible(true);
		this.setSize(400, 650);
		this.setLocation(800, 250);
		this.setResizable(false);
	}
	// #버튼 이벤트 처리부
	@Override
	public void actionPerformed(ActionEvent e) {
		Object obj = e.getSource();
		if(obj == jbtn_sync) {
			String loginID = login.loginID;
			// 폴더 생성
			if(stringUtil.isFile("", Path.CHAIN_DIRECTORY)) {
				// 체인 디렉토리 폴더가 없을경우 
			} else {
				stringUtil.mkDir(Path.CHAIN_DIRECTORY);
			}
			// 파일이 있는 경우 - 클라이언트의 체인 업로드 후 디코딩
			if(stringUtil.isFile(loginID, Path.CHAIN_DIRECTORY)) {
				JOptionPane.showMessageDialog(this, "사용자님의 체인을 검사 중입니다.");
				// 클라의 체인 업로드 진행
				FileTransfer fileTransfer = new FileTransfer();
				fileTransfer.chainSyncUpload(loginID);
				fileTransfer = null;
			}
			// 파일이 없는 경우
			else {
				int result = 
						JOptionPane.showConfirmDialog(this, "블록체인 파일이 없습니다.\n체인을 다운 받으시겠습니까?"
								, "Confirm", JOptionPane.YES_NO_OPTION);
				if(result == JOptionPane.YES_OPTION) {
					// 서버의 체인 다운로드 진행 - 끝
					FileTransfer fileTransfer = new FileTransfer();
					fileTransfer.chainDown(loginID);
					fileTransfer = null;
					JOptionPane.showMessageDialog(this, "파일 다운이 완료 되었습니다.");
				}
			}
			
		} else if(obj == jbtn_uploadKey) {
			String text = jtf_private.getText();
			jfc.setCurrentDirectory(new File("C:\\FTBC\\keys"));
			if("지갑을 생성하세요.".equals(text)) {
				JOptionPane.showMessageDialog(this, "지갑을 생성해주세요.");
			} else {
				int ret = jfc.showDialog(this, "개인키 입력");
				if(ret == JFileChooser.APPROVE_OPTION) {
					String chooseFile = jfc.getSelectedFile().toString();
					int start = chooseFile.lastIndexOf(".");
					String extension = chooseFile.substring(start);
					System.out.println("extension : "+extension);
					if(".prk".equals(extension)) {
						stringUtil = null;
						stringUtil = new StringUtil();
						try {
							String privateStr = stringUtil.importPrivateKey(login.loginID, chooseFile);
							System.out.println(jtf_public.getText());
							System.out.println(privateStr);
							// 키 검증을 위해 서버로 보냄
							this.send(Protocol.SEND_KEY_PAIR
									+Protocol.seperator+jtf_public.getText()
									+Protocol.seperator+privateStr);
						} catch (Exception e2) {
							e2.printStackTrace();
						}
					} else {
						JOptionPane.showMessageDialog(this, "잘못된 확장자입니다.\n'.prk' 확장자를 선택하세요");
					}
				}
			}
		} else if(obj == jbtn_wallet) {
			if(isWalletExist) { // 지갑이 존재할 경우 - 지갑생성 이벤트 막기
				JOptionPane.showMessageDialog(this, "이미 해당 아이디의 지갑이 존재합니다.");
			} else { // 지갑이 존재하지 않을 경우 - 지갑 생성
				int result = JOptionPane.showConfirmDialog(this, "지갑을 새로 생성하시겠습니까?", "지갑 생성", JOptionPane.YES_NO_OPTION);
				if(result == JOptionPane.YES_OPTION) {
					this.send(Protocol.CREATE_NEW_WALLET
							+Protocol.seperator+login.loginID);
				}
			}
		}
	}
}
