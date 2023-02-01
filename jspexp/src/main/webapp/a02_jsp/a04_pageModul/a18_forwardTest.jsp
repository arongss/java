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
	<form>
		아이디:<input type="text" name="id"/>
		<input type="submit"/>
	</form>
	<%
	String id = request.getParameter("id");
	if(id!=null){
		if(id.equals("himan")){
	%>
			<jsp:forward page="a19_main.jsp"/>
		<%}else{ %>
			<jsp:forward page="a20_error.jsp"/>
		<%} %>
	<%
	}
	%>
	
	
<%--a19_main.jsp
		<h2><%=request.getParameter("id")%>로그인 성공</h2>
		
	a20_error.jsp
		<h2><%=request.getParameter("id")%>로그인 실패</h2>

--%>
<%--
# ex) a18_forwardTest.jsp?id=himan 처리하여
		요청값이 himan일 때는 로그인 성공 페이지 a19_main.jsp로 전송
		그 외는 a20_error.jsp로 로그인 실패 페이지로 이동하여
		출력되게 하세요.

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