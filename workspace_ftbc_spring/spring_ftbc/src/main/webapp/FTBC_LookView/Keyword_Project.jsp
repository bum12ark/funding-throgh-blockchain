<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword").toString();
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	프로젝트 둘러보기 검색해서 들어오는 페이지
	타이틀: "키워드"에 대한 검색 결과 
	리스트 부분은  Keyword_ProjectList.jsp
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="Keyword_Project.css?It2s2z2y">
<script type="text/javascript">
	$(document).ready(function(){
		keyProjectView('<%=keyword%>',0,7);
	});
	var s = 0;
	var e = 7;
	function keyProjectView(keyword,s,e){
		$.ajax({
			method:'get',
			url:'/Project/getKeywordProjects?Keyword='+keyword+'&s='+s+'&e='+e,
			success:function(data){
				$("#keyword_view").append(data);
			}
			
		});
	}
	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	     if($(window).scrollTop() == $(document).height() - $(window).height()){
	           s = s+8;
	           e = e+8;
	           keyProjectView('<%=keyword%>',s,e);
	     } 
	});
    function projectDetail(pjo_code) {
        location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
     }
</script>
</head>
<body>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
	<div id="keyword_view">
	<div class="row Look_Top" id="Keyword_top">
		<h1 class="Look_title">“<%=keyword%>”에 대한 검색 결과 </h1>
	</div>
	
	<!-- 내용 -->
	<div>
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
		<div class="Look_Content">
		
		</div>
		</div>
		<div class="col-xs-2"></div>
	</div>
	</div>
</div>
</body>
</html>