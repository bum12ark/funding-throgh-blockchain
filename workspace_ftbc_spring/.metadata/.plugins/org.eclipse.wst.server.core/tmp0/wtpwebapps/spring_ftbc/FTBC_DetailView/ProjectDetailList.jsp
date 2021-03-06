<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.GiftVO"%>
<%@page import="vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//Detail 가져오기
	ProjectVO pVO = null;
	String pjo_code=null;
	float value = 0F;
	if (request.getAttribute("projectDetail") != null) {
		pVO = (ProjectVO) request.getAttribute("projectDetail");
		pjo_code=pVO.getProject_code();
		value = (float) ((Double.valueOf(pVO.getFundedMoney()) / Double.valueOf(pVO.getFd_targetMoney())) * 100);
	}
	//세션에서 로그인한사람 email가져오기
	String mem_email = null;
	if (session.getAttribute("mem_email") != null) {
		mem_email = session.getAttribute("mem_email").toString();
	}
	
	 //세션에서 로그인한사람 mem_isAuthority 가져오기
	   int mem_isAuthority = 0;
	   if (session.getAttribute("mem_isAuthority") != null) {
	      mem_isAuthority = Integer.parseInt(session.getAttribute("mem_isAuthority").toString());
	 }

	//창작자가 만든 프로젝트 수 가져오기
	int createrProjectCount = 0;
	if (request.getAttribute("createrProjectCount") != null) {
		createrProjectCount = (int) request.getAttribute("createrProjectCount");
	}
	//창작자 프로필 이미지 가져오기
	String createrPfimg = null;
	if (request.getAttribute("createrPfimg") != null) {
		createrPfimg = (String) request.getAttribute("createrPfimg");
	}

	//창작자가 펀딩한 프로젝트 수
	List<ProjectVO> CreaterFundedProjectList = null;
	int createrFundedProjects = 0;
	if (request.getAttribute("CreaterFundedProjects") != null) {
		CreaterFundedProjectList = (List<ProjectVO>) request.getAttribute("CreaterFundedProjects");
		createrFundedProjects = CreaterFundedProjectList.size();
	}
	List<MemberVO> fundingMember = null;
	if(request.getAttribute("fundingMember") != null){
		fundingMember = (List<MemberVO>)request.getAttribute("fundingMember");
	}
	/////////////////////10-24
	List<Object> rVO = null;
	List<String> gift_code = null;
	List<GiftVO> gop_option = null;
	String payDate = null;

	if (request.getAttribute("projectGiftDetail") != null) {
		rVO = (List<Object>) request.getAttribute("projectGiftDetail");
		gift_code = (List<String>) rVO.get(0);
		gop_option = (List<GiftVO>) rVO.get(1);
		payDate = pVO.getFd_deadLine().replaceFirst("-", "년 ");
		payDate = payDate.replaceFirst("-", "월 ");
		payDate = payDate.concat("일");
	}
%>
<!-- 서브 카테고리 -->
<div class="row">
	<div class="col-sm-12" id="subCat">
		<button type="button" class="btn btn-sm" id="btn_subCat" onclick="category('<%=pVO.getMaincat_name()%>','<%=pVO.getSubcat_name()%>')">
			<span style="color: rgb(117, 117, 117);"><%=pVO.getSubcat_name()%></span>
		</button>
	</div>
</div>
<!-- 프로젝트 제목 -->
<div class="row">
	<div class="col-sm-12" id="pj_title">
		<h1 align="center">
			<b><%=pVO.getPjo_longtitle()%></b>
		</h1>
	</div>
</div>
<!-- 창작자 그림 및 이름 -->
<div class="row" id="writers">
	<div class="col-sm-6" id="writer_img" align="right">
		<!-- #DB -->
		<img src="<%=pVO.getPjo_memimg()%>" class="img-circle" alt="창작자 이미지"
			width="30" height="30">
	</div>
	<div class="col-sm-6" id="writer_name" align="left">
		<div style="margin-top: 5px;"></div>
		<!-- #a태그_작성자 페이지 이동 -->
		<b><%=pVO.getPjo_nickname()%></b>
	</div>
</div>
<!-- 프로젝트 대표사진과 모인 금액 등 -->
<div class="row" id="top">
	<div class="col-lg-2" id="layout1"></div>
	<!-- 프로필 대표 사진 부분 -->
	<div class="col-lg-5" id="top_profile">
		<div id="top_profile_row1" class="row" align="center">
			<!-- #DB-->
			<img id="top_profile_img" src="<%=pVO.getPjo_img()%>"
				style="max-width: 100%; height: auto; max-height: 480px;"
				alt="프로젝트 커버 이미지">
		</div>
	</div>
	<!-- 우측 부분 -->
	<div class="col-lg-3" id="topInfo">
		<!-- 모인 금액.. 부분 -->
		<div class="topInfo_div row">
			<div>
				<span id="topInfo_label">모인금액</span>
			</div>
			<div>
				<!-- #DB -->
				<%
				String fundMoney = String.format("%,d", pVO.getFundedMoney());
				%>
				<span id="topInfo_label2"><%=fundMoney%></span> <span
					id="topInfo_label3">원&nbsp;&nbsp;</span>
				
				<!-- #DB -->
				<span id="topInfo_label4"><%=String.format("%.2f", value)%>%</span>

			</div>
			<!-- 남은 시간 -->
			<div id="topInfo_time">
				<span id="topInfo_label">남은시간</span>
			</div>
			<div>
				<!-- #DB -->
				<%
					if(pVO.getOutLine()>=0){
						
				%>
				<span id="topInfo_label2"><%=pVO.getOutLine()%></span> <span
					id="topInfo_label3">일</span>
				<%
					}else{
				%>
				<span id="topInfo_label2">0</span> <span
					id="topInfo_label3">일</span>
				
				<%		
					}
				
				%>	
			</div>
			<!-- 후원자 -->

			<div id="topInfo_sponsor">
				<span id="topInfo_label">후원자</span>
			</div>
			<div>
				<!-- #DB -->
				<span id="topInfo_label2"><%=pVO.getSupport_num()%></span> <span
					id="topInfo_label3">명</span>
			</div>
		</div>
		<!-- 후원자 -->
		<!-- 펀딩 진행중 박스 -->
		<div id="topInfo_fundBox" class="row">
			<div style="margin-bottom: 8px;">
			<%
			if(pVO.getOutLine()>=0){
			%>
				<span><b>펀딩 진행중</b></span>
			</div>
			<div>
				<!-- #DB -->
				<span> 목표금액인 <%=pVO.getFd_targetMoney()%>원이 모여야만 결제됩니다.<br>
					결제는 <%=payDate%> 이후로 다함께 진행됩니다.
				</span>
			</div>
			<%
			}else{
				if(pVO.getFundedMoney()>=Integer.parseInt(pVO.getFd_targetMoney())){
			%>
				<span><b>펀딩 성공</b></span>
			</div>
			<div>
				<!-- #DB -->
				<span> 목표금액인 <%=pVO.getFd_targetMoney()%>원을 달성하였습니다.<br>
					결제는 <%=payDate%> 이후로 다함께 진행됩니다.
				</span>
			</div>
			<%										
				}else{
			%>
				<span><b>펀딩 실패</b></span>
			</div>
			<div>
				<!-- #DB -->
				<span> 목표금액인 <%=pVO.getFd_targetMoney()%>원을 달성하지 못하였습니다.<br>
					결제는 <%=payDate%> 이후로 다함께 환불이 진행됩니다.
				</span>
			</div>
			<%										
				}
			}
			%>
		</div>
		 <!-- 프로젝트 밀어주기 버튼 ^^ 관리자일경우 승인하기 버튼으로 바뀜--> 
      <%
      if(pVO.getOutLine()>=0){
    	  
      if(mem_isAuthority == 1){
         if(Integer.parseInt(pVO.getPj_stat()) == 1){
      %>   
         <input id="fundProject" type="button" disabled="disabled"
         style="background-color: #a0a0a0;"
         value="프로젝트 승인완료">
      <%
         }else{
      
      %>
         <input id="fundProject" type="button"
         onclick="approveProject('<%=pVO.getProject_code()%>')"
         value="프로젝트 승인하기">
      <%
         }
      %>
      <% 
      }else{
            if (mem_email != null) {
      %>
      <input id="fundProject" type="button"
         onclick="clickRewardCards('<%=pVO.getProject_code()%>')"
         value="프로젝트 밀어주기">
      <%
            } else {
      %>
      <input id="fundProject" type="button"
         onclick="noLoginclickRewardCards()" value="프로젝트 밀어주기">
      <%
            }
         }
      }else{
      %>
      <input id="fundProject" type="button" style="background-color: #D1B7C6"
         onclick="noLoginclickRewardCards()" disabled value="프로젝트가 마감되었습니다">
      <% 		  
      }
      %>

	</div>
	<div class="col-lg-2"></div>
</div>
<div class="row" id="middle">
	<div class="col-lg-2"></div>
	<!-- 스토리 | 커뮤니티 | 펀딩안내 버튼 | 투자자 -->
	<div id="middle_tabs" class="col-lg-8">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#bottom_storyCard">스토리</a></li>
			<li><a data-toggle="tab" href="#bottom_mainCommunity">커뮤니티</a></li>
			<li><a data-toggle="tab" href="#bottom_mainFundingInfo">펀딩
					안내</a></li>
			<li><a data-toggle="tab" href="#bottom_sponsors">투자자</a></li>
		</ul>
	</div>
	<div class="col-lg-2"></div>
</div>
<!-- =========== end of middle ========== -->
<div class="row" id="bottom">
	<div class="col-lg-2"></div>
	<!-- 스토리 내용물 -->
	<div class="tab-content col-lg-5">
		<!-- 써머노트 내용물 -->
		<div id="bottom_storyCard"
			class="tab-pane fade in active bottom_storyCard"
			style="padding-top: 50px; padding-left: 50px; padding-right: 50px;">
			<!-- #DB_써머노트에서 긁어서 박아줘야함. -->
			<%=pVO.getSt_story()%>
		</div>
		<!-- 커뮤니티 내용물 -->
		<div id="bottom_mainCommunity" class="tab-pane fade">
			<!-- 글 작성부 -->
			<div id="newPost" class="bottom_storyCard">
				<!-- #####중요 : 후원한 사람만 작성할 수 있게 show hide 기능 필요 -->
				<!-- #DB_작성자 이미지 -->
				<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지"
					width="30" height="30"> <span>&nbsp;&nbsp;후원자만 글을 쓸수
					있어요<br> <br>
				</span>
				<div class="media-left">
					<!-- #DB -->
					<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지"
						width="30" height="30">
				</div>
				<div class="media-body">
					<textarea class="form-control" rows="5" id="comment"
						style="margin-bottom: 20px;"></textarea>
				</div>
				<div align="right">
					<input id="communitySave" class="bottom_btn" type="button"
						value="작성하기" onclick="javascript:clickCommunitySave()">
				</div>
			</div>
			<!-- 댓글 보여주기 부 -->
			<div id="storyReple" class="bottom_storyCard"
				onclick="javascript:clickStoryReple()">
				<!-- 사용자 정보 -->
				<div class="media-left">
					<!-- #DB -->
					<img src="../FTBC_Images/arin.png" class="img-circle" alt="작성자 이미지"
						width="30" height="30">
				</div>
				<div class="media-body">
					<!-- #DB -->
					<div>
						<b>[작성자아이디]</b>
					</div>
					<div>[8시간 전]</div>
				</div>
				<!-- 댓글 내용 -->
				<!-- #DB -->
				<div id="storyContent">[33000% 돌파도 눈앞이다!!]</div>
				<!-- 댓글 갯수 -->
				<div id="postSummary">
					<i class="fa fa-comment"></i>
					<!-- #DB -->
					<span>&nbsp;<b>[0]</b></span>
				</div>
			</div>
			<!-- 댓글  상세보기 페이지 헤더 -->
			<div id="backCommunityHeader">
				<input id="backCommunity" type="button" value="< 커뮤니티로 돌아가기"
					onclick="clickBackCommunity()">
			</div>
			<!-- 댓글 상세보기 페이지 -->
			<div id="repleDetail" class="bottom_storyCard">
				<div id="postTitle">게시글 상세보기</div>
				<div id="postBody">
					<!-- #조건문_글쓴이가 창작자일 경우만 나오게 해야함 -->
					<div id="postCategory">창작자 업데이트</div>
				</div>
				<div id="postWriter">
					<div class="media-left">
						<!-- #DB -->
						<img src="../FTBC_Images/arin.png" class="img-circle"
							alt="작성자 이미지" width="30" height="30">
					</div>
					<div class="media-body">
						<!-- #DB -->
						<!-- #조건문_글쓴이가 창작자일 경우만 나오게 해야함 -->
						<div>
							<b>[작성자아이디]</b>&nbsp;<b>[창작자]</b>
						</div>
						<div>[8시간 전]</div>
					</div>
				</div>
				<!-- #DB -->
				<div id="detailContent">
					[작가님께서 팬카페에 적어주신 1억 축하 메세지 입니다!! <br> 감사합니다.]
				</div>
				<!-- #DB -->
				<div id="commentAmount">[24]개의 댓글이 있습니다</div>
				<div id="loadMoreComment"
					onclick="javascript:clickLoadMoreComment()">이전 댓글 더 보기</div>
				<!-- #For문 -->
				<div id="comments">
					<div class="media-left">
						<!-- #DB -->
						<img src="../FTBC_Images/arin.png" class="img-circle"
							alt="댓글작성자 이미지" width="30" height="30">
					</div>
					<div class="media-body">
						<!-- #DB -->
						<div>
							<b>[작성자아이디]</b>
						</div>
						<!-- #DB -->
						<div>[작성 내용]</div>
					</div>
				</div>
				<!-- 댓글 작성 부_#후원자일 경우만 표시 되게 해야함. -->
				<div id="inputCommnet">
					<div class="media-left">
						<!-- #DB -->
						<img src="../FTBC_Images/arin.png" class="img-circle"
							alt="작성자 이미지" width="30" height="30">
					</div>
					<div class="media-body">
						<textarea class="form-control" rows="5" id="comment"
							style="margin-bottom: 20px;"></textarea>
					</div>
					<div align="right">
						<input id="btn_save" class="bottom_btn" type="button" value="작성하기"
							onclick="javascript:clickInputComment()">
					</div>
				</div>
			</div>
		</div>
		<!-- 펀딩 안내 내용물 -->
		<div id="bottom_mainFundingInfo" class="tab-pane fade">
			<div class="bottom_storyCard">
				<div>
					<b>이 프로젝트의 환불 및 교환 정책</b>
				</div>
				<div id="refundExchangePolicyText">
					<!-- #DB -->
					<p>
						[환불관련] - 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이
						불가능합니다. - 예상 전달일로부터 30일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를
						포함한 후원금을 환불해 드립니다. (플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%,
						부가세 별도 ) - 선물 전달을 위한 배송지 및 서베이 답변은
						<%=payDate%>이후로 일괄 취합할 예정입니다. - 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는
						'창작자에게 문의하기'로 개별 문의하셔야 합니다. [파손 및 불량] - 파손 또는 불량품 수령 시 15일 이내로 교환이
						가능합니다. - 교환 및 AS 문의는 '창작자에게 문의하기' 또는 연락처로 신청해 주세요. - 파손이나 불량품 교환시
						발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이
						불가합니다. [ 공연 초대권의 경우 ] - 행사 참가권은 타인에게 양도가 불가능합니다. - 현장에서 수령해야 하는
						선물을 수령하지 못하신 경우 환불은 가능하며, 선물 배송을 위한 추가 배송비를 별도 요청드릴 수 있습니다.
					</p>
				</div>
			</div>
			<div class="bottom_storyCard"
				style="padding: 20px 20px 20px 20px; margin-top: 20px;">
				<div class="bottom_stroyCard">
					<table style="width: 100%;">
						<tr>
							<th style="text-align: left;"><span style="font-size: 15px;"><b>프로젝트에
										대해 문의사항이 있으신가요?</b></span></th>
							<th style="text-align: right;">
								<!-- 창작자에게 문의하기 --> <%
 	if (pVO.isCheck() == true) {
 %>
								<div class="bottom_btn" data-toggle="modal"
									data-target="#creatorInquiry"
									onclick="clickInquiry('<%=pVO.getProject_code()%>','<%=pVO.getPjo_nickname()%>')">
									<i class="fa fa-envelope" style="margin-right: 5px"></i>창작자에게
									문의하기
								</div> <%
 	} else {
 %>
								<div class="bottom_btn" onclick="clickInquiry2()">
									<i class="fa fa-envelope" style="margin-right: 5px"></i>창작자에게
									문의하기
								</div> <%
 	}
 %>
							</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- 투자자 -->
		<div id="bottom_sponsors" class="bottom_storyCard tab-pane fade">
			<div align="center">
				<%@include file="./Chart.jsp"%>
			</div>
			<div class="row" style="margin-top: 10px;"></div>
<%
			if(fundingMember!=null){
				for(int i=0;i<fundingMember.size();i++){
			%>
			<div class="media-left">
				<!-- #DB -->
				<img src="<%=fundingMember.get(i).getMem_pfimg()%>" class="img-circle" alt="작성자 이미지"
					width="40" height="40">
			</div>
			<div class="media-body">
				<div><span style="font-weight: bold;"><%=fundingMember.get(i).getMem_name()%></span>님이 <span style="font-weight: bold;"><%=fundingMember.get(i).getMem_value()%></span>원 후원했습니다.</div>
				<div class="media-date" style="font-size: 5px;"><%=fundingMember.get(i).getTimeStamp().substring(0,13) %></div>
			</div>
				<div style="margin-top: 5px;margin-bottom: 5px;"><hr style="border-top:1px soild #000000"></div>
			<%		
				}
			}
			%>
		</div>
	</div>
	<!-- 창작자 소개 및 선물 선택 -->
	<div class="col-lg-3">
		<!-- 창작자 소개 -->
		<div class="row">
			<div id="bottom_creatorCard" style="padding: 20px 20px 20px 20px;">
				<div style="margin-bottom: 8px;">
					<b>창작자 소개</b>
				</div>
				<div style="margin-bottom: 10px;">
					<!-- #DB -->
					<span><img src="<%=pVO.getPjo_memimg()%>" class="img-circle"
						alt="창작자 이미지" width="30" height="30"></span>
					<!-- #DB -->
					<span><b><%=pVO.getPjo_nickname()%></b></span>
					<!-- #DB -->
				</div>
				<div style="margin-bottom: 15px;">
					<p>
						<%=pVO.getPjo_introduce()%>
					</p>
					<div class="Divider"></div>
				</div>
				<!-- #DB -->
				<div>
					진행한 프로젝트 <a onclick=""><b><%=createrProjectCount%></b></a> &nbsp;
					밀어준 프로젝트 <b><%=createrFundedProjects%></b>
				</div>
				<div style="margin-top: 20px;"></div>
				<!-- 창작자에게 문의하기 -->
				<%
					if (pVO.isCheck() == true) {
				%>
				<div class="bottom_btn" data-toggle="modal"
					data-target="#creatorInquiry"
					onclick="clickInquiry('<%=pVO.getProject_code()%>','<%=pVO.getPjo_nickname()%>')">
					<i class="fa fa-envelope" style="margin-right: 5px"></i>창작자에게 문의하기
				</div>
				<%
					} else {
				%>
				<div class="bottom_btn" onclick="clickInquiry2()">
					<i class="fa fa-envelope" style="margin-right: 5px"></i>창작자에게 문의하기
				</div>
				<%
					}
				%>
			</div>
		</div>
		<!-- #DB -->

		<div id="bottom_rewardsLabel">
			선택할 수 있는
			<%=gift_code.size()%>개의 선물이 있습니다.
		</div>
		<%
			for (int i = 0; i < gift_code.size(); i++) {
				GiftVO gVO = new GiftVO();
				for (int k = 0; k < gop_option.size(); k++) {
					if (gift_code.get(i).equals(gop_option.get(k).getGIFT_CODE())) {
						gVO = gop_option.get(k);
						break;
						}
				}
			
		%>
		<!-- 후원 선물 선택 -->
		<div class="row">
			<!-- #이동_결제 페이지 -->
			<%
			if(pVO.getOutLine()>=0){
				if (mem_email != null) {
                    if (gVO.GIFT_LIMITED != null) {//한정판일경우
                        if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){ 
                        	int limited = Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""));
                        %>
                        	<div id="bottom_rewardCards"
                					onclick="javascript:clickRewardCards('<%=pVO.getProject_code()%>','<%=limited%>','<%=gVO.getSupport_num()%>')">
                  <%    }
                        else{//한정판인데 수량이 남아있지 않을 경우
                        %>
                          <div id="bottom_rewardCards" style="cursor: default;'">
                        <%
                        } 
					}else{
					%>
					<div id="bottom_rewardCards"
                					onclick="javascript:clickRewardCards('<%=pVO.getProject_code()%>','<%=gVO.GIFT_LIMITED%>','<%=gVO.getSupport_num()%>')">
					<% 
				}
					}
				else {
				if (gVO.GIFT_LIMITED != null) {//한정판일경우
                        if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){ 
                        	int limited = Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""));
                        %>
                        	<div id="bottom_rewardCards"
						onclick="javascript:noLoginclickRewardCards()">
                  <%    }
                        else{//한정판인데 수량이 남아있지 않을 경우
                        %>
                          <div id="bottom_rewardCards" style="cursor: default;'">
                        <%
                        } 
					}else{
					%>
					<div id="bottom_rewardCards"
						onclick="javascript:noLoginclickRewardCards()">
					<% 
				}
						}
				
			}else if(pVO.getOutLine()<0){
							%>
							
					<div id="bottom_rewardCards"
					onclick="javascript:endFund()">
							<%
						}
					%>
					<!-- #DB -->
					<div id="bottom_rewardCards_rewardHeader">
						<table style="width: 100%">
							<tr>
								<th style="text-align: left;"><i class="fa fa-check-circle"
									style="margin-right: 5px"></i><span
									id="bottom_rewardCards_amounts"><%=gVO.getSupport_num() %>명이
										선택</span></th>

								<th style="text-align: right;">
                           <%
                              if (gVO.GIFT_LIMITED != null) {
                                 if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){
                           %><span id="bottom_rewardCards_rewardLabel">
                           <%=(Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()%>개 남음</span> <%
                                 }else{ %>
                                    <span id="bottom_rewardCards_rewardLabel_magam">선착순 마감</span>
									<% 
									}
								}%>
								</th>

							</tr>
						</table>
					</div>
					<!-- #DB -->
						<%
				        if(pVO.getOutLine()>=0){                 
                             if (gVO.GIFT_LIMITED != null) {
                                if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){
                           %>
					<div id="bottom_rewardCards_money">
						<b><%=gVO.getGIFT_UNITMONEY()%>원 +</b>
					</div>
					<% }else{ 
                           	%>
                 	<div id="bottom_rewardCards_money" class="magamSpan">
						<b><%=gVO.getGIFT_UNITMONEY()%>원 +</b>
					</div>
					<% }
                     }else{ 
                           	%>
                  	<div id="bottom_rewardCards_money">
						<b><%=gVO.getGIFT_UNITMONEY()%>원 +</b>
					</div>
					<% }
					        }
							%>
					<!-- #DB -->
					<%
						String gift_explanation = null;
							if (gVO.getGIFT_EXPLANATION() == null) {
								gift_explanation = "";
							} else {
								gift_explanation = gVO.getGIFT_EXPLANATION();
							}
					%>
					<%
				        if(pVO.getOutLine()>=0){                 
                             if (gVO.GIFT_LIMITED != null) {
                                if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){
                           %>
					<div id="bottom_rewardCards_description" ><%=gift_explanation%></div>
					<div id="bottom_rewardCards_itemList" >
						<ul>
							<!-- #DB_반복문 -->
							<%
								for (int j = 0; j < gop_option.size(); j++) {
										if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
											GiftVO kVO = gop_option.get(j);
							%>
							<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
							<%
								}
									}
							%>
						</ul>
					</div>
					<% }else{ 
                           	%>
						<div id="bottom_rewardCards_description" class="magamSpan"><%=gift_explanation%></div>
						<div id="bottom_rewardCards_itemList" class="magamSpan">
							<ul>
								<!-- #DB_반복문 -->
						<%
						for (int j = 0; j < gop_option.size(); j++) {
								if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
									GiftVO kVO = gop_option.get(j);
						%>
						<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
						<%
						}
							}
						%>
							</ul>
						</div>
						<% 
							}
						}else{%>
												<div id="bottom_rewardCards_description"><%=gift_explanation%></div>
						<div id="bottom_rewardCards_itemList">
							<ul>
								<!-- #DB_반복문 -->
						<%
						for (int j = 0; j < gop_option.size(); j++) {
								if (gop_option.get(j).getGIFT_CODE().equals(gift_code.get(i))) {
									GiftVO kVO = gop_option.get(j);
						%>
						<li><%=kVO.getGOP_OPTION()%> (x <%=kVO.getGOP_AMMOUNT()%>)</li>
						<%
						}
							}
						%>
							</ul>
						</div>
						<% }
					        }
							%> 
					<!-- #DB -->
					  <%
					        if(pVO.getOutLine()>=0){                 
                              if (gVO.GIFT_LIMITED != null) {
                                 if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){
                           %>
					<div id="bottom_rewardCards_deliveryDate">
						<span>예상 전달일: <b><%=gVO.getGIFT_DELIVERYDATE()%></b></span>
					</div>
					<% }else{ 
                                	%>
                    <div id="bottom_rewardCards_deliveryDate" class="magamSpan">
						<span>예상 전달일: <b><%=gVO.getGIFT_DELIVERYDATE()%></b></span>
					</div>       
					<% 
						}
					}else{%> 
					 <div id="bottom_rewardCards_deliveryDate">
						<span>예상 전달일: <b><%=gVO.getGIFT_DELIVERYDATE()%></b></span>
					</div>
							<% }
					        }
							%>   	
					<div class="Divider"></div>
					                         <%
					        if(pVO.getOutLine()>=0){                 
                              if (gVO.GIFT_LIMITED != null) {
                                 if((Integer.parseInt(gVO.GIFT_LIMITED.toString().replace(",",""))) - gVO.getSupport_num()>0){
                           %>
								<input class="bottom_btn" type="button" value="선물 선택하고 밀어주기">                           
                            <%
                                 }else{ 
                                	%>
                                	<input class="magam_bottom_btn" type="button" value="마감된 펀딩입니다." disabled>
                                	<% 
									}
								}else{%>
									<input class="bottom_btn" type="button" value="선물 선택하고 밀어주기">
									<% }
					        }
							%>					        	
					
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="col-lg-2"></div>
	</div>