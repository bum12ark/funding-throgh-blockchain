<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   int mem_isAuthority = 0;
   if (session.getAttribute("mem_isAuthority") != null) {
      mem_isAuthority = Integer.parseInt(session.getAttribute("mem_isAuthority").toString());
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
   내 페이지
   날짜:2019-09-16
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#project_menu").hide();
	});
	function project(){
		if ( $("#project_menu").css("display") == "none" ) $("#project_menu").show(); 
		else{
			$("#project_menu").hide();
		}
	}
</script>
	<style type="text/css">
.FTBC_myPage {
	margin: 30px 0 30px 50px;;
}

#myPage_pfimg {
	width: 75px;
}

#my_name {
	margin-left: 20px;
	font-size: 21px;
	font-weight: 700;
	text-decoration: none solid rgb(117, 117, 117);
}

.FTBC_myPage a {
	color: black;
	font-size: 28px;
	font-weight: bold;
	text-decoration: none;
}

.pjo_row a{
	text-decoration: none solid rgb(117, 117, 117);
}
	.pjo_row span:hover{
		color:  #757575;
	}
	.pjo_row i:hover{
		color:  #757575;
	}
	#project_menu {
		cursor:pointer;
		margin: 10px 0 10px 0;
	}
	
	#project_menu a{
		padding: 3px;
		color: #757575;
		font-size: 20px;
		display:block;
		font-weight: bold;
	}
	
</style>
	<script type="text/javascript">
   function myPage_logout() {
      location.href="/member/logout.ftbc";
   }
</script>
	<div id="top_MenuBar">
		<!-- 내 페이지는 상단바 바뀌어야함.  -->
		<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
		<hr class="FTBC_hr" width=110%>
	</div>
	<div class="container-fluid">
		<div class="col-xs-2">&nbsp;</div>
		<div class="col-xs-8">
			<div class="FTBC_myPage">
				<img src="<%=session.getAttribute("mem_pfimg").toString() %>"
					id="myPage_pfimg"> <span id="my_name"><%=session.getAttribute("mem_name").toString() %></span>
				<hr width=100%>
			</div>

			<div class="FTBC_myPage">
				<span><a href="Message.jsp">메시지</a></span><br>
				<%
            if (mem_isAuthority == 1) {
            %>
				<span><a href="/FTBC_Common/BlockServer.jsp" target="blank">서버
				</a></span><br>
				<%
            }else{
            %>
				<span><a href="FundedProject.jsp">내 후원현황</a></span><br> 
				<div class="pjo_row">
					<a onclick="project()"><span>내가 만든 프로젝트<i class="fa fa-sort-down"></i></span></a><br>
						<div id="project_menu">
							<a href="myProject.jsp">내가 만든 프로젝트</a>
							<a href="myProject_table.jsp">내가 만든 프로젝트 후원현황</a>
						</div>
				</div>
				<%
               }
            %>
				<hr width=100%>
			</div>

			<div class="FTBC_myPage" id="myPage_1p">
				<span><a href="Edit_Profile.jsp">프로필 설정</a></span><br>
				<%
               if (mem_isAuthority == 1) {
            %>
				<span><a href="/FTBC_Admin/Project_Approval.jsp">프로젝트 관리</a></span><br>
				<%
               }else{
            %>
				<span><a href="/FTBC_MainView/FTBC_WalletDownLoad.jsp">자료실</a></span><br>
				<%
               }
            %>
				<span><a href="javascript: myPage_logout()">로그아웃</a></span><br>
			</div>
		</div>
		<div class="col-xs-2">&nbsp;</div>
	</div>
</body>
</html>