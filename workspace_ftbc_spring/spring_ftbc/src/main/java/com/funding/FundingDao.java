package com.funding;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ProjectVO;
import vo.GiftVO;


@Repository
public class FundingDao {
	private static final Logger logger = LoggerFactory.getLogger(FundingDao.class);
	
	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;
	
	public String getPublicKey(String mem_email) {
		String publicKey = sqlSessionTemplate.selectOne("getPublicKey",mem_email);
		logger.info("====================publicKey: "+publicKey);
		return publicKey;
	}
	
	public List<Map<String, Object>> getGift(String projectCode) {
		 List<Map<String, Object>> giftList = new ArrayList<>();
		 giftList = sqlSessionTemplate.selectList("getGift",projectCode);
		return giftList;
	}
	
	public List<Map<String, Object>> getGiftOption(List<String> giftCode) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("giftCode",giftCode);
 		List<Map<String, Object>> giftOptionList = new ArrayList<>();
		giftOptionList = sqlSessionTemplate.selectList("getGiftOption",map);
		return giftOptionList;
	}
	
	public List<Object> getprojectGiftDetail(String projectCode) {
		logger.info("Dao FundGiftDetail 호출 성공");
		List<String> projectGiftCode = null;
		List<GiftVO> projectGiftDetail = null;
		projectGiftCode = sqlSessionTemplate.selectList("projectGiftCode",projectCode);
		Map<String,Object> pMap = new HashMap<>();
		if (projectGiftCode.size() > 0) {
		pMap.put("projectGiftCode", projectGiftCode);
		projectGiftDetail = sqlSessionTemplate.selectList("projectGiftDetail",pMap);
		}
		List<Object> giftObj = new ArrayList<>();
		giftObj.add(projectGiftCode);
		giftObj.add(projectGiftDetail);
		return giftObj;
	}
	
	public ProjectVO getProjectDetail(String projectCode) {
		logger.info("Dao getProjectDetail 호출");
		ProjectVO projectDetail =null;
		projectDetail = sqlSessionTemplate.selectOne("projectDetail", projectCode);
		return projectDetail;
	}

	public ProjectVO getPayFund(String gift_code, String pjo_code) {
		logger.info("Dao getPaFund 호출성공");
		ProjectVO payFund = null;
		if(gift_code.equals("0")) {
		payFund = sqlSessionTemplate.selectOne("project_longtitle",pjo_code);
		}
		else {
		payFund = sqlSessionTemplate.selectOne("payFund",gift_code);	
		}
		return payFund;
	}

	public List<GiftVO> sortationSelect(List<String> pList) {
		List<GiftVO> sortationSelect = sqlSessionTemplate.selectList("sortationSelect",pList);
		return sortationSelect;
	}
}
