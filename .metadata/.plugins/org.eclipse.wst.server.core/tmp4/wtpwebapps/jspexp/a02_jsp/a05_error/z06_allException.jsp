<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
	isErrorPage="true"
    %>
<%--
# 클래스 관련 전체 예외 처리 페이지
 --%>
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
	*{color:orange;}
</style>
</head>
<body style="background-image:url('img01.jpg')">
	<h2 align="center">에러가 발생했습니다.(모든 예외 처리)</h2>
	<%if(exception!=null){%>
	<table>
		<tr><td>에러타입:<%=exception.getClass().getName() %></td></tr>
		<tr><td>에러타입:<%=exception.getMessage() %></td></tr>
		<tr><td>불편을 끼쳐드려 죄송합니다.</td></tr>
		<tr><td>잠시 기다리시면 조속히 처리하도록 하겠습니다.</td></tr>
		<tr><td>담당자 : 홍길동 사원(010-0000-0000)</td></tr>
	</table>
	<%}else{%>
		<h2>아직 예외 없음/테스트용</h2>
	<%}%>
<div id="container"></div>
</body>
<script type="text/javascript">
/*

*/
var div = document.querySelector("#container")
div.innerHTML+="<br>"
</script>
</html>