<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--=============================================================================================
	로그인 안되있을 경우에 들어갈 상단바
	날짜:2019-09-12
================================================================================================  -->
<!DOCTYPE html>
<html>
<style type="text/css">
	#topMenuBar_bar{
		padding-top:10px;
		height:55px;
		background-color: white;
	}
	#topMenuBar_menus a, #top_login a{
		color:black;
		font-size:14px;
		font-weight: bold;
		text-decoration:none !important;		
		vertical-align: -webkit-baseline-middle;
	}
	#topMenuBar_bar a:hover{
		 color: #8b8b8b;
		 background-size:auto;
		 background-color: white;
	}
	
	#topMenuBar_menus{
		margin-top:5px;
	}
	
	.fa-bars{
		margin-right:5px;
	}
	#topMenuBar_FTBClogo{
		height: 30px;
		margin-top:-5px;
	}
</style>
<script type="text/javascript">
	function topLogin() {
		var url = window.location.href;
		console.log("url : "+url);
		location.href="../FTBC_MainView/FTBC_LoginLayout.jsp?preURL="+url;
	}
</script>
<div id="topMenuBar_bar">
	<div class="col-xs-2 "></div>
	   <!--===============[ 메뉴 ] =============-->
    <div class="col-xs-2 ">
		<div class="dropdown" id="topMenuBar_menus">		
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
			<i class="fa fa-bars"></i>프로젝트 <span class="caret"></span></a>
			<ul class="dropdown-menu" aria-labelledby="about-us">
			<li><a href="../FTBC_LookView/LookAround_Project.jsp">프로젝트 둘러보기 </a></li>
              <li><a href="../FTBC_CreateView/CreatProject_Terms.jsp">프로젝트 올리기</a></li>
              <li><a href="../FTBC_BlockChainView/BlockChain_Main2.jsp">프로젝트 블록체인</a></li>  
			</ul>
		</div>
     </div>
     	<div class="col-xs-1 "></div>
        <!--===============[ 타이틀 ]==============-->
      <div class="col-xs-2 ">
         <div id="topMenuBar_title"  class="collapse navbar-collapse" ">
            <ul id="topMenuBar_title" class="nav nav-justified">
                <li><a href="../FTBC_MainView/FTBC_Main.jsp"><img id="topMenuBar_FTBClogo" src="../FTBC_Images/logo.png"></a></li>
            </ul>                
          </div>
      </div>
      	<div class="col-xs-1 "></div>
       <!--===============[ 로그인 ]==============-->
      <div class="col-xs-3 ">
        <div class="collapse navbar-collapse" ">
           <ul id="top_login" class="nav nav-justified">
              <li><a href="javascript: topLogin()" id="topLogin">로그인</a></li>
            </ul>                
        </div>
     </div>
</div>
</html>
