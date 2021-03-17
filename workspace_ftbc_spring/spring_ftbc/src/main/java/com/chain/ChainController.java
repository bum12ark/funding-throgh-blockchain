package com.chain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import blockchain.Block;
import blockchain.util.AES256Util;
import blockchain.util.StringUtil;
import vo.ChainVO;

@Controller
@RequestMapping("/chain/*")
public class ChainController {
	private static final Logger logger = LoggerFactory.getLogger(ChainController.class);

	@Autowired
	ChainLogic chainLogic = null;
	StringUtil stringUtil = null;

	@RequestMapping(value = "addTransaction")
	public String addTransaction(@RequestParam Map<String, Object> pMap) throws Exception {
		logger.info("addTransaction 호출");
		String jsonOption = pMap.get("jsonOption").toString();
		Map<String, Object> godMap = null;
		if(!(jsonOption.equals("옵션없음"))) {
			Gson gson = new Gson();
			godMap = gson.fromJson(jsonOption, Map.class);
		}
		/// AES256 대칭키 - 주소 암호화 
		AES256Util aes256 = new AES256Util(pMap.get("buyer_email").toString());
		String cipherAddr = aes256.encrypt(pMap.get("buyer_addr").toString());
		String cipherPostCode = aes256.encrypt(pMap.get("buyer_postcode").toString());
		String cipherDetailAddr = aes256.encrypt(pMap.get("buyer_detailAddr").toString());
		Map<String, Object> addrMap = new HashMap<>();
		addrMap.clear();
		addrMap.put("buyer_addr", cipherAddr);
		addrMap.put("buyer_postcode", cipherPostCode);
		addrMap.put("buyer_detailAddr", cipherDetailAddr);
		// #DB- 프로젝트 이름으로 프로젝트 코드, 공개키 가져오기, 개인키
		String buyer_puk = chainLogic.getMemPubKey(pMap.get("buyer_email").toString());
		pMap.put("buyer_puk", buyer_puk);
		String project_name = pMap.get("p_title").toString();
		Map<String, Object> rMap = chainLogic.getProjectInfo(project_name);
		chainLogic.addTransaction(pMap, rMap, godMap, addrMap);
		return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}

	//////////////// 박상범 중간합본 이후 추가 || 수정 /////////////////
	@RequestMapping(value = "getBlockChainInfo")
	public @ResponseBody Map<String, List<ChainVO>> getBlockChainInfo()
			throws Exception {
		logger.info("getBlockChainInfo 호출");
		Map<String, List<ChainVO>> dataMap = new HashMap<>();
		List<ChainVO> chainVOList = chainLogic.getBlockChainInfo();
		dataMap.put("data", chainVOList);
		return dataMap;
	}
	@RequestMapping(value = "getDetailChainInfo")
	public String getDetailChainInfo(@RequestParam String tx_id, Model mod) {
		logger.info("getDetailChainInfo 호출");
		ChainVO chainVO = chainLogic.getDetailChainInfo(tx_id);
		mod.addAttribute("chainVO", chainVO);
		return "forward:/FTBC_BlockChainView/Transaction_Certificate.jsp";
	}
	//////////////// 박상범 중간합본 이후 추가 || 수정 /////////////////

	@RequestMapping(value = "BlockDetail")
	public String BlockDetail(@RequestParam int num, Model mod) throws Exception {
		logger.info("BlockDetail 호출" + num);
		Block block = chainLogic.getBlockDetail(num);
		logger.info("Block " + block);
		logger.info("Block " + block.hash);
		mod.addAttribute("block", block);
		return "forward:/FTBC_BlockChainView/Block_Detail.jsp";
	}

}
