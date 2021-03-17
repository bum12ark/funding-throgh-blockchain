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
<link rel="stylesheet" type="text/css" href="LookAround_Project.css?o2mygirl">
</head>
<body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".subcode").hide();
	});
	
	function showhideCategory(category){
		if ( $("#subcode_"+category).css("display") == "none" ) $("#subcode_"+category).show(); 
		else{
			$("#subcode_"+category).hide();
		}
	}
	function catProject(maincat_name,subcat_name){
		location.href="./Category_Project.jsp?maincat_name="+maincat_name+"&subcat_name="+subcat_name;
	}
	function keyword_pro(){
		var keyword = $("#search_txt").val();
		location.href="./Keyword_Project.jsp?keyword="+keyword;		
	}
		
</script>
	<!-- 상단 바 바꿀   -->
	<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
	 <hr class="FTBC_hr"width=110%>
	 	
	 		<div class="row La_row">
		 		<div class="col-xs-2">&nbsp;</div>
		 		<div class="col-xs-8">
		 			<div class="row">
		 				<span class="Look_span">검색</span>
		 			</div>
		 			<div class="row">
		 				<input id="search_txt" type="text" placeholder="프로젝트를 검색해 주세요" >
		 				<input id="serach_btn" type="button" value="검색하기" onClick="keyword_pro()">
		 			</div>
		 		</div>
	 		</div>
		 	<hr width=150%>
		 	
		 	<div class="row">
		 		<div class="col-xs-2">&nbsp;</div>
		 		<div class="col-xs-8">
			 		<div id="LA_discover_row"  class="row La_row">
			 			<a href="Discover_Project.jsp?sort=all"><span class="col-xs-3"> 모든 프로젝트</span>	</a>
			 			<a href="Discover_Project.jsp?sort=popular"><span class="col-xs-3"> 인기 프로젝트</span></a>	
			 			<a href="Discover_Project.jsp?sort=recommnad"><span class="col-xs-3"> 마감 임박 프로젝트</span></a>	
			 			<a href="Discover_Project.jsp?sort=vergeof"><span class="col-xs-3"> 완료 임박 프로젝트  </span></a>
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
					 				<a onclick="catProject('게임')">모든 게임 프로젝트</a>
					 				<a onclick="catProject('게임','TRPG')">TRPG</a>
					 				<a onclick="catProject('게임','모바일 게임')">모바일 게임</a>
					 				<a onclick="catProject('게임','보드게임')">보드게임</a>
					 				<a onclick="catProject('게임','비디오게임')">비디오게임</a>
					 			</div>					
					 		</div>
					 		<div  class="mainCategory">
				 				<a onclick="showhideCategory('perform')">
				 				<span> 공연<i class="fa fa-sort-down"></i></span></a>	
				 				<div id="subcode_perform" class="subcode">
					 				<a onclick="catProject('공연')">모든 공연 프로젝트</a>
					 				<a onclick="catProject('공연','무용')">무용</a>
					 				<a onclick="catProject('공연','뮤지컬')">뮤지컬</a>
					 				<a onclick="catProject('공연','연극')">연극</a>
					 				<a onclick="catProject('공연','페스티벌')">페스티벌</a>
					 				<a onclick="catProject('공연','클래스')">클래스</a>
					 			</div>	
					 		</div>
					 		<div  class="mainCategory">
				 				<a onclick="catProject('음악')"><span> 음악</span></a>	
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="catProject('테크놀로지')"><span>테크놀로지</span></a>
					 		</div>
				 		</div>
				 		
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('design')">
				 				<span> 디자인<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_design" class="subcode">
					 				<a onclick="catProject('디자인')">모든 디자인 프로젝트</a>
					 				<a onclick="catProject('디자인','공간디자인')">공간디자인</a>
					 				<a onclick="catProject('디자인','시각디자인')">시각디자인</a>
					 				<a onclick="catProject('디자인','제품디자인')">제품디자인</a>
					 				<a onclick="catProject('디자인','캐릭터 디자인')">캐릭터 디자인</a>
					 			</div>	
					 		</div>
				 			<div class="mainCategory">
				 				<a onclick="catProject('사진')"><span> 사진</span></a>
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('publication')">
				 				<span> 출판<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_publication" class="subcode">
					 				<a onclick="catProject('출판')">모든 출판 프로젝트</a>
					 				<a onclick="catProject('출판','논픽션')">논픽션</a>
					 				<a onclick="catProject('출판','매거진')">매거진</a>
					 				<a onclick="catProject('출판','소설')">소설</a>
					 				<a onclick="catProject('출판','시집')">시집</a>
					 				<a onclick="catProject('출판','아트북')">아트북</a>
					 				<a onclick="catProject('출판','어린이책')">어린이책</a>
					 				<a onclick="catProject('출판','저널리즘')">저널리즘</a>
					 				<a onclick="catProject('출판','전자출판')">전자출판</a>
					 				<a onclick="catProject('출판','학습')">학습</a>
					 			</div>	
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="catProject('공예')"><span>공예</span></a>
					 		</div>
				 		</div>
				 		
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('comics')">
				 				<span> 만화<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_comics" class="subcode">
					 				<a onclick="catProject('만화')">모든 만화 프로젝트</a>
					 				<a onclick="catProject('만화','그래픽 노블')">그래픽 노블</a>
					 				<a onclick="catProject('만화','웹툰')">웹툰</a>
					 				<a onclick="catProject('만화','출판 만화')">출판 만화</a>
					 			</div>	
					 		</div>
				 			<div class="mainCategory">
				 				<a onclick="showhideCategory('movie')">
				 				<span> 영화<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_movie" class="subcode">
					 				<a onclick="catProject('영화')">모든 영화 프로젝트</a>
					 				<a onclick="catProject('영화','극영화')">극영화</a>
					 				<a onclick="catProject('영화','다큐멘터리')">다큐멘터리</a>
					 				<a onclick="catProject('영화','단편 영화')">단편 영화</a>
					 				<a onclick="catProject('영화','애니메이션')">애니메이션</a>
					 				<a onclick="catProject('영화','웹시리즈')">웹시리즈</a>
					 			</div>	
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('fashion')">
				 				<span> 패션<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_fashion" class="subcode">
					 				<a onclick="catProject('패션')">모든 패션 프로젝트</a>
					 				<a onclick="catProject('패션','의류')">의류</a>
					 				<a onclick="catProject('패션','액세서리')">액세서리</a>
					 				<a onclick="catProject('패션','패션잡화')">패션잡화</a>
					 				<a onclick="catProject('패션','뷰티')">뷰티</a>
					 			</div>	
				 			</div>
				 		</div>
				 		<div class="col-xs-3 category_row">
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('art')">
				 				<span> 미술<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_art" class="subcode">
					 				<a onclick="catProject('미술')">모든 미술 프로젝트</a>
					 				<a onclick="catProject('미술','공공예술')">공공예술</a>
					 				<a onclick="catProject('미술','디지털 아트')">디지털 아트</a>
					 				<a onclick="catProject('미술','미술 전시')">미술 전시</a>
					 				<a onclick="catProject('미술','일러스트레이션')">일러스트레이션</a>
					 				<a onclick="catProject('미술','행위예술')">행위예술</a>
					 				<a onclick="catProject('미술','혼합매체')">혼합매체</a>
					 				<a onclick="catProject('미술','회화')">회화</a>
					 			</div>	
					 		</div>
				 			<div class="mainCategory">
				 				<a onclick="showhideCategory('food')">
				 				<span> 푸드<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_food" class="subcode">
					 				<a onclick="catProject('푸드')">모든 푸드 프로젝트</a>
					 				<a onclick="catProject('푸드','베이킹')">베이킹</a>
					 				<a onclick="catProject('푸드','요리책')">요리책</a>
					 			</div>	
					 		</div>
					 		<div class="mainCategory">
				 				<a onclick="showhideCategory('campagin')">
				 				<span> 캠페인<i class="fa fa-sort-down"></i></span></a>
				 				<div id="subcode_campagin" class="subcode">
					 				<a onclick="catProject('캠페인')">모든 캠페인 프로젝트</a>
					 				<a onclick="catProject('캠페인','인권')">인권</a>
					 				<a onclick="catProject('캠페인','환경')">환경</a>
					 				<a onclick="catProject('캠페인','사회')">사회</a>
					 			</div>	
				 			</div>
			 			</div>
		 		</div>
		 		<div class="col-xs-2">&nbsp;</div>
		 	</div>
		 	
	 	</div>
</body>
</html>