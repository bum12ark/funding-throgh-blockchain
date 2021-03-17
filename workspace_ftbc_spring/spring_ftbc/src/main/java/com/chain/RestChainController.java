package com.chain;

import java.io.File;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import blockchain.util.Base64Conversion;
import blockchain.util.StringUtil;
import exe.util.Path;
import exe.util.Protocol;


@RestController
@RequestMapping("/restchain/*")
public class RestChainController {
	private static final Logger logger = LoggerFactory.getLogger(RestChainController.class);
	@Autowired
	ChainLogic chainLogic = null;
	StringUtil stringUtil = null;

	@RequestMapping(value="verifyKeys",method=RequestMethod.POST,produces ="application/text; charset=utf8")
	public String verifyKeys(@RequestParam Map<String,Object> pMap) throws Exception {
		String mem_email = pMap.get("mem_email").toString();
		// 공개키는 DB에 존재
		String mem_pubKey = chainLogic.getMemPubKey(mem_email);
		String msg = null;
		// 공개키 존재 : publicKey, 공개키 X : 공개키가 존재하지 않습니다.
		if(!(mem_pubKey.contains("공개키가 존재하지 않습니다."))) {
			String encoded_pub = mem_pubKey;
			PublicKey publicKey = (PublicKey) Base64Conversion.decodeBase64(encoded_pub);
			// 개인키는 화면에서 받아옴.
			String encoded_prk = pMap.get("encoded_prk").toString();
			PrivateKey privateKey = (PrivateKey) Base64Conversion.decodeBase64(encoded_prk);
			// 키의 쌍(pair)가 맞는지 확인
			boolean isValidKeys = StringUtil.isValidKeys(publicKey, privateKey);
			if(isValidKeys) {
				msg = "회원님의 소중한 정보가 인증되었습니다.";
			} else {
				msg = "인증실패";
			}
		} else {
			msg = mem_pubKey;
		}
		return msg;
	}
	
	//# 블록이 추가되기전 과반수 프로그램을 돌려서 공유 체인을 채택함
	@RequestMapping(value="majorityStart", produces ="application/text; charset=utf8")
	public String majorityStart() {
		try {
			// 해당 디렉토리의 파일 제거
			FileUtils.cleanDirectory(new File(Path.MAJORITY_CHAINS));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 블록체인 서버안의 MSG 서버로 케넥션을 맺는 메소드
		chainLogic.getConnection();
		chainLogic.msgServerConnection(Protocol.ALERT_ADD_BLOCK);
		return "";
	}
	//# 공유 체인이 채택 되었으니 블록 추가 시키기
	@RequestMapping(value="addBlock", produces ="application/text; charset=utf8")
	public String addBlock() {
		logger.info("##addBlock 호출");
		chainLogic.addBlock();
		// 추가된 최신 체인 다운로드 시키기
		chainLogic.getConnection();
		chainLogic.msgServerConnection(Protocol.AUTOSYNC_CHAIN_DOWNLOAD_ALERT);
		return "";
	}
	@RequestMapping(value="isAuthorized", method=RequestMethod.GET, produces ="application/text; charset=utf8")
	public String isAuthorized(@RequestParam Map<String, Object> pMap) {
		logger.info("isAuthorized: String 호출");
		logger.info("pMap : "+pMap);
		pMap.put("password", StringUtil.applySha256(pMap.get("password").toString()));
		String isAuthorized = chainLogic.isAuthorized(pMap);
		return isAuthorized;
	}

}
