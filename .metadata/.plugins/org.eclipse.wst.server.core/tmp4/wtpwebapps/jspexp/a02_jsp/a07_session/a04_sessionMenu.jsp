<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
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
<script type="text/javascript">
/*

*/
</script>
</head>
<body>
<%--
# 

--%>
<%
Member m = (Member)session.getAttribute("mem");
boolean hasSess = m!=null;
log("log(hasSess):"+hasSess);
if(hasSess){
%>
	<h2>세션값 확인</h2>
	<h3>이름:<%=m.getName() %></h3>
	<h3>권한:<%=m.getAuth() %></h3>
<%} %>
</body>
<script type="text/javascript">
boolean hasSess = <%=hasSess%>
if( !hasSess ){
	alert("해당 메뉴 권한이 없습니다.\n 세션 설정하시겠습니까?")
	location.href="a03_afterLogin.jsp"
}
/*

*/
</script>
</html>