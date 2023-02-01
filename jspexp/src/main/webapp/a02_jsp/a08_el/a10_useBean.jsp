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
# useBean을 활용한 객체 생성
1. jsp에서는 action태그의 한 형식으로 useBean을 객체를 생성하여 사용하는데 활용한다.
2. 객체 선언과 생성
	<jsp:useBean id="참조명" class="패키지.클래스명" scope="세션범위"/>
3. 호출
	1) <jsp:getProperty name="참조명" property="퍼로퍼티명"/>
		${참조면.property명}
	2) <jsp:setProperty name="참조명" property="퍼로퍼티명" value="할당할데이터"/>
		${참조명.setXXXX('할당데이터')}
--%>
<jsp:useBean id="pl01" class="jspexp.vo.Player"/>
<jsp:setProperty property="tname" name="pl01" value="맨체스터유나이티드"/>
<jsp:setProperty property="name" name="pl01" value="박지성"/>
<jsp:setProperty property="record" name="pl01" value="30.0"/>
<h2>팀명:<jsp:getProperty property="tname" name="pl01"/> </h2>
<h2>이름:<jsp:getProperty property="name" name="pl01"/> </h2>
<h2>성적:<jsp:getProperty property="record" name="pl01"/>골 </h2>
<jsp:useBean id="pl02" class="jspexp.vo.Player"/>
${pl02.setTname("토트넘")} ${pl02.setName("손흥민")} ${pl02.setRecord("23")}
<h2>팀명:${pl02.tname}</h2>
<h2>이름:${pl02.name}</h2>
<h2>성적:${pl02.record}</h2>
<%-- ex) Code 클래스를 이용하여 useBean을 이용하여, 두가지 형식으로 저장하고,
		출력하세요 --%>
<jsp:useBean id="c01" class="jspexp.vo.Code"/>
<jsp:setProperty property="key" name="c01" value="10"/>
<jsp:setProperty property="val" name="c01" value="인사"/>
<h2>
	<jsp:getProperty property="key" name="c01"/>:
	<jsp:getProperty property="val" name="c01"/>
</h2>
<jsp:useBean id="c02" class="jspexp.vo.Code"/>
${c02.setKey("20")} ${c02.setVal("회계")}
<h2>${c02.key}:${c02.val}</h2>

</body>
<script type="text/javascript">
/*

*/

</script>
</html>