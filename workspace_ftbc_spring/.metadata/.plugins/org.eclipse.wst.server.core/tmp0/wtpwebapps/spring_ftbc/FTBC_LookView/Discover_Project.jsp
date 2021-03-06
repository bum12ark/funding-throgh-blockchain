<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String kind = request.getParameter("sort");
%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	프로젝트 둘러보기 클릭후 들어오는 페이지
	모든 프로젝트, 인기프로젝트 등  
	리스트 부분은  Discover_ProjectList.jsp
	날짜:2019-09-19
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="Discover_Project.css?Lu233dga">
</head>
<body>
	<script type="text/javascript">
		function projectDetail(pjo_code) {
			location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
		}
		$(document).ready(function() {
			  $(".dropdown-toggle").dropdown();
			  kindProject('<%=kind%>',0,7);
		});
		
		
		var start = 0;
		var end = 7;
		$(window).scroll(function(){
		     if($(window).scrollTop() == $(document).height() - $(window).height()){
		           start = start+8;
		           end = end+8;
		           kindProject('<%=kind%>',start,end);
		     } 
		});
		function kindProject(sort,start,end){
			$.ajax({
				method:'get',
				url:'/Project/getDiscoverProjects?sort='+sort+'&start='+start+'&end='+end,
				success:function(data){
					$("#discover_content").append(data);
				}
				
			});
			if(sort=="all"){
				$("#Look_title").html("모든 프로젝트");
			}else if(sort=="popular"){
				$("#Look_title").html("인기 프로젝트");
				
			}else if(sort=="recommnad"){
				$("#Look_title").html("마감 임박 프로젝트");
				
			}else if(sort=="vergeof"){
				$("#Look_title").html("완료 임박 프로젝트");
				
			}
		}
		function catProject(maincat_name,subcat_name){
			catProjectView(maincat_name,'undefined');
		}
		function catProjectView(maincat_name,subcat_name){
			$.ajax({
				method:'get',
				url:'/Project/getCategoryProjects?maincat_name='+maincat_name+'&subcat_name='+subcat_name,
				success:function(data){
					$("#category_pro").html(data);
				}
				
			});
		}
	</script>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="Look_hr"width=100%>
<div class="container-fluid">
	<!--상단 부분  -->
	<div class="row Look_Top " id="Discover_top">
	
		<div>
		 <a  class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<h1 class="Look_title" id="Look_title">모든 프로젝트
		 <i class="fa fa-sort-down"></i>
		 </h1>
		 </a>
			  <div class="dropdown-menu" id="discover_dropdown">
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
	<div>
		<div class="Look_Content">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
		<div id="discover_content">
		
		</div>
		
		</div>
		<div class="col-xs-2"></div>
		</div>
	</div>
</div>	
</body>
</html>