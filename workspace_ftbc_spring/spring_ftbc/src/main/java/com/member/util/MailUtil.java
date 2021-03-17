package com.member.util;

import org.apache.commons.mail.HtmlEmail;

//메일 보내는 클래스
public class MailUtil {
	public static void sendMail(String toEmail, String subject, String msg) 
			throws Exception{
		// Mail Server 설정
		String charSet = "utf-8";
		//이거 GMAIL로 해도 됨. GMAIL이면 당연히 호스트도 지메일 보내는사람도 지메일
		String hostSMTP = "smtp.naver.com"; 
		//테스트 해보니 호스트랑 보내는사람이 무조건 같아야함.
		String hostSMTPid = "cyrano213@naver.com";// 서버로 쓸 이메일 입력
		String hostSMTPpwd = "7j8k9l0p&*"; //서버로 쓸 이메일 비밀번호 입력
		// 보내는 사람
		String fromEmail = "cyrano213@naver.com";//보내는사람 이메일-호스트랑 똑같은것.
		String fromName = "[Funding Through Block Chain]";
		// email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true); //SSL 사용 (TLS가 없는 경우 SSL 사용)
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465); //SMTP 포트번호 SSL 465, TLS 587
			mail.setAuthentication(hostSMTPid,hostSMTPpwd);
			mail.setStartTLSEnabled(false); //TLS 사용 이거 사용하면 587 사용
			mail.addTo(toEmail);//비밀번호 찾는사람 이메일
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}	
}