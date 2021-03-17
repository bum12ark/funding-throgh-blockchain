<%@page import="blockchain.Block"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Block block = request.getAttribute("block")==null ? null : (Block)request.getAttribute("block");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블록체인 디테일</title>
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<!--=============================================================================================
	블록체인 상세보기 페이지
	날짜:2019-09-12
================================================================================================  -->
<style type="text/css">
	/********************[상단   부분]*******************/
	#BlockDetail_banner{
		height: 150px;
		width:110%;
		background-color: #dcd9ec;
		display:table;
		margin-left:-80px;
	}
	
	#BlockDetail_banner h2{
	 	font-size: 50px;
		font-weight: 700;
		line-height: 120px;
		color:  #453e82;
	}
	#BlockDetail_banner img{
		height:70px;
		margin-left:20px;
		margin-bottom:10px;
	}
	.boldspan{
		font-weight:bold;
	}
	span{
		font-size:20px;
	}
	/********************[내용   부분]*******************/
	#BlockDetail_empty {
		margin-top: 60px;
	}
	
</style>

</head>
<body>
	<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	<!--  상단 부분  -->
	<div class="row" id="BlockDetail_banner">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-3">
			<h2>블록 체인<img src="../FTBC_Images/block.png"></h2>
		</div>
		<div class="col-xs-3" >
		<!-- 	<div id="EditAccount_a" class="EditAccount_a">
				<a href="Edit_Profile.jsp">프로필 설정</a>
				<a>계정 설정</a>
				<a>지불 정보 설정</a>
			</div> -->
		</div>
		<div class="col-xs-3">&nbsp;</div>
	</div>
	
	<!--  내용  부분  -->
	<div  class="container-fluid">
		<div id="Block_left" class="col-xs-2"></div>
		<div id="Block_Center" class="col-xs-8">
			<div class="row" id="BlockDetail_empty"></div>
			<!-------------- 해쉬 값 -------------->
			<div class="row">
				<span class="col-xs-4 boldspan" >해쉬값</span>
				<span class="col-xs-8"><%=block.hash %></span>
				<hr width=100%>
			</div>
			
			<!-------------- 이전 해쉬 값 -------------->
			<div class="row">
				<span class="col-xs-4 boldspan" >이전 해쉬값</span>
				<span class="col-xs-8"><%=block.previousHash %></span>
				<hr width=100%>
			</div>
			
			<!-------------- 머클루트 -------------->
			<div class="row">
				<span class="col-xs-4 boldspan" >머클루트</span>
				<span class="col-xs-8"><%=block.merkleRoot %></span>
				<hr width=100%>
			</div>
			
			<!-------------- 난수 -------------->
			<div class="row">
				<span class="col-xs-4 boldspan" >난수</span>
				<span class="col-xs-8"><%=block.nonce %></span>
				<hr width=100%>
			</div>
			
			<!-------------- 거래 량  -------------->
			<div class="row">
				<span class="col-xs-4 boldspan" >거래량</span>
				<span class="col-xs-8"><%=block.transactions.size()%></span>
				<hr width=100%>
			</div>
		</div>
		<div id="Block_left" class="col-xs-2"></div>
	</div>
</body>
</html>