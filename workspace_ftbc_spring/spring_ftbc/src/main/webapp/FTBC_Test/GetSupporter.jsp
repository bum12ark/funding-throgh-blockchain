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
	function getSupports(){
		var proejctCode = $("#pjcodetxt").val();
		console.log("proejctCode " + proejctCode);
		 $.ajax({
	            method:'get',
	            url:'/Project/getSupports?proejctCode='+proejctCode,
	            success:function(data){
	            	console.log(data);
					$("#SupList").html(data);
	            } 
	         });
	}
</script>
<input type="button" onclick="getSupports()" value="TEST">
<input id="pjcodetxt" type="text" >
<br>
<span id="pj1">A01_1</span><br>
<span id="pj2">B04_1</span><br>
<span id="pj3">B04_2</span><br>
<span id="pj4">B04_3</span><br>
<span id="pj5">C04_1</span><br>
<span id="pj6">C04_2</span>

<div id="SupList"></div>

</body>
</html>