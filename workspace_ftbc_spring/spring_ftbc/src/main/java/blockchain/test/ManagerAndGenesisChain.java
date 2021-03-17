package blockchain.test;

import java.security.PrivateKey;
import java.security.PublicKey;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Output;
import blockchain.Transaction;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;

public class ManagerAndGenesisChain {
	CommonSet commonSet;
	String parkPuk = "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAASqfa4IOIBqL+qEoqGxL1C6iVtuQ+a6SqiHpMisRvm2KzokRF1rvsWqq6iPw061KGR4";
	String parkPrk = "rO0ABXNyAD1vcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQcml2YXRlS2V5Dc1c3SkJztQDAAJaAA93aXRoQ29tcHJlc3Npb25MAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZzt4cAB0AAVFQ0RTQXVyAAJbQqzzF/gGCFTgAgAAeHAAAAB9MHsCAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQEEYTBfAgEBBBiAItwbA4XpkkjQsaFTe3xpDKHdJ/b3XrigCgYIKoZIzj0DAQGhNAMyAASqfa4IOIBqL+qEoqGxL1C6iVtuQ+a6SqiHpMisRvm2KzokRF1rvsWqq6iPw061KGR4";
	String jungPuk = "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAASn80YLxiCkUljRw0WpQEgXIjotoOvrFqDXvaILlyxwgPqUrt4XCDf1YX/unev+U1p4";
	String jungPrk = "rO0ABXNyAD1vcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQcml2YXRlS2V5Dc1c3SkJztQDAAJaAA93aXRoQ29tcHJlc3Npb25MAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZzt4cAB0AAVFQ0RTQXVyAAJbQqzzF/gGCFTgAgAAeHAAAAB9MHsCAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQEEYTBfAgEBBBgdUNZ6VS90c0dhxeU/JwBRtCgQPH2Z3amgCgYIKoZIzj0DAQGhNAMyAASn80YLxiCkUljRw0WpQEgXIjotoOvrFqDXvaILlyxwgPqUrt4XCDf1YX/unev+U1p4";
	String koPuk = "rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAAS01h552VQuQ64SK1LUASeJ2kOwBgv6iT/uv/cc4vDmhue+xkYNdJ8BfNJ/GtjaDW14";
	String koPrk = "rO0ABXNyAD1vcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQcml2YXRlS2V5Dc1c3SkJztQDAAJaAA93aXRoQ29tcHJlc3Npb25MAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZzt4cAB0AAVFQ0RTQXVyAAJbQqzzF/gGCFTgAgAAeHAAAAB9MHsCAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQEEYTBfAgEBBBh0Vm7sVZ3u6qBW4UXMZWBJJAAStTByZDqgCgYIKoZIzj0DAQGhNAMyAAS01h552VQuQ64SK1LUASeJ2kOwBgv6iT/uv/cc4vDmhue+xkYNdJ8BfNJ/GtjaDW14";
	public ManagerAndGenesisChain() {
		commonSet = CommonSet.getInstance();
	}
	private BlockChain getFTBCChain() {
		BlockChain FTBCChain = null;
		try {
			String base64 = Base64Conversion.importChain("FTBC", "C:\\FTBC_server\\chain\\backup\\genesis_chain\\");
			FTBCChain = (BlockChain) Base64Conversion.decodeBase64(base64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return FTBCChain;
	}
	
	private void createManagerWallet() {
		try {
			Wallet managerWallet = new Wallet();
			managerWallet.generateKeyPair();
			String publicBase64 = Base64Conversion.encodePublicKey(managerWallet.getPublicKey());
			String privateBase64 = Base64Conversion.encodePrivateKey(managerWallet.getPrivateKey());
			Base64Conversion.saveUserPublicKey(publicBase64, Path.MANAGER_WALLET_PATH, "manager.com");
			Base64Conversion.saveUserPrivateKey(privateBase64, Path.MANAGER_WALLET_PATH, "manager.com");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void addGenesisBlock() {
		Wallet fuckWallet = new Wallet();
		fuckWallet.generateKeyPair();
		Wallet managerWallet = commonSet.getManagerWallet();
		PublicKey managerPuk = managerWallet.getPublicKey();
		PrivateKey managerPrk = managerWallet.getPrivateKey();
		BlockChain FTBCChain = new BlockChain();
		// 마르지 않는 샘물 추가
		FTBCChain.genesisTransaction = new Transaction(fuckWallet.getPublicKey(), managerPuk, "", 1000000000000000000L, null, "", null, null);
		FTBCChain.genesisTransaction.generateSignature(fuckWallet.getPrivateKey());
		FTBCChain.genesisTransaction.txId = "0";
		FTBCChain.genesisTransaction.outputs.add(new Output(FTBCChain.genesisTransaction.recipient,
															FTBCChain.genesisTransaction.value,
															FTBCChain.genesisTransaction.txId,
															FTBCChain.genesisTransaction.giftCode));
		FTBCChain.UTXOs.put(FTBCChain.genesisTransaction.outputs.get(0).id, FTBCChain.genesisTransaction.outputs.get(0));
		Block genesis = new Block("0");
		genesis.addTransaction(FTBCChain, FTBCChain.genesisTransaction);
		FTBCChain.addBlock(genesis);
		try {
			String baseStr = Base64Conversion.encodeChain(FTBCChain);
			Base64Conversion.saveChain(baseStr, "C:\\FTBC_server\\chain\\backup\\genesis_chain\\", "FTBC");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// addTransaction
	public boolean transactionAdd(BlockChain FTBCChain, Block block, PublicKey senderPuk, PrivateKey senderPrk, PublicKey recipient, long value, String giftCode) {
		Wallet managerWallet = commonSet.getManagerWallet();
		Wallet senderWallet = new Wallet();
		senderWallet.setPrivateKey(senderPrk);
		senderWallet.setPublicKey(senderPuk);
		boolean isAdd = false;
		try {
//			boolean isFirstAdd = block.addTransaction(FTBCChain, managerWallet.sendFunds(FTBCChain, senderWallet.getPublicKey(), "충전", value));
//			boolean isSecondAdd = block.addTransaction(FTBCChain, senderWallet.sendFunds(FTBCChain, recipient, giftCode, value));
//			if(isFirstAdd == true || isSecondAdd == true) isAdd = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isAdd;
	}
	
	
	
	public static void main(String[] args) {
		ManagerAndGenesisChain magc = new ManagerAndGenesisChain();
		magc.createManagerWallet();
		magc.addGenesisBlock();
//		BlockChain FTBCChain = magc.getFTBCChain();
//		FTBCChain.syncUTXOs();
//		System.out.println("블록체인 사이즈 : "+FTBCChain.blockChain.size());
//		Block block = new Block(FTBCChain.blockChain.get(FTBCChain.blockChain.size()-1).hash);
//		try {
//			PublicKey parkPuk = (PublicKey) Base64Conversion.decodeBase64(magc.parkPuk);
//			PrivateKey parkPrk = (PrivateKey) Base64Conversion.decodeBase64(magc.parkPrk);
//			PublicKey jungPuk = (PublicKey) Base64Conversion.decodeBase64(magc.jungPuk);
//			PrivateKey jungPrk = (PrivateKey) Base64Conversion.decodeBase64(magc.jungPrk);
//			PublicKey koPuk = (PublicKey) Base64Conversion.decodeBase64(magc.koPuk);
//			PrivateKey koPrk = (PrivateKey) Base64Conversion.decodeBase64(magc.koPrk);
//			PublicKey pukN01_1 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAAT6RAgQcwqiUa22MdO9LMJLNKJAW+sSqZGLr/Pt4eOlx/cYyMyob4VkF42cm4rlr/N4");
//			PublicKey pukM03_1 = (PublicKey) Base64Conversion.decodeBase64("rO0ABXNyADxvcmcuYm91bmN5Y2FzdGxlLmpjYWpjZS5wcm92aWRlci5hc3ltbWV0cmljLmVjLkJDRUNQdWJsaWNLZXkhn3qKo+pIJAMAAloAD3dpdGhDb21wcmVzc2lvbkwACWFsZ29yaXRobXQAEkxqYXZhL2xhbmcvU3RyaW5nO3hwAHQABUVDRFNBdXIAAltCrPMX+AYIVOACAAB4cAAAAEswSTATBgcqhkjOPQIBBggqhkjOPQMBAQMyAATHREoi8FI/W1/ndV0gpwBDw9+FSBsy73W94cTRvku6KYaxUzV6Yqlj826Uw4zjdu54");
//			
//			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, koPuk, koPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, jungPuk, jungPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			magc.transactionAdd(FTBCChain, block, parkPuk, parkPrk, pukM03_1, 1000L, "M03_1_1");
//			                   
//			
//			CommonSet commonSet = CommonSet.getInstance();
//			Wallet managerWallet = commonSet.getManagerWallet();
//			System.out.println("@@@@@@@@@@@@@@@@@@@ 매니저 지갑 잔액 : "+managerWallet.getBalance(FTBCChain));
//			
//			FTBCChain.addBlock(block);
//			String str = Base64Conversion.encodeChain(FTBCChain);
//			Base64Conversion.saveChain(str, "C:\\FTBC_server\\chain\\backup\\genesis_chain\\", "FTBC");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	
}
