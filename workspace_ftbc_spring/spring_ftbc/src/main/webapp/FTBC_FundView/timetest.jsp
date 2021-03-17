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

	<script language="JavaScript">
	
		var SetTime = 10;		// 최초 설정 시간(기본 : 초)

		function msg_time(time) {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	// 남은 시간 계산
			
			var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				clearInterval(tid);		// 타이머 해제
				alert("종료"); 
				//alert 대신 서블릿 태우면 됨.
				 SetTime = 10;
				return function TimerStart(){ tid=setInterval('msg_time()',1000) };
			}
			
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
	</script>
<div id="ViewTimer"></div>

</body>
</html>