<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	시간 카운트 하는 페이지 
	날짜:2019-10-04
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css" href="BlockServer.css?Lovelyz">
</head>
<body>
	<script type="text/javascript">
		function CountDownTimer(duration, granularity) {
			this.duration = duration;
			this.granularity = granularity || 1000;
			this.tickFtns = [];
			this.running = false;
		}

		CountDownTimer.prototype.start = function() {
			if (this.running) {
				return;
			}
			this.running = true;
			var start = Date.now(), that = this, diff, obj;

			(function timer() {
				diff = that.duration - (((Date.now() - start) / 1000) | 0);

				if (diff > 0) {
					setTimeout(timer, that.granularity);
				} else {
					diff = 0;
					that.running = false;
				}

				obj = CountDownTimer.parse(diff);
				that.tickFtns.forEach(function(ftn) {
					ftn.call(this, obj.minutes, obj.seconds);
				}, that);
			}());
		};

		CountDownTimer.prototype.onTick = function(ftn) {
			if (typeof ftn === 'function') {
				this.tickFtns.push(ftn);
			}
			return this;
		};

		CountDownTimer.prototype.expired = function() {
			return !this.running;
		};

		CountDownTimer.parse = function(seconds) {
			return {
				'minutes' : (seconds / 60) | 0,
				'seconds' : (seconds % 60) | 0
			};
		};

		window.onload = function() {

			//시간 보여주기


			var display = document.querySelector('#time'), timer = new CountDownTimer(
				30000); //시간 설정, 초단위
			timer.onTick(format).onTick(restart).start(); //restart호출
			function restart() { // 시간이 끝나면 다시 시작
				if (this.expired()) {
					//# Servlet으로 블럭 생성 알림
					$.ajax({
						method : 'get'
						,url : '/restchain/majorityStart'
						,success : function(data) {
						}
					});
					setTimeout(function() {
						timer.start();
					}, 1000);
				}
			}

			function format(minutes, seconds) {
				minutes = minutes < 10 ? "0" + minutes : minutes;
				seconds = seconds < 10 ? "0" + seconds : seconds;
				display.textContent = minutes + ':' + seconds;
			}
		};
		function addBlock() {
			$.ajax({
				method:'get'
				,url : '/restchain/majorityStart'
				,success : function(data) {
					
				}
			});
			alert("addBlock 호출");
		}
	</script>

	<div class="container-fluid">
		<%@ include file="../FTBC_Common/TopMenuBar_OnlyLogo.jsp"%>
		<div class="col-sm-3 ">&nbsp;</div>
		<div class="col-sm-6 ">
			<div id="server_content">
				<div id="stop_watch">
					<label>블럭생성 중&nbsp;&nbsp;</label> <span id="time"></span> <label>&nbsp;&nbsp;minutes!</label>
				</div>
				<img src="/FTBC_Images/blockgif.gif" id="blockgif">
			</div> 
			<div align="center">
				<button id="addBlock" onclick="addBlock()">블럭 추가</button>				
			</div>
		</div>
		<div class="col-sm-3 ">&nbsp;</div>
	</div>
</body>
</html>