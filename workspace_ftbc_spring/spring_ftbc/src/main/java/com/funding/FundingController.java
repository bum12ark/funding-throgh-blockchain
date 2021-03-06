package com.funding;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import vo.GiftVO;
import vo.ProjectVO;

@Controller
@RequestMapping("/Funding/*")
public class FundingController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);

	@Autowired
	FundingLogic fundingLogic = null;

	@GetMapping(value = "fundDetail")
	public String getfundproject(@RequestParam String projectCode, Model mod, String mem_email) {
		// 프로젝트 상세보기
		logger.info("Controller fundDetail 호출");
		ProjectVO FundingDetail = fundingLogic.getFundDetail(projectCode, mem_email);
		List<Object> FundingGiftDetail = fundingLogic.getFundGiftDetail(projectCode);
		List<GiftVO> sortationSelect = fundingLogic.sortationSelect(FundingGiftDetail);
		List<String> aList = (List<String>) FundingGiftDetail.get(0);
		List<GiftVO> bList = (List<GiftVO>) FundingGiftDetail.get(1);
		mod.addAttribute("sortationSelect", sortationSelect); // sList
		mod.addAttribute("FundingDetail", FundingDetail);
		mod.addAttribute("FundingGiftDetail", FundingGiftDetail); // gop_list
		return "forward:/FTBC_FundView/Fund_Project.jsp";
	}

	@PostMapping(value = "payFund")
	public String getPayFund(@RequestParam Map<String, Object> pMap, Model mod, HttpSession session)
		ProjectVO payFund = fundingLogic.getPayFund(pMap.get("gift_code").toString(), pMap.get("pjo_code").toString());
		
		// 페이 펀드 페이지에 있는 것들
		mod.addAttribute("payFund", payFund);
		// 금액
		mod.addAttribute("donation", pMap.get("donation"));
		// 객관식 주관식 옵션
		Map<String, Object> optionMap = new HashMap<String, Object>();
		Object keys[] = pMap.keySet().toArray();
		for(int i=0;i<keys.length;i++) {
			if(keys[i].toString().contains("gop_code-")) {
				optionMap.put(keys[i].toString(), pMap.get(keys[i]));
			}
		}
		if(optionMap.size()>0) {
			Gson gson = new Gson();
			String jsonOption = gson.toJson(optionMap);
			logger.info("######jsonOption : "+jsonOption);
			mod.addAttribute("jsonOption", jsonOption);
		}
		return "forward:/FTBC_FundView/Pay_Project.jsp";
	}

}
