<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pj_title = null;
	if(request.getParameter("pj_title") !=null){
		pj_title = request.getParameter("pj_title").toString();
		
	}
		
%>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="./myProject_option.css">
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<body>
<script type="text/javascript">
var table;
var tx_id;
$(document).ready(function() {
	table = $('#tb_project_option').DataTable({
		ajax : {
			"type" : "POST",
			"url" : '/Project/getmyProjectOption?project_code=<%=request.getParameter("project_code")%>',
			"dataType" : "JSON"
				},
		columns : [
			  		{data : "mem_nickname",	width : 100},
			  		{data : "fundedvalue", width : 100},
			  		{data : "pj_date", width : 250},
			  		{data : "mem_zipcode", width : 100},
			  		{data : "mem_addr", width : 250},
			  		{data : "", width : 80}, 
					{data : "gift_code", visible : false},
			  		{data : "mem_email", visible: false},
			  		{data : "txId", visible: false},
			  		],
		columnDefs : [ {
						"targets" : [ 5 ],
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
    $('#project_option_filter').prepend('<select id="select"></select>');
    $('#project_option > thead > tr').children().each(function (indexInArray, valueOfElement) { 
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
	var txId = table.row($(this).parents('tr:first')).data().txId;
	$("#modal_title").text(table.row($(this).parents('tr:first')).data().mem_nickname+"님의 선물 세부사항");
	$.ajax({
		method:'get',
		url:"/Project/getmypjogiftOption?project_code=<%=request.getParameter("project_code")%>&txId="+txId,
		success:function(data){
			$("#my_modal_body").html(data);
			$("#myModal").modal();
		} 
	});
	
});

</script>


	
	<%@ include file="/FTBC_Common/FTBC_Top.jsp"%>
	<div class="container-fluid">
		<!--  상단 부분  -->
	 	<div class="row" id="project_top">
		      <div class="row" id="project_pfd">
		         <img src="<%=session.getAttribute("mem_pfimg") %>" id="Project_pfimg" width=150px>
		         <h3><span id="my_mem_name"><%=pj_title %></span>의 후원내용 </h3>
		      </div>
   		</div>
		<div class="row" id="project_option">
			<div id="project_option_left" class="col-sm-2">&nbsp;</div>
			<div id="project_option_Center" class="col-sm-8">
				<h2><%=pj_title %></h2>
				<table id="tb_project_option" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>후원자</th>
							<th>후원금액</th>
							<th>후원날짜</th>
							<th>우편번호</th>
							<th>주소</th>
							<th>세부내용</th>
						</tr>
					</thead>
				</table>
			</div>
			<div id="project_Right" class="col-sm-2">&nbsp;</div>
		</div>
	</div>
		<!-- ==============Modal================= -->
	<div class="modal fade" id="myModal" role="dialog" >
		<div class="modal-dialog modal-sm" style="width: 500px;">
			<div class="modal-content">
				<div class="modal-header" style="background: #DCD9EC;text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="modal_title" style="font-weight: bold;">세부 옵션</h4>
				</div>
				<div class="modal-body" id="my_modal_body" style="padding-left: 40px;">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						>확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>