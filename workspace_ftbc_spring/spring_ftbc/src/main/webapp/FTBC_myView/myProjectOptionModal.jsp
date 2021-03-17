<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> getmypjogiftOption = new ArrayList<>();
	List<Map<String, Object>> gopOption = new ArrayList<>();
	if(request.getAttribute("getmypjogiftOption")!=null){
		getmypjogiftOption = (List<Map<String, Object>>)request.getAttribute("getmypjogiftOption");
		gopOption = (List<Map<String, Object>>)request.getAttribute("gopOption");
	}

%>

               <div>
                  <%
                     for(int j=0;j<gopOption.size();j++){
                        Map<String,Object> aMap = gopOption.get(j);
                        %>
                           <div>
                           <label style="font-size: 30px;">
                           <%=aMap.get("GOP_OPTION")%>
                           </label>
                           <label style="font-size:25px;">
                           X<%=aMap.get("GOP_AMMOUNT")%>
                           </label>
                        <%
                        for(int i=0;i<getmypjogiftOption.size();i++){
                           Map<String,Object> pMap = getmypjogiftOption.get(i);
                           if(aMap.get("GOP_CODE").equals(pMap.get("gop_code"))){
                     %>
                           <br>
                           <label style="font-size: 20px;">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="eicon eicon-flickr"></i><%=pMap.get("god_option")%>
                           </label>
                        
                     <%      
                           }
                        }
                     %>
                        
                           </div>
                           <hr style="margin: 0px;padding: 2px;">
                        <%
                     }
                  %>
               
               </div>      
				