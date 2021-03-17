<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="FTBC_Join_pre.css">
<script type="text/javascript">
	function join_next_pre(){
		var url = "../FTBC_MainView/FTBC_Join_now.jsp";
		$("#Login_page").load(url);
	}
	function delogin(){
		var url = "../FTBC_MainView/FTBC_Login.jsp";
		$("#Login_page").load(url);
	}
</script>
</head>
<body>
<div id="join_pre_box">
	<div>
		<button id="join_face">F 페이스북으로 가입하기</button>
		<button id="join_naver">N 네이버으로 가입하기</button>
	</div>
	<div id="hr_one">
		<div class="line">또 는</div>
	</div>
	<div>
		<button id="join_default" onClick="join_next_pre()">일반 가입하기</button>
	</div>	
		<hr/>
	<div id="join_pre_log">
		<span>이미 계정이 있으신가요? </span>
	</div>
	<div>
	</div>
	<div id="join_pre_login">
		<a href="javascript:delogin()">기존계정으로 로그인하기</a>
	</div>

</div>
</body>
</html>