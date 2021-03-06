package blockchain;

import java.io.Serializable;

import blockchain.util.Base64Conversion;
import exe.util.Path;

/*
 * 체인의 무결성을 점검하는 클래스
 */
public class AuthChain implements Serializable {
	private static final long serialVersionUID = -1084446089912098307L;
	public BlockChain serverChain = null;
	public BlockChain clientChain = null;

	/***************
	 * 무조건 선행 되어야 하는 메소드
	 * @param loginID
	 * @throws Exception
	 */
	public void decodeInitialization(String loginID) throws Exception {
		try {
			// #텍스트 파일 가져오기
			// 공유 노드(서버)의 체인 가져오기
			String serverBase62 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			this.serverChain = (BlockChain) Base64Conversion.decodeBase64(serverBase62);
			this.serverChain.syncUTXOs();
			String clientBase64 = Base64Conversion.importChain(loginID, Path.CLIENT_CHAIN_PATH);
			this.clientChain = (BlockChain) Base64Conversion.decodeBase64(clientBase64);
			this.clientChain.syncUTXOs();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public boolean isHashValid() throws Exception {
		// 클라이언트 체인의 최신 블록의 해쉬값들을 비교
		boolean isValid = false;
		Block clientBlock = null;
		Block serverBlock = null;
		try {
			if(clientChain.isChainValid()) isValid = true;
			int clientChainSize = clientChain.blockChain.size();
			clientBlock = clientChain.blockChain.get(clientChainSize-1);
			serverBlock = serverChain.blockChain.get(clientChainSize-1);
			if(clientBlock.hash.equals(serverBlock.hash)) {
				isValid = true;
			} else {
				isValid = false;
			}
			if(clientBlock.previousHash.equals(serverBlock.previousHash)) {
				isValid = true;
			} else {
				isValid = false;
			}
		} catch (Exception e) {
			isValid = false;
		}
		return isValid;
	}
	
	public boolean isChainComparation(String loginID) throws Exception {
		int clientChainSize = clientChain.blockChain.size();
		int serverChainSize = serverChain.blockChain.size();
		System.out.println("clientChainSize : "+clientChainSize);
		System.out.println("serverChainSize : "+serverChainSize);
		if( (clientChainSize == serverChainSize) ) {
			return true;
		} else {
			for(int i=clientChainSize;i<serverChain.blockChain.size();i++) {
				Block block = serverChain.blockChain.get(i);
				clientChain.blockChain.add(block);
				clientChain.syncUTXOs();
				// 추가 된 클라이언트 체인 다운로드
				String clientBase64 = Base64Conversion.encodeChain(clientChain);
				Base64Conversion.saveChain(clientBase64, Path.CLIENT_CHAIN_PATH, loginID);
			}
			return false;
		}
	}
}
