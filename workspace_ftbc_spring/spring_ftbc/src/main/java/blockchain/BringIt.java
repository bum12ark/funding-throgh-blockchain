package blockchain;

import java.util.Map;

import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;

public class BringIt {
	BlockChain testChain = null;
	
	public void getProject() {
		
	}
	public BlockChain getChain() {
		try {
			String chain64 = Base64Conversion.importChain("FTBC","C:\\Users\\kosmo_03\\Desktop\\FTBC\\test (1)\\");
			testChain = (BlockChain)Base64Conversion.decodeBase64(chain64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return testChain;
	}
	
	//체인 내에 UTXO에서 값 뽑아오기
	public void getUTXOs(BlockChain blockChain) {
		 Map<String, Output> UTXOs = blockChain.UTXOs;
		 Object[] keys = UTXOs.keySet().toArray();
		 
		 for(int i=0;i<keys.length;i++) {
			 Output output = UTXOs.get(keys[i]);
		 }
	}
	
	//블록에 있는 트랜잭션 뽑아오기 
	public void getTxs(BlockChain blockChain) {
		System.out.println("GET TXs");
		Block block = null;
		Transaction transaction = null;
		for(int i=0;i<blockChain.blockChain.size();i++) {
			block = blockChain.blockChain.get(i);
			for(int j=0;j<block.transactions.size();j++){
				transaction = block.transactions.get(j);
			}
		}
	}
	
	public void getProjectBalance() {
		CommonSet commonset = CommonSet.getInstance();
		Map<String, Wallet> projectWallets = commonset.projectWallets;
		
	}
	public static void main(String[] args) {
		BringIt bringIt = new BringIt();
		BlockChain blockChain = bringIt.getChain();
		bringIt.getTxs(blockChain);
		
	}

}
