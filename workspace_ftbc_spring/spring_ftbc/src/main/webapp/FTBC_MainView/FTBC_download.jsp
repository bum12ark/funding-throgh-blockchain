<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.net.*" %>    
<%
//사용자 화면으로 부터 파일명을 받아서 저장함.
	String filename = "FTBC_Setup.exe";
	//out.print("b_file: 8->euc"+b_file);		
	//out.print("<br>");		
	String filePath = "C:\\FTBC_server"; // 절대경로.	
	//가져온 파일이름을 객체화 시켜줌. - 파일이 있는 물리적인 경로가 필요함.
	File file = new File(filePath,filename.trim());
 	String mimeType = getServletContext().getMimeType(file.toString());
 	//mimeType이 브라우저가 인식할 수 없는 값이면 브라우저는 무조건 다운로드 처리하도록 설계되어 있음.
 	//마임타입이 부재인 경우 브라우저가 모르는 마임타입으로 변경하여 줌.
	if(mimeType == null){
		//그래서 다운로드 화면이 처리되도록 강제로 유도해줌.
		response.setContentType("application/octet-stream");
	}
	String downName = null;
	//첨부파일 이름에 대한 한글처리 코드 적용
	if(request.getHeader("user-agent").indexOf("MSIE")==-1){
		downName = new String(filename.getBytes("UTF-8"),"8859_1");
	}else{
		downName = new String(filename.getBytes("EUC-KR"),"8859_1");
	}
	//응답헤더에 한글처리한 이름 정보를 담아줌.
   	response.setHeader("Content-Disposition", "attachment;filename="+downName);
 	//해당 파일을 읽어오는 객체 생성해 줌. - 이 때 파일명을 객체화 한 주소번지가 필요함. 
 	FileInputStream fis = new FileInputStream(file);
 	//서블릿 출력객체를 생성해줌.
 	try{
 		out.clear();
 		out = pageContext.pushBody();
 	}catch(Exception e){
 		
 	}
	ServletOutputStream sos = response.getOutputStream();
	try{
		byte b[] = new byte[1024*10];
		int data = 0;
		//읽어들인 파일내용이 없어질 때까지 계속해서 읽어서 써줌.
		while((data=(fis.read(b,0,b.length)))!=-1){
			sos.write(b,0,data);
		}
		//출력 버퍼를 내보냄.
		sos.flush();		
	}catch(Exception e){
		out.print(e.toString());
	}finally{
		//사용한 자원은 반납해줌.
		if(sos != null) sos.close();
		if(fis != null) fis.close();
	}
%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>다운로드</title>
</head>
<body>
</body>
</html>