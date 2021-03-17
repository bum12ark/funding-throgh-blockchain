<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function formTest() {
			console.log("function=>formTest 호출");
			var obj = document.getElementById("div_t");
			var newForm = document.createElement("form");
			newForm.setAttribute("id", "fuckForm");
			var input = document.createElement("input");
			input.setAttribute("type", "text");
			input.setAttribute("value", "허허시발");
			newForm.appendChild(input);
			obj.appendChild(newForm);
		}
	</script>
	<div id="div_t">
		<button onclick="formTest()" value="시바알">시발버튼</button>
		<input type="text" value="인풋1">
		<input type="text" value="인풋2">
	</div>
</body>
</html>