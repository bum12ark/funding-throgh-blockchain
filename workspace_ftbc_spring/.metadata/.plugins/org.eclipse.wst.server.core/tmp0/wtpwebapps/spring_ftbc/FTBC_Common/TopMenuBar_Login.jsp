<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String mem_email = session.getAttribute("mem_email").toString();
   String mem_pfimg = session.getAttribute("mem_pfimg").toString();
   String mem_name = session.getAttribute("mem_name").toString();
   String mem_isauthority = session.getAttribute("mem_isAuthority").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
   로그인 되있을 경우에 들어갈 상단바
   로그인 부분이 회원이름으로.
   날짜:2019-09-12
================================================================================================  -->
</head>
<body>
	<style type="text/css">
.FTBC_loginbar {
	height: 40px;
	line-height: 40px;
}

#topMenuBar_bar {
	height: 65px;
}

#topMenuBar_menus a, #top_login a {
	color: black;
	font-size: 14px;
	line-height: 20px !important;
	font-weight: bold;
	text-decoration: none !important;
	vertical-align: -webkit-baseline-middle;
}

#topMenuBar_bar a:hover {
	color: #8b8b8b;
	background: none;
	background-color: white;
}

#topMenuBar_menus {
	margin-top: 5px;
}

#TopMenuBar_Login_mem_pfimg {
	margin-left: 10px;
	width: 40px;
}

#topMenuBar_FTBClogo {
	height: 30px;
	margin-top: -5px;
}
</style>

	<div id="topMenuBar_bar">
		<div class="col-xs-2 "></div>
		<!--===============[ 메뉴 ] =============-->
		<div class="col-xs-2 FTBC_loginbar">
			<div class="dropdown" id="topMenuBar_menus">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false"> <i
					class="fa fa-list"></i>프로젝트 <span class="caret"></span></a>
				<ul class="dropdown-menu" aria-labelledby="about-us">
					<li><a href="../FTBC_LookView/LookAround_Project.jsp">프로젝트
							둘러보기 </a></li>
					<li><a href="../FTBC_CreateView/CreatProject_Terms.jsp">프로젝트
							올리기</a></li>
					<li><a href="../FTBC_BlockChainView/BlockChain_Main2.jsp">프로젝트
							블록체인</a></li>
				</ul>
			</div>
		</div>
		<div class="col-xs-1 "></div>
		<!--===============[ 타이틀 ]==============-->
		<div class="col-xs-2 FTBC_loginbar">
			<div id="topMenuBar_title" class="collapse navbar-collapse"">
				<ul id="topMenuBar_title" class="nav nav-justified">
					<li><a href="../FTBC_MainView/FTBC_Main.jsp"><img
							id="topMenuBar_FTBClogo" src="../FTBC_Images/logo.png"></a></li>
				</ul>
			</div>
		</div>
		<div class="col-xs-1 "></div>
		<!--===============[ 로그인 ]==============-->
		<div class="col-xs-3 FTBC_loginbar">
			<div class="collapse navbar-collapse">
				<div>
					<ul id="top_login" class="nav nav-justified">
						<li><a href="/FTBC_myView/myPage.jsp" id="mem_name"
							style="padding: 10px 0 0 0;"> <i class="fa fa-search"></i> <%=mem_name %>
								<img src="<%=mem_pfimg %>" id="TopMenuBar_Login_mem_pfimg"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>