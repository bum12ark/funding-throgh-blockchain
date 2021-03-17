package blockchain.test;

import blockchain.BlockChain;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;

public class Test3 {
	// # 공유체인을 가져오는 메소드
	public static BlockChain getBlockChain() {
		BlockChain blockChain = null;
		try {
			String base64Chain = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			blockChain = (BlockChain) Base64Conversion.decodeBase64(base64Chain);
			blockChain.syncUTXOs();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;
	}
	
	public static void main(String[] args) {
		BlockChain sharedChain = Test3.getBlockChain();
		CommonSet commonSet = CommonSet.getInstance();
		Wallet managerWallet = commonSet.getManagerWallet();
		System.out.println("관리자 지갑 잔고 : "+managerWallet.getBalance(sharedChain));
	}
}
