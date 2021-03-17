package com.member.util;

import java.util.Random;

//가입할때 이메일 인증 해야하고, ID나 비밀번호 찾을 때 그 인증 된 이메일이어야 이름과 함께해서 찾을 수 있도록
//랜덤 키 생성 클래스
public class FindUtil {

	public static String createKey() throws Exception{
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for(int i=0;i<10;i++) {
			int index = rnd.nextInt(3);
			
			switch(index) {
			case 0:
				key.append((char)((int)(rnd.nextInt(26)) +97));
				break;
			case 1:
				key.append((char)((int)(rnd.nextInt(26)) +65));
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				break;
				
			}
		}
		return key.toString();
	}
}
