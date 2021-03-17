<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% 
String email = null;
if(session.getAttribute("mem_email")!=null){
email = session.getAttribute("mem_email").toString();
 }
 %>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	비밀번호 설정페이지
	날짜:2019-10-15 정원형 수정
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Edit_Account.css?1">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#email_tbox").val("<%=email%>");
})
function editAccount(){
	  $.post("/member/editAccount",$("#editAccount_form").serialize(),function(data){
		 if(data==1){
			 alert("계정 정보를 변경하였습니다.");
			 location.href="/FTBC_myView/Edit_Account.jsp";
		 }else if(data==2){
			 alert("변경하실 비밀번호는 기존의 비밀번호로 사용하실 수 없습니다.");
		 }else if(data==0){
			 alert("기존 비밀번호가 일치하지 않습니다.");
		 }
		 });
}
</script>
</head>
<body>
<%@ include file="../FTBC_Common/TopMenuBar_OnlyLogo.jsp"%>
<form id="editAccount_form" name="editAccount_form">
<div class="container-fluid">
	<!--  상단 부분  -->
	<div class="row" id="EditAccount_top">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-3">
			<h2>계정 설정</h2>
		</div>
		<div class="col-xs-3" >
			<div id="EditAccount_a" class="EditAccount_a">
				<a href="Edit_Profile.jsp">프로필 설정</a>
				<a>계정 설정</a>
				<a>지불 정보 설정</a>
			</div>
		</div>
		<div class="col-xs-3">&nbsp;</div>
	</div>
	<!--  내용 부분 -->
	<div class="row" id="EditAccount_content">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-5"> 
		
			<!--  이메일 설정  -->
			<div id="edit_eamil" class="row">
				<div class="col-xs-2 labelbox"><label>이메일</label> </div>
				<div class="col-xs-10">
					<div class="row">
						<input type="text" class="edit_txtbox" id="email_tbox" name="email_tbox" readOnly> 
					</div>
				</div>
			</div>
			
			<!--  비밀번호 설정  -->
			<div id="edit_pw" class="row edit_ac">
				<div class="col-xs-2 labelbox"><label>비밀번호</label> </div>
				<div class="col-xs-10">
					<input type="password" class="edit_txtbox" placeholder="현재 비밀번호" id="pw_tboxpre" name="pw_tboxpre" style="margin-left:0px">
					<input type="password" class="edit_txtbox" placeholder="변경할 비밀번호" id="pw_tboxafter" name="pw_tboxafter">
				</div>
			</div>
			
			<!--  수정하기 버튼  -->
			<div id="edit_ac_btn" class="row edit_ac">
				<div class="col-xs-2 labelbox" ><label>&nbsp;</label> </div>
				<input type="button"  value="수정하기 " onclick="editAccount()" id="edit_ac_button">
			</div>
		</div>
		<div class="col-xs-4">&nbsp;</div>
	</div>
</div>
</form>
</body>
</html>