<%@page import="vo.ProjectVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProjectVO> pList = (List<ProjectVO>)request.getAttribute("FundedProjects");
	int ing = 0;
	int end = 0;
	for(int i=0;i<pList.size();i++){
		ProjectVO pVO = pList.get(i);
		if(pVO.getOutLine()>0){
			ing++;
		}else {
			end++; 
		}
	}
%>		
		
		
		<div class="col-xs-2">&nbsp;</div>
		<div class="col-xs-8">
			<!-- Content 상단 버튼 & 검색바  -->
			<div class="row" id="Fpj_content_top">
				<div class="col-xs-6" id="Fpj_content_btns">
					<a id="Fpj_all" class="col-xs-3 Fpj_btns" onclick="FpjbtnActive(id)">
					모두 보기<div class="Fpj_num" id="Fpj_all_num"><%=pList.size()%></div>
					 </a>
					<a id="Fpj_ing" class="col-xs-3 Fpj_btns" onclick="FpjbtnActive(id)">
					펀딩 진행중 <div class="Fpj_num" id="Fpj_ing_num" ><%=ing%></div>
					</a>
					<a id="Fpj_done" class="col-xs-3 Fpj_btns"  onclick="FpjbtnActive(id)">
					결제 완료<div class="Fpj_num" id="Fpj_done_num"><%=end%></div>
					</a>
				</div>
				<div class="col-xs-6" id="Fpj_content_sbar">
					<input id="Fpj_search" type="text" placeholder="프로젝트,선물, 창작자를 검색하세요" >
					<input id="Fpj_search_btn" type="button" onclick="">
				</div>
			</div>
			
			<div  id="Fpj_all_cnt" class="Fpj_all">
			<div class="row Fpj_count">
				<div>
				<i class="fa fa-list"></i>총 <span><%=pList.size() %></span>건의 후원 결과가 있습니다
				</div>
			</div>
			
			<div class="row Project_lists" id="contents">
				<div id="main_Center" class="col-xs-12">
			
<%
					for(int i=0;i<pList.size();i++){
					ProjectVO pVO = pList.get(i);
					if(pVO.getOutLine()>=0){
						
					
%>
					<div class="card col-xs-3" onclick="projectDetail('<%=pVO.getProject_code()%>')">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getPjo_nickname()%></span>
							<hr  style="max-width: 94%"  width=<%=(float)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>% align="left" class="card_hr">
							<span class="card-text project_date col-xs-5"><img id="project_img" src="../FTBC_Images/date.png"/><%=pVO.getOutLine() %>일 남음</span> 
							<span class="card-text project_cost col-xs-5"><%=pVO.getFundedMoney()%>원</span><span class="card-text project_per col-xs-2"><%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
						</div>
					</div>
<%
						}
					}
				for(int i=0;i<pList.size();i++){
					ProjectVO pVO = pList.get(i);
					if(pVO.getOutLine()<0){
						%>
						<div class="card col-xs-3" onclick="projectDetail('<%=pVO.getProject_code()%>')">
							<div class="card-header">
								<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
							</div>
							<div class="card-body">
								<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
								<span class="card-text project_nick"><%=pVO.getPjo_nickname()%></span>
								<hr width=<%=(float)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%  style="max-width: 94%"  align="left" class="card_hr">
								<%if(pVO.getFundedMoney()>Integer.parseInt(pVO.getFd_targetMoney())){
									%>
								<span class="card-text project_date col-xs-5" style="border: 1px solid #88C1A9;background-color:#88C1A9; color: #ffffff;text-align: center;">
									펀딩 성공
								</span> 
									<% 
								}else{
									%>
								<span class="card-text project_date col-xs-5" style="border: 1px solid #C91903;background-color:#C91903; color: #ffffff;text-align: center;">
									펀딩 실패
								</span> 
									<%
								}
									%>						
								<span class="card-text project_cost col-xs-5"><%=pVO.getFundedMoney()%>원</span><span class="card-text project_per col-xs-2"><%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
							</div>
						</div>
	<%	
					}
						
				}
%>
			</div>
			</div>
			</div>
			
			<div  id="Fpj_ing_cnt" class="Fpj_all">
			<div class="row Fpj_count" >
				<div>
				<i class="fa fa-spinner"></i>총 <span><%=ing %></span>건의 펀딩 진행중인 후원이 있습니다
				</div>
			</div>
			<div class="row Project_lists" id="contents">
				<div id="main_Center" class="col-xs-12">
<%
				for(int i=0;i<pList.size();i++){
					ProjectVO pVO = pList.get(i);
					if(pVO.getOutLine()>0){
%>
					<div class="card col-xs-3" onclick="projectDetail('<%=pVO.getProject_code()%>')">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getPjo_nickname()%></span>
							<hr  style="max-width: 94%"  width=<%=(float)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>% align="left" class="card_hr">
							<span class="card-text project_date col-xs-5"><img id="project_img" src="../FTBC_Images/date.png"/><%=pVO.getOutLine() %>일 남음</span> 
							<span class="card-text project_cost col-xs-5"><%=pVO.getFundedMoney()%>원</span><span class="card-text project_per col-xs-2"><%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
						</div>
					</div>
<%
					}
}
%>
				</div>
			</div>
			</div>
			
			<div id="Fpj_done_cnt" class="Fpj_all">
			<div class="row Fpj_count" >
				<div>
				<i class="fa fa-money"></i>총 <span><%=end %></span>건의 결제 완료된 후원이 있습니다
				</div>
			</div>
			<div class="row Project_lists" id="contents">
				<div id="main_Center" class="col-xs-12">
<%
					for(int i=0;i<pList.size();i++){
					ProjectVO pVO = pList.get(i);
						if(pVO.getOutLine()<=0){
%>
					<div class="card col-xs-3" onclick="projectDetail('<%=pVO.getProject_code()%>')">
						<div class="card-header">
							<img src="<%=pVO.getPjo_img()%>"class="card_img"> 
						</div>
						<div class="card-body">
							<span class="card-text project_title"><%=pVO.getPjo_longtitle()%></span> 
							<span class="card-text project_nick"><%=pVO.getPjo_nickname()%></span>
							<hr  style="max-width: 94%"  width=<%=(float)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>% align="left" class="card_hr">
							<%if(pVO.getFundedMoney()>Integer.parseInt(pVO.getFd_targetMoney())){
								%>
							<span class="card-text project_date col-xs-5" style="border: 1px solid #88C1A9;background-color:#88C1A9; color: #ffffff;text-align: center;">
								펀딩 성공
							</span> 
								<% 
							}else{
								%>
							<span class="card-text project_date col-xs-5" style="border: 1px solid #C91903;background-color:#C91903; color: #ffffff;text-align: center;">
								펀딩 실패
							</span> 
								<%
							}
								%>	
							<span class="card-text project_cost col-xs-5"><%=pVO.getFundedMoney()%>원</span><span class="card-text project_per col-xs-2"><%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
						</div>
					</div>
<%
						}
}
%>	
					</div>
			</div>
			</div>
		</div>
		<div class="col-xs-2">&nbsp;</div>