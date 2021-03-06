<%@page import="vo.ChainVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>FTBC 인증서</title>
<script
	src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>

<style type="text/css">
.html2canvas-container {
	width: 3000px !important;
	height: 3000px !important;
	align-content: center !important;
}

.container {
	text_align: center;
	zoom: 0.7;
}

#download_Tx {
	margin-top: -20px;
}

.tx_info {
	left: 350px;
}

#d_tx_id>span {
	font-size: 28px;
	font-weight: bold;
	color: #4c4c4c;
}

.d_tx_content {
	font-size: 25px;
	font-family: Gungsuh;
	color: #4c4c4c;
	padding-top: 25px;
}

#tx_contents {
	margin-top: 30px;
	text-align: left !important;
	left: 300px;
}

.span_list {
	display: inline-block;
	width: 185px;
}

#saveTX {
	color: white;
	font-size: 14px;
	text-align: center;
	vertical-align: middle;
	background-color: #635c9f;
	height: 40px;
	width: 144px;
	border-radius: 5px;
	border: none;
	outline: none;
	margin-left: 51%;
	margin-bottom: 20px;
}
</style>


</head>

<body>
	<script type="text/javascript">

	$(function(){
	   $("#saveTX").click(function() { 
	
	        html2canvas($("#download_Tx"), {
	
	            onrendered: function(canvas) {
	
	                canvas.toBlob(function(blob) {
	
	                    saveAs(blob, 'FTBC_transaction.png');
	                });
	            }
	        });
	    });
	});

</script>
<%
	ChainVO chainVO = (ChainVO) request.getAttribute("chainVO");
	List<String> hashList = new ArrayList<>();
	String blockHash = chainVO.getBlockHash();
	hashList.add(blockHash.substring(0, blockHash.length()/2));
	hashList.add(blockHash.substring(blockHash.length()/2));
	List<String> txList = new ArrayList<>();
	String txID = chainVO.getTx_id();
	txList.add(txID.substring(0, txID.length()/2));
	txList.add(txID.substring(txID.length()/2));
	
	String value = String.format("%,d", Integer.parseInt(chainVO.getValue()));
	
%>
	<div class="container" style="position: relative;">
		<div id="download_Tx" align="center" style="width: 1400px;">
			<img src="../FTBC_Images/Certificate.png">
			<div class="tx_info"
				style="width: auto; bottom: 480px; position: absolute; text-align: center">
				<div id="d_tx_id">
					<span style="vertical-align: top; display: inline-block;width: 185px;">거래 번호 :</span> 
					<span id="tx_id" style="display: inline-block; text-align: left;"><%=txList.get(0)%><br><%=txList.get(1)%></span>
				</div>

				<div id="tx_contents">
					<div class="d_tx_content">
						<span class="span_list">프로젝트 이름 :</span> <span
							id="tx_project_name"><%=chainVO.getPjo_longtitle()%></span>
					</div>

					<div class="d_tx_content">
						<span class="span_list">프로젝트 코드 :</span> <span
							id="tx_project_code"><%=chainVO.getProject_code()%></span>
					</div>

					<div class="d_tx_content">
						<span class="span_list">작성자&nbsp;&nbsp; 이름 :</span> <span
							id="tx_recipient_name"><%=chainVO.getCreator_name()%></span>
					</div>

					<div class="d_tx_content">
						<span class="span_list">후원자&nbsp;&nbsp; 이름 :</span> <span
							id="tx_sender_name"><%=chainVO.getDonator_name()%></span>
					</div>

					<div class="d_tx_content">
						<span class="span_list">펀딩&nbsp;&nbsp;&nbsp;&nbsp; 금액 :</span> <span
							id="tx_value"><%=value%> 원</span>
					</div>

					<div class="d_tx_content">
						<span class="span_list">펀딩상품 코드 :</span> 
						<span id="tx_gift_code"><%=chainVO.getGift_code() %></span>
					</div>

					<div class="d_tx_content">
						<span class="span_list">거래시간 정보 :</span> 
						<span id="tx_timestamp"><%=chainVO.getTimeStamp()%></span>
					</div>

					<div class="d_tx_content">
						<span class="span_list" style="vertical-align: top;">해당블록 해쉬 :</span> 
						<span id="tx_block_hash" style="display: inline-block;text-align: left;">
							<%=hashList.get(0)%><br><%=hashList.get(1) %>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<button id="saveTX">저장하기</button>
</body>
</html>