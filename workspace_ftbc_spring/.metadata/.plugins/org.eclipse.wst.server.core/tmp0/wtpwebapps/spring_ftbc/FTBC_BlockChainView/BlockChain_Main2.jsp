<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/FTBC_BlockChainView/BlockChain_Main.css?123">
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<body>
	<script type="text/javascript">
		var table;
		var tx_id;
		var pj_publicKey;
		var mem_publicKey;
		$(document).ready(function() {
			table = $('#tb_blockChain').DataTable({
				ajax : {
					"type" : "POST",
					"url" : "/chain/getBlockChainInfo",
					"dataType" : "JSON"
						},
				columns : [
					  		{data : "pjo_longtitle", width : 300},
					  		{data : "creator_name",	width : 200},
					  		{data : "donator_name", width : 200},
					  		{data : "timeStamp", width : 200},
					  		{data : "", width : 80}, 
							{data : "tx_id", visible : false},
					  		{data : "pj_publicKey", visible: false},
					  		{data : "mem_publicKey", visible: false}
					  		],
				columnDefs : [ {
								"targets" : [ 4 ],
								"orderable" : false,
								"searchable" : false,
								"className" : "center",
								"render" : function(data, type, row) {
									var html = '<button type="button" class="btn btn-info btn-xs" name="detailBtn" style="width:63px">보기</button>';
									return html;
									}
								}],
		        language: {
		            "emptyTable": "데이터가 없어요.",
		            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
		            "info": "현재 _START_ - _END_ / _TOTAL_건",
		            "infoEmpty": "데이터 없음",
		            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		            "search": "&nbsp;&nbsp;&nbsp;검색 : ",
		            "zeroRecords": "일치하는 데이터가 없어요.",
		            "loadingRecords": "로딩중...",
		            "processing":     "잠시만 기다려 주세요...",
		            "paginate": {
		                "next": "다음",
		                "previous": "이전"
		            }
		        }
			});
		    /* Column별 검색기능 추가 */
		    $('#tb_blockChain_filter').prepend('<select id="select"></select>');
		    $('#tb_blockChain > thead > tr').children().each(function (indexInArray, valueOfElement) { 
		    	if(indexInArray != 4) {
			        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
		    	}
		    });
		    
		    $('.dataTables_filter input').unbind().bind('keyup', function () {
		        var colIndex = document.querySelector('#select').selectedIndex;
		        table.column(colIndex).search(this.value).draw();
		    });
		});
		/////// document.ready
		$(document).on('click', 'button[name="detailBtn"]', function() {
			tx_id = table.row($(this).parents('tr:first')).data().tx_id;
			pj_publicKey = table.row($(this).parents('tr:first')).data().pj_publicKey;
			mem_publicKey = table.row($(this).parents('tr:first')).data().mem_publicKey;
			// 모달 초기화
			$("input[name=password]").val('');
			$("input[name=writer]").prop('checked', false);
			$("#myModal").modal();
		});
		

		function confirmClick() {
			if($("#donator").is(":checked")) {
				id = mem_publicKey;
				writer = 'donator';
			} else if($("#creator").is(":checked")){
				id = pj_publicKey;
				writer = 'creator';
			} else {
				id = null;
			}
        	// 쿼리스트링으로 전송 시 '+' 기호를 예약어로써 지워버리는 문제를 해결하기 위한 코드
        	if(id != null) id = id.replace(/\+/g,"%2B");
        	var password = $("input[name=password]").val();
			var isFullWritting = false;
			if(id == null || password == "") {
				alert("모든 항목을 작성해주세요.");
			} else {
				$.ajax({
					method:'GET',
					url:'/restchain/isAuthorized?writer='+writer+'&password='+password+'&id='+id,
					success:function(data){
						console.log("ajax_data : "+data);
						if(data == "비밀번호가 일치하지 않습니다.") {
							alert(data);
						} else {
							location.href = "/chain/getDetailChainInfo?tx_id="+tx_id;
						}
					}
				});
			}
		}
	</script>
	<%@ include file="/FTBC_Common/FTBC_Top.jsp"%>
	<div class="container-fluid">
		<!--  상단 부분  -->
		<div class="row" id="BlockChain_banner">
			<div class="col-xs-3">&nbsp;</div>
			<div class="col-xs-3">
				<h2>
					블록 체인<img src="/FTBC_Images/blockchainicon.png">
				</h2>
			</div>
			<div class="col-xs-3"></div>
			<div class="col-xs-3">&nbsp;</div>
		</div>
		<div class="row" id="blockChain_List">
			<div id="Block_left" class="col-sm-2">&nbsp;</div>
			<div id="Blcok_Center" class="col-sm-8">
				<h2>최신 블록</h2>
				<table id="tb_blockChain" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>프로젝트 제목</th>
							<th>프로젝트 작성자</th>
							<th>후원자</th>
							<th>후원날짜</th>
							<th>인증서</th>
							<th>트랜잭션아이디</th>
							<th>작성자 공개키</th>
							<th>후원자 공개키</th>
						</tr>
					</thead>
				</table>
			</div>
			<div id="Block_Right" class="col-sm-2">&nbsp;</div>
		</div>
	</div>
	<!-- ==============Modal================= -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">본인 확인창</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" name="rownum"> <label
						class="radio-inline"><input type="radio" id="creator"
						name="writer" value="작성자" />&nbsp;작성자</label> &nbsp;&nbsp;&nbsp; <label
						class="radio-inline"><input type="radio" id="donator"
						name="writer" value="후원자" />&nbsp;후원자</label> <br> <br>
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-lock"></i></span> <input id="password"
							type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						onclick="confirmClick()">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ==============Modal================= -->
</body>
</html>