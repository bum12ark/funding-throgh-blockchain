package blockchain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlockChain implements Serializable {
	private static final long serialVersionUID = -4524521688745832529L;
	public List<Block> blockChain = new ArrayList<Block>();
	public Transaction genesisTransaction;
	private int difficulty = 3;
	public float minimumTransaction = 0.1f;
	public Map<String, Output> UTXOs = new HashMap<>();
	
	// #블록의 무결성을 점검하는 메소드
	public boolean isChainValid() {
		System.out.println("\n[NoobChain] isChainValid: boolean 호출");
		Block currentBlock;
		Block previousBlock;
		String hashTarget = new String(new char[difficulty]).replace('\0', '0');
		Map<String, Output> tempUTXOs = null;
		tempUTXOs = new HashMap<>();
		tempUTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));
		// 블록체인이 변경되었을 때 false 반환
		for(int i=1;i<blockChain.size();i++) {
			currentBlock = blockChain.get(i);
			previousBlock = blockChain.get(i-1);
			// 등록 된 해시와 계산 된 해시를 비교
			if(!currentBlock.hash.equals(currentBlock.calculateHash())) {
				System.out.println("Current Hashes not equal");
				return false;
			}
			// 이전 해시와 등록 된 이전 해시 비교
			if(!previousBlock.hash.equals(currentBlock.previousHash)) {
				System.out.println("previousBlock.hash : "+previousBlock.hash);
				System.out.println("currentBlock.previousHash : "+currentBlock.previousHash);
				System.out.println("Previous Hashes not equal");
				return false;
			}
			// 해시가 해결 되었는지 확인
			if(!currentBlock.hash.substring(0, difficulty).equals(hashTarget)) {
				System.out.println("This block hasn't been mined");
				return false;
			}
			//
			Output tempOutput;
			for(int t=0; t<currentBlock.transactions.size();t++) {
				Transaction currentTransaction = currentBlock.transactions.get(t);
				if(!currentTransaction.verifiySignature()) {
					System.out.println("#Signature on Transaction("+t+") is Invalid");
					return false;
				}
				if(currentTransaction.getInputsValue() != currentTransaction.getOutputsValue()) {
					System.out.println("#Inputs are note equal to outputs on Transaction(" + t + ")");
					return false;
				}
				for(Input input : currentTransaction.inputs) {
					tempOutput = tempUTXOs.get(input.outputId);
					if(tempOutput == null) {
						System.out.println("#Referenced input on Transaction(" + t + ") is Missing");
						return false;
					}
					if(input.UTXO.value != tempOutput.value) {
						System.out.println("#Referenced input Transaction(" + t + ") value is Invalid");
						return false;
					}
					tempUTXOs.remove(input.outputId);
				}
				for(Output output: currentTransaction.outputs) {
					tempUTXOs.put(output.id, output);
				}
				if( currentTransaction.outputs.get(0).recipient != currentTransaction.recipient) {
					System.out.println("#Transaction(" + t + ") output reciepient is not who it should be");
					return false;
				}
				if( currentTransaction.outputs.get(1).recipient != currentTransaction.sender) {
					System.out.println("#Transaction(" + t + ") output 'change' is not sender.");
					return false;
				}
			}
		}
		System.out.println("Blockchain is valid");
		return true;
	}
	// #블록체인에 블록을 추가해주는 메소드
	public void addBlock(Block newBlock) {
		newBlock.mineBlock(difficulty);
		blockChain.add(newBlock);
	}
	// #UTXOs를 동기화 해주는 메소드
	public void syncUTXOs() {
		for(int i=0;i<blockChain.size();i++) {
			Block block = blockChain.get(i);
			for(int j=0;j<block.transactions.size();j++) {
				Transaction transaction = block.transactions.get(j);
				for(int x=0;x<transaction.outputs.size();x++) {
					UTXOs.put(transaction.outputs.get(x).id, transaction.outputs.get(x));
				}
				if(transaction.inputs != null) {
					for(int z=0;z<transaction.inputs.size();z++) {
						if(transaction.inputs.get(z).UTXO == null) continue;
						UTXOs.remove(transaction.inputs.get(z).UTXO.id);
					}
				}
			}
		}
	}
	
}
