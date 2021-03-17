package com.chain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ChainVO;
import vo.MemberVO;

@Repository
public class ChainDao {
	private static final Logger logger = LoggerFactory.getLogger(ChainDao.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	//#DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기
	public Map<String, Object> getProjectInfo(String project_name) {
		logger.info("getProjectInfo 호출");
		Map<String, Object> rMap = new HashMap<>();
		rMap = sqlSessionTemplate.selectOne("getProjectInfo", project_name);
		return rMap;
	}
	////////////////박상범 중간합본 이후 추가 || 수정 /////////////////
	public List<Map<String, Object>> getCreatorInfo(List<String> dbList) {
		logger.info("getCreatorInfo: List<Map<String, Object>> 호출");
		List<Map<String, Object>> resultList = sqlSessionTemplate.selectList("getCreatorInfo", dbList);
		return resultList;
	}
	public List<Map<String, Object>> getDonatorInfo(List<String> dbList) {
		logger.info("getDonatorInfo: List<Map<String, Object>> 호출");
		List<Map<String, Object>> resultList = sqlSessionTemplate.selectList("getDonatorInfo", dbList);
		return resultList;
	}
	public String isCreatorAuthorized(Map<String, Object> pMap) {
		logger.info("isCretorAuthorized 호출");
		String isAuthorized = sqlSessionTemplate.selectOne("isCreatorAuthorized", pMap);
		logger.info("isCreatorAuthorized : "+isAuthorized);
		return isAuthorized;
	}
	public String isDonatorAuthorized(Map<String, Object> pMap) {
		logger.info("isDonatorAuthorized: 호출");
		String isAuthorized = sqlSessionTemplate.selectOne("isDonatorAuthorized", pMap);
		return isAuthorized;
	}
	public void getDetailChainInfo(ChainVO chainVO) {
		logger.info("getDetailChainInfo 호출");
		sqlSessionTemplate.selectOne("getDetailChainInfo", chainVO);
	}
	
	
	////////////////박상범 중간합본 이후 추가 || 수정 /////////////////
	public String getMemPubKey(String mem_email) {
		logger.info("getMemPubKey: String 호출");
		String encoded_pub = sqlSessionTemplate.selectOne("getMemPubKey", mem_email);
		return encoded_pub;
	}
}
