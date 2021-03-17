package com.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import blockchain.util.StringUtil;
import vo.MemberVO;

@RestController
@RequestMapping("/restMember")
public class RestMemberController {
	private static final Logger logger = LoggerFactory.getLogger(RestMemberController.class);
	@Autowired
	MemberLogic memberLogic;
	@Autowired
	MemberVO memberVO;

	@RequestMapping(value = "login.ftbc", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String login(@RequestParam Map<String, Object> pMap, HttpSession httpSession) {
		logger.info("login: String 호출");
		logger.info("mem_pw : "+pMap.get("log_pw").toString());
		String log_pw = StringUtil.applySha256(pMap.get("log_pw").toString());
		memberVO.setMem_email(pMap.get("log_id").toString());
		memberVO.setMem_pw(log_pw);
		memberLogic.login(memberVO);
		String msg = memberVO.getMsg();
		if ("로그인에 성공하였습니다".equals(msg)) {
			httpSession.setAttribute("mem_email", memberVO.getMem_email());
			httpSession.setAttribute("mem_pfimg", memberVO.getMem_pfimg());
			httpSession.setAttribute("mem_name", memberVO.getMem_name());
			httpSession.setAttribute("mem_nickname", memberVO.getMem_nickname());
			httpSession.setAttribute("mem_isAuthority", memberVO.getMem_isauthority());
		}
		return msg;
	}

}
