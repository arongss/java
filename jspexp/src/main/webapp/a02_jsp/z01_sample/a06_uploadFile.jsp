<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import="java.util.*"
     import="jspexp.vo.*"
    import="jspexp.a13_database.*"
    import="jspexp.a13_database.vo.*"
 %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">

</script>
</head>
<body>
<%
	String loc="C:/a01_javaexp/workspace/jspexp/src/main/webapp/a02_jsp/z02_upload";
	int maxSize = 1024*1024*5;
	MultipartRequest multi = new MultipartRequest(
		request,
		loc,
		maxSize,
		"utf-8",
		new DefaultFileRenamePolicy()
	);
	String name = multi.getParameter("name");
	Enumeration<?> files = multi.getFileNames();
	while(files.hasMoreElements()){
		String ele = (String)files.nextElement();
%>
	<h2>자료 내용:<%=name %></h2>
	<h2>파라미터이름:<%=ele %></h2>
	<h2>서버업로드파일명:<%=multi.getFilesystemName(ele) %></h2>
	<h2>유저 업로드파일명:<%=multi.getOriginalFileName(ele) %></h2>
	<h2>파일 타입:<%=multi.getContentType(ele) %></h2>
	<h2>파일 길이:<%=multi.getFile(ele) %></h2>
	
<%}%>

<%--

--%>
</body>
</html>