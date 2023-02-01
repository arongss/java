<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.*"
    import="java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
request.setCharacterEncoding("utf-8");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
    
</head>
<body>
<%-- 로그아웃을 하거나 로그인 할 때, 기존의 session을
필요없으므로 초기화 처리 --%>
<c:remove var="mem" scope="session"/>
<h2>로그인</h2>
<form method="post" action="a02_makeSession_DB.jsp">
아이디:<input type="text" name="id"/>
패스워드:<input type="password" name="pass"/>
<input type="submit" value="로그인"/>

</form>
<%--
#
1.
--%>
<%
//

%>
</body>
<script type="text/javascript">
/*
 
*/
</script>
</html>