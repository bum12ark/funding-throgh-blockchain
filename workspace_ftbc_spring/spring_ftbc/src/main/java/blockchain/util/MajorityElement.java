package blockchain.util;

import java.io.File;
import java.util.List;
import java.util.Vector;

import org.apache.commons.io.FileUtils;

import blockchain.BlockChain;
import exe.util.Path;

public class MajorityElement {

	// 두개의 체인이 같은지 비교하는 메소드
	// 두개의 체인의 해쉬와 이전 해쉬가 같은 경우 tre
	// 두개의 체인의 해쉬와 이전 해쉬가 다른 경우 false
	private boolean isChainEquals(BlockChain blockChain1, BlockChain blockChain2) {
		// 두 블록체인의 사이즈가 같다는 가정하에 진행
		// 두 블록체인의 클래스의 UTXOs의 사이즈도 같다는 가정하에 진행
		int size = blockChain1.blockChain.size();
		for (int i = 0; i < size; i++) {
			String hash = blockChain1.blockChain.get(i).hash;
			String hash2 = blockChain2.blockChain.get(i).hash;
			String prehash = blockChain1.blockChain.get(i).previousHash;
			String prehash2 = blockChain2.blockChain.get(i).previousHash;
			if ((!hash.equals(hash2)) && (!prehash.equals(prehash2))) {
				return false;
			}
		}
		return true;
	}

	private BlockChain majorityAlgorithm(List<BlockChain> blockList) {
		BlockChain blockChain = null;
		int cnt = 0;
		for (int i = 0; i < blockList.size(); i++) {
			if (cnt == 0) {
				blockChain = blockList.get(i);
				cnt++;
			} else if (isChainEquals(blockChain, blockList.get(i))) {
				cnt++;
			} else {
				cnt--;
			}
		}
		return blockChain;

	}

	/****************
	 * 해당 클라이언트의 체인을 다운받기 위함
	 * 
	 * @param syncClientList - 자동 동기화 체크 박스버튼이 눌려져있는 클라이언트의 아이디 정보
	 */
	public boolean majorityElement(List<String> syncClientList) {
		try {
			List<BlockChain> syncBlockChain = null;
			syncBlockChain = new Vector<BlockChain>();
			String base64Chain = null;
			BlockChain clientChain = null;
			// 서버의 체인을 가져옴
			String serverBase64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			BlockChain serverChain = (BlockChain) Base64Conversion.decodeBase64(serverBase64);
			serverChain.syncUTXOs();
			System.out.println("syncClientList 사이즈 : " + syncClientList.size());
			for (int i = 0; i < syncClientList.size(); i++) {
				base64Chain = Base64Conversion.importChain(syncClientList.get(i), Path.MAJORITY_CHAINS);
				clientChain = (BlockChain) Base64Conversion.decodeBase64(base64Chain);
				clientChain.syncUTXOs();
				if (clientChain.isChainValid()) {
					// 공유체인과 사이즈가 같은 로컬 체인들만 가져온다.
					if ((clientChain.blockChain.size() == serverChain.blockChain.size())) {
						syncBlockChain.add(clientChain);
					}
				}
			}
			// 서버의 체인도 넣어줌
			syncBlockChain.add(serverChain);
			System.out.println("자동 동기화 하기 위해  가져온 모든 BlockChain을 모아논 컬렉션의 사이즈 : " + syncBlockChain.size());
			BlockChain sharedChain = this.majorityAlgorithm(syncBlockChain);
			// 과반수로 채택된 체인 저장
			String sharedBase64 = Base64Conversion.encodeChain(sharedChain);
			Base64Conversion.saveChain(sharedBase64, Path.SERVER_CHAIN_PATH, "FTBC");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}