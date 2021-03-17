<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
   메인 페이지
   날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/FTBC_MainView/FTBC_Main.css?2122311">
</head>
<body leftmargin="0" rightmargin="0">
	<script type="text/javascript">
      //배너 변경
      $(".carousel").carousel({
         interval : 2000
      });

      $('#mainbanner').bind('slide.bs.carousel', function(e) {
         console.log('slide event!');
      });

      $('#mainbanner').bind('slid', function(e) {
         console.log("slid event!");
      });

      function projectDetail(pjo_code) {
         location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="
               + pjo_code;
      }
      
      function bannerDetail(pjo_code){
         location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="
            + pjo_code;
      }
      function main_ajax() {
         $.ajax({
            method : 'get',
            url : '/Project/getMainProjects',
            success : function(data) {
               $("#allproject").html(data);
            }

         });
      }
      $(document).ready(function() {
         main_ajax();
      });
   </script>
	<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	<!--====================[배너 이미지 ]====================  -->
	<div class="container-fluid">
		<!-- Wrapper for slides -->
		<div id="mainbanner" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="mainbanner" data-slide-to="0" class="active"></li>
				<li data-target="mainbanner" data-slide-to="1"></li>
				<li data-target="mainbanner" data-slide-to="2"></li>
				<li data-target="mainbanner" data-slide-to="3"></li>
				<li data-target="mainbanner" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="../FTBC_Images/banner1.png" alt="..."
						onclick="bannerDetail('C03_1')">
					<div class="carousel-caption">
						<p>이븐데이 향초</p>
						<h2>하고싶은 말, 듣고싶은 말, 보고싶은 말</h2>
					</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/banner2.png" alt="..."
						onclick="bannerDetail('C03_2')">
					<div class="carousel-caption">
						<h1>深夜 심야 ver. 2020</h1>
						<p>낭만이길 다이어리</p>
					</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/banner3.png" alt="..."
						onclick="bannerDetail('F01_1')">
					<div class="carousel-caption">
						<h1>신년, 연말 필수템</h1>
						<p>주당원샷잔</p>
					</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/banner4.png" alt="..."
						onclick="bannerDetail('C03_3')">
					<div class="carousel-caption">
						<h1>어둠 속에 빛나는 눈동자</h1>
						<p>검은 고양이 ‘르샤누아’</p>
					</div>
				</div>
				<div class="item">
					<img src="../FTBC_Images/banner5.png" alt="..."
						onclick="bannerDetail('C04_1')">
					<div class="carousel-caption">
						<h1>날 데려가라...</h1>
						<p>미어캣입니다</p>
						<h3>귀여움 가득담은 미어캣입니다 얼굴 쿠션</h3>
					</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#mainbanner" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#mainbanner" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<!--====================[ 내  용   ]====================  -->
		<div class="row Project_lists" id="contents">
			<div class="col-xs-2"></div>
			<div id="main_Center" class="col-xs-8">

				<!--=================================[인기 프로젝트 ]================================== -->
				<div class="row" id="allproject"></div>
			</div>
			<!--end of center  -->
			<div class="col-xs-2"></div>
		</div>
		<!--========================= [푸터 ] ======================== -->
		<div id="footer"><%@ include
				file="../FTBC_Common/FTBC_Footer.jsp"%></div>
	</div>
</body>
</html>