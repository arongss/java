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
<script type="text/javascript">
/*

*/
</script>
</head>
<body>

<%--
# el활용한 VO객체 처리
1. el은 VO객체를 property라는 개념으로 접근해서 호출할 수 있다.
2. 저장시, 호출시
	1) scope에 따른 객체로 저장.
		request.setAttribute("p01", new Person());
	2) 가져올 때..
		<%=p01.getName()%> ==> 
			${p01.name} 필드를 호출하는 것이 아님 getName()
			get삭제 Name() ==> name 변경해서 처리..
		VO
			필드를 name01로 해도 접근 가능?
			getName() ==> getName88()	${p01.name88}
			==> el는 없으면 nullpointerException 발생하지 않고 
			공백으로 처리된다. (조건문 처리 하지 않더라도)
--%>
<%
	request.setAttribute("p01", new Person("홍길동",25,"서울"));
// ex) d01 Dept()객체를 생성하고, el로 호출하세요..
	request.setAttribute("d01", new Dept(10,"회계","부산"));
%>
	<h2>이름:${p01.name}</h2>
	<h2>나이:${p01.age}</h2>
	<h2>사는곳:${p01.loc}</h2>
	<h3>부서번호:${d01.deptno}</h3>
	<h3>부서명:${d01.dname}</h3>
	<h3>부서위치:${d01.loc}</h3>
</body>
<script type="text/javascript">
/*

*/
</script>
</html>