package blockchain.util;

import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Map;

import blockchain.Wallet;
import exe.util.Path;


public class CommonSet {
	public Map<String, Wallet> projectWallets = new HashMap<>();
	private Wallet managerWallet  = null;
	// 싱글톤
	private CommonSet() {}
	private static class LazyHolder {
	   public static final CommonSet INSTANCE = new CommonSet();
	}
	public static CommonSet getInstance() {
	   return LazyHolder.INSTANCE;
	}
	public Wallet getProjectWallet(String walletID) throws Exception {
		Wallet projectWallet = null;
		Object keys[] = projectWallets.keySet().toArray();
		for(int i=0;i<projectWallets.size();i++) {
			if(walletID.equals(keys[i])) {
				projectWallet = projectWallets.get(keys[i]);
			}
		}
		return projectWallet;
	}
	
	//## 충전용 관리자 wallet 가져오기
	public Wallet getManagerWallet() {
		this.managerWallet = null;
		this.managerWallet = new Wallet();
		try {
			String pubStr = Base64Conversion.importPublicKey(Path.MANAGER_WALLET_PATH, "manager.com");
			String priStr = Base64Conversion.importPrivateKey(Path.MANAGER_WALLET_PATH, "manager.com");
			PublicKey publicKey = (PublicKey) Base64Conversion.decodeBase64(pubStr);
			PrivateKey privateKey = (PrivateKey) Base64Conversion.decodeBase64(priStr);
			this.managerWallet.setPublicKey(publicKey);
			this.managerWallet.setPrivateKey(privateKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return managerWallet;
	}

	/****************************
	 * 
	 * @param project_code
	 * @return encodePuk : DB에 저장해야 할 Base64 encoding된 공개키ㄴ
	 */
	public String createProject(String project_code) {
		Wallet projectWallet = new Wallet();
		projectWallet.generateKeyPair();
		String encodePuk = null;
		// 개인키 서버 로컬에 저장
		try {
			String base64 = Base64Conversion.encodePrivateKey(projectWallet.getPrivateKey());
			String pjKeyPath = pjKeyPath(project_code);
			Base64Conversion.savePjPrivateKey(base64, pjKeyPath, project_code);
			encodePuk = Base64Conversion.encodePublicKey(projectWallet.getPublicKey());
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.projectWallets.put(project_code, projectWallet);
		
		return encodePuk;
	}
	
	// 프로젝트코드로 개인키가 들어가는 폴더 경로 만들어주는 메소드
	public String pjKeyPath(String project_code) {
		StringBuffer sb = new StringBuffer();
		String upperFolder = project_code.substring(0, project_code.lastIndexOf("_"));
		sb.append(Path.PROEJCT_WALLET_PATH);
		sb.append(upperFolder+"\\");
		sb.append(project_code);
		return sb.toString();
	}
	
}
