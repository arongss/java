<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
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
<style type="text/css">
	h2,h3{color:orange;}
</style>
<script type="text/javascript">
/*

*/
</script>
</head>
<body style="background-image:url('/a00_img/404_img.png');background-size:cover;">
	<h2 align="center">요청한 페이지가 없습니다.</h2>
	<h3 align="center">404 에러발생</h3>
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