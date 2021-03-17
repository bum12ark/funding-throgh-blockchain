<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	내 지갑 페이지 
	날짜:2019-09-20
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="myWallet.css?lovelyz">
</head>
<body>
<%@ include file="../FTBC_Common/TopMenuBar_OnlyLogo.jsp"%>
<div class="container-fluid">
	<!--  상단 부분  -->
	<div class="row" id="myWallet_banner">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-3">
				<h2>내 지갑<img src="../FTBC_Images/wallet.png"></h2>
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
	
	<!--내용 부분  -->
	<div class="row">
				<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-5"> 
		
			<!--  public key -->
			<div id="wallet_publickey" class="row edit_ac">
				<div class="col-xs-2 labelbox"><label>public key</label> </div>
				<div class="col-xs-10">
					<input type="text" class="edit_txtbox"  id="publickey_txtbox">
				</div>
			</div>
			
			<!--  private key -->
			<div id="wallet_privatekey" class="row edit_ac">
				<div class="col-xs-2 labelbox"><label>public key</label> </div>
				<div class="col-xs-10">
					<input type="text" class="edit_txtbox"  id="privatekey_txtbox">
					<input type="button" value="인증받기 " id="certify_btn"> 
				</div>
			</div>
			
		</div>
		<div class="col-xs-4">&nbsp;</div>
	</div>
</div>
</body>
</html>