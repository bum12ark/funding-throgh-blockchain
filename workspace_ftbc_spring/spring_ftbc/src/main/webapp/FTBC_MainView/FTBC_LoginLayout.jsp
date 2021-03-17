<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인  </title>
<!--=============================================================================================
	로그인 페이지
	박스 만 바뀜
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<script type="text/javascript">

</script>
<style type="text/css">
	.content{
		margin-left:0px !important;
	}
	
	#Login_page{
		margin-left:20px;
	}
</style>
<div class="container-fluid">
	<div id="top_MenuBar">
		<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	</div>
	<div class="row content">
		<div class="col-sm-3 ">&nbsp;</div>
		<div class="col-sm-6 " id="Login_page">
			<%@ include file="../FTBC_MainView/FTBC_Login.jsp"%>
		</div>
		<div class="col-sm-3 ">&nbsp;</div>
	</div>
	<div class="row footer">
		<%@ include file="../FTBC_Common/FTBC_Footer.jsp"%>
	</div>
</div>

</body>
</html>