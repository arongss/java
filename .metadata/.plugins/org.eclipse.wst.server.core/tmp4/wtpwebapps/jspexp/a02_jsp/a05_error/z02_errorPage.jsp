<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
    isErrorPage="true"
    %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<style>
	h2{color:yellow;}
</style>
</head>
<body style="background-image:url('img01.jpg')">
	<%if(exception!=null){ %>
	<h2>에러 발생했습니다.</h2>
	<h2><%=exception.getClass().getName() %></h2>
	<h2><%=exception.getMessage() %></h2>
	<%}else{ %>
		<h2>테스트용(예외처리화면)</h2>
	<%} %>
<%--
# 

--%>
<div id="container"></div>
</body>
<script type="text/javascript">
/*

*/
var div = document.querySelector("#container")
div.innerHTML+="<br>"
</script>
</html>