<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	List<Map<String,Object>> supList = (List)request.getAttribute("supList");
 	int size = 0;
	int rownum = 1;
	if(supList.size() >0){
		size = supList.size();
	}
 %>
<table class="table" id="Project_Sup_Table">
	<thead>
		<tr>
			<th scope="col">#<%=size%></th>
			<th scope="col">후원자 이름</th>
			<th scope="col">후원 금액</th>
			<th scope="col">후원 상품 코드</th>
		</tr>
	</thead>
	<tbody>
<%
	for(int i=0;i<size;i++){
		rownum = 1 + i;
		Map<String,Object> sMap = supList.get(i);
%>

		<tr>
			<th width="150px"><%=rownum%></th>
			<td><%=sMap.get("supName")%></td>
			<td><%=sMap.get("value") %></td>
			<td><%=sMap.get("giftCode") %></td>
		</tr>	
<%
	}
%>
	</tbody>
</table>