<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script>
/*

*/
</script>
</head>
<body>
<%
	String grade = request.getParameter("grade");
	int gradeInt = 0;
	if(grade!=null) gradeInt = Integer.parseInt(grade);
	String losal = request.getParameter("losal");
	double losalD = 0;
	if(losal!=null) losalD = Double.parseDouble(losal);
	String hisal = request.getParameter("hisal");
	double hisalD = 0;
	if(hisal!=null) hisalD = Double.parseDouble(hisal);
	boolean isInsert = false;
	if(grade!=null&& !grade.equals("")){
		Salgrade ins = new Salgrade(gradeInt, losalD, hisalD);
		A06_PareparedDao dao = new A06_PareparedDao();
		dao.insertSalgrade(ins); 
		isInsert = true;
	}
%>
<script type="text/javascript">
	var isInsert = <%=isInsert%>
	if(isInsert){
		if(confirm("등록성공\n조회화면으로 이동하시겠습니까?")){
			location.href="1117.jsp"
		}
	}
</script>
<h2>등급등록</h2>
	<form>
		등급:<input type="text" name="grade"/>
		급여시작:<input type="text" name="losal"/>
		급여끝:<input type="text" name="hisal"/>
		<input type="submit" value="등록"/>
	</form>
<%--
# 

--%>

</body>
<script>
/*

*/
</script>
</html>