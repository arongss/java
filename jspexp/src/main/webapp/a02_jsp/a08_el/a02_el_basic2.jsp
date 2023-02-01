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
	<h2>숫자1:${num01}</h2>
	<h2>숫자2:${num02}</h2>
	<h2>합산:${num01+num02}</h2>
	<h2>이름:${name}</h2>
	<h2>이름2:${name01}</h2>
	<h2>세션값:${sess01}</h2>	
	
	<h2>물건명:${pname}</h2>
	<h2>가격:${price}</h2>
	<h2>갯수:${cnt}</h2>
	<h2>총계:${price*cnt}</h2>
</body>
<script type="text/javascript">
/*

*/
</script>
</html>