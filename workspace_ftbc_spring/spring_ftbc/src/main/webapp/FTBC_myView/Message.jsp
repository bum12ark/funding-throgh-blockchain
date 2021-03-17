<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FTBC</title>
<!--=============================================================================================
	메세지 페이지 
	날짜:2019-09-16
================================================================================================  -->
<link rel="stylesheet" type="text/css" href="Message.css">
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
   type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
   href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
</head>
<style type="text/css">

a.no-uline { text-decoration:none }


</style>
<body>
<script type="text/javascript">

	var Sms_code;
	var Smem_email;
	var Spjo_code;
	var Ssend;
	var Squestion;
	var Scontent;
	var Stitle;
	
	
	function Answer(ms_code,mem_email,pjo_code,send,question,content,title){
		Sms_code = ms_code;
		Smem_email = mem_email;
		Spjo_code = pjo_code;
		Ssend = send;
		Squestion = question;
		Scontent = content;
		Stitle = title;
		$("#modal-from").text(Ssend);
		$("#title").text(Stitle);
		$("#question").text(Squestion);
		$("#modal-contents").text(Scontent);
		$("#message_modal").modal();
	}
	function reAnswer(){
		$("#remodal-from").text(Ssend);
		$("#retitle").text(Ssend+"님에게 답변");
		$("#rproject_code").val(Spjo_code);
		$("#rems_code").val(Sms_code);
		$("#Smem_email").val(Smem_email);
		$("#requestion").text(Squestion);
		$("#requestion1").val(Squestion);
		$("#remodal-contents").text("");
		$("#remessage_modal").modal();
	}
	function messegeSend(){
		
		var select = $("#modal-types option:selected").text();
		 $.post("/member/messageSend", $("#remessage_form").serialize(), function(data){
			 	location.href="Message.jsp";
	 	    });
	}
	
    $(document).on('click', 'a[name="allAnTitle"]', function() {
		Sms_code = table.row($(this).parents('tr:first')).data().ms_code;
		Spjo_code = table.row($(this).parents('tr:first')).data().project_code;
		Smem_email = table.row($(this).parents('tr:first')).data().mem_email;
		Ssend = table.row($(this).parents('tr:first')).data().my_nickname;
		Squestion = table.row($(this).parents('tr:first')).data().ms_question;
		Scontent = table.row($(this).parents('tr:first')).data().ms_content;
		Stitle = table.row($(this).parents('tr:first')).data().ms_title;
  		$.ajax({
			method:'get',
			url:"/member/messageUpdate?ms_code="+Sms_code,
			success:function(data){
				Answer(Sms_code,Smem_email,Spjo_code,Ssend,Squestion,Scontent,Stitle);
			}		
		});
     });
    $(document).on('click', 'a[name="myAnTitle"]', function() {
		Sms_code = table2.row($(this).parents('tr:first')).data().ms_code;
		Spjo_code = table2.row($(this).parents('tr:first')).data().project_code;
		Smem_email = table2.row($(this).parents('tr:first')).data().mem_email;
		Ssend = table2.row($(this).parents('tr:first')).data().ms_send;
		Squestion = table2.row($(this).parents('tr:first')).data().ms_question;
		Scontent = table2.row($(this).parents('tr:first')).data().ms_content;
		Stitle = table2.row($(this).parents('tr:first')).data().ms_title;
  		$.ajax({
			method:'get',
			url:"/member/messageUpdate?ms_code="+Sms_code,
			success:function(data){
				Answer(Sms_code,Smem_email,Spjo_code,Ssend,Squestion,Scontent,Stitle);
			}		
		});
     });
  	
    var table2;
    var table;
	$(document).ready(function() {
		$("#uall_btn").css("background-color", "gainsboro");
		$("#uall_btn").css("color", "#3A6FF2");
		
		 table = $('#tb_message').DataTable({
	            ajax : {
	               "type" : "POST",
	               "url" : "/member/getMyMessage?mem_email=<%=session.getAttribute("mem_email")%>",
	               "dataType" : "JSON"
	                  },
	            columns : [
	                       {data : "ms_question", width : 50},
	                       {data : "ms_title",   width : 180,
	                           "render": function(data, type, row){
	                               if(type=='display'){
	                                   data = '<a name="allAnTitle" style="text-decoration:none;color:#000000">' + data+ '</a>';
	                               }
	                               return data;
	                           }},
	                       {data : "my_nickname", width : 50},
	                       {data : "rec_nickname", width : 50},
	                       {data : "ms_date", width : 50}, 
	                       {data : "ms_isread", width : 50,
	                    	   "render": function(data, type, row){
	                               if(type=='display'){
	                            	   if(data==1){
	                                   data = "읽음";
	                            	   }else{
	                            		data = "안읽음"   
	                            	   }
	                               }
	                               return data;
	                    	   }
	                       }, 
	                       {data : "ms_code", visible : false},
	                       {data : "mem_email", visible: false},
	                       {data : "ms_content", visible: false},
	                       {data : "project_code", visible: false}
	                       ],
	              language: {
	                  "emptyTable": "메세지가 존재하지 않습니다",
	                  "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	                  "info": "현재 _START_ - _END_ / _TOTAL_건",
	                  "infoEmpty": "메세지가 존재하지 않습니다",
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
		
		 table2 = $('#tb_PjoMessage').DataTable({
	            ajax : {
	               "type" : "POST",
	               "url" : "/member/myPjoMessage?mem_email=<%=session.getAttribute("mem_email")%>",
	               "dataType" : "JSON"
	                  },
	            columns : [
	                       {data : "ms_question", width : 50},
	                       {data : "ms_title",   width : 180,
	                           "render": function(data, type, row){
	                               if(type=='display'){
	                                   data = '<a name="myAnTitle" style="text-decoration:none;color:#000000">' + data+ '</a>';
	                               }
	                               return data;
	                           }},
	                       {data : "my_nickname", width : 50},
	                       {data : "rec_nickname", width : 50},
	                       {data : "ms_date", width : 50}, 
	                       {data : "ms_isread", width : 50,
	                    	   "render": function(data, type, row){
	                               if(type=='display'){
	                            	   if(data==1){
	                                   data = "읽음";
	                            	   }else{
	                            		data = "안읽음"   
	                            	   }
	                               }
	                               return data;
	                    	   }}, 
	                       {data : "ms_code", visible : false},
	                       {data : "mem_email", visible: false},
	                       {data : "ms_content", visible: false},
	                       {data : "project_code", visible: false}
	                       ],
	              language: {
	                  "emptyTable": "메세지가 존재하지 않습니다",
	                  "lengthMenu": "페이지당 _MENU_ 개씩 보기",
	                  "info": "현재 _START_ - _END_ / _TOTAL_건",
	                  "infoEmpty": "메세지가 존재하지 않습니다",
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
          $('#tb_message_filter').prepend('<select id="select"></select>');
          $('#tb_message > thead > tr').children().each(function (indexInArray, valueOfElement) { 
             if(indexInArray != 4) {
                 $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
             }
          });
          
          $('.dataTables_filter input').unbind().bind('keyup', function () {
              var colIndex = document.querySelector('#select').selectedIndex;
              table.column(colIndex).search(this.value).draw();
          });
          $('#tb_PjoMessage_filter').prepend('<select id="select1"></select>');
          $('#tb_PjoMessage > thead > tr').children().each(function (indexInArray, valueOfElement) { 
             if(indexInArray != 4) {
                 $('#select1').append('<option>'+valueOfElement.innerHTML+'</option>');
             }
          });
          
	});
   function hide1(){
	   $("#my_project").hide();
	   $("#ur_project").show();
   }
   function hide2(){
	   $("#ur_project").hide();
	   $("#my_project").show();
   }
</script>


<!----------------상단바------------>
<%@ include file="../FTBC_Common/FTBC_Top.jsp"%>
<hr class="FTBC_hr" >
<div class="container-fluid">
	<!--상단 배너 부분 -->
	<div class="row"  id="MessageBanner" >
		<div class="col-xs-3 banner_side"></div>
		<div class="col-xs-7">
		<div id="floater">&nbsp;</div>
		<div class="row"  id="msgBanner_top">
			<img src="../FTBC_Images/messageicondark.png" id="msg_dark">
			<span id="msg_title">메시지</span>
		</div>
		<ul class="nav nav-tabs" id="#msgBanner_tab">
			<li class="active">
			<a class="tab_menu" data-toggle="tab" href="#ur_project" onclick="hide1()">문의/후원 프로젝트</a></li>
			<li><a class="tab_menu" data-toggle="tab" href="#my_project" onclick="hide2()">만든 프로젝트</a></li>
		</ul>
		</div>
		<div class="col-xs-2 banner_side"></div>
	</div>	
		
		<div id="ur_project" class="tab-pane fade in active">
			<div class="row" style="margin-bottom: 50px;"></div>
	    	<div class="row" id="blockChain_List">
	         <div id="Block_left" class="col-sm-2">&nbsp;</div>
	         <div id="Blcok_Center" class="col-sm-8">
				<table id="tb_message" class="table table-striped table-bordered"
	               style="width: 100%;">
	               <thead>
	                  <tr>
	          			<th>문의유형</th>
						<th>제목</th>
						<th>보낸이</th>
						<th>받는이</th>
						<th>날짜</th>
						<th>읽음</th>
	                  </tr>
	               </thead>
	            </table>
			  </div>
	         <div id="Block_Right" class="col-sm-2">&nbsp;</div>
	         </div>
		</div>
		
		<div id="my_project" class="tab-pane fade">
			<div class="row" style="margin-bottom: 50px;"></div>
	    	<div class="row" id="blockChain_List">
	         <div id="Block_left" class="col-sm-2">&nbsp;</div>
	         <div id="Blcok_Center" class="col-sm-8">
				<table id="tb_PjoMessage" class="table table-striped table-bordered"
	               style="width: 100%;">
	               <thead>
	                  <tr>
	          			<th>문의유형</th>
						<th>제목</th>
						<th>보낸이</th>
						<th>받는이</th>
						<th>날짜</th>
						<th>읽음</th>
	                  </tr>
	               </thead>
	            </table>
			  </div>
	         <div id="Block_Right" class="col-sm-2">&nbsp;</div>
	         </div>
		</div>
		
</div>	
<%@include file="./MessageModal.jsp" %>	 
<%@include file="./ReAnswer.jsp" %>	 
</body>
</html>