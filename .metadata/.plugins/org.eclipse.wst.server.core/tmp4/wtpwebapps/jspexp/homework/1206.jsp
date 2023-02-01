<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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

<%--
2022-12-06
[1단계:개념] 1. 배열형 DOM객체의 속성 처리 방식을 기본예제로 기술하세요.
	# 여러가지 배열 데이터와 함께 DOM객체 활용하기
	1. DOM 다중 선택자
		var domArry = document.querySelectorAll("다중의 선택자")
	2. 배열문과 반복 처리
		donArry[0] : 개별적인 단위 DOM객체
		donArry[1] : 개별적인 단위 DOM객체
		for(var idx=0;idx<배열.length;idx++)
			// 각 DOM의 데이터 처리
			domArry[idx].innerText = "입력데이터"
[1단계:확인] 2. 월드컵 16강 팀들을 배열로 리스트하고, 8X2 테이블에 DOM으로 출력하세요 

<table id="tab01">
	<thead><tr><th>팀1</th><th>팀2</th></tr></thead>
	<tbody>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	</tbody>
</table>
<script type="text/javascript">
var teams = ["네덜란드","미국","아르헨티나","호주","프랑스","폴란드","잉글랜드","세네갈",
			"일본","크로아티아","브라질","대한민국","모로코","스페인","포르투칼","스위스"]
var tds = document.querySelectorAll("#tab01 tbody td")
for(var idx=0; idx<teams.length; idx++){
tds[idx].innerText = teams[idx]
}
</script>

[1단계:확인] 3. 사원번호/사원명 5개,  부서번호와 부서명4개를 json데이터를 선언하고, 
하나는 테이블에 하나는 select의 option에 레이블과 value로 출력해보세요

<table id="tab02">
	<thead><tr><th>사원번호</th><th>사원명</th></tr></thead>
	<tbody>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	</tbody>
</table>
<select>
</select>
<script type="text/javascript">
var tds1 = document.querySelectorAll("#tab02 tbody td")
var emp = [{empno:7781,ename:"홍길동"},
			{empno:7782,ename:"김길동"},
			{empno:7783,ename:"신길동"},
			{empno:7784,ename:"마길동"},
			{empno:7785,ename:"오길동"}]
emp.forEach(function(e,idx){
	tds1[idx*2].innerText = e.empno
	tds1[idx*2+1].innerText = e.ename

})
var sel = document.querySelectorAll("select")
var dept = [{deptno:10,dname:"인사"},
			{deptno:20,dname:"회계"},
			{deptno:30,dname:"총무"},
			{deptno:40,dname:"기획"}]
dept.forEach(function(d){
	sel.innerText += "<option value='"+d.deptno+"'>"+d.dname+"</option>"

})
</script>

[1단계:개념] 4. 예외 처리하는 형식(페이지 지정, 서버단위) 내용을 기본 예제를 통해서 설명하세요.
	# 에러 페이지 지정 처리
	1. 에러가 발생했을 때, 나타낼 페이지 구현
		1) 지시자 선언
			<%@ page isErrorPage = "true" %>
			이 페이지는 에러 처리를 위한 페이지 임을 나타낸다.
			이렇게 속성값을 지정하면, 예외의 기본 객체의 참조변수 exception을 처리할 수 있다.
	2. 에러가 발생할 가능성이 있는 페이지 구현
		1) 페이지별로 에러발생시, 에러 페이지 지정
		2) 페이지 지시자 선언
			<%@ page errorPage = "만들어 둔 에러페이지 지정" %>
	# 서버단위에러 처리
	1. 서버의 설정페이지 web.xml에서 응답코드(http)별로
		에러페이지를 지정할 수 있다.
		<error-page>
			<error-code>응답코드</error-code>
			<location>에러페이지uri</location>
				webapp기준으로 하위에 특정한 경로에 에러페이지를 지정하여 처리
	2. 서버의 설정페이지 web.xml에 예외 클래스별로 에러페이지도 지정할 수 있다.
		<error-page>
			<exception-type>java.lang.XXXException</exception-type>
			<location>경로지정</location>
	3. 처리 순서
		1) webapp기준으로 특정한 위치에 에러를 나타낼 화면을 구현한다.
		2) 응답코드 또는 예외 클래스별로 에러 처리화면의 jsp를 만들고 경로와 파일명을 기준으로 서버단위(web.xml)로 처리한다.
		3) 서버를 리스타트 후, 테스트 코드를 통해서 에러처리를 확인한다.
[1단계:확인] 5. z55_errPage.jsp로 에러 페이지를 지정하고, z51_callError.jsp 지정된 페이지로 에러가 호출되게 처리해보세요.
[1단계:확인] 6. 새로운 프로젝트를 web.xml 파일과 함께 만들어서 404, 500 에러를 페이지를 지정하여 대체 화면으로 처리하세요.
[1단계:확인] 7. 위 프로젝트에 NullPoinerException, ArrayIndexOutBoundsException을 
처리하는 에러페이지를 만들고 web.xml에 등록하고 테스트를 통해서 해당 화면이 나타나게 하세요
--%>
<%-- 풀이
2022-12-06
[1단계:개념] 1. 배열형 DOM객체의 속성 처리 방식을 기본예제로 기술하세요.
[1단계:확인] 2. 월드컵 16강 팀들을 배열로 리스트하고, 8X2 테이블에 DOM으로 출력하세요 
[1단계:확인] *3. 사원번호/사원명 5개,  부서번호와 부서명4개를 json데이터를 선언하고, 하나는 테이블에 하나는 select의 option에 레이블과 value로 출력해보세요
--%>
<h2>json데이터처리1(요소에할당)</h2>
<table id="tab01">
	<thead><th>사원번호</th><th>사원명</th></thead>
	<tbody>
		<tr><td>0</td><td>1</td></tr>
		<tr><td>2</td><td>3</td></tr>
		<tr><td>4</td><td>5</td></tr>
		<tr><td>6</td><td>7</td></tr>
		<tr><td>8</td><td>9</td></tr>
	</tbody>
</table>
<script type="text/javascript">
	var emps = [
				{empno:7800,ename:"홍길동"},
				{empno:7801,ename:"김길동"},
				{empno:7802,ename:"신길동"},
				{empno:7803,ename:"오길동"},
				{empno:7804,ename:"마길동"}
				]
	var tds = document.querySelectorAll("#tab01 td")
	emps.forEach(function(emp, idx){
		//		0 {empno:7800,ename:"홍길동"}
		//		1 {empno:7801,ename:"김길동"}
		tds[idx*2].innerText = emp.empno
		tds[idx*2+1].innerText = emp.ename
	})
</script>
<h2>json데이터처리2(동적요소만들기)</h2>
<select name="dept" onchange="alert(this.value)"></select>
<script type="text/javascript">
	var dept =[
				{deptno:10,dname:"인사"},
				{deptno:20,dname:"재무"},
				{deptno:30,dname:"회계"},
				{deptno:40,dname:"기획"},		
				]
	var deptDom = document.querySelector("[name=dept]")
	var addHtml = ""
	dept.forEach(function(dept){
		addHtml+="<option value='"+dept.deptno+"'>"+dept.dname+"</option>"
	})
	deptDom.innerHTML = addHtml
</script>

<%--
[1단계:개념] 4. 예외 처리하는 형식(페이지 지정, 서버단위) 내용을 기본 예제를 통해서 설명하세요.
[1단계:확인] 5. z55_errPage.jsp로 에러 페이지를 지정하고, z51_callError.jsp 지정된 페이지로 에러가 호출되게 처리해보세요.
[1단계:확인] *6. 새로운 프로젝트를 web.xml 파일과 함께 만들어서 404, 500 에러를 페이지를 지정하여 대체 화면으로 처리하세요.
[1단계:확인] *7. 위 프로젝트에 NullPointerException, ArrayIndexOutBoundsException을 처리하는 에러페이지를 만들고 web.xml에 등록하고 테스트를 통해서 해당 화면이 나타나게 하세요.
	1) 예외 파일 생성
		z03_null.jsp
			isErrorPage = "true"
			객체가 null로 설정되어 발생 에러입니다.
			<%=exception.getClass().getName()%>
			<%=exception.getMessage()%>
		z04_arrayIndex.jsp
			isErrorPage = "true"
			배열의 index범위를 확인하세요
			<%=exception.getClass().getName()%>
			<%=exception.getMessage()%>
	2) web.xml
		<exception-type>java.lang.NullPointerException</exception-type>
  		<location>/z03_null.jsp</location>
  		<exception-type>java.lang.ArrayIndexOutBoundsException</exception-type>
  		<location>/z04_arrayIndex.jsp</location>
		
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