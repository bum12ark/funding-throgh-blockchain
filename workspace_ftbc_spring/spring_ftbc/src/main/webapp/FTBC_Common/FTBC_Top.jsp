<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("mem_email") != null) {
%>
<%@ include file="../FTBC_Common/TopMenuBar_Login.jsp"%>
<%
	}
	else {
%>				
<%@ include file="../FTBC_Common/TopMenuBar.jsp"%>
<% 
	}
%>		