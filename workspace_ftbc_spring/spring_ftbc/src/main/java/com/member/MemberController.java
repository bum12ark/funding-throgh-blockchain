package com.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.util.FindUtil;
import com.member.util.MailUtil;

import blockchain.util.StringUtil;
import vo.MemberVO;
import vo.MessageVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	public MemberLogic memberLogic = null;
	@Autowired
	public MemberVO mVO = null;

	@GetMapping("emailCheck")
	public @ResponseBody String emailCheck(@RequestParam Map<String, Object> pMap) {
		logger.info("emailCheck Controller 호출");
		mVO.setMem_email(pMap.get("email").toString());
		String result = memberLogic.emailCheck(mVO);
		return result;
	}

	@GetMapping("emailSend")
	public @ResponseBody String emailSend(@RequestParam Map<String, Object> pMap, HttpSession session) {
		logger.info("emailSend Controller 호출");
		String keyCode = null;
		try {
			keyCode = FindUtil.createKey();
			String mem_email = pMap.get("email").toString();
			System.out.println("mem_email: ==============" + mem_email);
			String subject = "[FTBC] 이메일 인증 안내";
			String msg = "";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>인증 코드가 발급되었습니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "발급된 인증번호는 <strong>" + keyCode + "</string>이며,<br>";
			msg += "인증번호를 입력하셔서, 본인확인을 완료해주시기를 바랍니다.</div><br>";
			MailUtil.sendMail(mem_email, subject, msg);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return keyCode;
	}

////[2019-10-15] 정원형 중간합산 이후 비밀번호 찾기 및 회원가입 생년월일 추가 시작 ///////////////////////
	@GetMapping("forgotEmail")
	public @ResponseBody int forgotEmail(@RequestParam Map<String, Object> pMap) {
		logger.info("컨트롤러 비밀번호 찾기 호출 성공");
		int result = 0;
		// 받아온 이메일
		String keyCode = null;
		try {
			keyCode = FindUtil.createKey();
			String imsiPassword = StringUtil.applySha256(keyCode);
			pMap.put("imsiPassword", imsiPassword);
			String mem_email = pMap.get("email").toString();
			String subject = "[FTBC] 비밀번호 찾기 안내";
			String msg = "";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>인증 코드가 발급되었습니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "발급된 임시비밀번호는 <strong>" + keyCode + "</string>이며,<br>";
			msg += "임시비밀번호로 로그인하신 후, 비밀번호를 변경 해 주시길 바랍니다.</div><br>";
			result = memberLogic.forgotEmail(pMap);
			if (result == 1) {
				MailUtil.sendMail(mem_email, subject, msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping(value="join", produces ="application/text; charset=utf8")
	public String join(@RequestParam Map<String, Object> pMap) {
		// int result = 0;
		logger.info("MemberController join 호출 성공");
		logger.info("이메일============:" + pMap.get("mem_email").toString());
		logger.info("이름============:" + pMap.get("mem_name").toString());
		logger.info("비밀번호============:" + pMap.get("mem_pw").toString());
		logger.info("생년월일============:" + pMap.get("mem_birth").toString());
		String mem_birth = pMap.get("mem_birth").toString();
		pMap.put("mem_birth", mem_birth.replaceAll("-", "/"));
		logger.info("체인공개여부=========:" + pMap.get("mem_isDisClose").toString());
		mVO.setMem_email(pMap.get("mem_email").toString());
		mVO.setMem_name(pMap.get("mem_name").toString());
		mVO.setMem_birth(pMap.get("mem_birth").toString());
		mVO.setMem_isdisclose(pMap.get("mem_isDisClose").toString());
		String password = pMap.get("mem_pw").toString();
		logger.info("비밀번호sha256통과============:" + StringUtil.applySha256(password));
		mVO.setMem_pw(StringUtil.applySha256(password));
		memberLogic.join(mVO);
		return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}

	@PostMapping(value = "editAccount")
	public @ResponseBody int editAccount(@RequestParam Map<String, Object> pMap) {
		logger.info("Controller editAccount 호출성공");
		String ilchi = null;
		String pw_tboxpre = StringUtil.applySha256(pMap.get("pw_tboxpre").toString());
		String pw_tboxafter = StringUtil.applySha256(pMap.get("pw_tboxafter").toString());
		int result = 0;
		mVO.setMem_email(pMap.get("email_tbox").toString());
		mVO.setMem_pw(pw_tboxpre);
		ilchi = memberLogic.prepasswordconfirm(mVO);
		if (ilchi.equals("있음")) {// 입력한 기존 비밀번호가 DB와일치
			if (pw_tboxpre.equals(pw_tboxafter)) {// 변경전과 변경후가 똑같을 경우
				return 2;
			} else {// 변경전과 변경후가 다를경우
				mVO.setMem_pw(pw_tboxafter);
				result = memberLogic.editAccount(mVO);
			}
		} else {// 입력한 기존 비밀번호가 DB와 불일치
			return result;
		}
		return result;
	}

////[2019-10-15] 정원형 중간합산 이후 비밀번호 찾기 및 회원가입 생년월일 추가 끝 ///////////////////////   
	@GetMapping(value = "logout.ftbc")
	public String logout(HttpSession httpSession) {
		logger.info("logout: String 호출");
		httpSession.removeAttribute("mem_email");
		httpSession.removeAttribute("mem_pfimg");
		httpSession.removeAttribute("mem_name");
		httpSession.removeAttribute("mem_isAuthority");
		return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}

	/* ==========[[^^ 고명석 2019-10-16 수정]]=============== */
	@PostMapping("MemberUpdate")
	public String MemberUpdate(@RequestParam Map<String, Object> pMap) {
		int result = memberLogic.MemberUpdate(pMap);
		return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}

	@GetMapping("memberReplace")
	public String memberReplace(@RequestParam String mem_email, HttpSession httpSession) {
		mVO.setMem_email(mem_email);
		mVO = memberLogic.memberReplace(mVO);
		httpSession.setAttribute("mem_pfimg", mVO.getMem_pfimg());
		httpSession.setAttribute("mem_name", mVO.getMem_name());
		return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	}
	@PostMapping("messageSend")
	   public String messageSend(@RequestParam Map<String,Object> pMap) {
		   memberLogic.messageSend(pMap);
		   return "redirect:/FTBC_MainView/FTBC_Main.jsp";
	   }
	   /*==========[[^^ 고명석 2019-10-16 수정]]===============*/
		//////////////////2019-10-17 고명석 수정
	 @RequestMapping("getMyMessage")
	   public @ResponseBody Map<String, List<MessageVO>> getMyMessage(@RequestParam String mem_email, Model mod) {
		   Map<String,Object> rMap = memberLogic.getMessage(mem_email);
		   List<MessageVO> myMessage = (List<MessageVO>)rMap.get("myMessage");
		   Map<String, List<MessageVO>> dataMap = new HashMap<>();
		   dataMap.put("data",myMessage);
		   return dataMap;
	   }
	   
	   @RequestMapping("myPjoMessage")
	   public @ResponseBody Map<String, List<MessageVO>> myPjoMessage(@RequestParam String mem_email, Model mod) {
		   Map<String,Object> rMap = memberLogic.getMessage(mem_email);
		   List<MessageVO> myPjoMessage = (List<MessageVO>)rMap.get("myPjoMessage");
		   Map<String, List<MessageVO>> dataMap = new HashMap<>();
		   dataMap.put("data",myPjoMessage);
		   return dataMap;
	   }
	   
	   @GetMapping("messageUpdate")
	   public String messageUpdate(@RequestParam String ms_code) {
		   memberLogic.messageUpdate(ms_code);
		   return "redirect:/FTBC_myView/Message.jsp";
	   }
	   
	   /*==========[[^^ 고명석 2019-10-16 수정]]===============*/

}