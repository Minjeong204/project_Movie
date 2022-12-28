<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String directory = application.getRealPath("/upload/");
	int maxSize = 1024 * 1024 * 100; //100MB
	String encoding = "UTF-8"; //파일 이름이 한글이면 깨지니까 그거 방지하기 위해.
	
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	
	String fileName = multipartRequest.getOriginalFileName("file"); //업로드할 때에 정의한 파일 이름
	String fileRealName = multipartRequest.getFilesystemName("file"); //실제로 저장된 파일 이름
%>

<h1>디렉토리 : <%= directory%></h1>
<h1>파일명 : <%= fileName%></h1>
<h1>실제 파일명 : <%= fileRealName%></h1>

</body>
</html>
