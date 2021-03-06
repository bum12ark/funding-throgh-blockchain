<%@page import="vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pjo_code = request.getParameter("pjo_code").toString();
	String mem_email_c = null;
	if (session.getAttribute("mem_email") != null) {
		mem_email_c = session.getAttribute("mem_email").toString();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세 페이지</title>
<!--=============================================================================================
	상세보기 페이지
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="ProjectDetail.css?10">
<script type="text/javascript">
	$(document).ready(function() {
		pjo_ajax();
	});
	function approveProject(pjo_code){
		var conf = confirm("해당 프로젝트를 승인하시겠습니까?");
		if(conf == true) {
			location.href="/Project/ApproveProject?projectCode="+pjo_code;
		}
    }
	   function pjo_ajax(){
	       $.ajax({
	         method:'get',
	         url:'/Project/projectDetail?projectCode=<%=pjo_code%>&mem_email=<%=mem_email_c%>',
	         success:function(data){
	            $("#detail_pjo").html(data);
	         } 
	            
	      }); 
	   }
      function clickRewardCards(pjo_code,GIFT_LIMITED,getSupport_num) {
            if (GIFT_LIMITED!= null) {
               if(GIFT_LIMITED - getSupport_num !=0){
                location.href = '/Funding/fundDetail?projectCode=<%=pjo_code%>&mem_email=<%=session.getAttribute("mem_email")%>';
               }else {
                  alert("해당 선물은 선착순 마감되었습니다.");
               }
         }else {
         location.href = '/Funding/fundDetail?projectCode=<%=pjo_code%>&mem_email=<%=session.getAttribute("mem_email")%>';
         }
      }
		function noLoginclickRewardCards(){
			alert("로그인 후 가능합니다.");
		}
		function clickStoryReple() {
			alert("clickStroyReple 클릭");
		}
		function clickBackCommunity() {
			alert("커뮤니티로 돌아가기");
		}
		function clickLoadMoreComment() {
			alert("이전 댓글 더보기");
		}
		function clickInputComment() {
			alert("댓글 작성 클릭");
		}
		function clickCommunitySave() {
			alert("커뮤니티 후원자 글 작성");
		}
		function endFund() {
			alert("마감된 펀딩입니다.");
		}
		// 이전에 써져있던 정보들을 초기화 하기 위한 함수
		var nick = null;
		function clickInquiry(pjo_code,mem_nick) {
			nick = mem_nick;
			$("#modal-from").text(mem_nick);
			var value = $('#modal-types option:selected').val();
			if(!(value == '문의유형')) {
				$("#modal-types").val('문의유형').prop("selected", true);
				$("#modal-contents").attr('disabled', 'disabled');
				$("#modal-contents").val('');
				$('#footer-submit').attr('disabled', 'disabled');
			}
			$("#pjo_code").val(pjo_code);
		}
		function messegeSend(){
			$("#PROJECT_CODE").val('<%=pjo_code%>');

			var select = $("#modal-types option:selected").text();
			$("#modal-types_select").val(select);
			$.post("/member/messageSend", $("#message_form").serialize(), function(
					data) {
			});
		}
		function category(maincat_name,subcat_name){
			location.href="../FTBC_LookView/Category_Project.jsp?maincat_name="+maincat_name+"&subcat_name="+subcat_name;
		}
		function clickInquiry2() {
			alert("창작자만 문의할 수 있습니다.");
		}
</script>
</head>
<body>
	<div id="top_MenuBar">
		<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	</div>
	<div class="container-fluid">
		<div id="detail_pjo"></div>
	</div>
	<!-- ======== 창작자에게 문의하기 모달 창 ============ -->
	<%@include file="./Project_InquiryModal.jsp"%>
</body>
</html>