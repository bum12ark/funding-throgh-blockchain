<%@page import="vo.ProjectVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
   List<ProjectVO> pList = (List<ProjectVO>)request.getAttribute("myProjects");
%>
<script>
	var size = <%=pList.size()%>
</script>
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
                     <hr width=<%=(float)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%  style="max-width: 94%"  align="left" class="card_hr">
                     <span class="card-text project_date col-xs-5" ><img id="project_img" src="../FTBC_Images/date.png"/><%=pVO.getOutLine() %>일 남음</span> 
                     <span class="card-text project_cost col-xs-5"><%=pVO.getFundedMoney()%>원</span><span class="card-text project_per col-xs-2"><%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
                  </div>
               </div>
<%               }else{
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
                     </span> 
                     <span class="card-text project_cost col-xs-5"><%=pVO.getFundedMoney()%>원</span><span class="card-text project_per col-xs-2"><%=(long)((Double.valueOf(pVO.getFundedMoney())/Double.valueOf(pVO.getFd_targetMoney()))*100)%>%</span>
                  </div>
               </div>
<%                  
               }
            }
         
%>   