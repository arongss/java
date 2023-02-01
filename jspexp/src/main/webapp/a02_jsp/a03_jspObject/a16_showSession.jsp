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

--%>
<h2>물건명(page):<%=pageContext.getAttribute("name")%></h2>
<h2>가격(request):<%=request.getAttribute("price")%></h2>
<h2>갯수(session):<%=session.getAttribute("cnt")%></h2>
<h2>구매처(application):<%=application.getAttribute("bloc")%></h2>
<div id="container"></div>
</body>
<script type="text/javascript">
/*

*/
var div = document.querySelector("#container")
div.innerHTML+="<br>"
</script>
</html>