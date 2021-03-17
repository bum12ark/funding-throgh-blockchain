<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--=============================================================================================
	로그인 안되있을 경우에 들어갈 상단바
	날짜:2019-09-12
================================================================================================  -->
<style type="text/css">
	#topMenu_bar{
		padding-top:10px;
		height:55px;
		background-color: white;
	}
	#top_menus a, #top_login a{
		color:black;
		font-size:14px;
		font-weight: bold;
		text-decoration:none !important;		
		vertical-align: -webkit-baseline-middle;
	}
	#topMenu_bar a:hover{
		 color: #8b8b8b;
		 background-size:auto;
		 background-color: white;
	}
	#logo{
		height: 30px;
		margin-top:-5px;
	}
</style>
<div id="topMenu_bar">
	<div class="col-xs-5 "></div>
        <!--===============[ 타이틀 ]==============-->
      <div class="col-xs-2 ">
         <div id="top_title"  class="collapse navbar-collapse" ">
            <ul id="top_title" class="nav nav-justified">
                <li><a href="../FTBC_MainView/FTBC_Main.jsp"><img id="logo" src="../FTBC_Images/logo.png"></a></li>
            </ul>                
          </div>
      </div>
      	<div class="col-xs-5 "></div>
       <!--===============[ 로그인 ]==============-->
</div>
