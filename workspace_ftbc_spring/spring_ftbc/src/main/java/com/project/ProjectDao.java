package com.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GiftVO;
import vo.MemberVO;
import vo.ProjectVO;

/*
 * 
 */
@Repository
public class ProjectDao {
	private static final Logger logger = LoggerFactory.getLogger(ProjectDao.class);

	@Autowired
	public SqlSessionTemplate sqlSessionTemplate = null;

	// 퍼블릭키 가져오기 - v
	public String getPublicKey(String mem_email) {
		String publicKey = sqlSessionTemplate.selectOne("getPublicKey", mem_email);
		return publicKey;
	}

	// 모든 프로젝트 - v
	public List<ProjectVO> allProjects() {
		List<ProjectVO> allProjects = new ArrayList<>();
		allProjects = sqlSessionTemplate.selectList("allProjects");
		return allProjects;
	}

	// 키워드별 프로젝트 - v
	public List<ProjectVO> getKeywordProjects(String keyword) {
		List<ProjectVO> keywordProjects = new ArrayList<>();
		keywordProjects = sqlSessionTemplate.selectList("keywordProjects", keyword);
		return keywordProjects;
	}

	// 카테고리별 프로젝트 - v
	public List<ProjectVO> getCategoryProjects(Map<String, Object> pMap) {
		List<ProjectVO> categoryProjects = new ArrayList<>();
		categoryProjects = sqlSessionTemplate.selectList("categoryProjects", pMap);
		return categoryProjects;
	}

	// 내가 펀딩한 프로젝트 - p
	public List<ProjectVO> getFundedProject(List<String> projectCodes) {
		logger.info("Dao getFundedProject 호출 성공");
		List<ProjectVO> fundedProject = new ArrayList<>();
		if (projectCodes.size() > 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectCodes", projectCodes);
			fundedProject = sqlSessionTemplate.selectList("fundedProject", map);
		}
		return fundedProject;
	}

	// 내가 만든 프로젝트 - p
	public List<ProjectVO> getMyProjects(String mem_email) {
		List<ProjectVO> myProjects = new ArrayList<>();
		myProjects = sqlSessionTemplate.selectList("myProjects", mem_email);
		return myProjects;
	}

	// 프로젝트 상세보기 - v
	public ProjectVO getProjectDetail(String projectCode) {
		logger.info("getProjectDetail: ProjectVO 호출");
		ProjectVO projectDetail = null;
		projectDetail = sqlSessionTemplate.selectOne("projectDetail", projectCode);
		return projectDetail;
	}

	// 프로젝트 생성하기 - v
	public int projectcreate(Map<String, Object> projectCreateCol) {
		int result = sqlSessionTemplate.update("projectcreate", projectCreateCol);
		return result;
	}

	// 스토리텔링부분 INSERT - v
	public int storytellinginsert(Map<String, Object> storyMap) {
		int result = sqlSessionTemplate.update("storytellinginsert", storyMap);
		return result;
	}

	// 아웃라인부분 INSERT - v
	public int pjoutlineinsert(Map<String, Object> pjOutLineMap) {
		int result = sqlSessionTemplate.update("pjoutlineinsert", pjOutLineMap);
		return result;
	}

	// 펀딩부분 INSERT - p
	public int fundinginsert(Map<String, Object> fundingMap) {
		int result = sqlSessionTemplate.update("fundinginsert", fundingMap);
		return result;
	}

	// ?
	public List<ProjectVO> recommnadProjects() {
		List<ProjectVO> recommnadProjects = new ArrayList<>();
		recommnadProjects = sqlSessionTemplate.selectList("allProjects");
		return recommnadProjects;
	}

	// ?
	public List<ProjectVO> newProjects() {
		List<ProjectVO> newProjects = new ArrayList<>();
		newProjects = sqlSessionTemplate.selectList("newProjects");
		return newProjects;
	}

	// 프로젝트 코드 생성하기
	public Map<String, Object> projectCode(Map<String, Object> pMap) {
		sqlSessionTemplate.selectOne("proc_procode", pMap);
		return pMap;
	}

	public List<Map<String, Object>> getGift(String projectCode) {
		List<Map<String, Object>> giftList = new ArrayList<>();
		giftList = sqlSessionTemplate.selectList("getGift", projectCode);
		return giftList;
	}

	public List<Map<String, Object>> getGiftOption(List<String> giftCode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("giftCode", giftCode);
		List<Map<String, Object>> giftOptionList = new ArrayList<>();
		giftOptionList = sqlSessionTemplate.selectList("getGiftOption", map);
		return giftOptionList;
	}
	// 선물부분 INSERT

	// 상품옵션부분 INSERT
	public int giftoptioninsert(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("giftoptioninsert", pMap);
		return result;
	}

	public String giftCode(Map<String, Object> pMap) {
		String gift_code = null;
		sqlSessionTemplate.selectOne("proc_giftcode", pMap);
		return gift_code;
	}

	public String giftOptionCode(Map<String, Object> pMap) {
		String gop_code = null;
		gop_code = sqlSessionTemplate.selectOne("proc_giftoption", pMap);
		return gop_code;
	}

	public List<Map<String, Object>> getProjectCodes() {
		List<Map<String, Object>> proCodes = new ArrayList<Map<String, Object>>();
		proCodes = sqlSessionTemplate.selectList("getProjectCodes");
		return proCodes;
	}

	public List<ProjectVO> getProject(List<String> codeList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectCodes", codeList);
		List<ProjectVO> allProjects = new ArrayList<>();
		allProjects = sqlSessionTemplate.selectList("getProjects", map);
		return allProjects;
	}

	public List<ProjectVO> getAllProject() {
		List<ProjectVO> allProjects = new ArrayList<>();
		allProjects = sqlSessionTemplate.selectList("allProjects");
		return allProjects;
	}

	// 선물부분 INSERT - 전역 변수
	List<Map<String, Object>> giftCodeList = null;
	int giftCodeSize = 0;

	public int giftinsert(int size, Map<String, Object> giftInsertMap) { // 선물코드 생성하고 선물코드만 따로 insert해주는 부분
		giftCodeList = new Vector<Map<String, Object>>();
		giftCodeList.clear();
		int result = 0;
		giftCodeSize = size;
		Map<String, Object> rMap = null;
		for (int i = 0; i < size; i++) {
			rMap = new HashMap<>();
			sqlSessionTemplate.selectOne("proc_giftcode", giftInsertMap);
			rMap.put("gift_code", giftInsertMap.get("gift_code").toString());
			giftCodeList.add(rMap);// 이거에 담은것을 아래 gift테이블의 다른컬럼들 insert해줄때 조건으로 사용하기 위해 넣음.
			result = sqlSessionTemplate.update("giftCodeInsert", giftInsertMap);
		}
		logger.info("giftCodeList : " + giftCodeList);
		return result;
	}

	public int giftupdate(Map<String, Object> pMap) {
		int result = 0;
		List<Map<String, Object>> rList = new ArrayList<>();
		for (int i = 0; i < giftCodeSize; i++) {
			Map<String, Object> rMap = new HashMap<>();
			rMap.put("minDonationMoneyOutput", pMap.get("minDonationMoneyOutput" + i).toString());
			rMap.put("giftTextAreaOutput", pMap.get("giftTextAreaOutput" + i).toString());
			rMap.put("deliveryDayOutput", pMap.get("deliveryDayOutput" + i).toString());
			rMap.put("limitedQuantityInput", pMap.get("limitedQuantityInput" + i).toString());
			rMap.put("gift_isinclude", pMap.get("gift_isinclude").toString());
			rMap.put("gift_code", giftCodeList.get(i).get("gift_code").toString());
			rList.add(rMap);
//			logger.info("minDonationMoneyOutput======== : "+pMap.get("minDonationMoneyOutput" + i).toString());
//			logger.info("giftTextAreaOutput======== : "+pMap.get("giftTextAreaOutput" + i).toString());
//			logger.info("deliveryDayOutput======== : "+pMap.get("deliveryDayOutput" + i).toString());
//			logger.info("limitedQuantityInput======== : "+pMap.get("limitedQuantityInput" + i).toString());
//			logger.info("gift_isinclude======== : "+pMap.get("gift_isinclude").toString());
//			logger.info("gift_code======== : "+giftCodeList.get(i).get("gift_code").toString());
		}
//		logger.info("############lMap : " + rList);
		result = sqlSessionTemplate.update("giftinsert", rList);
		return result;
	}

	////////////////////////////////////////////////////////////////
	// 상품옵션부분 INSERT
//	List<Map<String, Object>> gopcodeList = new ArrayList<>();
	int giftSize = 0;
	List<Map<String, Object>> gopList = null;

	public void gopCodeInsert(List<String> gopCodeList, List<Map<String, Object>> realList) {
		logger.info("gopCodeInsert 호출 성공");
//		logger.info("gopCodeList : "+gopCodeList);
//		logger.info("realList : "+realList);
		Map<String, Integer> giftGopMap = null;
		List<Map<String, Integer>> giftGopList = new ArrayList<Map<String, Integer>>();
		//// 선물의 개수
		int max = 0;
		for (int i = 0; i < gopCodeList.size(); i++) {
			String tempStr = gopCodeList.get(i);
			int tempInt = Integer.parseInt(tempStr.substring(1));
			if (tempInt >= max) {
				max = tempInt;
			}
		}
//		logger.info("!!!!max : "+max);
		giftSize = max + 1;
//		logger.info("!!!gopCodeList.size : "+gopCodeList.size()); 
		for (int i = 0; i < giftSize; i++) { //// 3번
			int cnt = 0;
			giftGopMap = new HashMap<String, Integer>();
			for (int j = 0; j < gopCodeList.size(); j++) {
				String tempStr = gopCodeList.get(j);
				if (tempStr.substring(1).equals(String.valueOf(i))) {
					cnt++;
					giftGopMap.put(giftCodeList.get(i).get("gift_code").toString(), cnt);
				}
			}
//			logger.info("Map2 : "+giftGopMap);
			giftGopList.add(giftGopMap);
		}
//		logger.info("giftGopList : "+giftGopList);
		// 다 가지고있는 미친새끼 미새 gop_code 와 gift_code를 가지고 있는 미새-미.친.새.끼
		gopList = new ArrayList<Map<String, Object>>();

		Map<String, Object> rMap = null;
		for (int i = 0; i < giftGopList.size(); i++) {
			Map<String, Integer> gopSize = giftGopList.get(i);
			Object keys[] = gopSize.keySet().toArray();
			int size = gopSize.get(keys[0]);
//			for(int y=0;y<keys.length;y++) {
//				logger.info("keys["+y+"] : "+keys[y]);
//			}
			for (int j = 0; j < size; j++) {
				rMap = new HashMap<String, Object>();
				rMap.put("gift_code", keys[0]);
				sqlSessionTemplate.selectOne("proc_giftoption", rMap);
				sqlSessionTemplate.update("gopCodeInsert", rMap);
				gopList.add(rMap);
			}
		}
//		logger.info("시발!!!!!!!!!!!!! : "+gopList);
		for (int i = 0; i < gopList.size(); i++) {
			Object keys[] = realList.get(i).keySet().toArray();
			for (int j = 0; j < keys.length; j++) {
				gopList.get(i).put(keys[j].toString(), realList.get(i).get(keys[j]));
			}
		}
//		logger.info("후 시발!!!!!!!!!!!!! : "+gopList);
		// rMap -> gift_code, gop_code
		// gopcodeList -> 3개가 담기는 거죠
	}

	//////////////////////////////////////
	// 여기서 넣어야할것이 그 gopcode에 맞는 곳에 insert 해야한다.

	public int gopInsert() {
		int result = 0;
		for (int i = 0; i < gopList.size(); i++) {
			Map<String, Object> sibalMap = gopList.get(i);
			Object keys[] = sibalMap.keySet().toArray();
			for (int j = 0; j < keys.length; j++) {
				if (keys[j].toString().contains("GiftUlListName")) {
					String value = sibalMap.get(keys[j].toString()).toString();
					sibalMap.put("GiftUlListName", value);
				} else if (keys[j].toString().contains("GiftUlListQuantity")) {
					String value = sibalMap.get(keys[j].toString()).toString();
					sibalMap.put("GiftUlListQuantity", value);
				} else if (keys[j].toString().contains("GiftUlListOption")) {
					String value = sibalMap.get(keys[j].toString()).toString();
					sibalMap.put("GiftUlListOption", value);
				}
			}
		}
		result = sqlSessionTemplate.update("gopInsert", gopList);
		return result;
	}

	public int godDesInsert() {
		logger.info("Dao godDesInsert===================== ");
		int result = 0;
		Map<String, Object> oMap = null;
		List<Map<String, Object>> optionList = new ArrayList<>();
		String preOptionReplace = null;// subString하기 전 온전한 문자
		String optionReplace = null;// subString 해서 추출한 것.
		String preOptionDescription = null;// 옵션 설명 없음을 제외한 두개의 옵션
		String gop_code = null;
		for (int i = 0; i < gopList.size(); i++) {
			gop_code = gopList.get(i).get("gop_code").toString();
			preOptionReplace = gopList.get(i).get("GiftUlListOption").toString();
			try {
				// 없음이 아닌거지
				optionReplace = preOptionReplace.substring(0, 3);
			} catch (StringIndexOutOfBoundsException e) {
				// 없음
				optionReplace = preOptionReplace.substring(0, 2);
			}
			if (optionReplace.equals("없음")) {
				preOptionDescription = preOptionReplace.replace(optionReplace, "");// 그대로 넣어주거나 split할 문자열.
			} else {
				preOptionDescription = preOptionReplace.replace(optionReplace, "");
			}
			if (optionReplace.equals("없음")) {
				oMap = new HashMap<>();
				oMap.put("gop_code", gop_code);
				oMap.put("GiftUlListOption", preOptionReplace);
				oMap.put("sortation", 0);
				optionList.add(oMap);
			} else if (optionReplace.equals("선택:")) {
				String optionDescription[] = preOptionDescription.split(",");
				for (int j = 0; j < optionDescription.length; j++) {
					oMap = new HashMap<>();
					oMap.put("gop_code", gop_code);
					oMap.put("GiftUlListOption", optionDescription[j]);
					oMap.put("sortation", 1);
					optionList.add(oMap);
				}
			} else if (optionReplace.equals("입력:")) {
				oMap = new HashMap<>();
				oMap.put("gop_code", gop_code);
				oMap.put("GiftUlListOption", preOptionReplace);
				oMap.put("sortation", 2);
				optionList.add(oMap);
			}
		}
		result = sqlSessionTemplate.update("godDesInsert", optionList);
		return result;
	}

	public List<Object> getprojectGiftDetail(String projectCode) {
		logger.info("Dao projectGiftDetail 호출 성공");
		List<String> projectGiftCode = null;
		List<GiftVO> projectGiftDetail = null;
		projectGiftCode = sqlSessionTemplate.selectList("projectGiftCode", projectCode);
		Map<String, Object> pMap = new HashMap<>();
		if (projectGiftCode.size() > 0) {
			pMap.put("projectGiftCode", projectGiftCode);
			projectGiftDetail = sqlSessionTemplate.selectList("projectGiftDetail", pMap);
		}
		List<Object> giftObj = new ArrayList<>();
		giftObj.add(projectGiftCode);
		giftObj.add(projectGiftDetail);
		return giftObj;
	}

	public int getCreaterProjects(String projectCreaterName) {
		int createrProjectCount = 0;
		createrProjectCount = sqlSessionTemplate.selectOne("createrProjects", projectCreaterName);
		return createrProjectCount;
	}

	public String getCreaterPfimg(String projectCreaterName) {
		String createrPfimg = null;
		createrPfimg = sqlSessionTemplate.selectOne("createrPfimg", projectCreaterName);
		return createrPfimg;
	}

	public List<ProjectVO> ManageProjects(ProjectVO pVO) {
		List<ProjectVO> managerProjects = new ArrayList<>();
		managerProjects = sqlSessionTemplate.selectList("ManageProjects");
		return managerProjects;
	}

	public String getPjo_code(String pjo_code) {
		String pjo_publickey = sqlSessionTemplate.selectOne("getPjocode", pjo_code);
		return pjo_publickey;
	}

	public List<MemberVO> getMemAge(Map<String, Object> pMap) {
		List<MemberVO> getMemAge = new ArrayList<MemberVO>();
		getMemAge = sqlSessionTemplate.selectList("getMemAge",pMap);
		return getMemAge;
	}
	public List<MemberVO> getMemname(Map<String, Object> pMap) {
		List<MemberVO> getMemname = new ArrayList<MemberVO>();
		getMemname = sqlSessionTemplate.selectList("getMemname",pMap);
		logger.info("getMemname   : "+getMemname);
		return getMemname;
	}
	

	public int ApporveProject(String projectCode) {
		int result = sqlSessionTemplate.update("apporveProject", projectCode);
		return result;
	}

	public List<Map<String, Object>> getEndMainProjects() {
		List<Map<String, Object>> proCodes = new ArrayList<Map<String, Object>>();
		proCodes = sqlSessionTemplate.selectList("getEndProjectCodes");
		return proCodes;
	}

	public List<ProjectVO> getPjomemName(Map<String, Object> pMap) {
		List<ProjectVO> getPjomemName = new ArrayList<ProjectVO>();
		getPjomemName = sqlSessionTemplate.selectList("getPjomemName", pMap);
		return getPjomemName;
	}

	public Map<String, Object> getPjo_coti(String pjo_code) {
		logger.info(pjo_code);
		Map<String, Object> getPjo_coti = sqlSessionTemplate.selectMap("getPjo_coti", pjo_code);
		return getPjo_coti;
	}

	public String getMemEmail(String mem_publickK) {
		String getMemEmail = sqlSessionTemplate.selectOne("getMemEmail", mem_publickK);
		return getMemEmail;
	}

	public List<Map<String, Object>> getmygiftoption(List<String> gop_codes) {
		List<Map<String, Object>> getmygiftoption = sqlSessionTemplate.selectList("getmygiftoption", gop_codes);
		return getmygiftoption;
	}

	public String getPjo_codes(String code) {
		String pjo_code = null;
		pjo_code = sqlSessionTemplate.selectOne("getPjo_codes", code);
		return pjo_code;
	}
}
