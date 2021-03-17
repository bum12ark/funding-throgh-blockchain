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
	$(function(){
	    //이벤트 리스너 등록.
	    document.getElementById('file1').addEventListener('change', readFile1, false);
	 
	});
	 
	function readFile1(e) { 
	    var file = e.target.files[0];
	 
	    if (!file) {
	           return;
	    }
	    var reader = new FileReader();
	    reader.onload = function(e) {
	    	
	        fileData = e.target.result;
	        //file데이터를 읽어서 처리할 로직.
	     	console.log("fileData " + fileData);
	        $("#testarea").text(fileData);
	    };
	    reader.readAsText(file, 'euc-kr');
	}



</script>


<input id="file1" class="ml8" type="file"/>
<textarea id="testarea" placeholder="지갑에 있는 개인키를 복사 붙여넣기 해주세요" rows="8"
								style="width: 100%;"></textarea>

</body>
</html>