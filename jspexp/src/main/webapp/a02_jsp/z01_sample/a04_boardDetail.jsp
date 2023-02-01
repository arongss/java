<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
   	import="jspexp.a13_database.vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
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
<h2>게시판 상세</h2>
<form>
	번호:<input type="text" name="no" value="1000" 
		readonly="readonly"/><br>
	제목:<input type="text" name="title" value="첫번째글"/><br>
	작성자:<input type="text" name="writer" value="himan" 
		readonly="readonly"/><br>
	<input type="button" value="수정" onclick="procFunc('upt')"/>
	<input type="button" value="삭제" onclick="procFunc('del')"/>
</form>
<script type="text/javascript">
	function procFunc(proc){
		var sessId = "${mem.id}"
		var writer = document.querySelector("[name=writer]").value
		if(sessId!=writer){
			alert("권한이 없습니다")
			return;
		}
		if(confirm("수정/삭제 하시겠습니다")){
			document.querySelector("form").submit();
		}
	}
</script>
</body>
</html>