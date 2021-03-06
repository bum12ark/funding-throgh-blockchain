<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="./myProject_table.css?121">
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<body>
<script type="text/javascript">
var table;
var tx_id;
var pj_code;
var pj_title;
$(document).ready(function() {
	table = $('#tb_project').DataTable({
		ajax : {
			"type" : "POST",
			"url" : '/Project/getProjectTable?mem_email=<%=session.getAttribute("mem_email")%>',
			"dataType" : "JSON"
				},
		columns : [
			  		{data : "pjo_longtitle", width : 300},
			  		{data : "fd_deadLine",	width : 200},
			  		{data : "fundedMoney", width : 200},
			  		{data : "fd_targetMoney", width : 200},
			  		{data : "", width : 80}, 
					{data : "project_code", visible : false},
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
    $('#tb_project_filter').prepend('<select id="select"></select>');
    $('#tb_project > thead > tr').children().each(function (indexInArray, valueOfElement) { 
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
	pj_code = table.row($(this).parents('tr:first')).data().project_code;
	pj_title = table.row($(this).parents('tr:first')).data().pjo_longtitle;
	location.href="myProject_option.jsp?project_code="+pj_code+"&pj_title="+pj_title;
});

</script>


	
	<%@ include file="/FTBC_Common/FTBC_Top.jsp"%>
	<div class="container-fluid">
		<!--  상단 부분  -->
	 	<div class="row" id="project_top">
		      <div class="row" id="project_pfd">
		         <img src="<%=session.getAttribute("mem_pfimg") %>" id="Project_pfimg" width=150px>
		         <h3><span id="my_mem_name"><%=session.getAttribute("mem_nickname") %></span>님이 만든 프로젝트 </h3>
		      </div>
   		</div>
		<div class="row" id="project_List">
			<div id="project_left" class="col-sm-2">&nbsp;</div>
			<div id="project_Center" class="col-sm-8">
				<h2>내가 만든 프로젝트</h2>
				<table id="tb_project" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>프로젝트 제목</th>
							<th>마감일</th>
							<th>모인금액</th>
							<th>목표금액</th>
							<th>세부내용</th>
						</tr>
					</thead>
				</table>
			</div>
			<div id="project_Right" class="col-sm-2">&nbsp;</div>
		</div>
	</div>
	
	
</body>
</html>