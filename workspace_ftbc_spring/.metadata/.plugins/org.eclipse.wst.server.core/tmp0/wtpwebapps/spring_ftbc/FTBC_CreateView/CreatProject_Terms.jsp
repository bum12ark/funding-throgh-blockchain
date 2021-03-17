<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 올리기전에 확인해주세요</title>
<!--=============================================================================================
   프로젝트 올리기 전 약관동의 페이지
   날짜:2019-09-16
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
	<script type="text/javascript">
   function continue_create(){
      var term1 = document.getElementById("f_terms").Terms_cb1.checked;
      var term2 = document.getElementById("f_terms").Terms_cb2.checked;
      var term3 = document.getElementById("f_terms").Terms_cb3.checked;
      var term4 = document.getElementById("f_terms").Terms_cb4.checked;
       if(<%=session.getAttribute("mem_email")==null%>){
    	   location.href="../FTBC_MainView/FTBC_LoginLayout.jsp?preURL=../FTBC_CreateView/CreatProject_Terms.jsp";
       }
       else if(!term1){
               alert('모든 약관에 동의해 주세요');
               return false;
        }else if(!term2) {
               alert('모든 약관에 동의해 주세요');
               return false;
        }else if(!term3) {
               alert('모든 약관에 동의해 주세요');
               return false;
        }else if(!term4) {
              alert('모든 약관에 동의해 주세요');
               return false;
        }else{
           location.href="CreateProjectLayout.jsp";
           
        }


   }
   function start_create(){
      alert("ㅇㅅㅇ");
   }
   
</script>
	<style type="text/css">
#CreateTerms_Empty {
	margin-top: 100px;
}

#Terms_Title {
	margin-bottom: -10px;
	font-weight: bold;
	font-size: 23px;
}

#Terms_Notice {
	font-size: 13px;
	width: 110%;
}

#Terms_Link a {
	font-size: 13px;
}

#qualify {
	margin-left: 30px;
}

#Terms_Content label {
	font-size: 14px;
}

#Terms_Content .col-xs-1 {
	width: 5%;
}

#Terms_Content>div {
	margin-left: 10px;
	margin-top: 5px;
}

#Terms_Continue {
	color: white;
	font-size: 13px;
	font-weight: bold;
	border: none;
	background-color: #635c9f !important;
	border-radius: 5px;
	vertical-algin: middle;
	text-align: center;
	width: 100px;
	line-height: 45px;
}

.FTBC_hr {
	border: 1px solid gainsobro;
	margin-top: -5px;
}
</style>
	<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	<hr class="FTBC_hr" width=110%>

	<div class="container-fluid">
		<div class="col-xs-3">&nbsp;</div>
		<div class="col-xs-6">
			<div class="row" id="CreateTerms_Empty"></div>
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-8">
				&nbsp;
				<div>
					<h4 id="Terms_Title"># 프로젝트를 올리기 전 확인해 주세요</h4>
				</div>
				<hr width=110%>

				<div id="Terms_Notice">
					<span>FTBC는 공개 검토 절차를 통해 창작자님이 작성한 프로젝트가 FTBC의 정책을 준수하는지
						확인하고 있습니다 </span>
					<div style="margin-top: 5px"></div>
					<span>아래 사항들을 확인한 후 프로젝트를 올려 주세요. </span>
				</div>
				<hr width=110%>

				<div id="Terms_Link">
					<a>공개 검토 절차 및 기준 </a> <a id="qualify">창작자 자격 요건</a>
				</div>
				<hr width=110%>

				<div id="Terms_Content">
					<form id="f_terms" name="CreateTerms" onSubmit="terms_agree()">
						<div class="row">
							<input class="col-xs-1" type="checkbox" name="Terms_cb1"
								class="custom-control-input"> <label class="col-xs-11">새로운
								아이디어를 실현하기 위한 프로젝트입니다.</label>
						</div>
						<div class="row">
							<input class="col-xs-1" type="checkbox" name="Terms_cb2"
								class="custom-control-input"> <label class="col-xs-11">이미
								시판된 제품, 현금이나 지분 등 수익 제공, 선물 없는 단순 기부, 성인 인증이 필요한 콘텐츠 등 기준에 맞지 않는
								선물을 제공하지 않습니다.</label>
						</div>
						<div class="row">
							<input class="col-xs-1" type="checkbox" name="Terms_cb3"
								class="custom-control-input"> <label class="col-xs-11">창작자의
								신분증 혹은 사업자등록증, 국내 은행 계좌, 연락 가능한 본인 휴대폰 번호가 있습니다.</label>
						</div>
						<div class="row">
							<input class="col-xs-1" type="checkbox" name="Terms_cb4"
								class="custom-control-input"> <label class="col-xs-11">창작자
								대표자는 19세 이상 성인입니다. (미성년자 참여 방법은 자격 요건을 참고해 주세요)</label>
						</div>
				</div>
				</form>
				<hr width=110%>

				<div>
					<input id="Terms_Continue" type="button"
						onClick="continue_create()" value="계속하기">
				</div>
			</div>
		</div>
		<div class="col-xs-2">&nbsp;</div>

	</div>
</body>
</html>