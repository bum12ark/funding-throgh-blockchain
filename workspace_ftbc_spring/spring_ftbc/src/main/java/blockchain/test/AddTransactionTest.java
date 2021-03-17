package blockchain.test;

import java.security.PublicKey;

import blockchain.BlockChain;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;

public class AddTransactionTest {
	public static void main(String[] args) {
		try {
			CommonSet commonSet = CommonSet.getInstance();
			Wallet managerWallet = commonSet.getManagerWallet();
			String str = Base64Conversion.importChain("FTBC", "C:\\FTBC_server\\chain\\");
			BlockChain sharedChain = (BlockChain) Base64Conversion.decodeBase64(str);
			Wallet projectWallet = new Wallet();
			String str2 = Base64Conversion.importPublicKey(Path.PROEJCT_WALLET_PATH+"A01\\A01_1\\", "A01_1");
			PublicKey recipient = (PublicKey) Base64Conversion.decodeBase64(str2);
			projectWallet.setPublicKey(recipient);
			String str3 = Base64Conversion.importPublicKey("C:\\FTBC\\keys\\", "park");
			PublicKey sender = (PublicKey) Base64Conversion.decodeBase64(str3);
			System.out.println(projectWallet.getBalance(sharedChain));
			
			for(int i=0;i<sharedChain.blockChain.size();i++) {
				for(int j=0;j<sharedChain.blockChain.get(i).transactions.size();j++) {
					if(sharedChain.blockChain.get(i).transactions.get(j).recipient.toString().equals(recipient.toString())) {
						System.out.println("[i]_"+i+" [j]_"+j+" recipient : A01_1 프로젝트");
					} else if(sharedChain.blockChain.get(i).transactions.get(j).recipient.toString().equals(sender.toString())) {
						System.out.println("[i]_"+i+" [j]_"+j+" recipient : 박상범");
					} else if(sharedChain.blockChain.get(i).transactions.get(j).sender.toString().equals(sender.toString())) {
						System.out.println("[i]_"+i+" [j]_"+j+" sender : 박상범");
					} else if(sharedChain.blockChain.get(i).transactions.get(j).sender.toString().equals(managerWallet.getPublicKey().toString())) {
						System.out.println("[i]_"+i+" [j]_"+j+" sender : 매니저");
					}
					System.out.println("[i]_"+i+" [j]_"+j+" giftCode : "+sharedChain.blockChain.get(i).transactions.get(j).giftCode);
					System.out.println("[i]_"+i+" [j]_"+j+" value : "+sharedChain.blockChain.get(i).transactions.get(j).value);
						
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
