package blockchain.test;


import java.util.List;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Transaction;
import blockchain.util.Base64Conversion;
import exe.util.Path;

public class Test2 {

	public static void main(String[] args) throws Exception {
		String str = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
		BlockChain sharedChain = (BlockChain) Base64Conversion.decodeBase64(str);
		sharedChain.syncUTXOs();
		System.out.println("블체 사이즈 : "+sharedChain.blockChain.size());
		sharedChain.isChainValid();
		List<Block> blockChain = sharedChain.blockChain;
		for(int i=0;i<blockChain.size();i++) {
			List<Transaction> transactions = blockChain.get(i).transactions;
			for(int j=0;j<transactions.size();j++) {
				if(!(transactions.get(j).giftCode.equals("충전"))) {
					System.out.println(j+"번째 addrMap : "+transactions.get(j).addrMap);
					System.out.println(j+"번째 godMap : "+transactions.get(j).godMap);
				}
			}
		}
		
		
	}
}
