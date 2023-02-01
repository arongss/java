<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	import="java.util.*"
   	import="jspexp.a13_database.*"
   	import="jspexp.vo.*"
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
<%
A02_EmpDao dao = new A02_EmpDao();
%>
<table>
	<tr>
		<th>사원번호</th><th>사원명</th><th>직책명</th>
		<th>관리자번호</th><th>급여</th><th>부서명</th>
	</tr>
	<%
	for(Emp e:dao.getEmpSch()){
	%>
	<tr>
		<td><%=e.getEmpno() %></td>
		<td><%=e.getEname() %></td>
		<td><%=e.getJob() %></td>
		<td><%=e.getMgr() %></td>
		<td><%=e.getSal() %></td>
		<td><%=e.getDeptno() %></td>
	</tr>
	<%} %>
</table>
</body>
<script type="text/javascript">
/*
1. WEB-INF 밑에 위치를 시키지 못하신 분.. 손들기.
*/
</script>
</html>