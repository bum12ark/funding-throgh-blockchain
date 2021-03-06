package blockchain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import blockchain.util.StringUtil;


public class Block implements Serializable {
	private static final long serialVersionUID = 3789218647314831245L;
	public String hash;
	public String previousHash;
	public String merkleRoot;
	public List<Transaction> transactions = new ArrayList<>();
	public int nonce;
	// # 생성자
	public Block(String previousHash) {
		this.previousHash = previousHash;
		this.hash = calculateHash();
	}
	public String calculateHash() {
		String calculatehash = StringUtil.applySha256(
								previousHash
								+ Integer.toString(nonce)
								+ merkleRoot
								);
		return calculatehash;
	}
	// * 데이터 추출 - 마이닝
	public void mineBlock(int difficulty) {
		System.out.println("[Block] mineBlock: void 호출");
		merkleRoot = StringUtil.getMerkleRoot(transactions);
		String target = new String(new char[difficulty]).replace('\0', '0');
		while(!hash.substring(0, difficulty).equals(target)) {
			nonce++;
			hash = calculateHash();
		}
	}
	// # 해당 블록에 거래를 추가하는 메소드
	public boolean addTransaction(BlockChain blockChain, Transaction transaction) {
		System.out.println("\n[Block] addTransaction: boolean 호출");
		if(transaction == null) return false;
		if((previousHash != "0")) {
			if((transaction.processTransaction(blockChain) != true)) {
				System.out.println("Transaction failed to process. Discarded.");
				return false;
			}
		} else {
			transaction.txId = transaction.calculateHash();
		}
		transactions.add(transaction);
		System.out.println("Transaction Successfully added to Block");
		return true;
	}
}
