<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>우편번호 검색</title>
    <%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
      <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <!--[if IE 6]><script type="text/javascript" src="http://cdn.poesis.kr/post/popup.min.js"></script><![endif]-->
</head>
<body>

<!--
 *  Postcodify - 도로명주소 우편번호 검색 프로그램 (코딩 예제)
 * 
 *  Copyright (c) 2014-2015, Poesis <root@poesis.kr>
 * 
 *  이 프로그램은 자유 소프트웨어입니다. 이 소프트웨어의 피양도자는 자유
 *  소프트웨어 재단이 공표한 GNU 약소 일반 공중 사용 허가서 (GNU LGPL) 제3판
 *  또는 그 이후의 판을 임의로 선택하여, 그 규정에 따라 이 프로그램을
 *  개작하거나 재배포할 수 있습니다.
 * 
 *  이 프로그램은 유용하게 사용될 수 있으리라는 희망에서 배포되고 있지만,
 *  특정한 목적에 맞는 적합성 여부나 판매용으로 사용할 수 있으리라는 묵시적인
 *  보증을 포함한 어떠한 형태의 보증도 제공하지 않습니다. 보다 자세한 사항에
 *  대해서는 GNU 약소 일반 공중 사용 허가서를 참고하시기 바랍니다.
 * 
 *  GNU 약소 일반 공중 사용 허가서는 이 프로그램과 함께 제공됩니다.
 *  만약 허가서가 누락되어 있다면 자유 소프트웨어 재단으로 문의하시기 바랍니다.
 *
 *-->

<h1>우편번호 검색</h1>

<!-- 주소 입력란 -->

<div>
    <p>
        <label>우편번호</label><input type="text" size="4" class="postcodify_postcode6_1" /> &ndash;
        <label></label><input type="text" size="4" class="postcodify_postcode6_2" /> &nbsp;
        <button id="search_button">검색</button>
    </p>
    <p><label>도로명주소</label><input type="text" class="postcodify_address" /></p>
    <p><label>상세주소</label><input type="text" class="postcodify_details" /></p>
    <p><label>참고항목</label><input type="text" class="postcodify_extra_info" /></p>
    <p><label>영문주소</label><input type="text" class="postcodify_english_address" /></p>
    <p><label>지번주소</label><input type="text" class="postcodify_jibeon_address" /></p>
</div>

<!-- Postcodify 셋팅 -->

<script type="text/javascript">
    $("#search_button").postcodifyPopUp();
</script>

</body>
</html>
