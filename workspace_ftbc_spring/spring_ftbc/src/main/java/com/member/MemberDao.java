package com.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;
import vo.MessageVO;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);

	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;

	public String memberLogin(MemberVO mVO) {
		String result = null;
		logger.info("Dao  memberLogin 호출 ");
		result = sqlSessionTemplate.selectOne("memberLogin", mVO);
		return result;
	}

	public int memberJoin(MemberVO mVO) {
		int result = 0;
		return result;
	}

	public String emailCheck(MemberVO mVO) {
		String result = null;
		logger.info("Dao  memberemailCheck 호출 ");
		result = sqlSessionTemplate.selectOne("emailCheck", mVO);
		return result;
	}

	public int join(MemberVO mVO) {
		int result = 0;
		logger.info("Dao  join 호출 ");
		result = sqlSessionTemplate.insert("join", mVO);
		return result;
	}

	public void login(MemberVO mVO) {
		logger.info("Dao  join 호출 ");
		sqlSessionTemplate.selectOne("login", mVO);
	}

/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
	public int forgotEmail(Map<String, Object> pMap) {
		int result = 0;
		logger.info("Dao forgotEmail 호출");
		result = sqlSessionTemplate.update("forgotEmail", pMap);
		return result;
	}

/////////////////////2019-10-14 정원형 중간합산 이후 비밀번호 찾기 //////////////////////
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////
	public String prepasswordConfirm(MemberVO mVO) {
		logger.info("Dao 이전패스워드확인 호출");
		String result = null;
		result = sqlSessionTemplate.selectOne("prepasswordConfirm", mVO);
		return result;
	}

	public int editAccount(MemberVO mVO) {
		int result = 0;
		logger.info("Dao editAccount 호출성공");
		result = sqlSessionTemplate.update("editAccount", mVO);
		return result;
	}
/////////////////////2019-10-15 정원형 비번변경/////////////////////////////

////////////////////2019-10-16 //////////////////////////////
	public String getPublicKey(String mem_email) {
		String publicKey = sqlSessionTemplate.selectOne("getPublicKey", mem_email);
		logger.info("==============" + publicKey);
		return publicKey;
	}

	public int getMyProjects(String mem_email) {
		String mem_id[] = mem_email.split("@");
		int myProjects = sqlSessionTemplate.selectOne("getMyProjects", mem_id[0]);
		return myProjects;
	}

////////////////////2019-10-16 //////////////////////////////
	public int MemberUpdate(Map<String, Object> pMap) {
		int result = sqlSessionTemplate.update("MemberUpdate", pMap);
		return result;
	}

	public MemberVO memberReplace(MemberVO mVO) {
		mVO = sqlSessionTemplate.selectOne("memberReplace", mVO);
		return mVO;
	}
	public void messageSend(Map<String, Object> pMap) {
		sqlSessionTemplate.update("messageSend",pMap);
	}

	public void messageCode(Map<String, Object> pMap) {
		sqlSessionTemplate.update("messageCode",pMap);
		
	}

	public Map<String, Object> messageRecipient(Map<String, Object> pMap) {
		logger.info("code: "+pMap);
		String mem_email = sqlSessionTemplate.selectOne("messageRecipient", pMap);
		pMap.put("mem_email", mem_email);
		return pMap;
	}


	public List<MessageVO> myMessage(String mem_email) {
		List<MessageVO> myMessage = null;
		myMessage = sqlSessionTemplate.selectList("myMessage", mem_email);
		return myMessage;
	}

	public List<MessageVO> myPjoMessage(List<String> projectCodes, String mem_email) {
		List<MessageVO> myPjoMessage = null;
		Map<String,Object> pMap = new HashMap<String, Object>();
		logger.info("코드 : "+projectCodes);
		if(projectCodes.size()>0) {
			pMap.put("projectCodes", projectCodes);
			pMap.put("mem_email", mem_email);
			myPjoMessage = sqlSessionTemplate.selectList("myPjoMessage", pMap);
		}
		return myPjoMessage;
	}

	public List<String> getMsProcode(String mem_email) {
		List<String> getMsProcode = sqlSessionTemplate.selectList("getMsProcode",mem_email);
		return getMsProcode;
	}

	public void messageUpdate(String ms_code) {
		sqlSessionTemplate.update("messageUpdate",ms_code);
	}
}