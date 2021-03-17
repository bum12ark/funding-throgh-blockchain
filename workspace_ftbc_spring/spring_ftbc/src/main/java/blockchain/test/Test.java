package blockchain.test;


import java.io.File;

import org.apache.commons.io.FileUtils;

import blockchain.BlockChain;
import blockchain.util.Base64Conversion;
import exe.util.Path;

public class Test {
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
	public static void main(String[] args) throws Exception {
//		Test t = new Test();
//		BlockChain FTBCChain = t.getFTBCChain();
////		FTBCChain.syncUTXOs();
//		System.out.println(FTBCChain.blockChain.get(3).transactions.get(12).recipient);
		FileUtils.cleanDirectory(new File(Path.CLIENT_CHAIN_PATH));
	}
}
