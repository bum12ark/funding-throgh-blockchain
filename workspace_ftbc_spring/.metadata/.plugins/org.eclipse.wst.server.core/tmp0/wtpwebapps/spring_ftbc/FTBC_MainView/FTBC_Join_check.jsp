<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="FTBC_Join_check.css">
</head>
<body>
<div id="join_check_box">
	<div id="check_title">
		<h3><b>아래 내용에 동의해 주세요</b></h3>
	</div>
	<div id="hr_one">
		<hr/>
	</div>
	<div id="Consent">
		<span>원활한 서비스 제공을 위해 이용약관 동의 내용에 동의해주세요</span>
	</div>
	<div id="hr_one">
		<hr/>
	</div>
	<div id="check_box">
		<div>
		<input type="checkbox" class="col-sm-1">
			<span class="col-sm-11" id="agg_1">이용약관 및 개인정보 처리 방침에 동의 합니다(필수)</span>
		</div>
	</div>
	<div id="check_box">
		<div>
		<input type="checkbox" class="col-sm-1">
			<span class="col-sm-11" id="agg_1">만 14세 이상입니다(필수)</span>
		</div>
	</div>
	<div id="check_box" >
		<div>
		<input type="checkbox" class="col-sm-1">
			<span class="col-sm-11" id="agg_1">마케팅 정보 수신에 동의합니다(선택)</span>
		</div>
	</div>
	<div>
		<button id="check_join" onClick="join_next_pre()">가입하기</button>
	</div>	
</div>
</body>
</html>