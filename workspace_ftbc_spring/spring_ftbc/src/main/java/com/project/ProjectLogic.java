package com.project;

import java.security.PublicKey;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.chain.ChainLogic;
import com.project.util.SortProject;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Transaction;
import blockchain.Wallet;
import blockchain.util.AES256Util;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;
import vo.GiftVO;
import vo.MemberVO;
import vo.ProjectVO;

/*
 * 성공임박 - 모인금액/목표금액
 * 추천  - 오늘날짜/d-7안에인 프로젝트? 기준은 정해야함.
 * 인기 - 펀딩한 사람들 명 수로 
 * 
 */
@Service
public class ProjectLogic {
	private static final Logger logger = LoggerFactory.getLogger(ProjectLogic.class);
	@Autowired
	ProjectDao projectDao = null;
	List<Map<String, Object>> transactionList = null;

	public BlockChain getBlockChain() { // check
		BlockChain blockChain = null;
		try {
			String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			blockChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;
	}

	public List<Map<String, Object>> getTransactionList() {
		List<Map<String, Object>> transactionList = ChainLogic.getTransactionList();
		return transactionList;
	}

	// 프로젝트 별 펀딩인원 넣기
	public List<ProjectVO> putSupporterNum(List<ProjectVO> projectList) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int sup_num = 0;
		/*
		 * 1. 받아온 프로젝트 리스트 사이즈만큼 for문 돌림 2. import해온 블록체인 사이즈만큼 다시 for문 돌림 3. 2번에서 돌려서
		 * 나온 block의 transactions 사이즈만틈 다시 for문 돌림. 4. pVO의 publicKey와 transaction의
		 * recepient의 퍼블릭키를 대조. 5. 4번에서 같을경우 변수 sup_num ++ 6. 다 돌리면 pVO에 set.
		 */
		for (int i = 0; i < projectList.size(); i++) {
			ProjectVO pVO = projectList.get(i);
			for (int j = 0; j < blockChain.blockChain.size(); j++) {
				Block block = blockChain.blockChain.get(j);
				for (int k = 0; k < block.transactions.size(); k++) {
					Transaction transaction = block.transactions.get(k);
					PublicKey publicKey = null;
					try {
						publicKey = (PublicKey) Base64Conversion.decodeBase64(pVO.getPj_publickey());
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (transaction.recipient.equals(publicKey)) {
						sup_num++;
					}
				}
			}
			if (getTransactionList != null) {
				for (int j = 0; j < getTransactionList.size(); j++) {
					Map<String, Object> transactionMap = getTransactionList.get(j);
					PublicKey publicKey = null;
					try {
						publicKey = (PublicKey) Base64Conversion.decodeBase64(pVO.getPj_publickey());
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (transactionMap.get("projectPuk").equals(publicKey)) {
						sup_num++;
					}
				}
			}
			pVO.setSupport_num(sup_num);
		}

		return projectList;

	}

	// 펀딩금액 집어넣기
	public List<ProjectVO> getFundedMoney(List<ProjectVO> vergeofProjects) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int value = 0;
		Map<String, Integer> code = new HashMap<String, Integer>();
		for (int z = 0; z < vergeofProjects.size(); z++) {
			if (vergeofProjects.get(z).getProject_code() != null) {
				PublicKey project_key = null;
				try {
					project_key = (PublicKey) Base64Conversion.decodeBase64(vergeofProjects.get(z).getPj_publickey());
				} catch (Exception e) {
					e.printStackTrace();
				}
				int sup_num = 0;
				for (int i = 0; i < blockChain.blockChain.size(); i++) {
					Block block = blockChain.blockChain.get(i);
					for (int j = 0; j < block.transactions.size(); j++) {
						Transaction transaction = block.transactions.get(j);
						if (project_key.equals(transaction.recipient)) {
							value += transaction.value;
							sup_num++;
						}
					}
				}
				if (getTransactionList != null) {
					for (int j = 0; j < getTransactionList.size(); j++) {
						Map<String, Object> transactionMap = getTransactionList.get(j);
						if (project_key.equals(transactionMap.get("projectPuk"))) {
							value += Integer.parseInt(transactionMap.get("amount").toString());
							sup_num++;
						}
					}
				}
				String target = (vergeofProjects.get(z).getFd_targetMoney()).replace(",", "");
				vergeofProjects.get(z).setFundedMoney(value);
				;
				vergeofProjects.get(z).setFd_targetMoney(target);
				vergeofProjects.get(z).setSupport_num(sup_num);
				int success = (int) ((Double.valueOf(value) / Integer.parseInt(target)) * 100);
				vergeofProjects.get(z).setSuccessMoney(success);

				value = 0;
			}
		}
		vergeofProjects = getOutLint(vergeofProjects);
		return vergeofProjects;
	}

	// 남은 날짜 집어 넣기
	public List<ProjectVO> getOutLint(List<ProjectVO> pjoList) {
		Map<String, Integer> code = new HashMap<String, Integer>();
		for (int i = 0; i < pjoList.size(); i++) {
			if (pjoList.get(i).getFd_deadLine() != null) {

				String proDate = pjoList.get(i).getFd_deadLine();
				String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
				Date time = new Date();
				// SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
				SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
				String nowDate = sdf.format(time);
				long diffDay = 0;
				try {
					Date startDate = sdf.parse(proDate);
					Date endDate = sdf.parse(nowDate);

					// 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
					diffDay = (startDate.getTime() - endDate.getTime()) / (24 * 60 * 60 * 1000);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				pjoList.get(i).setOutLine(diffDay);
			}
		}
		return pjoList;
	}

	// 메인에 뿌릴 프로젝트
	public Map<String, Object> getMainProjects() {
		Map<String, Object> mainProjects = new HashMap<>();
		List<Map<String, Object>> proCodes = projectDao.getProjectCodes();
		SortProject st = new SortProject();
		if (proCodes.size() > 0) {
			// 인기 프로젝트 가져오기
			List<ProjectVO> popularProjects = st.SortbySupNum(popularProjects(proCodes, 4));
			// 마감 임박순 프로젝트
			List<ProjectVO> recommnadProjects = st.SortbyOut(recommnadProjects(proCodes, 4));
			// 펀딩 완료 임박 프로젝트
			List<ProjectVO> vergeofProjects = st.SortbySuccess(vergeofProjects(proCodes, 4));

			mainProjects.put("popularProject", popularProjects);
			mainProjects.put("recommnadProject", recommnadProjects);
			mainProjects.put("vergeofProject", vergeofProjects);
		}
		return mainProjects;
	}

	public Map<String, Object> getEndMainProjects() {
		Map<String, Object> mainProjects = new HashMap<>();
		List<Map<String, Object>> proCodes = projectDao.getEndMainProjects();
		SortProject st = new SortProject();
		if (proCodes.size() > 0) {
			// 인기 프로젝트 가져오기
			List<ProjectVO> popularProjects = st.SortbySupNum(popularProjects(proCodes, 4));
			// 마감 임박순 프로젝트
			List<ProjectVO> recommnadProjects = st.SortbyOut(recommnadProjects(proCodes, 4));
			// 펀딩 완료 임박 프로젝트
			List<ProjectVO> vergeofProjects = st.SortbySuccess(vergeofProjects(proCodes, 4));

			mainProjects.put("popularProject", popularProjects);
			mainProjects.put("recommnadProject", recommnadProjects);
			mainProjects.put("vergeofProject", vergeofProjects);
		}
		return mainProjects;
	}

	// 성공 임박순 비교
	private List<ProjectVO> vergeofProjects(List<Map<String, Object>> proCodes, int k) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int value = 0;
		Map<String, Integer> code = new HashMap<String, Integer>();
		SortProject st = new SortProject();
		for (int z = 0; z < proCodes.size(); z++) {
			if (proCodes.get(z).get("PJ_PUBLICKEY") != null) {
				PublicKey project_key = null;
				try {
					project_key = (PublicKey) Base64Conversion
							.decodeBase64(proCodes.get(z).get("PJ_PUBLICKEY").toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
				for (int i = 0; i < blockChain.blockChain.size(); i++) {
					Block block = blockChain.blockChain.get(i);
					for (int j = 0; j < block.transactions.size(); j++) {
						Transaction transaction = block.transactions.get(j);
						if (project_key.equals(transaction.recipient)) {
							value += transaction.value;
						}
					}
				}
				if (getTransactionList != null) {
					for (int j = 0; j < getTransactionList.size(); j++) {
						Map<String, Object> transactionMap = getTransactionList.get(j);
						if (project_key.equals(transactionMap.get("projectPuk"))) {
							value += Integer.parseInt(transactionMap.get("amount").toString());
						}
					}
				}
				String target = (proCodes.get(z).get("FD_TARGETMONEY").toString()).replace(",", "");
				int success = (int) ((Double.valueOf(value) / Integer.parseInt(target)) * 100);
				if (success >= 0 && success < 100) {
					code.put(proCodes.get(z).get("PROJECT_CODE").toString(), success);
				}
				value = 0;
			}
		}
		List<ProjectVO> vergeofProjects = new ArrayList<ProjectVO>();
		if (code.size() > 0) {
			List<Map.Entry<String, Integer>> list = new LinkedList<>(code.entrySet());

			Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
				@Override
				public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
					int comparision = (o1.getValue() - o2.getValue()) * -1;
					return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
				}
			});

			// 순서유지를 위해 LinkedHashMap을 사용
			List<String> sorteList = new LinkedList<String>();
			for (Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();) {
				Map.Entry<String, Integer> entry = iter.next();
				sorteList.add(entry.getKey());
			}
			int s = sorteList.size();
			if (k > 1) {
				for (int i = 0; i < s; i++) {
					if (sorteList.size() > 4) {
						sorteList.remove(4);
					}
				}
			}
			vergeofProjects = projectDao.getProject(sorteList);
			vergeofProjects = getFundedMoney(vergeofProjects);
		} else {
			vergeofProjects = st.SortbySupNum(popularProjects(proCodes, 4));
		}
		return vergeofProjects;
	}

	// 마감 임박순 프로젝트 나열
	private List<ProjectVO> recommnadProjects(List<Map<String, Object>> proCodes, int k) {
		Map<String, Integer> code = new HashMap<String, Integer>();
		for (int i = 0; i < proCodes.size(); i++) {
			if (proCodes.get(i).get("FD_DEADLINE") != null) {

				String proDate = proCodes.get(i).get("FD_DEADLINE").toString();
				String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
				Date time = new Date();
				// SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
				SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
				String nowDate = sdf.format(time);
				long diffDay = 0;
				try {
					Date startDate = sdf.parse(proDate);
					Date endDate = sdf.parse(nowDate);

					// 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
					diffDay = (startDate.getTime() - endDate.getTime()) / (24 * 60 * 60 * 1000);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				code.put(proCodes.get(i).get("PROJECT_CODE").toString(), (int) diffDay);
			}
		}
		List<Map.Entry<String, Integer>> list = new LinkedList<>(code.entrySet());

		Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
			@Override
			public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
				int comparision = (o2.getValue() - o1.getValue()) * -1;
				return comparision == 0 ? o2.getKey().compareTo(o1.getKey()) : comparision;
			}
		});

		// 순서유지를 위해 LinkedHashMap을 사용
		List<String> sorteList = new LinkedList<String>();
		for (Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();) {
			Map.Entry<String, Integer> entry = iter.next();
			sorteList.add(entry.getKey());
		}
		int s = sorteList.size();
		if (k > 1) {
			for (int i = 0; i < s; i++) {
				if (sorteList.size() > 4) {
					sorteList.remove(4);
				}
			}
		}
		List<ProjectVO> recommnadProjects = projectDao.getProject(sorteList);
		recommnadProjects = getFundedMoney(recommnadProjects);
		return recommnadProjects;
	}

	///////////////////// 인기있는 프로젝트 4개 뽑기
	///////////////////// 인기있는 프로젝트 4개 뽑기
	/////// pj_publickey null체크하고 넘길것
	private List<ProjectVO> popularProjects(List<Map<String, Object>> proCodes, int k) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int sup_num = 0;
		Map<String, Integer> code = new HashMap<String, Integer>();
		for (int z = 0; z < proCodes.size(); z++) {
			if (proCodes.get(z).get("PJ_PUBLICKEY") != null) {
				PublicKey project_key = null;
				try {
					project_key = (PublicKey) Base64Conversion
							.decodeBase64(proCodes.get(z).get("PJ_PUBLICKEY").toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
				for (int i = 0; i < blockChain.blockChain.size(); i++) {
					Block block = blockChain.blockChain.get(i);
					for (int j = 0; j < block.transactions.size(); j++) {
						Transaction transaction = block.transactions.get(j);
						if (project_key.equals(transaction.recipient)) {
							sup_num++;
						}
					}
				}
				if (getTransactionList != null) {
					for (int j = 0; j < getTransactionList.size(); j++) {
						Map<String, Object> transactionMap = getTransactionList.get(j);
						if (project_key.equals(transactionMap.get("projectPuk"))) {
							sup_num++;
						}
					}
				}
				code.put(proCodes.get(z).get("PROJECT_CODE").toString(), sup_num);
				sup_num = 0;
			}
		}
		List<Map.Entry<String, Integer>> list = new LinkedList<>(code.entrySet());

		Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
			@Override
			public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
				int comparision = (o1.getValue() - o2.getValue()) * -1;
				return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
			}
		});

		// 순서유지를 위해 LinkedHashMap을 사용
		List<String> sorteList = new LinkedList<String>();
		for (Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();) {
			Map.Entry<String, Integer> entry = iter.next();
			sorteList.add(entry.getKey());
		}
		int s = sorteList.size();
		if (k > 1) {
			for (int i = 0; i < s; i++) {
				if (sorteList.size() > 4) {
					sorteList.remove(4);
				}
			}
		}
		List<ProjectVO> popularProjects = projectDao.getProject(sorteList);
		popularProjects = getFundedMoney(popularProjects);
		return popularProjects;
	}

	// 내가 펀딩한 프로젝트들 가져오기
	public List<ProjectVO> getFundedProjects(String mem_email) {
		List<ProjectVO> fundedProjects = new ArrayList<>();
		List<String> projectCodes = new ArrayList<>();
		PublicKey my_publicKey = null;
		String getPublick = projectDao.getPublicKey(mem_email);
		if (getPublick != null) {
			try {
				my_publicKey = (PublicKey) Base64Conversion.decodeBase64(getPublick);
			} catch (Exception e) {
				e.printStackTrace();
			}
			CommonSet commonset = CommonSet.getInstance();
			BlockChain blockChain = getBlockChain();
			List<Map<String, Object>> getTransactionList = getTransactionList();
			for (int i = 0; i < blockChain.blockChain.size(); i++) {
				Block block = blockChain.blockChain.get(i);
				for (int j = 0; j < block.transactions.size(); j++) {
					Transaction transaction = block.transactions.get(j);
					PublicKey funded_publicKey = null;
					if (my_publicKey.equals(transaction.sender)) {
						funded_publicKey = transaction.recipient;
						Object keys[] = commonset.projectWallets.keySet().toArray();
						for (int k = 0; k < keys.length; k++) {
							if (funded_publicKey.equals(commonset.projectWallets.get(keys[k]).getPublicKey())) {
								projectCodes.add(keys[k].toString());
							}
						}
					}
				}
			}
			if (getTransactionList != null) {
				for (int j = 0; j < getTransactionList.size(); j++) {
					Map<String, Object> transactionMap = getTransactionList.get(j);
					PublicKey funded_publicKey = null;
					Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
					if (my_publicKey.equals(buyerWallet.getPublicKey())) {
						funded_publicKey = (PublicKey) transactionMap.get("projectPuk");
						Object keys[] = commonset.projectWallets.keySet().toArray();
						for (int k = 0; k < keys.length; k++) {
							if (funded_publicKey.equals(commonset.projectWallets.get(keys[k]).getPublicKey())) {
								projectCodes.add(keys[k].toString());
							}
						}
					}
				}
			}
			HashSet<String> hash = new HashSet<String>(projectCodes);
			projectCodes = new ArrayList<>(hash);

			fundedProjects = getFundedMoney(projectDao.getFundedProject(projectCodes));
		}
		return fundedProjects;
	}

// 창작자가 펀딩한 프로젝트 수
	// 창작자가 펀딩한 프로젝트 수
	public List<ProjectVO> getCreaterFundedProjects(String mem_email) {
		// 내가 펀딩한 프로젝트 담을 리스트
		List<ProjectVO> fundedProjects = new ArrayList<>();
		// 내가 펀딩한 프로젝트의 프로젝트 코드들
		List<String> projectCodes = new ArrayList<>();
		// 내 퍼블릭키
		PublicKey my_publicKey = null;
		;
		String email = projectDao.getPublicKey(mem_email);
		try {
			my_publicKey = (PublicKey) Base64Conversion.decodeBase64(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		CommonSet commonset = CommonSet.getInstance();
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		/*
		 * 1. 로컬에서 가져온 블록체인의 사이즈 만큼 for문 돌려서 Block을 뽑아냄 2. 블럭의 transactions 사이즈만큼 for문을
		 * 돌려서 트랜잭션을 뽑아냄 3. 트랜잭션의 sender가 내 공개키와 같을경우 reciepient을 가져옴 4. 3번에서 가져온
		 * reciepient(PublicKey)로 CommonsSet의 projects에서 프로젝트 코드를 가져온다음 proejectCodes
		 * 리스트에 담음. 5. proejectCodes를 파라미터로 보내서 DB에서 해당 프로젝트의 정보들을 가져옴.
		 */

		for (int i = 0; i < blockChain.blockChain.size(); i++) {
			Block block = blockChain.blockChain.get(i);
			for (int j = 0; j < block.transactions.size(); j++) {
				Transaction transaction = block.transactions.get(j);
				PublicKey funded_publicKey = null;
				if (my_publicKey.equals(transaction.sender)) {
					funded_publicKey = transaction.recipient;
					Object keys[] = commonset.projectWallets.keySet().toArray();
					for (int k = 0; k < keys.length; k++) {
						if (funded_publicKey.equals(commonset.projectWallets.get(keys[k]).getPublicKey())) {
							String projectCode = keys[k].toString();
							projectCodes.add(projectCode);
						}
					}
				}
			}
		}
		if (getTransactionList != null) {
			for (int j = 0; j < getTransactionList.size(); j++) {
				Map<String, Object> transactionMap = getTransactionList.get(j);
				PublicKey funded_publicKey = null;
				Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
				if (my_publicKey.equals(buyerWallet.getPublicKey())) {
					funded_publicKey = (PublicKey) transactionMap.get("projectPuk");
					Object keys[] = commonset.projectWallets.keySet().toArray();
					for (int k = 0; k < keys.length; k++) {
						if (funded_publicKey.equals(commonset.projectWallets.get(keys[k]).getPublicKey())) {
							String projectCode = keys[k].toString();
							projectCodes.add(projectCode);
						}
					}
				}
			}
		}
		HashSet<String> hash = new HashSet<String>(projectCodes);
		projectCodes = new ArrayList<>(hash);
		fundedProjects = projectDao.getFundedProject(projectCodes);
		return fundedProjects;
	}

	// 내가 만든 프로젝트들 가져오기
	public List<ProjectVO> getMyProjects(String mem_email) {
		List<ProjectVO> myProjects = new ArrayList<>();
		myProjects = getFundedMoney(projectDao.getMyProjects(mem_email));

		return myProjects;
	}

	public ProjectVO getProjectDetail(String projectCode, String mem_email) {
		ProjectVO projectDetail = null;
		projectDetail = getDetailFundedMoney(projectDao.getProjectDetail(projectCode));
		// 상세보기할 프로젝트의 공개키

		PublicKey project_key = null;
		try {
			project_key = (PublicKey) Base64Conversion.decodeBase64(projectDetail.getPj_publickey());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 상세보기할 프로젝트의 후원자 수 담을 변수

		int sup_num = 0;
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		/*
		 * 후원자 명수 가져오기 1. 로컬에서 가져온 블록체인의 사이즈 만큼 for문 돌려서 Block을 뽑아냄 2. 블럭의 transactions
		 * 사이즈만큼 for문을 돌려서 트랜잭션을 뽑아냄 3. 트랜잭션의 reciepient가 DB에서 가져온 프로젝트의 공개키와 같을경우 후원자 명
		 * 수 ++ 4. projectDetail 맵에 후원자 수 도 put
		 */

		for (int i = 0; i < blockChain.blockChain.size(); i++) {
			Block block = blockChain.blockChain.get(i);
			for (int j = 0; j < block.transactions.size(); j++) {
				Transaction transaction = block.transactions.get(j);
				if (project_key.equals(transaction.recipient)) {
					sup_num++;
				}
			}
		}
		if (getTransactionList != null) {
			for (int j = 0; j < getTransactionList.size(); j++) {
				Map<String, Object> transactionMap = getTransactionList.get(j);
				if (project_key.equals(transactionMap.get("projectPuk"))) {
					sup_num++;
				}
			}
		}
		List<Map<String, Object>> giftList = new ArrayList<>();
		giftList = projectDao.getGift(projectCode);
		List<String> giftCode = new ArrayList<>();
		for (int i = 0; i < giftList.size(); i++) {
			Map<String, Object> gift = new HashMap<String, Object>();
			gift = giftList.get(i);
			giftCode.add(gift.get("GIFT_CODE").toString());
		}
		if (giftCode.size() > 0) {
			List<Map<String, Object>> giftOptionList = new ArrayList<>();
			giftOptionList = projectDao.getGiftOption(giftCode);
		}
		projectDetail.setSupport_num(sup_num);
		projectDetail = fundCheck(projectDetail, mem_email);
		return projectDetail;
	}

	public ProjectVO fundCheck(ProjectVO projectDetail, String mem_email) {
		PublicKey my_publicKey = null;
		PublicKey pjo_publicKey = null;
		boolean check = false;
		if (mem_email.length() > 5) {
			String publicKey = projectDao.getPublicKey(mem_email);
			if (publicKey != null) {
				try {
					my_publicKey = (PublicKey) Base64Conversion.decodeBase64(publicKey);
					pjo_publicKey = (PublicKey) Base64Conversion.decodeBase64(projectDetail.getPj_publickey());
				} catch (Exception e) {
					e.printStackTrace();
				}
				CommonSet commonset = CommonSet.getInstance();
				BlockChain blockChain = getBlockChain();
				List<Map<String, Object>> getTransactionList = getTransactionList();
				for (int i = 0; i < blockChain.blockChain.size(); i++) {
					Block block = blockChain.blockChain.get(i);
					for (int j = 0; j < block.transactions.size(); j++) {
						Transaction transaction = block.transactions.get(j);
						PublicKey funded_publicKey = null;
						if (my_publicKey.equals(transaction.sender)) {
							funded_publicKey = transaction.recipient;
							Object keys[] = commonset.projectWallets.keySet().toArray();
							if (funded_publicKey.equals(pjo_publicKey)) {
								check = true;
							}
						}
					}
				}
				if (getTransactionList != null) {
					for (int j = 0; j < getTransactionList.size(); j++) {
						Map<String, Object> transactionMap = getTransactionList.get(j);
						PublicKey funded_publicKey = null;
						Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
						if (my_publicKey.equals(buyerWallet.getPublicKey())) {
							funded_publicKey = buyerWallet.getPublicKey();
							Object keys[] = commonset.projectWallets.keySet().toArray();
							if (funded_publicKey.equals(pjo_publicKey)) {
								check = true;
							}
						}
					}
				}
			}
		}
		projectDetail.setCheck(check);
		return projectDetail;
	}

	// 모든, 인기 등등
	public List<ProjectVO> getDiscoverProjects(String sort) {
		List<ProjectVO> projectList = null;
		List<Map<String, Object>> proCodes = projectDao.getProjectCodes();
		SortProject st = new SortProject();
		if (sort.equals("all")) {
			projectList = projectDao.getAllProject();
			projectList = getFundedMoney(projectList);
			// projectList = getVergeofProejcts(projectList);
		} else if (sort.equals("popular")) {// 인기순
			projectList = st.SortbySupNum(popularProjects(proCodes, 0));
		} else if (sort.equals("recommnad")) {// 마감 임박
			projectList = st.SortbyOut(recommnadProjects(proCodes, 0));
		} else if (sort.equals("vergeof")) {
			projectList = st.SortbySuccess(vergeofProjects(proCodes, 0));
		}
		return projectList;
	}

	// 키워드 별로
	public List<ProjectVO> getKeywordProjects(String keyword) {
		List<ProjectVO> projectList = null;
		projectList = getFundedMoney(projectDao.getKeywordProjects(keyword));
		return projectList;
	}

	// 카테고리 별로
	public List<ProjectVO> getCategoryProjects(Map<String, Object> pMap) {
		List<ProjectVO> projectList = null;
		projectList = getFundedMoney(projectDao.getCategoryProjects(pMap));
		return projectList;
	}

	public List<ProjectVO> getVergeofProejcts(List<ProjectVO> plist) {
		List<ProjectVO> rlist = new ArrayList<>();
		/*
		 * 파라미터로 받아온 프로젝트에 현재 모인금액까지 넣어둠.
		 */
		/*
		 * for(int i=0; i<plist.size();i++) { ProjectVO pVO = plist.get(i); double
		 * percentage = pVO.getFundedMoney()/pVO.getFd_targetMoney(); if(percentage >=
		 * 0.9) { //90퍼센트 이상일 경우 rlist.add(pVO); } }
		 */
		return rlist;
	}

	public List<ProjectVO> getPopularProjects(List<ProjectVO> plist) {
		SortProject sortProject = new SortProject();
		// 리스트 전체 넣어서 후원자 많은 순으로 10개만 넣음.
		plist = sortProject.SortbySupNum(plist);
		return plist;

	}

	// ## 여러 군데에서 많이 사용 되는 project_code 초기화
	String project_code = null;

	public Map<String, Object> initProjectCreate(Map<String, Object> pMap) {
		Map<String, Object> projectCreateCol = new HashMap<String, Object>();
		projectCreateCol.put("pjo_category_select_result", pMap.get("pjo_category_select_result"));
		projectCreateCol.put("mem_email", pMap.get("mem_email"));
		projectDao.projectCode(projectCreateCol);
		project_code = projectCreateCol.get("PROJECT_CODE").toString();
		String publickey = null;
		CommonSet commonset = CommonSet.getInstance();
		publickey = commonset.createProject(project_code);
		projectCreateCol.put("PROJECT_CODE", project_code);
		projectCreateCol.put("PJ_PUBLICKEY", publickey);
		return projectCreateCol;
	}

	public Map<String, Object> initStoryTellingInsert(Map<String, Object> pMap) {
		Map<String, Object> storyMap = new HashMap<String, Object>();
		storyMap.put("PROJECT_CODE", project_code);
		storyMap.put("editordata", pMap.get("editordata"));
		return storyMap;
	}

	public Map<String, Object> initPjOutlineInsert(Map<String, Object> pMap) {
		Map<String, Object> pjOutLineMap = new HashMap<String, Object>();
		pjOutLineMap.put("PROJECT_CODE", project_code);
		pjOutLineMap.put("pjo_introduction_edit_textarea", pMap.get("pjo_introduction_edit_textarea"));
		pjOutLineMap.put("long_title", pMap.get("long_title"));
		pjOutLineMap.put("short_title", pMap.get("short_title"));
		pjOutLineMap.put("pjo_img_result", pMap.get("pjo_img_result"));
		pjOutLineMap.put("pjo_summary_edit_text", pMap.get("pjo_summary_edit_text"));
		pjOutLineMap.put("pjo_profile_img_result", pMap.get("pjo_profile_img_result"));
		pjOutLineMap.put("pjo_name_text", pMap.get("pjo_name_text"));
		return pjOutLineMap;
	}

	public Map<String, Object> initFundingInsert(Map<String, Object> pMap) {
		Map<String, Object> fundingMap = new HashMap<String, Object>();
		fundingMap.put("PROJECT_CODE", project_code);
		fundingMap.put("goalMoneyOutput", pMap.get("goalMoneyOutput"));
		fundingMap.put("projectEndDateOutput", pMap.get("projectEndDateOutput"));
		return fundingMap;
	}

	public int initGiftInsert(Map<String, Object> pMap, Map<String, Object> giftInsertMap) {
		giftInsertMap.put("PROJECT_CODE", project_code);
		Object keys[] = pMap.keySet().toArray();
		int size = 0;
		for (int i = 0; i < keys.length; i++) {
			if (keys[i].toString().contains("minDonationMoneyOutput")) {
				size++;
			}
		}
		return size;
	}

	List<String> gopCodeList = null;

	public List<Map<String, Object>> initGopCodeInsert(Map<String, Object> pMap) {
		Object keys[] = pMap.keySet().toArray();
		gopCodeList = new ArrayList<String>();
		List<Map<String, Object>> ulList = new ArrayList<Map<String, Object>>();
		Map<String, Object> ulMap = null;
		for (int i = 0; i < keys.length; i++) {
			ulMap = new HashMap<String, Object>();
			if (keys[i].toString().contains("GiftUlListName")) {
				String number = keys[i].toString().substring(14); // GiftUlListName 까지 잘라줌.
				gopCodeList.add(number);
				ulMap.put(keys[i].toString(), pMap.get(keys[i]));
			} else if (keys[i].toString().contains("GiftUlListQuantity")) {
				ulMap.put(keys[i].toString(), pMap.get(keys[i]));
			} else if (keys[i].toString().contains("GiftUlListOption")) {
				ulMap.put(keys[i].toString(), pMap.get(keys[i]));
			}
			if (ulMap.size() > 0) {
				ulList.add(ulMap);
			}
		}
		return ulList;
	}

	public List<Map<String, Object>> initRealListInsert(List<Map<String, Object>> ulList) {
		Map<String, Object> realMap = null;
		List<Map<String, Object>> realList = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < ulList.size(); i++) {
			Object ulKeys[] = ulList.get(i).keySet().toArray();
			String key = ulKeys[0].toString();
			if (key.contains("GiftUlListName")) {
				realMap = new HashMap<String, Object>();
				realMap.put(key, ulList.get(i).get(key));
				realList.add(realMap);
			}
		}
		for (int i = 0; i < ulList.size(); i++) {
			Object ulKeys[] = ulList.get(i).keySet().toArray();
			if (ulKeys[0].toString().contains("GiftUlListQuantity")) {
				String number = ulKeys[0].toString().substring(18);
				for (int j = 0; j < realList.size(); j++) {
					Object realKeys[] = realList.get(j).keySet().toArray();
					if (number.equals(realKeys[0].toString().substring(14))) {
						realList.get(j).put(ulKeys[0].toString(), ulList.get(i).get(ulKeys[0]));
					}
				}
			} else if (ulKeys[0].toString().contains("GiftUlListOption")) {
				String number = ulKeys[0].toString().substring(16);
				for (int j = 0; j < realList.size(); j++) {
					Object realKeys[] = realList.get(j).keySet().toArray();
					for (int x = 0; x < realKeys.length; x++) {
						if (realKeys[x].toString().contains("GiftUlListQuantity")) {
							if (number.equals(realKeys[x].toString().substring(18))) {
								realList.get(j).put(ulKeys[0].toString(), ulList.get(i).get(ulKeys[0]));
							}
						}
					}
				}
			}
		}
		return realList;
	}

	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = { Exception.class })
	@Pointcut(value = "execution(* com.project.*Logic.*(..)")
	public int createProject(Map<String, Object> pMap) throws Exception {

		int result = 0;
		//////////// 프로젝트 크리에이트에 필요한 녀석들 초기화
		Map<String, Object> projectCreateCol = this.initProjectCreate(pMap);
		//////////// 스토리텔링 인서트에 필요한 녀석들 초기화
		Map<String, Object> storyMap = this.initStoryTellingInsert(pMap);
		//////////// pjoutlineinsert에 필요한 녀석들 초기화
		Map<String, Object> pjOutLineMap = this.initPjOutlineInsert(pMap);
		//////////// fundinginsert에 필요한 녀석들 초기화
		Map<String, Object> fundingMap = this.initFundingInsert(pMap);
		//////////// giftinsert에 필요한 녀석들 초기화
		Map<String, Object> giftInsertMap = new HashMap<String, Object>();
		int size = this.initGiftInsert(pMap, giftInsertMap);
		//////////// gopCodeInsert에 필요한 녀석들 초기화
		List<Map<String, Object>> ulList = this.initGopCodeInsert(pMap);
		/// 유엘리스트 네임과, 리스트 퀀티티의 번호가 같은 녀석들을 묶기 위한 코드
		List<Map<String, Object>> realList = this.initRealListInsert(ulList);
		try {
			projectDao.projectcreate(projectCreateCol);
			projectDao.storytellinginsert(storyMap);
			projectDao.pjoutlineinsert(pjOutLineMap);
			projectDao.fundinginsert(fundingMap);
			projectDao.giftinsert(size, giftInsertMap);
			projectDao.giftupdate(pMap);
			projectDao.gopCodeInsert(gopCodeList, realList);
			projectDao.gopInsert();
			result = projectDao.godDesInsert();
		} catch (Exception e) {
			throw e;
		}
		logger.info("###화면에서 가져오는 값들의 사이즈_pMap.size() : " + pMap.size());
		return result;
	}

	public List<GiftVO> gift_limited(List<GiftVO> gList) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int value = 0;
		Map<String, Integer> code = new HashMap<String, Integer>();
		if (gList != null) {
			for (int z = 0; z < gList.size(); z++) {
				if (gList.get(z).getPROJECT_CODE() != null) {
					PublicKey project_key = null;
					try {
						project_key = (PublicKey) Base64Conversion.decodeBase64(gList.get(z).getPj_publickey());
					} catch (Exception e) {
						e.printStackTrace();
					}
					int sup_num = 0;
					for (int i = 0; i < blockChain.blockChain.size(); i++) {
						Block block = blockChain.blockChain.get(i);
						for (int j = 0; j < block.transactions.size(); j++) {
							Transaction transaction = block.transactions.get(j);
							if (project_key.equals(transaction.recipient)) {
								String gift_code = gList.get(z).getGIFT_CODE();
								if (gift_code.equals(transaction.giftCode)) {
									sup_num++;
								}
							}
						}
					}
					if (getTransactionList != null) {
						for (int j = 0; j < getTransactionList.size(); j++) {
							Map<String, Object> transactionMap = getTransactionList.get(j);
							if (project_key.equals(transactionMap.get("projectPuk"))) {
								String gift_code = gList.get(z).getGIFT_CODE();
								if (gift_code.equals(transactionMap.get("p_gift_code"))) {
									sup_num++;
								}
							}
						}
					}
					gList.get(z).setSupport_num(sup_num);
					sup_num = 0;
				}
			}
		}
		return gList;
	}

///////10-16 정원형 프로젝트 디테일에서 gift 옵션 부분 뿌려주는 것 작업////////////
	public List<Object> getprojectGiftDetail(String projectCode) {
		logger.info("Logic getprojectGiftDetail 호출성공");
		List<Object> projectGiftDetail = null;
		projectGiftDetail = projectDao.getprojectGiftDetail(projectCode);
		List<GiftVO> gList = gift_limited((List<GiftVO>) projectGiftDetail.get(1));
		projectGiftDetail.remove(1);
		projectGiftDetail.add(1, gList);
		return projectGiftDetail;
	}
//////10-16 정원형 프로젝트 디테일에서 gift 옵션 부분 뿌려주는 것 작업////////////

	public ProjectVO getDetailFundedMoney(ProjectVO pVO) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		int value = 0;
		Map<String, Integer> code = new HashMap<String, Integer>();
		PublicKey project_key = null;
		try {
			project_key = (PublicKey) Base64Conversion.decodeBase64(pVO.getPj_publickey());
		} catch (Exception e) {
			e.printStackTrace();
		}
		int sup_num = 0;
		for (int i = 0; i < blockChain.blockChain.size(); i++) {
			Block block = blockChain.blockChain.get(i);
			for (int j = 0; j < block.transactions.size(); j++) {
				Transaction transaction = block.transactions.get(j);
				if (project_key.equals(transaction.recipient)) {
					value += transaction.value;
					sup_num++;
				}
			}
		}
		if (getTransactionList != null) {
			for (int j = 0; j < getTransactionList.size(); j++) {
				Map<String, Object> transactionMap = getTransactionList.get(j);
				if (project_key.equals(transactionMap.get("projectPuk"))) {
					value += Integer.parseInt(transactionMap.get("amount").toString());
					sup_num++;
				}
			}
		}
		String target = (pVO.getFd_targetMoney()).replace(",", "");
		pVO.setFundedMoney(value);
		pVO.setFd_targetMoney(target);
		pVO.setSupport_num(sup_num);
		int success = (int) ((Double.valueOf(value) / Integer.parseInt(target)) * 100);
		pVO.setSuccessMoney(success);

		value = 0;

		pVO = getDetailOutLine(pVO);
		return pVO;
	}

	public ProjectVO getDetailOutLine(ProjectVO pVO) {
		Map<String, Integer> code = new HashMap<String, Integer>();

		String proDate = pVO.getFd_deadLine();
		String strFormat = "yyyy-MM-dd"; // strStartDate 와 strEndDate 의 format
		Date time = new Date();
		// SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
		SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
		String nowDate = sdf.format(time);
		long diffDay = 0;
		try {
			Date startDate = sdf.parse(proDate);
			Date endDate = sdf.parse(nowDate);

			// 두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
			diffDay = (startDate.getTime() - endDate.getTime()) / (24 * 60 * 60 * 1000);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		pVO.setOutLine(diffDay);
		return pVO;
	}

	////////////////////////////////
	public int getCreaterProjects(String projectCreaterName) {
		int createrProjectCount = 0;
		createrProjectCount = projectDao.getCreaterProjects(projectCreaterName);
		return createrProjectCount;
	}

	public String getCreaterPfimg(String projectCreaterName) {
		String createrPfimg = null;
		createrPfimg = projectDao.getCreaterPfimg(projectCreaterName);
		return createrPfimg;
	}

	// 관리자용 프로젝트 리스트 가져오기 ^^
	public Object ManageProjects(ProjectVO pVO) {
		List<ProjectVO> managerProjects = projectDao.ManageProjects(pVO);
		for (int i = 0; i < managerProjects.size(); i++) {
			ProjectVO raVO = managerProjects.get(i);
		}
		return managerProjects;
	}

	// 2019-10-23 고명석 추가부분 - 통계 넣기
	public Map<String, Object> chartcnt(String pjo_code) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		List<String> mem_publick = new ArrayList();
		String pjo_key = projectDao.getPjo_code(pjo_code);
		PublicKey project_key = null;
		PublicKey mem_publicKey = null;
		PublicKey publicKey = null;
		try {
			publicKey = (PublicKey) Base64Conversion.decodeBase64(pjo_key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int j = 0; j < blockChain.blockChain.size(); j++) {
			Block block = blockChain.blockChain.get(j);
			for (int k = 0; k < block.transactions.size(); k++) {
				Transaction transaction = block.transactions.get(k);
				if (transaction.recipient.equals(publicKey)) {
					mem_publicKey = transaction.sender;
					String mem_publickK = null;
					try {
						mem_publickK = Base64Conversion.encodePublicKey(mem_publicKey);
					} catch (Exception e) {
					}
					mem_publick.add(mem_publickK);
				}
			}
		}
		if (getTransactionList != null) {
			for (int k = 0; k < getTransactionList.size(); k++) {
				Map<String, Object> transactionMap = getTransactionList.get(k);
				if (transactionMap.get("projectPuk").equals(publicKey)) {
					Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
					mem_publicKey = buyerWallet.getPublicKey();
					String mem_publickK = null;
					try {
						mem_publickK = Base64Conversion.encodePublicKey(mem_publicKey);
					} catch (Exception e) {
					}
					mem_publick.add(mem_publickK);
				}
			}
		}
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("mem_publick", mem_publick);
		List<MemberVO> cnt = new ArrayList<MemberVO>();
		List<MemberVO> cntList = new ArrayList<MemberVO>();
		if (mem_publick.size() > 0) {
			cnt = projectDao.getMemAge(pMap);
		}
		for(int i=0;i<mem_publick.size();i++) {
			MemberVO mVO = new MemberVO();
			mVO.setMem_publickey(mem_publick.get(i));
			for(int j = 0;j<cnt.size();j++) {
				if(mVO.getMem_publickey().equals(cnt.get(j).getMem_publickey())){
					mVO.setMem_age(cnt.get(j).getMem_age());
					cntList.add(mVO);
				}
			}
		}
		int count10 = 0;
		int count20 = 0;
		int count30 = 0;
		int count40 = 0;
		int count50 = 0;
		for (int i = 0; i < cntList.size(); i++) {
			if (Integer.parseInt(cntList.get(i).getMem_age()) < 20) {// 10대
				count10++;
			} else if (Integer.parseInt(cntList.get(i).getMem_age()) < 30 && Integer.parseInt(cntList.get(i).getMem_age()) >= 20) {// 20대
				count20++;
			} else if (Integer.parseInt(cntList.get(i).getMem_age()) < 40 && Integer.parseInt(cntList.get(i).getMem_age()) >= 30) {// 30대
				count30++;
			} else if (Integer.parseInt(cntList.get(i).getMem_age()) < 50 && Integer.parseInt(cntList.get(i).getMem_age()) >= 40) {// 40대
				count40++;
			} else if (Integer.parseInt(cntList.get(i).getMem_age()) >= 50) {// 50대이상
				count50++;
			}
		}
		pMap = new HashMap<String, Object>();
		pMap.put("10대", count10);
		pMap.put("20대", count20);
		pMap.put("30대", count30);
		pMap.put("40대", count40);
		pMap.put("50대", count50);

		return pMap;
	}

	// 2019-10-24 고명석 추가부분 - 펀딩한사람 이름 금액
	public List<MemberVO> fundingMember(String pjo_code) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		List<String> mem_publick = new ArrayList();
		String pjo_key = projectDao.getPjo_code(pjo_code);
		PublicKey mem_publicKey = null;
		List<Map<String, Object>> valueList = new ArrayList<Map<String, Object>>();
		Map<String, Object> valueMap = new HashMap<String, Object>();
		PublicKey publicKey = null;
		try {
			publicKey = (PublicKey) Base64Conversion.decodeBase64(pjo_key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int j = 0; j < blockChain.blockChain.size(); j++) {
			Block block = blockChain.blockChain.get(j);
			for (int k = 0; k < block.transactions.size(); k++) {
				Transaction transaction = block.transactions.get(k);
				if (transaction.recipient.equals(publicKey)) {
					valueMap = new HashMap<String, Object>();
					mem_publicKey = transaction.sender;
					String mem_publickK = null;
					try {
						mem_publickK = Base64Conversion.encodePublicKey(mem_publicKey);
					} catch (Exception e) {
					}
					mem_publick.add(mem_publickK);
					valueMap = new HashMap<String, Object>();
					valueMap.put("mem_publicKey", mem_publickK);
					valueMap.put("mem_value", transaction.value);
					valueMap.put("timeStamp", transaction.timeStamp);
					valueList.add(valueMap);
				}
			}
		}
		if (getTransactionList != null) {
			for (int k = 0; k < getTransactionList.size(); k++) {
				Map<String, Object> transactionMap = getTransactionList.get(k);
				if (transactionMap.get("projectPuk").equals(publicKey)) {
					valueMap = new HashMap<String, Object>();
					Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
					mem_publicKey = buyerWallet.getPublicKey();
					String mem_publickK = null;
					try {
						mem_publickK = Base64Conversion.encodePublicKey(mem_publicKey);
					} catch (Exception e) {
					}
					mem_publick.add(mem_publickK);
					valueMap = new HashMap<String, Object>();
					valueMap.put("mem_publicKey", mem_publickK);
					valueMap.put("mem_value", transactionMap.get("amount"));
					valueMap.put("timeStamp", transactionMap.get("timeStamp"));
					valueList.add(valueMap);
				}
			}
		}
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<MemberVO> cnt = new ArrayList<>();
		List<MemberVO> cntList = new ArrayList<>();
		if (mem_publick.size() > 0) {
			pMap.put("mem_publick", mem_publick);
			cnt = projectDao.getMemname(pMap);
			for(int i=0;i<valueList.size();i++) {
				MemberVO mVO = new MemberVO();
				mVO.setMem_publickey(valueList.get(i).get("mem_publicKey").toString());
				mVO.setMem_value(valueList.get(i).get("mem_value").toString());
				mVO.setTimeStamp(valueList.get(i).get("timeStamp").toString());
				for(int j=0;j<cnt.size();j++) {
					if(mVO.getMem_publickey().equals(cnt.get(j).getMem_publickey())) {
						mVO.setMem_name(cnt.get(j).getMem_name());
						mVO.setMem_publickey(cnt.get(j).getMem_publickey());
						mVO.setMem_pfimg(cnt.get(j).getMem_pfimg());
						cntList.add(mVO);
					}
				}
			}
		}
		return cntList;
	}

	public String ApporveProject(String projectCode) {
		String msg = null;
		int result = projectDao.ApporveProject(projectCode);
		if (result == 1) {
			msg = "승인이 완료 ";
		} else {
			msg = "승인 실패 ";
		}
		return msg;
	}

	public List<ProjectVO> getProjectTable(String mem_email) {
		List<ProjectVO> getProjectTable = new ArrayList<>();
		getProjectTable = getFundedMoney(projectDao.getMyProjects(mem_email));
		return getProjectTable;
	}

	public List<ProjectVO> getProjectOption(String pjo_code) {
		// 가져와야 할거 제목 후원자 금액 날짜 주소 세부내용(옵션이름/수량/세부옵션
		// 블록체인에서 가져와야 할거 - 후원자 후원금액 날짜 주소 상품세부옵션
		// 세부옵션 뽑기 gopMap에서 keyset뽑고 그거 토크나이저로 - 기준 자르기 자른걸로 db가서 옵션이름 수량 가져오기
		// db에서 가져올거 제목 옵션 제목 수량
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		List<String> mem_publick = new ArrayList();
		String pjo_key = projectDao.getPjo_code(pjo_code);
		PublicKey mem_publicKey = null;
		List<Map<String, Object>> valueList = new ArrayList<Map<String, Object>>();
		Map<String, Object> valueMap = new HashMap<String, Object>();
		PublicKey publicKey = null;
		try {
			publicKey = (PublicKey) Base64Conversion.decodeBase64(pjo_key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int j = 0; j < blockChain.blockChain.size(); j++) {
			Block block = blockChain.blockChain.get(j);
			for (int k = 0; k < block.transactions.size(); k++) {
				Transaction transaction = block.transactions.get(k);
				if (transaction.recipient.equals(publicKey)) {
					valueMap = new HashMap<String, Object>();
					mem_publicKey = transaction.sender;
					String mem_publickK = null;
					try {
						mem_publickK = Base64Conversion.encodePublicKey(mem_publicKey);
					} catch (Exception e) {
					}
					String mem_email = projectDao.getMemEmail(mem_publickK);
					String zip = null;
					String addr = null;
					try {
						AES256Util aes = new AES256Util(mem_email);
						zip = aes.decrypt(transaction.addrMap.get("buyer_postcode").toString());
						addr = aes.decrypt(transaction.addrMap.get("buyer_addr").toString());
					} catch (Exception e) {
						e.printStackTrace();
					}
					mem_publick.add(mem_publickK);
					valueMap.put("mem_zipcode", zip);
					valueMap.put("mem_addr", addr);
					valueMap.put("mem_publicKey", mem_publickK);
					valueMap.put("mem_value", transaction.value);
					valueMap.put("timeStamp", transaction.timeStamp);
					valueMap.put("txId", transaction.txId);
					valueList.add(valueMap);
				}
			}
		}
		if (getTransactionList != null) {
			for (int k = 0; k < getTransactionList.size(); k++) {
				Map<String, Object> transactionMap = getTransactionList.get(k);
				if (transactionMap.get("projectPuk").equals(publicKey)) {
					valueMap = new HashMap<String, Object>();
					Wallet buyerWallet = (Wallet) transactionMap.get("buyerWallet");
					mem_publicKey = buyerWallet.getPublicKey();
					String mem_publickK = null;
					try {
						mem_publickK = Base64Conversion.encodePublicKey(mem_publicKey);
					} catch (Exception e) {
					}
					String mem_email = projectDao.getMemEmail(mem_publickK);
					String zip = null;
					String addr = null;
					try {
						AES256Util aes = new AES256Util(mem_email);
						Map<String, Object> addrMap = new HashMap<>();
						addrMap = (Map<String, Object>)transactionMap.get("addrMap");
						zip = aes.decrypt(addrMap.get("buyer_postcode").toString());
						addr = aes.decrypt(addrMap.get("buyer_addr").toString());
					} catch (Exception e) {
						e.printStackTrace();
					}
					mem_publick.add(mem_publickK);
					valueMap.put("mem_zipcode", zip);
					valueMap.put("mem_addr", addr);
					valueMap.put("mem_publicKey", mem_publickK);
					valueMap.put("mem_value", transactionMap.get("amount"));
					valueMap.put("timeStamp", transactionMap.get("timeStamp"));
					valueMap.put("txId", transactionMap.get("timeID"));
					valueList.add(valueMap);
				}
			}
		}
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<ProjectVO> getProjectOption = new ArrayList<>();
		List<ProjectVO> testList = new ArrayList<ProjectVO>();
		if (mem_publick.size() > 0) {
			pMap.put("mem_publick", mem_publick);
			getProjectOption = projectDao.getPjomemName(pMap);
			for(int i=0;i<valueList.size();i++) {
				ProjectVO pVO = new ProjectVO();
				pVO.setMem_publicKey(valueList.get(i).get("mem_publicKey").toString());
				pVO.setFundedvalue(Integer.parseInt(valueList.get(i).get("mem_value").toString()));  
				pVO.setPj_date(valueList.get(i).get("timeStamp").toString());                        
				pVO.setMem_addr(valueList.get(i).get("mem_addr").toString());                        
				pVO.setMem_zipcode(valueList.get(i).get("mem_zipcode").toString());                  
				pVO.setTxId(valueList.get(i).get("txId").toString());
				for(int j =0;j<getProjectOption.size();j++) {
					if(pVO.getMem_publicKey().equals(getProjectOption.get(j).getMem_publicKey())) {
						pVO.setMem_nickname(getProjectOption.get(j).getMem_nickname());
						pVO.setMem_publicKey(getProjectOption.get(j).getMem_publicKey());
						pVO.setMem_email(getProjectOption.get(j).getMem_email());
						testList.add(pVO);	
					}
				}
			}
			
		}
		return testList;
	}

	public List<Object> getmypjogiftOption(String pjo_code, String txId) {
		BlockChain blockChain = getBlockChain();
		List<Map<String, Object>> getTransactionList = getTransactionList();
		String pjo_key = projectDao.getPjo_code(pjo_code);
		PublicKey project_key = null;
		PublicKey publicKey = null;
		try {
			publicKey = (PublicKey) Base64Conversion.decodeBase64(pjo_key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Map<String, Object>> List = new ArrayList<Map<String, Object>>();
		List<String> gop_codes = new ArrayList<String>();
		for (int j = 0; j < blockChain.blockChain.size(); j++) {
			Block block = blockChain.blockChain.get(j);
			for (int k = 0; k < block.transactions.size(); k++) {
				Transaction transaction = block.transactions.get(k);
				if (txId.equals(transaction.txId)) {
					gop_codes.add(transaction.giftCode);
					if (transaction.godMap != null) {
						Object keys[] = transaction.godMap.keySet().toArray();
						for (int z = 0; z < keys.length; z++) {
							Map<String, Object> map = new HashMap<String, Object>();
							String key = keys[z].toString();
							String[] split = key.split("-");
							String str = key.substring(0, 7);
							map.put("gop_code", split[1]);
							map.put("god_option", transaction.godMap.get(keys[z]));
							List.add(map);
						}
					}
				}
			}
		}
		if (getTransactionList != null) {
			for (int k = 0; k < getTransactionList.size(); k++) {
				Map<String, Object> transactionMap = getTransactionList.get(k);
				if (txId.equals(transactionMap.get("timeID").toString())) {
					gop_codes.add(transactionMap.get("p_gift_code").toString());
					if (transactionMap.get("godMap") != null) {
						Map<String, Object> godMap = (Map<String, Object>) transactionMap.get("godMap");
						Object keys[] = godMap.keySet().toArray();
						for (int z = 0; z < keys.length; z++) {
							Map<String, Object> map = new HashMap<String, Object>();
							String key = keys[z].toString();
							String[] split = key.split("-");
							String str = key.substring(0, 7);
							map.put("gop_code", split[1]);
							map.put("god_option", godMap.get(keys[z]));
							List.add(map);
						}
					}
				}
			}
		}
		logger.info("=========gop_codes : "+gop_codes);
		List<Map<String, Object>> gop_option = projectDao.getmygiftoption(gop_codes);

		List<Object> all = new ArrayList<Object>();
		all.add(List);
		all.add(gop_option);
		return all;
	}

}
