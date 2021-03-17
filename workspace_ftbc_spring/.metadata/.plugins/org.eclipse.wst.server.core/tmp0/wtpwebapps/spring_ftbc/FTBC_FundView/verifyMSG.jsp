<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String msg = request.getAttribute("msg")==null ? "" : request.getAttribute("msg").toString();
	out.print(msg);
%>