<%@page import="vo.ProjectVO"%>
<%@page import="vo.GiftVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String pjo_code = null;
	if (request.getParameter("pjo_code") != null) {
		pjo_code = request.getParameter("pjo_code").toString();
	}

	ProjectVO pVO = null;
	if (request.getAttribute("FundingDetail") != null) {
		pVO = (ProjectVO) request.getAttribute("FundingDetail");
	}
	String mem_email = null;
	if (session.getAttribute("mem_email") != null) {
		mem_email = session.getAttribute("mem_email").toString();
	}
	List<Object> rVO = null;
	List<String> gift_code = null;
	List<GiftVO> gop_option = null;
	String payDate = null;
	String giftcode = null;
	int num = 0;
	if (request.getAttribute("FundingGiftDetail") != null) {
		rVO = (List<Object>) request.getAttribute("FundingGiftDetail");
		gift_code = (List<String>) rVO.get(0);
		gop_option = (List<GiftVO>) rVO.get(1);
		payDate = pVO.getFd_deadLine().replaceFirst("-", "년 ");
		payDate = payDate.replaceFirst("-", "월 ");
		payDate = payDate.concat("일"); 
		rVO.get(num);
	}
	String project_code = pVO.getProject_code();
	int project_code_length = project_code.length();
	project_code = project_code.substring(0,project_code_length-1);
	%>
<!-- 10-23 정원형 funding_project페이지에 선물상세옵션 추가 -->
<%
	List<GiftVO> sList =null;
	if(request.getAttribute("sortationSelect")!=null){
		sList =(List<GiftVO>)request.getAttribute("sortationSelect");
	}
	
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>FTBC</title>
<!--=============================================================================================
	펀딩 페이지
	얼마짜리 펀딩할건지 선택 하는 페이지
	날짜:2019-09-20
================================================================================================  -->
<%@ include file="../FTBC_Common/FTBC_Common.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../FTBC_FundView/Fund_Project.css?8">
</head>
<body>
	<script type="text/javascript">
		function optionSelect(gop_code,num,value){
			if($("#gop_code-"+gop_code+"-"+num).length==1){
				$("#gop_code-"+gop_code+"-"+num).val(value);
			}
		}
	      function pay(id,gift_num,num) {//id는 input의 아이디, gift_num은 몇번째 선물인지, num은 순번 구분자, value=??
	          var selectOptionList = new Array();
	         var selectCount = 0;
	         for(var i=1;i<10;i++){
	            for(var j=1;j<10;j++){
	               if($("#optionSelect"+gift_num+"_"+i+j).length==1){
	                  selectOptionList[selectCount] = $("#optionSelect"+gift_num+"_"+i+j+" option:selected").val();
	                  selectCount++;
	               }
	            }
	         }
	         var selCheck = false;
	         for(var i=0;i<selectOptionList.length;i++){
	            if(!(selectOptionList[i]=="선물선택")){
	               selCheck = true;
	            }else{
	               selCheck = false;
	               break;
	            }
	         }
	         if(selectOptionList.length==0){
	        	 selCheck= true;
	         }
	         var jugwanOptionList = new Array();
	         var jugwanCount = 0;
	         for(var i=1;i<10;i++){
	            for(var j=1;j<10;j++){
	               if($("#gop_code-"+gift_num+"_"+i+"-"+j).length==1){
	                  jugwanOptionList[jugwanCount] = $("#gop_code-"+gift_num+"_"+i+"-"+j).val();
	                  jugwanCount++;
	               }
	            }
	         }
	         var juCheck = false;
	         for(var i=0;i<jugwanOptionList.length;i++){
	            if(!(jugwanOptionList[i]=="")){
	               juCheck=true;
	            }else{
	               juCheck=false;
	               break;
	            }
	         }	         
	         if(jugwanOptionList.length==0){
	        	 juCheck= true;
	         }
	          if(selCheck&&juCheck){
	            var p_form = $("#giftOption"+num);
	            /// 인풋태그 만들기
	            var inputDonation = document.createElement("input");
	            inputDonation.setAttribute("type", "hidden");
	            inputDonation.setAttribute("id", "donation");
	            inputDonation.setAttribute("name", "donation");
	            inputDonation.setAttribute("value", "donation");
	            var inputGiftCode = document.createElement("input");
	            inputGiftCode.setAttribute("type", "hidden");
	            inputGiftCode.setAttribute("id", "gift_code");
	            inputGiftCode.setAttribute("name", "gift_code");
	            inputDonation.setAttribute("value", "gift_code");
	            var inputPjoCode = document.createElement("input");
	            inputPjoCode.setAttribute("type", "hidden");
	            inputPjoCode.setAttribute("id", "pjo_code");
	            inputPjoCode.setAttribute("name", "pjo_code");
	            inputDonation.setAttribute("value", "pjo_code");
	            /// 인풋 태그 폼태그 안에 자식 태그로 넣어주기
	            p_form.prepend(inputDonation);         
	            p_form.prepend(inputGiftCode);         
	            p_form.prepend(inputPjoCode);         
	            /// 인풋태그 세팅하기
	            var fundval = Number($("#reward_val").text().replace(/,/gi, ""));
	            $("#donation").val($("#"+id).val());
	            var fundtext = String($("#reward_notice"+num).text()).replace(/(\s*)/g,"");
	            $("#pjo_code").val('<%=pVO.getProject_code()%>');
	            // 기프트 코드, 
	            if(fundtext=="더많이입력하실수있습니다"){
	               if(gift_num==0){
	                   $("#gift_code").val(0);
	                  $("#giftOption"+num).attr("method","post");
	                  $("#giftOption"+num).attr("action","/Funding/payFund");
	                  $("#giftOption"+num).submit(); 
	               }else{
	                  $("#gift_code").val(gift_num);
	                  $("#giftOption"+num).attr("method","post");
	                  $("#giftOption"+num).attr("action","/Funding/payFund");
	                  $("#giftOption"+num).submit(); 
	               }
	            }
	            else if(fundtext=="최소" + fundval + "원이상입력해주세요"){
	               alert("최소 후원금액보다 적은 금액은 불가능합니다.");
	            }
	      }else if(selCheck!=true){
	         alert("모든 옵션을 선택해주세요.");
	      }else if(juCheck!=true){
	         alert("모든 입력항목을 입력해주세요.");
	      }
	   }
		
		function fundThis(id) {
			$(".Fund_Panel").show();
			$("#" + id).hide();
			$(".Fund_Panel_Reward").hide();
			$("#" + id + "_reward").show();
		}

		/*숫자키 누르고 다른거 눌러야 적용됨.  */
	     function valueCheck(value, num, obj) {
	         obj.value = comma(uncomma(obj.value));
			var fundval = Number($("#reward_val" + num).text().replace(",", "")); //리워드 가격
			var pvalue = Number(value.replace(",", ""));
			if (fundval > pvalue) { //입력한 값이 리워드 가격보다  작을경우
				$("#reward_notice" + num).text("최소 " + fundval + "원 이상 입력해주세요");
				$("#reward_notice" + num).css("color", "#FF0000");
			} else {
				$("#reward_notice" + num).text("더 많이 입력하실 수 있습니다");
				$("#reward_notice" + num).css("color", "#4B82F0");
			}
		}
		
	      function comma(str) {
	          str = String(str);
	          return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	      }
	      
	      function uncomma(str) {
	          str = String(str);
	          return str.replace(/[^\d]+/g, '');
	      }
		
		function valStop() {
			event.stopPropagation();
		}

		$(document).ready(function() {
			$(".Fund_Panel_Reward").hide();
		});

	</script>
	<div id="Fund_ajax">
		<div id="FundTop_bar">
			<span id="Fund_title"><%=pVO.getPjo_longtitle()%></span>
		</div>
		<div class="container-fluid">

			<!--================================================================================================================
	 												[  	  내용	]
	 ================================================================================================================-->
			<%
				int giftnum = 0;
			%>
			<!--------------- 0번  상품----------------->
			<div class="row Fund_Panel" id="fund_default<%=giftnum%>"
				onclick="fundThis(id)">
				<div class="Fund_Header">
					<span id="reward_val<%=giftnum%>">1,000</span><span>원 이상
						밀어주시는 분께</span>
				</div>
				<div class="Fund_Body">
					<span>선물을 선택하지 않고, 밀어만 줍니다</span>
				</div>
			</div>

			<!--------------- 0번  상품 리워드----------------->
			<div class="row Fund_Panel_Reward"
				id="fund_default<%=giftnum%>_reward">
				<form id="giftOption0">
					<div class="Fund_Header">
						<input type="text" class="fund_valbox" value="1,000"
							id="gift_reward<%=giftnum %>"
							onkeyup="valueCheck(value,'<%=giftnum%>',this)" onclick="valStop()"><span>원</span>
						<a
							onclick="javascript:pay('gift_reward<%=giftnum %>','<%=giftnum%>','<%=giftnum%>')">
							<img src="../FTBC_Images/fundbtn.png">
						</a>
					</div>
					<div class="Fund_Body">
						<span class="reward_notice" id="reward_notice<%=giftnum%>">더
							많이 입력하실 수 있습니다</span> <br> <span>선물을 선택하지 않고, 밀어만 줍니다</span>
					</div>
				</form>
			</div>
			<%
				for (int i = 0; i < gift_code.size(); i++) {
					giftnum++;
					GiftVO gVO = null;
					for (int k = 0; k < gop_option.size(); k++) {
						if (gift_code.get(i).equals(gop_option.get(k).getGIFT_CODE())) {
							gVO = gop_option.get(k);
							break;
						}
					}
					 if (gVO.GIFT_LIMITED != null) {
                  	  if( (Integer.parseInt(gVO.GIFT_LIMITED.toString())) - gVO.getSupport_num()>0 ) {
                  	  
			%>

			<!--------------- 한정 수량인데 아직 수량이 남았을 경우----------------->
			<div class="row Fund_Panel" id="fund_default<%=giftnum%>"
				onclick="fundThis(id)">
				<div class="Fund_Header">
					<span id="reward_val<%=giftnum%>"><%=gVO.getGIFT_UNITMONEY()%></span><span>원
						이상 밀어주시는 분께</span>
				</div>
				<div class="Fund_Body">
					<%
					String gift_explanation = "";
					if(gVO.getGIFT_EXPLANATION() ==null) {
						gift_explanation = "";
					} else {
						gift_explanation = gVO.getGIFT_EXPLANATION();
					}
					%>
					<span><%=gift_explanation%></span>
					<ul>
						<%
							for (int j = 0; j < gop_option.size(); j++) {
									if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
										GiftVO kVO = gop_option.get(j);
						%>
						<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
						<input type="hidden" id="quantity-<%=kVO.getGOP_CODE()%>" name="quantity-<%=kVO.getGOP_CODE()%>" value="<%=kVO.getGOP_AMMOUNT() %>">
						<input type="hidden" id="gop_option-<%=kVO.getGOP_CODE()%>" name="gop_option-<%=kVO.getGOP_CODE()%>" value="<%=kVO.getGOP_OPTION() %>">
						<%int cnt = 0;
								for(int k=0;k<sList.size();k++){ 
								if(sList.get(k).getGOP_CODE().equals(kVO.getGOP_CODE())){
									if(sList.get(k).getGOD_SORTATION()==0){}
									else if(sList.get(k).getGOD_SORTATION()==1){
										
										if(cnt==0){
											for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
						<select class="optionSelect"
							onchange="optionSelect<%=r %>(this.value)">
							<option selected="selected" value="선물선택">선물선택</option>
							<%for(int h=0;h<sList.size();h++){
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												%>
							<option value="<%=sList.get(h).getGOD_DESCRIPTION() %>"><%=sList.get(h).getGOD_DESCRIPTION() %></option>
							<%
											}
										} %>
						</select>
						<input type="hidden" id="selectedOption<%=r %>"
							name="selectedOption<%=r %>"
							value="<%=sList.get(0).getGOD_DESCRIPTION() %>">
						<br>
						<%  } cnt++;}
									}else if(sList.get(k).getGOD_SORTATION()==2){
										for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
						<input type="text" class="optionJugwan"
							placeholder="<%=sList.get(k).getGOD_DESCRIPTION() %>">
						<br>
						<% 	
										}
									}
								}
							%>
						<% 
						}
							}
								}
						%>
					</ul>
				</div>
				<div class="Fund_Footer">
					<span class="Footer_num"><%=gVO.getSupport_num()%></span><span>명이
						선택하였습니다</span> <br> <span>예상 전달일:<%=gVO.getGIFT_DELIVERYDATE()%></span>
				</div>
			</div>

			<!--------------- 한정 수량인데 아직 수량이 남았을 경우 리워드----------------->
			<div class="row Fund_Panel_Reward"
				id="fund_default<%=giftnum%>_reward">
				<!-- #화면폼 -->
				<form id="giftOption<%=i+1 %>" name="giftOption<%=i+1 %>">
					<div class="Fund_Header">
						<input type="text" class="fund_valbox"
							id="gift_reward<%=giftnum %>"
							value="<%=gVO.getGIFT_UNITMONEY()%>"
							onkeyup="valueCheck(value,'<%=giftnum%>',this)" onchange="valStop()"><span>원</span>
						<a
							onclick="javascript:pay('gift_reward<%=giftnum %>','<%=gVO.getGIFT_CODE()%>','<%=giftnum %>')">
							<img src="../FTBC_Images/fundbtn.png">
						</a>
					</div>
					<div class="Fund_Body">
						<span class="reward_notice" id="reward_notice<%=giftnum%>">더
							많이 입력하실 수 있습니다</span> <br> <span><%=gVO.getGIFT_EXPLANATION()%></span>
						<ul>
							<%  
									int jugwanCount =1;
						for (int j = 0; j < gop_option.size(); j++) {
									if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
										GiftVO kVO = gop_option.get(j);
						%>
							<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
							<% int cnt = 0;
								for(int k=0;k<sList.size();k++){ 
								if(sList.get(k).getGOP_CODE().equals(kVO.getGOP_CODE())){
									
									if(sList.get(k).getGOD_SORTATION()==0){}
									else if(sList.get(k).getGOD_SORTATION()==1){
										
										if(cnt==0){
											for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
							<select class="optionSelect" id="optionSelect<%=kVO.getGOP_CODE() %><%=r+1 %>"
								onchange="optionSelect('<%=kVO.getGOP_CODE()%>','<%=r+1 %>',this.value)">
								<option selected="selected" value="선물선택">선물선택</option>
								<%for(int h=0;h<sList.size();h++){
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												%>
								<option value="<%=sList.get(h).getGOD_DESCRIPTION() %>"><%=sList.get(h).getGOD_DESCRIPTION() %></option>
								<%
											}
										} %>
							</select>
							<%
										int cnt1 = 0;
										int cnt2 = 0;
										for(int h=0;h<sList.size();h++) {
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												if(cnt1==0){
													cnt2 = h;
													cnt1++;
												}
										%>
							<%		
											}
										}
										 %>
							<input type="hidden"
								id="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								name="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								value="<%=sList.get(cnt2).getGOD_DESCRIPTION() %>">
							<br>
							<%  } cnt++;}
									}else if(sList.get(k).getGOD_SORTATION()==2){
										for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
							<input type="text"
								id="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								name="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								class="optionJugwan"
								placeholder="<%=sList.get(k).getGOD_DESCRIPTION() %>">
							<br>
							<% 	
										}
										jugwanCount++;
									}
								}
								
							%>
							<% 
						
						}
							}
								}
						%>
						</ul>
					</div>
					<div class="Fund_Footer">
						<span class="Footer_num"><%=gVO.getSupport_num()%></span><span>명이
							선택하였습니다</span> <br> <span>예상 전달일:<%=gVO.getGIFT_DELIVERYDATE() %></span>
					</div>
				</form>
			</div>
			<%}else{
				%>
			<!---------------------------------------- 한정수량인데 선착순 마감됐을경우.------------------------------>
			<div class="row Fund_Panel_magam" id="fund_default<%=giftnum%>">
				<div class="Fund_Header" style="opacity: 0.4;">
					<span id="reward_val<%=giftnum%>"><%=gVO.getGIFT_UNITMONEY()%></span><span>원
						이상 밀어주시는 분께</span>
				</div>
				<div class="Fund_Body" style="opacity: 0.4;">
					<%
					String gift_explanation = "";
					if(gVO.getGIFT_EXPLANATION() ==null) {
						gift_explanation = "";
					} else {
						gift_explanation = gVO.getGIFT_EXPLANATION();
					}
					%>
					<span><%=gift_explanation%></span>
					<ul>
						<%
							for (int j = 0; j < gop_option.size(); j++) {
									if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
										GiftVO kVO = gop_option.get(j);
						%>
						<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
						<%int cnt = 0;
								for(int k=0;k<sList.size();k++){ 
								if(sList.get(k).getGOP_CODE().equals(kVO.getGOP_CODE())){
									if(sList.get(k).getGOD_SORTATION()==0){}
									else if(sList.get(k).getGOD_SORTATION()==1){
										
										if(cnt==0){
											for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
						<select class="optionSelect"
							onchange="optionSelect<%=r %>(this.value)">
							<option selected="selected" value="선물선택">선물선택</option>
							<%for(int h=0;h<sList.size();h++){
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												%>
							<option value="<%=sList.get(h).getGOD_DESCRIPTION() %>"><%=sList.get(h).getGOD_DESCRIPTION() %></option>
							<%
											}
										} %>
						</select>
						<%
										int cnt1 = 0;
										int cnt2 = 0;
										for(int h=0;h<sList.size();h++) {
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												if(cnt1==0){
													cnt2 = h;
													cnt1++;
												}
										%>
						<input type="hidden" id="selectedOption<%=r %>"
							name="selectedOption<%=r %>"
							value="<%=sList.get(cnt2).getGOD_DESCRIPTION() %>">
						<%		
											}
										}
										 %>
						<br>
						<%  } cnt++;}
									}else if(sList.get(k).getGOD_SORTATION()==2){
										for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
						<input type="text" class="optionJugwan"
							placeholder="<%=sList.get(k).getGOD_DESCRIPTION() %>">
						<br>
						<% 	
										}
									}
								}
							%>
						<% 
						}
							}
								}
						%>
					</ul>
				</div>
				<div class="Fund_Footer">
					<span class="Footer_num" style="opacity: 0.4;"><%=gVO.getSupport_num()%></span><span
						style="opacity: 0.4;">명이 선택하였습니다</span> <br> <span
						style="opacity: 0.4;">예상 전달일:<%=gVO.getGIFT_DELIVERYDATE()%></span><span
						style="color: red;"><b>&nbsp;&nbsp;&nbsp;선착순 마감 됨!</b></span>
				</div>
			</div>
			<%
			}
                  	  }else{
                  		  %>

			<!---------------한정 수량이 아닐 경우----------------->
			<div class="row Fund_Panel" id="fund_default<%=giftnum%>"
				onclick="fundThis(id)">
				<div class="Fund_Header">
					<span id="reward_val<%=giftnum%>"><%=gVO.getGIFT_UNITMONEY()%></span><span>원
						이상 밀어주시는 분께</span>
				</div>
				<div class="Fund_Body">
					<%
					String gift_explanation = "";
					if(gVO.getGIFT_EXPLANATION() ==null) {
						gift_explanation = "";
					} else {
						gift_explanation = gVO.getGIFT_EXPLANATION();
					}
					%>
					<span><%=gift_explanation%></span>
					<ul>
						<%
							for (int j = 0; j < gop_option.size(); j++) {
									if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
										GiftVO kVO = gop_option.get(j);
						%>
						<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
						<%int cnt = 0;
								for(int k=0;k<sList.size();k++){ 
								if(sList.get(k).getGOP_CODE().equals(kVO.getGOP_CODE())){
									if(sList.get(k).getGOD_SORTATION()==0){}
									else if(sList.get(k).getGOD_SORTATION()==1){
										
										if(cnt==0){
											for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
						<select class="optionSelect"
							onchange="optionSelect<%=r %>(this.value)">
							<option selected="selected" value="선물선택">선물선택</option>
							<%for(int h=0;h<sList.size();h++){
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												%>
							<option value="<%=sList.get(h).getGOD_DESCRIPTION() %>"><%=sList.get(h).getGOD_DESCRIPTION() %></option>
							<%
											}
										} %>
						</select>
						<%
										int cnt1 = 0;
										int cnt2 = 0;
										for(int h=0;h<sList.size();h++) {
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												if(cnt1==0){
													cnt2 = h;
													cnt1++;
												}
										%>
						<input type="hidden"
							value="<%=sList.get(cnt2).getGOD_DESCRIPTION() %>">
						<%		
											}
										}
										 %>
						<br>
						<%  } cnt++;}
									}else if(sList.get(k).getGOD_SORTATION()==2){
										for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
						<input type="text" class="optionJugwan"
							placeholder="<%=sList.get(k).getGOD_DESCRIPTION() %>">
						<br>
						<% 	
										}
									}
								}
							%>
						<% 
						}
							}
								}
						%>
					</ul>
				</div>
				<div class="Fund_Footer">
					<span class="Footer_num"><%=gVO.getSupport_num()%></span><span>명이
						선택하였습니다</span> <br> <span>예상 전달일:<%=gVO.getGIFT_DELIVERYDATE()%></span>
				</div>
			</div>
			<!--------------- 한정 수량이 아닐 경우 리워드----------------->
			<div class="row Fund_Panel_Reward"
				id="fund_default<%=giftnum%>_reward">
				<!-- #화면폼 -->
				<form id="giftOption<%=i+1 %>" name="giftOption<%=i+1 %>">
					<div class="Fund_Header">
						<input type="text" class="fund_valbox"
							id="gift_reward<%=giftnum %>"
							value="<%=gVO.getGIFT_UNITMONEY()%>"
							onkeyup="valueCheck(value,'<%=giftnum%>',this)" onchange="valStop()"><span>원</span>
						<a
							onclick="javascript:pay('gift_reward<%=giftnum %>','<%=gVO.getGIFT_CODE()%>','<%=giftnum %>')"><img
							src="../FTBC_Images/fundbtn.png"></a>
					</div>
					<div class="Fund_Body">
						<span class="reward_notice" id="reward_notice<%=giftnum%>">더
							많이 입력하실 수 있습니다</span> <br> <span><%=gVO.getGIFT_EXPLANATION()%></span>
						<ul>
							<%  
							int jugwanCount =1;
						for (int j = 0; j < gop_option.size(); j++) {
									if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
										GiftVO kVO = gop_option.get(j);
						%>
							<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
							<input type="hidden" id="quantity-<%=kVO.getGOP_CODE()%>" name="quantity-<%=kVO.getGOP_CODE()%>" value="<%=kVO.getGOP_AMMOUNT() %>">
							<input type="hidden" id="gop_option-<%=kVO.getGOP_CODE()%>" name="gop_option-<%=kVO.getGOP_CODE()%>" value="<%=kVO.getGOP_OPTION() %>">
							<%int cnt = 0;
								for(int k=0;k<sList.size();k++){ 
								if(sList.get(k).getGOP_CODE().equals(kVO.getGOP_CODE())){
									
									if(sList.get(k).getGOD_SORTATION()==0){}
									
									else if(sList.get(k).getGOD_SORTATION()==1){
										
										if(cnt==0){
											for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
							<select class="optionSelect" id="optionSelect<%=kVO.getGOP_CODE() %><%=r+1 %>"
								onchange="optionSelect('<%=kVO.getGOP_CODE()%>','<%=r+1 %>',this.value)">
								<option selected="selected" value="선물선택">선물선택</option>
								<%for(int h=0;h<sList.size();h++){
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												%>
								<option value="<%=sList.get(h).getGOD_DESCRIPTION() %>"><%=sList.get(h).getGOD_DESCRIPTION() %></option>
								<%
											}
										} %>
							</select>
							<%
										int cnt1 = 0;
										int cnt2 = 0;
										for(int h=0;h<sList.size();h++) {
											if(sList.get(h).getGOP_CODE().equals(kVO.getGOP_CODE())&&sList.get(h).getGOD_SORTATION()==1){
												if(cnt1==0){
													cnt2 = h;
													cnt1++;
												}
										%>
							<%		
											}
										}
										 %>
							<input type="hidden"
								id="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								name="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								value="<%=sList.get(cnt2).getGOD_DESCRIPTION() %>">
							<br>
							<%  } cnt++;}
									}else if(sList.get(k).getGOD_SORTATION()==2){
										for(int r=0;r<kVO.getGOP_AMMOUNT();r++){
									%>
							<input type="text"
								id="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								name="gop_code-<%=kVO.getGOP_CODE() %>-<%=r+1 %>"
								class="optionJugwan"
								placeholder="<%=sList.get(k).getGOD_DESCRIPTION() %>">
							<br>
							<% 	
										}
										jugwanCount++;
									}
								}
							%>
							<% 

						}
							}
								}
						%>
						</ul>
					</div>
					<div class="Fund_Footer">
						<span class="Footer_num"><%=gVO.getSupport_num()%></span><span>명이
							선택하였습니다</span> <br> <span>예상 전달일:<%=gVO.getGIFT_DELIVERYDATE() %></span>
					</div>
				</form>
			</div>
			<%
                  	  }
					}
				%>
		</div>
	</div>
</body>
</html>