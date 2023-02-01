<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
   	import="jspexp.a13_database.vo.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*

*/
</script>
</head>
<body>

<%--
# 
최종 범위 확인
--%>
<div id="container"></div>
<h1>page와 request 범위 확인(request에서 forward처리시)</h1>
<h2>페이지범위 데이터:<%=pageContext.getAttribute("name")%></h2>
<h2>요청범위 데이터:<%=request.getAttribute("age")%></h2>
</body>
<script type="text/javascript">
/*

*/
var div = document.querySelector("#container")
div.innerHTML+="<br>"
</script>
</html>