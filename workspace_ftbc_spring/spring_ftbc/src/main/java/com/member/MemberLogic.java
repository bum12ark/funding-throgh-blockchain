package com.member;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blockchain.Block;
import blockchain.BlockChain;
import blockchain.Transaction;
import blockchain.util.Base64Conversion;
import blockchain.util.CommonSet;
import exe.util.Path;
import vo.MemberVO;
import vo.MessageVO;

@Service
public class MemberLogic {
	private static final Logger logger = LoggerFactory.getLogger(MemberLogic.class);

	@Autowired
	MemberDao memberDao = null;

	public String emailCheck(MemberVO mVO) {
		logger.info("Logic emailCheck 호출 성공");
		String result = null;
		result = memberDao.emailCheck(mVO);
		return result;
	}

	public String memberLogin(MemberVO mVO) {
		logger.info("Logic memberLogin 성공");
		String result = null;
		result = memberDao.memberLogin(mVO);
		return result;
	}

	public int memberJoin(MemberVO mVO) {
		int result = 0;
		result = memberDao.memberJoin(mVO);
		return result;
	}

	public int join(MemberVO mVO) {
		int result = 0;
		logger.info("Logic join 호출 ");
		result = memberDao.join(mVO);
		return result;
	}

	public void login(MemberVO mVO) {
		logger.info("Logic login 호출 ");
		memberDao.login(mVO);

		// mVO = getMyProjects(mVO);
	}

	public BlockChain getBlockChain() {
		BlockChain blockChain = null;
		try {
			String blockchain64 = Base64Conversion.importChain("FTBC", Path.SERVER_CHAIN_PATH);
			blockChain = (BlockChain) Base64Conversion.decodeBase64(blockchain64);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blockChain;

	}

/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
	public int forgotEmail(Map<String, Object> pMap) {
		logger.info("Logic forgotEmail 호출");
		int result = 0;
		result = memberDao.forgotEmail(pMap);
		return result;
	}

/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////
	public String prepasswordconfirm(MemberVO mVO) {
		String result = null;
		logger.info("Logic 이전패스워드확인 호출");
		result = memberDao.prepasswordConfirm(mVO);
		return result;
	}

	public int editAccount(MemberVO mVO) {
		int result = 0;
		logger.info("Logic 변경할패스워드 호출 성공");
		result = memberDao.editAccount(mVO);
		return result;
	}
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////

	// 내가 펀딩한 프로젝트들 가져오기
	public MemberVO getMyProjects(MemberVO mVO) {
		List<String> projectCodes = new ArrayList<>();
		PublicKey my_publicKey = null;
		try {
			my_publicKey = (PublicKey) Base64Conversion.decodeBase64(memberDao.getPublicKey(mVO.getMem_email()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		CommonSet commonset = CommonSet.getInstance();
		BlockChain blockChain = getBlockChain();
		int FundingToProject = 0;
		for (int i = 0; i < blockChain.blockChain.size(); i++) {
			Block block = blockChain.blockChain.get(i);
			for (int j = 0; j < block.transactions.size(); j++) {
				Transaction transaction = block.transactions.get(j);
				PublicKey funded_publicKey = null;
				if (my_publicKey.equals(transaction.sender)) {
					funded_publicKey = transaction.recipient;
					Object keys[] = commonset.projectWallets.keySet().toArray();
					for (int k = 0; k < keys.length; k++) {
						FundingToProject = keys.length;
					}
				}
			}
		}
		mVO.setFundingToProject(FundingToProject);
		int myProjects = memberDao.getMyProjects(mVO.getMem_email());
		mVO.setMyProject(myProjects);
		return mVO;
	}

	public int MemberUpdate(Map<String, Object> pMap) {
		String zipcode = pMap.get("buyer_post1") + "-" + pMap.get("buyer_post2");
		pMap.put("zipCode", zipcode);
		String mem_hp = pMap.get("hp1") + "-" + pMap.get("hp2") + "-" + pMap.get("hp3");
		pMap.put("mem_hp", mem_hp);
		int result = memberDao.MemberUpdate(pMap);
		return result;
	}

	public MemberVO memberReplace(MemberVO mVO) {
		mVO = memberDao.memberReplace(mVO);
		return mVO;
	}
//////////////////2019-10-16 고명석 수정   
public void messageSend(Map<String, Object> pMap) {
pMap = memberDao.messageRecipient(pMap);
memberDao.messageCode(pMap);
memberDao.messageSend(pMap);
}
//////////////////2019-10-16 고명석 수정   
//////////////////2019-10-17 고명석 수정

public Map<String,Object> getMessage(String mem_email) {
List<MessageVO> myMessage = new ArrayList<>();
//문의 후원 메세지 가져오기
myMessage = memberDao.myMessage(mem_email);
List<String> projectCodes = new ArrayList<>();
projectCodes = getMyPjocode(mem_email);
List<MessageVO> myPjoMessage = new ArrayList<>();
//내가 만든 프로젝트의 메세지 가져오기
myPjoMessage = memberDao.myPjoMessage(projectCodes,mem_email);
Map<String,Object> rMap = new HashMap<String, Object>();
rMap.put("myMessage", myMessage);
rMap.put("myPjoMessage", myPjoMessage);
return rMap;
}

public List<String> getMyPjocode(String mem_email){
List<String> projectCodes = new ArrayList<>();
projectCodes = memberDao.getMsProcode(mem_email);
return projectCodes;
}

public void messageUpdate(String ms_code) {
memberDao.messageUpdate(ms_code);
}


//////////////////2019-10-17 고명석 수정  
}
