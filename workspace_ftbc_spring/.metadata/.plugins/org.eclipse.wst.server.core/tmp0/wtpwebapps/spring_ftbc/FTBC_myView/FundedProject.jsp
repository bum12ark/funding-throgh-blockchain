<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	내 후원현황 페이지
	날짜:2019-09-18
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="FundedProject.css?12222222231">
</head>
<body>
<script type="text/javascript">
	function FpjbtnActive(id){
		$(".Fpj_btns").css("color", "#000000");
		$(".Fpj_btns").css("background-color", "transparent");
		$(".Fpj_num").css("background-color", "#999999");
		
		$("#"+id).css("color", "#3A6FF2");
		$("#"+id).css("background-color", "#DDDDDD");
		$("#"+id+"_num").css("background-color", "#3A6FF2");
		
		$(".Fpj_all").hide();
		$("#"+id+"_cnt").show();
		
	}
	
	/* ====[[^^고명석 2019-10-14 추가]] */
	function projectDetail(pjo_code) {
		location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
	}
	function fundedProject(){
		$.ajax({
			method:'get',
			url:'/Project/getFundedProjects?mem_email=<%=session.getAttribute("mem_email")%>',
			success:function(data){
				$("#fundedProject").append(data);
				$("#Fpj_ing_cnt").hide();
				$("#Fpj_done_cnt").hide();
				
			} 
				
		});
	}
	/* ====[[^^고명석 2019-10-14 추가]] */
	$(document).ready(function() {
		$("#Fpj_all").css("color", "#3A6FF2");
		$("#Fpj_all").css("background-color", "#DDDDDD");
		$("#Fpj_all_num").css("background-color", "#3A6FF2");

		/* ====[[^^고명석 2019-10-14 추가]] */
		fundedProject();
		/* ====[[^^고명석 2019-10-14 추가]] */
	});
</script>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
 <hr width=110%>
<div class="container-fluid">
	<div class="row" id="FundedProject_top">
		<div class="row" id="FundedProject_ele">
			<img src="<%=session.getAttribute("mem_pfimg").toString() %>" id="Fpj_pfimg">
			<h3><span id="Funded_mem_name"><%=session.getAttribute("mem_name").toString() %></span>님의  후원 현황 </h3>
		</div>
	</div>
	<div class="row" id="FundedProject_content">
	<!-- ====[[고명석 2019-10-14 수정]] -->
	<div id="fundedProject">
	</div>
	<!-- ====[[고명석 2019-10-14 수정]] -->	
	</div>
</div>
</body>
</html>