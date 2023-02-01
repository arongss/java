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
<style>
iframe{border:1px solid blue;width:30%;height:30%;}
</style>
<script type="text/javascript">
function alloc(idx){
	var tname = document.querySelector("[name=tname]").value
	if(idx==0) group01.document.body.innerHTML+=tname+", "
	if(idx==1) group02.document.body.innerHTML+=tname+", "
	if(idx==2) group03.document.body.innerHTML+=tname+", "
}
</script>
</head>
<body>
16강 확정팀 <input type="text" name="tname"/>
<input type="button" value="16강 1번째그룹 할당" onclick="alloc(0)"/>
<input type="button" value="16강 2번째그룹 할당" onclick="alloc(1)"/>
<input type="button" value="16강 3번째그룹 할당" onclick="alloc(2)"/>
<iframe name="group01" src="a13_sub.jsp"></iframe>
<iframe name="group02" src="a14_sub.jsp"></iframe>
<iframe name="group03" src="a15_sub.jsp"></iframe>

<%--
# 

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