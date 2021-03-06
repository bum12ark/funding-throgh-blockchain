<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String maincat_name = request.getParameter("maincat_name").toString();
	String subcat_name = "null";
	if(request.getParameter("subcat_name")!=null){
	subcat_name = request.getParameter("subcat_name").toString();
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	프로젝트 둘러보기 클릭후 들어오는 페이지
	카테고리별 프로젝트
	리스트 부분은  Category_ProjectList.jsp
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="Category_Project.css?firew33211o29rk">
<script type="text/javascript">
	$(document).ready(function(){
		catProjectView('<%=maincat_name%>','<%=subcat_name%>',0,7);
	});
	function catProjectView(maincat_name,subcat_name,s,e){
		$.ajax({
			method:'get',
			url:'/Project/getCategoryProjects?maincat_name='+maincat_name+'&subcat_name='+subcat_name+'&s='+s+'&e='+e,
			success:function(data){
				$("#Look_Content").html(data);
				
			}
			
		});
	}
	function catProjectWindow(maincat_name,subcat_name,s,e){
		$.ajax({
			method:'get',
			url:'/Project/getCategoryProjects?maincat_name='+maincat_name+'&subcat_name='+subcat_name+'&s='+s+'&e='+e,
			success:function(data){
				$("#Look_Content").append(data);
				
			}
			
		});
	}
	var s = 0;
	var e = 7;
	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	     if($(window).scrollTop() == $(document).height() - $(window).height()){
	           s = s+8;
	           e = e+8;
	           catProjectWindow('<%=maincat_name%>','<%=subcat_name%>',s,e);
	     } 
	});
	function projectDetail(pjo_code) {
		location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
	}
	function catProject(maincat_name,subcat_name){
		catProjectView(maincat_name,'undefined',0,7);
		$("#Look_title").text(maincat_name);
	}
</script>
</head>
<body>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
<div id="category_pro">
	<div class="row Look_Top" id="Category_top">
		<div>
		 <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		 <%if(subcat_name.equals("undefined")){ %>
		<h1 class="Look_title" ><span id="Look_title"><%=maincat_name%></span>
		<%}else{
		%>
		<h1 class="Look_title" ><span id="Look_title"><%=subcat_name%></span>
		<%
		}
			%>
		 <i class="fa fa-sort-down"></i>
		 </h1>
		 </a>
			 <div class="dropdown-menu" id="category_dropdown">
				<div id="drop-item1">
					<a class="dropdown-item col-sm-6 ">모든 프로젝트</a>
					<a class="dropdown-item col-sm-6 " onclick="catProject('게임')">게임</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('공연')">공연</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('디자인')">디자인</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('영화')">영화 ∙ 비디오</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('푸드')">푸드</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('음악')">음악</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('출판')">출판</a>
				</div>
				<hr width=90%>
				
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('패션')">패션</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('캠페인')">캠페인</a>
				</div>
				<hr width=90%>
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('공예')">공예</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('만화')">만화</a>
				</div>
				<hr width=90%>
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('미술')">미술</a>
					<a class="dropdown-item col-sm-6" onclick="catProject('사진')">사진</a>
				</div>
				<hr width=90%>
				<div>
					<a class="dropdown-item col-sm-6" onclick="catProject('테크놀로지')">테크놀로지</a>
				</div>
				<hr width=90%>
			 </div>
		</div>
		
	</div>
	
	<!--중앙 메뉴바  -->
	<div class="row Look_Midbar">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
	
		</div>
		<div class="col-xs-2"></div>
	</div>
	
	<!-- 내용 -->
	<div class="Look_Content">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
		<div  id="Look_Content">
		
		</div>
	</div>
	<div class="col-xs-2"></div>
	</div>		
</div>
</div>
</body>
</html>