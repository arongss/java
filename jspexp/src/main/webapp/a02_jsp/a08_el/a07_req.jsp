<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

%>
<c:set var="bprod" value="바나나" scope="page"/>
<c:set var="bloc1" value="제주" scope="request"/>
<%-- forward처리할 때는 다른 변수로 설정이 필요하다
<h2>구매장소:${bloc1}</h2>
 --%>
<c:set var="bperson" value="홍길동" scope="session"/>
<c:set var="rcnt" value="2000" scope="application"/>

<jsp:forward page="a08_session.jsp"/>

</body>
<script type="text/javascript">
/*

*/
</script>
</html>