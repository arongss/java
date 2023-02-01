<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.Emp"
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
<h2 align="center">세션 설정완료</h2>
<%
	session.setAttribute("emp", new Emp("홍길동",3500,10));
%>
<%-- Emp(String ename, double sal, int deptno)
# 세션 설정과 다시 원래 페이지로 이동
--%>

</body>
<script type="text/javascript">
	if(confirm("세션 설정 완료!!\n세션 메뉴 화면으로 이동하시겠습니까?")){
		location.href="1208.jsp";
	}
/*

*/
</script>
</html>