<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Forgot_PW.css">
<script type="text/javascript">
	function Find_pw(){
		
	}
</script>
</head>
<body>
<div id="find_pw_box">
	<div id="find_pw_title">
		<h3><b>비밀번호 찾기</b></h3>
	</div>
	<div id="hr_one">
		<hr/>
	</div>
	<div id="Consent">
		<span>텀블벅 가입 시 사용하신 이메일을 입력하시면 새 비밀번호를 생성할 수 있는 링크를 보내드립니다.</span>
	</div>
	<div id="Consent">
		<span>페이스북/네이버로 가입하신 경우, 페이스북/네이버 계정에 쓰이는 이메일을 입력해주세요.</span>
	</div>
	<div id="hr_one">
		<hr/>
	</div>
	<div id="for_email">
		<input id="Forgot_email" name="Forgot_email" type="text" placeholder="가입하신 이메일 주소" >
	</div>
	<div id="log_join">
		<button id="Find_pw" onclick="Find_pw()">비밀번호 코드 받기</button>
	</div>
</div>
</body>
</html>