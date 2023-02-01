<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="jspexp.project_4.*"
	import="jspexp.project_4.vo.*" %>
<%
	// post방식에서 한글요청값을 받을 때, 반드시 설정되어야한다.
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용대학교</title>
<link href="img/ss.png" rel="shortcut icon" type="image/x-icon">
<link href="PJ_css/noticeNo1.css" type="text/css" rel="stylesheet">
<link href="PJ_css/input.css" type="text/css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
</head>
<body>
<%
String id = request.getParameter("id");
String curpass = request.getParameter("pass1");
String newpass = request.getParameter("pass2"); 
try{
	if( id!=null && !id.equals("") ){
		UniversityDao dao = new UniversityDao();
		int rows = dao.uptPw(id, curpass, newpass);
		if(rows==1){
			%>
			<script type="text/javascript">
			alert("비밀번호 변경이 완료되었습니다.");
			location.href="/project_4/a01_login_DB.jsp"
			</script>
			<%
			//response.sendRedirect("a01_login_DB.jsp");
		}else{
			%>
			<script type="text/javascript">
			alert("입력된 현재 비밀번호가 일치하지 않습니다.");
			history.back();
			</script>
			<%
		}
	}
}catch(NullPointerException e){
}
%>
</body>
<script type="text/javascript">

</script>
</html>