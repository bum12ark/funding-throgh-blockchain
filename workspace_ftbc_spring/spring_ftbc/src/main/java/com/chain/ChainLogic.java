package com.chain;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Transaction;
import blockchain.Wallet;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.MsgServletThread;
import exe.util.Path;
import exe.util.Protocol;
import vo.ChainVO;
import vo.MemberVO;

@Service
public class ChainLogic {
	private static final Logger logger = LoggerFactory.getLogger(ChainLogic.class);
	Socket alertSocket = null; // 일정 주기가 지났다고 알리기 위한 소켓
	private static BlockChain sharedChain = null;
	// 과반수 체인이 채택되기 전까지 트랜잭션들을 모아 놓는 컬렉션
	private static List<Map<String, Object>> transactionList = null;
	public static List<Map<String, Object>> getTransactionList() {
		return transactionList;
	}
	private static final SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");

	ObjectOutputStream oos = null;
	ObjectInputStream ois = null;
	MsgServletThread mst = null;

	@Autowired
	ChainDao chainDao = null;

	// #Socket - 메세지 서버에 커넥션을 맺는 메소드
	public void getConnection() {
		try {
			alertSocket = new Socket(Path.SERVER_IP, Path.MSG_SERVER_PORT);
			oos = new ObjectOutputStream(alertSocket.getOutputStream());
			ois = new ObjectInputStream(alertSocket.getInputStream());
			mst = new MsgServletThread(alertSocket, oos, ois); // 소켓과의 정상적인 종료를 위해
			mst.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// #Socket - 메세지 서버에 접속하는데 사용하는 메소드
	public void msgServerConnection(int protocol) {
		try {
			oos.writeObject(protocol + Protocol.seperator);
			oos.flush();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	// # 공유체인을 가져오는 메소드
	public BlockChain getBlockChain() {
		BlockChain blockChain = null;
		logger.info("getBlockChain 호출");
		try {
			String base64Chain = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			blockChain = (BlockChain) Base64Conversion.decodeBase64(base64Chain);
			blockChain.syncUTXOs();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;
	}
	// #DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기
	public Map<String, Object> getProjectInfo(String project_name) {
		Map<String, Object> rMap = chainDao.getProjectInfo(project_name);
		return rMap;
	}

	/*************************************
	 * 펀딩을 할 때 블록에 트랜잭션을 추가하는 메소드
	 * 
	 * @param pMap : 화면 단에서 가져온 사용자가 입력한 값
	 * @param rMap : logger.info(rMap.get("PJ_PUBLICKEY").toString());
	 *             logger.info(rMap.get("PROJECT_CODE").toString());
	 */
	public void addTransaction(Map<String, Object> pMap, Map<String, Object> rMap
			, Map<String, Object> godMap, Map<String, Object> addrMap) {
		if (transactionList == null) transactionList = new Vector<Map<String, Object>>();
		String project_code = rMap.get("PROJECT_CODE").toString();
		String upperFolder = project_code.substring(0, project_code.lastIndexOf("_"));
		Map<String, Object> transactionMap = null;
		transactionMap = new HashMap<String, Object>();
		try {
			Wallet projectWallet = new Wallet();
			PublicKey projectPuk = (PublicKey) Base64Conversion.decodeBase64(rMap.get("PJ_PUBLICKEY").toString());
			String prkStr = Base64Conversion.importPjPrivateKey(
					Path.PROEJCT_WALLET_PATH + upperFolder + "\\" + project_code + "\\", project_code);
			PrivateKey projectPrk = (PrivateKey) Base64Conversion.decodeBase64(prkStr);
			projectWallet.setPublicKey(projectPuk);
			projectWallet.setPrivateKey(projectPrk);
			Wallet buyerWallet = new Wallet();
			PublicKey buyerPuk = (PublicKey) Base64Conversion.decodeBase64(pMap.get("buyer_puk").toString());
			PrivateKey buyerPrk = (PrivateKey) Base64Conversion.decodeBase64(pMap.get("pritxt").toString());
			buyerWallet.setPublicKey(buyerPuk);
			buyerWallet.setPrivateKey(buyerPrk);
			// 트랜잭션 맵에 값들 초기화 해주기 - 추가본
			transactionMap.put("buyerWallet", buyerWallet);
			transactionMap.put("amount", Long.parseLong(pMap.get("paid_amount").toString()));
			transactionMap.put("projectPuk", projectPuk);
			transactionMap.put("p_gift_code", pMap.get("p_gift_code").toString());
			transactionMap.put("timeStamp", simpleDateFormat.format(System.currentTimeMillis()));
			transactionMap.put("timeID", System.currentTimeMillis());
			transactionMap.put("godMap", godMap);
			transactionMap.put("addrMap", addrMap);
			transactionList.add(transactionMap);
			logger.info("####=======트랜잭션 리스트에 트랜잭션 애드 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String addBlock() {
		logger.info("addBlock 호출");
		String addResult = null;
		try {
			sharedChain = null;
			sharedChain = this.getBlockChain();
			Block newBlock = null;
			
			newBlock = new Block(sharedChain.blockChain.get(sharedChain.blockChain.size() - 1).hash);
			
			
			CommonSet commonSet = CommonSet.getInstance();
			Wallet managerWallet = commonSet.getManagerWallet();
			for (int i = 0; i < transactionList.size(); i++) {
				Map<String, Object> transactionMap = transactionList.get(i);
				Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
				PublicKey projectPuk = (PublicKey) transactionMap.get("projectPuk");
				String giftCode = transactionMap.get("p_gift_code").toString();
				String amountStr = transactionMap.get("amount").toString();
				long amount = Long.parseLong(amountStr);
				String timeStamp = transactionMap.get("timeStamp").toString();
				Map<String, Object> godMap = (Map<String, Object>) transactionMap.get("godMap");
				Map<String, Object> addrMap = (Map<String, Object>) transactionMap.get("addrMap");
				newBlock.addTransaction(sharedChain,
						managerWallet.sendFunds(sharedChain, buyerWallet.getPublicKey(), "충전", amount, timeStamp, null, null));
				newBlock.addTransaction(sharedChain,
						buyerWallet.sendFunds(sharedChain, projectPuk, giftCode, amount, timeStamp, godMap, addrMap));
			}
			
			sharedChain.addBlock(newBlock);
			if(sharedChain.isChainValid()) { // 해당 체인이 무결할 경우에 체인을 서버 폴더에 저장
				// 다음 블록 주기 동안을 위해 트랜잭션 리스트 초기화
				transactionList.clear();
				String sharedBase64 = Base64Conversion.encodeChain(sharedChain);
				Base64Conversion.saveChain(sharedBase64, Path.SERVER_CHAIN_PATH, "FTBC");
				addResult = "공유체인이 무결합니다.";
			} else {
				addResult = "공유체인이 무결하지 않습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return addResult;
	}

	public Block getBlockDetail(int num) {
		logger.info("getBlockDetail 호출 " + num);
		Block block = null;
		try {
			block = sharedChain.blockChain.get(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return block;
	}

	//////////////// 박상범 중간합본 이후 추가 || 수정 /////////////////

	public List<ChainVO> getBlockChainInfo() {
		if (sharedChain == null || sharedChain.blockChain.size() < 1) {
			sharedChain = this.getBlockChain();
		}
		List<Block> blockChain = sharedChain.blockChain;
		List<ChainVO> chainList = new Vector<ChainVO>();
		ChainVO chainVO = null;
		List<String> creatorList = new Vector<String>(); // WHERE 절에 들어갈 작성자 관련 리스트
		List<String> donatorList = new Vector<String>(); // WHERE 절에 들어갈 작성자 관련 리스트
		// 뉴 블록 추가해주기
		for (int i = (blockChain.size() - 1); 1 <= i; i--) {
			List<Transaction> transactions = blockChain.get(i).transactions;
			for (int j = 0; j < transactions.size(); j++) {
				if ((!transactions.get(j).giftCode.equals("충전"))) { // 충전이 아닌 트랜잭션만 가져옴
					String pj_publicKey = null;
					String mem_publicKey = null;
					try {
						pj_publicKey = Base64Conversion.encodePublicKey(transactions.get(j).recipient);
						mem_publicKey = Base64Conversion.encodePublicKey(transactions.get(j).sender);
					} catch (Exception e) {
						e.printStackTrace();
					}
					chainVO = new ChainVO();
					chainVO.setPj_publicKey(pj_publicKey); // 제목 + 작성자를 가져오기 위함
					chainVO.setMem_publicKey(mem_publicKey); // 후원자를 가져오기 위함
					String timeStamp = transactions.get(j).timeStamp;
					timeStamp = timeStamp.substring(0, timeStamp.lastIndexOf("일") + 1);
					chainVO.setTimeStamp(timeStamp);
					chainVO.setTx_id(transactions.get(j).txId);
					chainList.add(chainVO);
					creatorList.add(pj_publicKey);
					donatorList.add(mem_publicKey);
				}
			}
		}
		List<String> dbList = new Vector<String>();
		for (String str : creatorList) {
			if (!dbList.contains(str))
				dbList.add(str);
		}
		List<Map<String, Object>> finalList = chainDao.getCreatorInfo(dbList);
		dbList.clear();
		for (String str : donatorList) {
			if (!dbList.contains(str))
				dbList.add(str);
		}
		List<Map<String, Object>> finalList2 = chainDao.getDonatorInfo(dbList);
		// 화면으로 넘겨줄 chianList에 뿌려줄 값들 넣어주는 부분
		for (int i = 0; i < chainList.size(); i++) {
			for (int j = 0; j < finalList.size(); j++) {
				if (chainList.get(i).getPj_publicKey().equals(finalList.get(j).get("PJ_PUBLICKEY").toString())) {
					for (int x = 0; x < finalList.get(j).size(); x++) {
						chainList.get(i).setPjo_longtitle(finalList.get(j).get("PJO_LONGTITLE").toString());
						chainList.get(i).setCreator_name(finalList.get(j).get("CREATOR_NAME").toString());
					}
				}
			}
			for (int y = 0; y < finalList2.size(); y++) {
				if (chainList.get(i).getMem_publicKey().equals(finalList2.get(y).get("MEM_PUBLICKEY").toString())) {
					for (int x = 0; x < finalList2.get(y).size(); x++) {
						chainList.get(i).setDonator_name(finalList2.get(y).get("DONATOR_NAME").toString());
					}
				}
			}
		}
		logger.info("chainList");
		return chainList;
	}

	public String isAuthorized(Map<String, Object> pMap) {
		String isAuthorized = null;
		if ("creator".equals(pMap.get("writer"))) {
			isAuthorized = chainDao.isCreatorAuthorized(pMap);
		} else if ("donator".equals(pMap.get("writer"))) {
			isAuthorized = chainDao.isDonatorAuthorized(pMap);
		}
		logger.info("isAuthorized : " + isAuthorized);
		return isAuthorized;
	}

	public ChainVO getDetailChainInfo(String tx_id) {
		List<Block> blockChain = sharedChain.blockChain;
		ChainVO chainVO = null;
		block: for (int i = (blockChain.size() - 1); 1 <= i; i--) {
			List<Transaction> transactions = blockChain.get(i).transactions;
			for (int j = 0; j < transactions.size(); j++) {
				if ((!transactions.get(j).giftCode.equals("충전"))) { // 충전이 아닌 트랜잭션만 가져옴
					if (transactions.get(j).txId.equals(tx_id)) {
						String pj_publicKey = null;
						String mem_publicKey = null;
						try {
							pj_publicKey = Base64Conversion.encodePublicKey(transactions.get(j).recipient);
							mem_publicKey = Base64Conversion.encodePublicKey(transactions.get(j).sender);
						} catch (Exception e) {
							e.printStackTrace();
						}
						chainVO = new ChainVO();
						chainVO.setPj_publicKey(pj_publicKey);
						chainVO.setMem_publicKey(mem_publicKey); // 후원자를 가져오기 위함
						chainVO.setTimeStamp(transactions.get(j).timeStamp);
						chainVO.setTx_id(transactions.get(j).txId);
						chainVO.setValue(String.valueOf(transactions.get(j).value));
						chainVO.setBlockHash(blockChain.get(i).hash);
						chainVO.setGift_code(transactions.get(j).giftCode);
						break block;
					}
				}
			}
		}
		chainDao.getDetailChainInfo(chainVO);
		return chainVO;
	}

	// 2차 합본 이후
	public String getMemPubKey(String mem_email) {
		logger.info("getMemPubKey: String 호출");
		String encoded_pub = chainDao.getMemPubKey(mem_email);
		return encoded_pub;
	}

}
