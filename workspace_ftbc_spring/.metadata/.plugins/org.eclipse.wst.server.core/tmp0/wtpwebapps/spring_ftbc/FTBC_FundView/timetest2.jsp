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
	  var start = Date.now(),
	      that = this,
	      diff, obj;

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
	    'minutes': (seconds / 60) | 0,
	    'seconds': (seconds % 60) | 0
	  };
	};
	
	window.onload = function() {
		
		//시간 보여주기
	  var display = document.querySelector('#time'),
	      timer = new CountDownTimer(5);   //시간 설정, 초단위

	  timer.onTick(format).onTick(restart).start(); //restart호출

	  function restart() { //시간이 끝나면 다시 시작
		
	    if (this.expired()) {
	    	to_ajax();
	      setTimeout(function() { timer.start(); }, 1000);
	    }
	  }

	  function format(minutes, seconds) {
	    minutes = minutes < 10 ? "0" + minutes : minutes;
	    seconds = seconds < 10 ? "0" + seconds : seconds;
	    display.textContent = minutes + ':' + seconds;
	  }
	  function to_ajax(){
	 
	  
	    }

	  function blockTime(){
			$("#time_form").attr("method","post");
			$("#time_form").attr("action","test/blocktime.ftbc"); //지금은 없지만 로그인 아이디도 같이 넘겨야함 
			$("#time_form").submit(); 	

			console.log("전송 완료");
			
		}
	};
</script>
    <div>블럭생성 중 <span id="time"></span> minutes!</div>
    
<form name="time_form" id="time_form"  >
     <input type="text" name="block_success" size="10em" value="블럭 생성 완료">
</form>

<div id="fuck"> </div>

</body>
</html>