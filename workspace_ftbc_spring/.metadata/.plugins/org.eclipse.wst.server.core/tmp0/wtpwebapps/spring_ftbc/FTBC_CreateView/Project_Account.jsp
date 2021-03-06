<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 만들기 </title>
<!--=============================================================================================
	프로젝트 올리기 - 계좌 설정 탭
	날짜:2019-09-12
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Project_Account.css?2">
</head>
<body>	
<script type="text/javascript">

	/******* 본인인증  *****/
	function enterpnum() {
		$("#ac_urself1").hide();
		$("#ac_urself2").show();
	}
	
	function cancelSelf() {
		$("#ac_urself2").hide();
		$("#ac_urself1").show();
	}
	
	/******* 입금계좌  *****/
	function enterAccount() {
		$("#ac_account1").hide();
		$("#ac_account2").show();
	}
	
	function cancelAccount() {
		$("#ac_account2").hide();
		$("#ac_account1").show();
	}
	
	function saveAccount() {
			var account2_textbox = $("#account2_textbox").val( );
			var Account_form = document.Account_form;
			if(Account_form.account2_textbox.value==""){
				alert("계좌번호를 입력해 주세요");
			}
			else{
				account_change();
				cancelAccount();
				//여기 showhide 추가.
			}
	}
	
	$(document).ready(function() {
		$("#ac_email2").hide();
		$("#ac_urself2").hide();
		$("#ac_account2").hide();
	});
	function account_change(){
		var Account_form = document.Account_form;
		if(Account_form.account2_textbox.value==""||$("#account2_select").val()==null
		){
			$("#check_tab4").html('<img id="check_tab4" src="../FTBC_Images/check1.png">');
		} else{
			$("#check_tab4").html('<img id="check_tab4" src="../FTBC_Images/check.png">');
			
		}
	}
	function account_check_count(){
		var Account_form = document.Account_form;
		if(Account_form.account2_textbox.value==""){
			check = check+",계좌번호";
		}
		else{
			$("#check_tab4").html('<img id="check_tab4" src="../FTBC_Images/check.png">');
		}
	}
	   function pre_pageAccount() {//페이지 하단 이전 버튼
	         changepro();
	         $("#tab4").removeClass("active");
	         $("#tab3").attr('class', 'active');
	      
	   }
</script>
<form id="Account_form" name="Account_form" onSubmit="return false" class="create_form">
	
	<!--==================================[ 보닌 인증  ]============================  -->
	<p>본인 인증</p>
	<div id="ac_urself1" onclick="enterpnum()">
			<div class="row" id="ac_urself1_content">
				<div class="col-sm-10">
					<img src="../FTBC_Images/finger.png"></img><label class="account_label">&nbsp; 본인 인증을 진행해 주세요</label>
				</div>
				<div class="col-sm-2">
					<img src="../FTBC_Images/edit.png"></img><label class="account_label">&nbsp; 수정하기</label>
				</div>
			</div>
		</div>
		<!--end of ac_urself1  -->	
		
		<div id="ac_urself2">
			<div>
				<label class="account_label">&nbsp; 휴대폰 번호로 한국모바일인증(주)의 본인확인서비스를 통해 본인 인증을 진행합니다. </label>
			</div>			
			<div id="urself2_btns">
				<input id="selfverify_cancel" type="button" onClick="cancelSelf()"value="취소하기"> 
				<input id="selfverify_verify" type="button" onClick="verifySelf()" value="인증받기">
			</div>
		</div>
		
		<!--==================================[ 입금 계좌 ]============================  -->
	<p>입금 계좌</p>
	<div id="ac_account1" onclick="enterAccount()">
		<div class="row" id="ac_account1_content">
			<div class="col-sm-10">
				<img src="../FTBC_Images/finger.png"></img><label class="account_label">&nbsp; 본인 인증을 진행해 주세요</label>
			</div>
			<div class="col-sm-2">
				<img src="../FTBC_Images/edit.png"></img><label class="account_label">&nbsp; 수정하기</label>
			</div>
		</div>
	</div>
		<!--end of ac_account1  -->	
		
		<div id="ac_account2">
			<div>
				<label>&nbsp; 계좌 번호 </label>
			</div>
			<div>
				<label style="font-size:12px;">&nbsp; 펀딩에 성공할시 입금 받으실 계좌를 입력해 주세요.</label>
			</div>
			<div id="ac_account2_content">
					<select id="account2_select">
						<option>현대카드</option>
						<option>삼성카드</option>
						<option>Kb국민</option>
						<option>비씨카드</option>
						<option>신한카드</option>
						<option>하나카드</option>
						<option>롯데카드</option>
						<option>NH농협</option>
						<option>씨티카드</option>
						<option>전북카드</option>
						<option>경남카드</option>
					</select>
					<input type="text" id="account2_textbox" style="font-size: 12px;">
			</div>
			
			<div id="account2_btns">
				<input id="account_cancel" type="button" onClick="cancelAccount()"value="취소하기"> 
				<input id="account_verify" type="button" onClick="saveAccount()" value="저장하기">
			</div>
		</div>
		</form>
		<div class="row">
			<div id="bottomPreNextButton" class="col-xs-12">
				<a class="tab_menu" data-toggle="tab" href="#menu3">
					<button onClick="pre_pageAccount()" class="button button_pre">
						<i class="glyphicon glyphicon-chevron-left"></i>이전
					</button>
				</a>
			</div>
		</div>
</body>
</html>