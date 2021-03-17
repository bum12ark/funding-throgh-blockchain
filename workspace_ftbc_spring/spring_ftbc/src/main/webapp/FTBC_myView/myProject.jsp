<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
   int cnt = 0;
   if(session.getAttribute("myPjoSize")!=null){
      cnt = Integer.parseInt(session.getAttribute("myPjoSize").toString());
   }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
   내 가 만든 프로젝트 
   날짜:2019-09-16
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="myProject.css?minj32323u">
<!-- ================= [고명석 2019-10-14 중간합산본 이후 추가] ========================= -->
<script type="text/javascript">
   function projectDetail(pjo_code) {
      location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="+pjo_code;
   }
   var s = 0;
   var e = 7;
   function myProject(s,e){
      $.ajax({
         method:'get',
         url:'/Project/getMyProjects?mem_email=<%=session.getAttribute("mem_email")%>&s='+s+'&e='+e,
         success:function(data){
            $("#myProject_List").append(data);
            $("#created_num").text(size);
         } 
            
      });
   }
   $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
        if($(window).scrollTop() == $(document).height() - $(window).height()){
              s = s+8;
              e = e+8;
              myProject(s,e);
        } 
   });
   $(document).ready(function() {
      myProject(0,7);
   });
</script>
<!-- ================= [고명석 2019-10-14 중간합산본 이후 추가] ========================= -->
</head>
<body>
	<!-- 내가 만든 프로젝트 페이지는 상단바 바뀌어야함.  -->
	<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	<div class="container-fluid">
		<div class="row" id="myProject_top">
			<div class="row" id="myProject_pfd">
				<img src="<%=session.getAttribute("mem_pfimg").toString() %>"
					id="myProject_pfimg" width=150px>
				<h3>
					<span id="my_mem_name"><%=session.getAttribute("mem_nickname").toString() %></span>님이
					만든 프로젝트 현황
				</h3>
			</div>
		</div>

		<div class="row" id="myProject_content">
			<div>
				<div class="col-xs-2">&nbsp;</div>
				<div class="col-xs-8">
					<div id="myProject_spans">
						<span id="created_project">만든 프로젝트 </span> <span id="created_num"><%=cnt%></span>
						<span>개</span>
					</div>
					<div id="myProject_List" ></div>
				</div>
				<div class="col-xs-2">&nbsp;</div>
			</div>
		</div>
	</div>
</body>
</html>