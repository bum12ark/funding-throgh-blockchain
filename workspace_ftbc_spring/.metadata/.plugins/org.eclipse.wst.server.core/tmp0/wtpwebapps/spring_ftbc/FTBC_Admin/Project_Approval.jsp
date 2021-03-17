<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--=============================================================================================
	관리자가 프로젝트 관리 하는 페이지
	날짜:2019-10-16
================================================================================================  -->
<%@ include file="/FTBC_Common/FTBC_Common.jsp"%>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<style type="text/css">
#Admin_banner {
	height: 150px;
	width: 110%;
	background-color: #dcd9ec;
	display: table;
}

#Admin_banner h2 {
	font-size: 50px;
	font-weight: 700;
	line-height: 120px;
	color: #453e82;
}

#Admin_Center {
	top: 50px;
}

#isApporve {
	margin: 15px 0;
}
</style>
<body>
	<script type="text/javascript">
var table;
	$(document).ready(function() {
	table = $('#Manage_Projects').DataTable({
	    	ajax:{
	    		"type":"POST",
	    		"url":"/Project/ManageProjects.ftbc",
	    		"dataType":"JSON",
	    	},
	    	 columns: [
                  { data: "pj_date",width:100 },
                  { data: "pjo_longtitle",width:400  },
                  { data: "mem_email",width:200 },
                  { data: "project_code",width:100 },
                  { data: "subcat_code",width:100 },
                  { data: "pj_stat",width:50 }
              ]

	    });
	$('.dataTable').on('click', 'tbody td', function() {
	      
        console.log('API row values : ', table.row(this).data().project_code);
        
        selected_project_code = table.row(this).data().project_code;
        
        console.log(selected_project_code);
        
        location.href = "../FTBC_DetailView/ProjectDetail.jsp?pjo_code="
              + selected_project_code;
   })	
   $('#isApporve').on('change', function() {
       if ($(this).is(':checked')) {
         $.fn.dataTable.ext.search.push(
           function(settings, data, dataIndex) {  
              console.log(data[5])
              return data[5] < 1
           }
         )
       } else {
         $.fn.dataTable.ext.search.pop()
       }
       table.draw()
     })
  });

	
</script>
	<%@ include file="/FTBC_Common/FTBC_Top.jsp"%>
	<div class="container-fluid">
		<!-- 상단 부분  -->
		<div class="row" id="Admin_banner">
			<div class="col-xs-2">&nbsp;</div>
			<div class="col-xs-3">
				<h2>프로젝트 관리</h2>
			</div>
			<div class="col-xs-3"></div>
			<div class="col-xs-3">&nbsp;</div>
		</div>

		<!--내용 부분  -->
		<div id="admin_content">
			<div class="col-sm-2">&nbsp;</div>
			<div id="Admin_Center" class="col-sm-8">
				<label> <input type="checkbox" id="isApporve"> 미승인
					프로젝트
				</label>
				<table id="Manage_Projects"
					class="table table-striped table-bordered" style="width: 100%">
					<thead>
						<tr>
							<th>작성일</th>
							<th>프로젝트 이름</th>
							<th>작성자</th>
							<th>프로젝트 코드</th>
							<th>서브 코드</th>
							<th>상태</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="col-sm-2">&nbsp;</div>
		</div>
	</div>
</body>
</html>