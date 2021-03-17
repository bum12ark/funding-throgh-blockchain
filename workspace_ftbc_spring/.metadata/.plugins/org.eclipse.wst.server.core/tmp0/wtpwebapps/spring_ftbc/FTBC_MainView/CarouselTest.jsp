<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
</head>
<body>
<script>
	$(".carousel").carousel({ interval:3000 });
	/*
	interval : 자동 슬라이드의 경우 다음 슬라이드가 나타날 때까지의 시간이며 기본은 5000ms입니다. 값으로 false를 사용하면 자동 슬라이드가 안됩니다.
	pause : 캐러젤에 마우스를 올렸을 때 슬라이드가 정지됩니다. 기본은 ‘hover’이며 false를 사용하면 마우스를 올려도 슬라이드 됩니다.
	wrap : false로 하면 마지막 슬라이드에서 슬라이드가 정지됩니다. 기본 값은 true입니다.
	keyboard : false로 하면 키보드 이벤트에 반응하지 않습니다. 기본 값은 true입니다.
	*/
</script>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="../FTBC_Images/banner1.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img src="../FTBC_Images/banner2.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</body>
</html>