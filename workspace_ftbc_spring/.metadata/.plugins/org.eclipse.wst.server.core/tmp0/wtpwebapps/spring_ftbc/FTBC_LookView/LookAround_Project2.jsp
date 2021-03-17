<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 프로젝트 둘러보기 </title>
<!--=============================================================================================
	프로젝트 둘러보기 페이지
	날짜:2019-09-12
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="LookAround_Project2.css?o2mygirl">
</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".subcode").hide();
	});
	
	function showhideCategory(category){
		console.log("category " + category);
		if ( $("#subcode_"+category).css("display") == "none" ) $("#subcode_"+category).show(); 
		else{
			$("#subcode_"+category).hide();
		}
	}
	
		
	document.write
</script>
	<!-- 상단 바 바꿀   -->
	<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
	 <hr class="FTBC_hr"width=110%>
	 	
	 		<div class="row La_row">
		 		<div class="col-xs-2">&nbsp;</div>
		 		<div class="col-xs-8">
		 			<div class="row">
		 				<span class="Look_span">검색</span>
		 			</div>
		 			<div class="row">
		 				<input id="search_txt" type="text" placeholder="프로젝트를 검색해 주세요" >
		 				<input id="serach_btn" type="button" value="검색하기" >
		 			</div>
		 		</div>
	 		</div>
		 	<hr width=150%>
		 	
		 	<div class="row">
		 		<div class="col-xs-2">&nbsp;</div>
		 		<div class="col-xs-8">
			 		<div id="LA_discover_row"  class="row La_row">
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 모든 프로젝트</span>	</a>
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 인기 프로젝트</span></a>	
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 성공 임박 프로젝트</span></a>	
			 			<a href="Discover_Project.jsp"><span class="col-xs-3"> 새로운 프로젝트  </span></a>
			 		</div>
			 		<div id="LA_category_row" class="row La_row">
				 		<div class="row La_row">
				 			<span  class="col-xs-3 Look_span">카테고리</span>
				 		</div>
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
					 			<a onclick="showhideCategory('game')">
					 			<span> 게임<i class="fa fa-sort-down"></i></span></a>
					 			<div id="subcode_game" class="subcode">
					 				<a>모든 게임 프로젝트</a>
					 				<a>TRPG</a>
					 				<a>모바일 게임</a>
					 				<a>보드게임</a>
					 				<a>비디오 게임</a>
					 			</div>					
					 		</div>
					 		<div  class="mainCategory">
				 				<a onclick="showhideCategory('perform')">
				 				<span> 공연<i class="fa fa-sort-down"></i></span></a>	
				 				<div id="subcode_perform" class="subcode">
					 				<a>모든 공연 프로젝트</a>
					 				<a>무용</a>
					 				<a>뮤지컬</a>
					 				<a>연극</a>
					 				<a>페스티벌</a>
					 				<a>클래스</a>
					 			</div>	
					 		</div>
					 		<div  class="mainCategory">
				 				<a href="Discover_Project.jsp"><span> 음악</span></a>	
					 		</div>
					 		
				 		</div>
				 		
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('design')">
				 				<span> 디자인<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_design" class="subcode">
					 				<a>모든 디자인 프로젝트</a>
					 				<a>공간 디자인</a>
					 				<a>시각 디자인</a>
					 				<a>제품 디자인</a>
					 				<a>캐릭터 디자인</a>
					 			</div>	
					 		</div>
				 			<div class="mainCategory">
				 				<a href="Discover_Project.jsp"><span> 사진</span></a>
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('publication')">
				 				<span> 출판<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_publication" class="subcode">
					 				<a>모든 출판 프로젝트</a>
					 				<a>논픽션</a>
					 				<a>매거진</a>
					 				<a>소설</a>
					 				<a>시집</a>
					 				<a>아트북</a>
					 				<a>어린이책</a>
					 				<a>저널리즘</a>
					 				<a>전자출판</a>
					 				<a>학습</a>
					 			</div>	
					 		</div>
				 		</div>
				 		
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('comics')">
				 				<span> 만화<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_comics" class="subcode">
					 				<a>모든 만화 프로젝트</a>
					 				<a>그래픽 노블</a>
					 				<a>웹툰</a>
					 				<a>출판 만화</a>
					 			</div>	
					 		</div>
				 			<div class="mainCategory">
				 				<a onclick="showhideCategory('movie')">
				 				<span> 영화<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_movie" class="subcode">
					 				<a>모든 영화 프로젝트</a>
					 				<a>극영화</a>
					 				<a>다큐멘터리</a>
					 				<a>단편 영화</a>
					 				<a>애니메이션</a>
					 				<a>웹시리즈</a>
					 			</div>	
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('fashion')">
				 				<span> 패션<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_fashion" class="subcode">
					 				<a>모든 패션 프로젝트</a>
					 				<a>의류</a>
					 				<a>액세서리</a>
					 				<a>패션잡화</a>
					 				<a>뷰티</a>
					 			</div>	
				 			</div>
				 		</div>
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('art')">
				 				<span> 미술<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_art" class="subcode">
					 				<a>모든 미술 프로젝트</a>
					 				<a>공공예술</a>
					 				<a>디지털 아트</a>
					 				<a>미술 전시</a>
					 				<a>일러스트레이션</a>
					 				<a>행위예술</a>
					 				<a>혼합매체</a>
					 				<a>회화</a>
					 			</div>	
					 		</div>
				 			<div class="mainCategory">
				 				<a onclick="showhideCategory('food')">
				 				<span> 푸드<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_food" class="subcode">
					 				<a>모든 푸드 프로젝트</a>
					 				<a>베이킹</a>
					 				<a>요리책</a>
					 			</div>	
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('campagin')">
				 				<span> 캠페인<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_campagin" class="subcode">
					 				<a>모든 캠페인 프로젝트</a>
					 				<a>인권</a>
					 				<a>환경</a>
					 				<a>사회</a>
					 			</div>	
				 			</div>
			 			</div>
		 		</div>
		 		<div class="col-xs-2">&nbsp;</div>
		 	</div>
		 	
	 	</div>
</body>
</html>