<%@page import="vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String,Object> rMap = null;
	List<MessageVO> myMessage = null;
	List<MessageVO> myPjoMessage = null;
	if(request.getAttribute("rMap")!=null){
		rMap = (Map<String,Object>)request.getAttribute("rMap");
		myMessage = (List<MessageVO>)rMap.get("myMessage");
		myPjoMessage = (List<MessageVO>)rMap.get("myPjoMessage");
%>
<!--배너 밑 부분 -->
		<div class="col-xs-3"></div>
		<div class="col-xs-7">	
			<div class="tab-content">
			
				<!-- 문의/후원한 프로젝트  -->
				<div id="ur_project" class="tab-pane fade in active">
					<div class="row">
						<div class="col-xs-6 msg_btns">
							<input onclick="msgBtn(id)"id="uall_btn" class="msg_btn" type="button" value="모든 메세지">
							<input onclick="msgBtn(id)" id="usent_btn" class="msg_btn" type="button" value="보낸 메세지">
							<input onclick="msgBtn(id)" id="uunread_btn" class="msg_btn" type="button" value="안 읽은 메세지">
						</div>
					</div>
					<div class="row" id="ur_msg">
						<div id="u_content1" class="msg_content">
							<table class="table" style="color : black;margin-left: -60px;margin-top: -50px">
								<tr>
									<td>문의유형</td>
									<td>제목</td>
									<td>보낸이</td>
									<td>받는이</td>
									<td>날짜</td>
									<td>읽음</td>
								</tr>		
							<%
								for(int i=0;i<myMessage.size();i++){
									MessageVO mVO = myMessage.get(i);
							%>
								<tr onclick="Answer('<%=mVO.getMs_code()%>','<%=mVO.getMs_title()%>','<%=mVO.getMem_email()%>','<%=mVO.getMy_nickname()%>','<%=mVO.getMs_content()%>','<%=mVO.getMs_question()%>','<%=mVO.getProject_code()%>')">
									<td><%=mVO.getMs_question()%></td>
									<td><%=mVO.getMs_title()%></td>
									<td><%=mVO.getMy_nickname()%></td>									
									<td><%=mVO.getRec_nickname() %></td>
									<td><%=mVO.getMs_date() %></td>
									<%if(mVO.getMs_isread().equals("0")){%><td>안읽음</td><%}else{ %><td>읽음</td><%} %>
								</tr>									
							<%		
								}
							%>					
							</table>							
						</div>
						<div id="u_content2" class="msg_content">
							<table class="table" style="color : black;margin-left: -60px;margin-top: -50px">
								<tr>
									<td>문의유형</td>
									<td>제목</td>
									<td>보낸이</td>
									<td>받는이</td>
									<td>날짜</td>
									<td>읽음</td>
								</tr>		
							<%
								for(int i=0;i<myMessage.size();i++){
									MessageVO mVO = myMessage.get(i);
									if(mVO.getMem_email().equals(session.getAttribute("mem_email"))){
										
							%>
								<tr onclick="Answer('<%=mVO.getMs_code()%>','<%=mVO.getMs_title()%>','<%=mVO.getMem_email()%>','<%=mVO.getMy_nickname()%>','<%=mVO.getMs_content()%>','<%=mVO.getMs_question()%>','<%=mVO.getProject_code()%>')">
									<td><%=mVO.getMs_question()%></td>
									<td><%=mVO.getMs_title()%></td>
									<td><%=mVO.getMy_nickname()%></td>									
									<td><%=mVO.getRec_nickname() %></td>
									<td><%=mVO.getMs_date() %></td>
									<%if(mVO.getMs_isread().equals("0")){%><td>안읽음</td><%}else{ %><td>읽음</td><%} %>
								</tr>	
							<%		
									}
									}
							%>					
							</table>								
							
						</div>
						<div id="u_content3" class="msg_content">
						<table class="table" style="color : black;margin-left: -60px;margin-top: -50px">
								<tr>
									<td>문의유형</td>
									<td>제목</td>
									<td>보낸이</td>
									<td>받는이</td>
									<td>날짜</td>
									<td>읽음</td>
								</tr>		
							<%
								for(int i=0;i<myMessage.size();i++){
									MessageVO mVO = myMessage.get(i);
									if(mVO.getMs_recipient().equals(session.getAttribute("mem_email"))){
									if(mVO.getMs_isread().equals("0")){
										
							%>
								<tr onclick="Answer('<%=mVO.getMs_code()%>','<%=mVO.getMs_title()%>','<%=mVO.getMem_email()%>','<%=mVO.getMy_nickname()%>','<%=mVO.getMs_content()%>','<%=mVO.getMs_question()%>','<%=mVO.getProject_code()%>')">
									<td><%=mVO.getMs_question()%></td>
									<td><%=mVO.getMs_title()%></td>
									<td><%=mVO.getMy_nickname()%></td>									
									<td><%=mVO.getRec_nickname() %></td>
									<td><%=mVO.getMs_date() %></td>
									<%if(mVO.getMs_isread().equals("0")){%><td>안읽음</td><%}else{ %><td>읽음</td><%} %>
								</tr>	
							<%		
										}
									}
								}
							%>
							</table>								
						</div>
					</div>
				</div>
				
				<!-- 만든 프로젝트  -->
				
				<div id="my_project" class="tab-pane fade">
					<div class="row">
						<div class="col-xs-6 msg_btns">
							<input onclick="msgBtn(id)" id="mall_btn" class="msg_btn" type="button" value="모든 메세지">
							<input onclick="msgBtn(id)" id="msent_btn" class="msg_btn" type="button" value="보낸 메세지">
							<input onclick="msgBtn(id)" id="munread_btn" class="msg_btn" type="button" value="안 읽은 메세지">
						</div>
					</div>
					<div class="row" id="my_msg">
					<div id="m_content1" class="msg_content">
						<table class="table" style="color : black;margin-left: -60px;margin-top: -50px">
								<tr>
									<td>문의유형</td>
									<td>제목</td>
									<td>보낸이</td>
									<td>받는이</td>
									<td>날짜</td>
									<td>읽음</td>
								</tr>		
							<%
								for(int i=0;i<myPjoMessage.size();i++){
									MessageVO mVO = myPjoMessage.get(i);
							%>
								<tr onclick="Answer('<%=mVO.getMs_code()%>','<%=mVO.getMs_title()%>','<%=mVO.getMem_email()%>','<%=mVO.getMy_nickname()%>','<%=mVO.getMs_content()%>','<%=mVO.getMs_question()%>','<%=mVO.getProject_code()%>')">
								 	<td><%=mVO.getMs_question()%></td>
									<td><%=mVO.getMs_title()%></td>
									<td><%=mVO.getMy_nickname()%></td>									
									<td><%=mVO.getRec_nickname() %></td>
									<td><%=mVO.getMs_date() %></td>
									<%if(mVO.getMs_isread().equals("0")){%><td>안읽음</td><%}else{ %><td>읽음</td><%} %>
								</tr>									
							<%		
								}
							%>					
							</table>
					</div>
					<div id="m_content2" class="msg_content">
						<table class="table" style="color : black;margin-left: -60px;margin-top: -50px">
								<tr>
									<td>문의유형</td>
									<td>제목</td>
									<td>보낸이</td>
									<td>받는이</td>
									<td>날짜</td>
									<td>읽음</td>
								</tr>		
							<%
								for(int i=0;i<myPjoMessage.size();i++){
									MessageVO mVO = myPjoMessage.get(i);
									if(mVO.getMem_email().equals(session.getAttribute("mem_email"))){
										
							%>
								<tr onclick="Answer('<%=mVO.getMs_code()%>','<%=mVO.getMs_title()%>','<%=mVO.getMem_email()%>','<%=mVO.getMy_nickname()%>','<%=mVO.getMs_content()%>','<%=mVO.getMs_question()%>','<%=mVO.getProject_code()%>')">
									<td><%=mVO.getMs_question()%></td>
									<td><%=mVO.getMs_title()%></td>
									<td><%=mVO.getMy_nickname()%></td>									
									<td><%=mVO.getRec_nickname() %></td>
									<td><%=mVO.getMs_date() %></td>
									<%if(mVO.getMs_isread().equals("0")){%><td>안읽음</td><%}else{ %><td>읽음</td><%} %>
								</tr>	
							<%		
									}
								}
							%>					
							</table>								
							
					</div>
					<div id="m_content3" class="msg_content">
						<table class="table" style="color : black;margin-left: -60px;margin-top: -50px">
								<tr>
									<td>문의유형</td>
									<td>제목</td>
									<td>보낸이</td>
									<td>받는이</td>
									<td>날짜</td>
									<td>읽음</td>
								</tr>		
							<%
								for(int i=0;i<myPjoMessage.size();i++){
									MessageVO mVO = myPjoMessage.get(i);
									if(mVO.getMs_recipient().equals(session.getAttribute("mem_email"))){
										if(mVO.getMs_isread().equals("0")){
										
							%>
								<tr onclick="Answer('<%=mVO.getMs_code()%>','<%=mVO.getMs_title()%>','<%=mVO.getMem_email()%>','<%=mVO.getMy_nickname()%>','<%=mVO.getMs_content()%>','<%=mVO.getMs_question()%>','<%=mVO.getProject_code()%>')">
									<td><%=mVO.getMs_question()%></td>
									<td><%=mVO.getMs_title()%></td>
									<td><%=mVO.getMy_nickname()%></td>									
									<td><%=mVO.getRec_nickname() %></td>
									<td><%=mVO.getMs_date() %></td>
									<%if(mVO.getMs_isread().equals("0")){%><td>안읽음</td><%}else{ %><td>읽음</td><%} %>
								</tr>	
							<%		
										}
									}
								}	
							%>	
							</table>								
					</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="col-xs-2"></div>
<%		
} else{
%>

<!--배너 밑 부분 -->
		<div class="col-xs-3"></div>
		<div class="col-xs-7">	
			<div class="tab-content">
			
				<!-- 문의/후원한 프로젝트  -->
				<div id="ur_project" class="tab-pane fade in active">
					<div class="row">
						<div class="col-xs-6 msg_btns">
							<input onclick="msgBtn(id)"id="uall_btn" class="msg_btn" type="button" value="모든 메세지">
							<input onclick="msgBtn(id)" id="usent_btn" class="msg_btn" type="button" value="보낸 메세지">
							<input onclick="msgBtn(id)" id="uunread_btn" class="msg_btn" type="button" value="안 읽은 메세지">
						</div>
					</div>
					<div class="row" id="ur_msg">
						<div id="u_content1" class="msg_content">
							<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
							<h3>새로운 메시지가 없습니다</h3>
							<p>프로젝트 페이지에서 '문의하기' 버튼을 눌러 <br>메세지를 보낼 수 있습니다.</p>
						</div>
						<div id="u_content2" class="msg_content">
							<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
							<h3>새로운 메시지가 없습니다</h3>
							<p>프로젝트 페이지에서 '문의하기' 버튼을 눌러 <br>메세지를 보낼 수 있습니다.</p>
						</div>
						<div id="u_content3" class="msg_content">
							<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
							<h3>새로운 메시지가 없습니다</h3>
						</div>
					</div>
				</div>
				
				<!-- 만든 프로젝트  -->
				
				<div id="my_project" class="tab-pane fade">
					<div class="row">
						<div class="col-xs-6 msg_btns">
							<input onclick="msgBtn(id)" id="mall_btn" class="msg_btn" type="button" value="모든 메세지">
							<input onclick="msgBtn(id)" id="msent_btn" class="msg_btn" type="button" value="보낸 메세지">
							<input onclick="msgBtn(id)" id="munread_btn" class="msg_btn" type="button" value="안 읽은 메세지">
						</div>
					</div>
					<div class="row" id="my_msg">
					<div id="m_content1" class="msg_content">
						<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
						<h3>새로운 메시지가 없습니다</h3>
						<p>프로젝트 페이지에서 '문의하기' 버튼을 눌러 <br>메세지를 보낼 수 있습니다.</p>
					</div>
					<div id="m_content2" class="msg_content">
						<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
						<h3>새로운 메시지가 없습니다</h3>
						<p>프로젝트 페이지에서 '문의하기' 버튼을 눌러 <br>메세지를 보낼 수 있습니다.</p>
					</div>
					<div id="m_content3" class="msg_content">
						<img src="../FTBC_Images/messageiconlt.png" id="msg_lt">
						<h3>새로운 메시지가 없습니다</h3>
					</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="col-xs-2"></div>

<%

	}
%>    
    
    
