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
<script>
/*
2022-11-16
[1단계:개념] 1. [js]"",'',`` 문자열 데이터의 사용 규칙과 특징을 기술하세요.
	# 문자열 사용
	1. 큰 따옴표는 쌍으로, 작은 따옴표 쌍으로
		"문자열", '문자열', `문자열`
	2. 큰 따옴표와 작은 따옴표는 감싸는 형식으로 같이 사용할 수 있다.
		alert(``), prompt(``), confirm(``),console.log(``) 사용시, 줄바꿈 처리 등 본 기능이 처리된다.
[1단계:확인] 2. [js] ``(백틱)으로 선언된 버스번호와 목적지를 변수로 선언하고 console.log로 줄바꾸어
               출력하세요.
	console.log(`버스번호1004
            		   		목적지 홍대입구역`)
[1단계:개념] 3. [js] js 숫자형 문자와 숫자의 데이터의 처리방식의 특징을 연산자와 비교연산식을 기준으로 기술하세요
	# 연산자 사용.
	1. 숫자형 중 정수/정수 ==> 실수 처리
		parseInt() 함수를 통해서 소숫점 절삭 처리 가능
	2. 비교연산자
		1) 모든 숫자형 문자열은 자동형변환으로 + 기호 이외에 연산이 가능하다.
		2) === : 데이터유형과 데이터 같을 때, true
		   !== : 데이터유형이나 데이터가 같지 않을 때, true
		   == : 데이터유형이 같지 않더라도 형변환되었을 때 데이터가 같으면 true
		   		'2' == 2 ==> true
[1단계:확인] 4. [js] prompt창으로 두개의 숫자를 입력받아, 사칙연산을 처리한 결과를 p태그로 출력하세요. 
	var num01=prompt("숫자 입력", "");
	var num02 = prompt("숫자 입력", "");
	var sh = document.body
	sh.innerHTML = "<p>"+(Number(num01)+Number(num02))+"</p>";
[1단계:개념] 5. [js] ==, === 차이점은 무엇인가?
	=== : 데이터유형과 데이터 같을 때, true
	== : 데이터유형이 같지 않더라도 형변환되었을 때 데이터가 같으면 true
[1단계:개념] 6. [js] js의 데이터 유형 기술하고, 확인하는 함수와 함께 기본예제로 출력처리하세요.
	# 자바스크립트의 데이터 유형
	1. 문자열형(string)
	2. 숫자형(number)
	3. boolean형
	4. 함수형(function)
	5. 객체형(object)형으로 나누어진다.
	typeof()라는 함수를 통해서 확인할 수 있다.
[1단계:개념] 7. [js] 동적 배열이란 어떤 기능을 처리할 수 있는 배열을 말하는가?
	# 동적 배열 처리
	1. js에서는 동적 배열이 기본적으로 지원되고 있다.
	2. 배열 선언
		var 배열명 = []
		var 배열명 = [데이터1, 데이터2...]
	3. 배열 활용
		배열명[index명]
		배열명.push(추가데이터)
[1단계:개념] 8. [js] 배열과 for in 구문을 관계를 정리하세요
	# for문과 배열/객체
	1. for(var index in 배열명)
		index : index번호를 문자열로 가져온다.
		배열명[index] : 배열의 index위치의 데이터를 가져온다.
[1단계:확인] 9. [js] 배열1에는 아이디 3개, 배열2에는 이름 3개를 선언하고, 반복문을 이용해서 테이블 리스트로
            출력하세요

[1단계:개념] 10. [jsp]요청값이란 무엇이고, query string과 어떤 연관 관계가 있는지 기술하세요.
	# 요청객체 request
	1. jsp는 servlet이라는 java로 감싸는 코드이기에 내장된 객체의 참조변수를
		활용하는 경우가 많다.
	2. request : HttpServletRequest의 참조변수의 내용이다.
	3. 요청객체는 요청값을 처리할 때, 주로 사용한다.
		1) 요청값 : client를 통해서 server로 전송된 데이터를 말한다.
			- query string(key=value), 쿠키값, 기타 브라우저에서 서버로 전달
				header 정보 등이 있다.
	4. 요청값(query string 처리내용)
		1) 기본 요청값 처리
			request.getParameter("요청값")
[1단계:확인] 11. [jsp]form화면에 도서관에서 빌린책명, 대출일, 대출자명을 요청값으로 넘겨 테이블 형식 화면에 출력하게 하세요(null처리)
		<form>
		빌린책명:<input type="text" name="bname"/>
		대출일:<input type="text" name="date"/>
		대출자명:<input type="text" name="name"/>
		<input type="submit"/>
		</form>
		
		String bname = request.getParameter("bname");
		if(bname==null) bname="";
		String date = request.getParameter("date");
		if(date==null) date="YYYY-MM-DD";
		String name = request.getParameter("name");
		if(name==null) name="";
		
		<h2>도서관</h2>
		<table>
			<col width="40%">
			<tr><th>빌린책명</th><td><=bname ></td></tr> 
			<tr><th>대출일</th><td><=date ></td></tr>
			<tr><th>대출자명</th><td><=name ></td></tr>
		</table>
[1단계:확인] 12. [jsp]form화면에 구매 물건 3개의 (물건명/가격)을 입력하게하고, 구매 눌렀을 때, 구매 물건 리스트와
           총비용을 출력하게 하세요.

*/

</script>
</head>
<body>

<%-- 풀이
[1단계:확인] *2. [js] ``(백틱)으로 선언된 버스번호와 목적지를 변수로 선언하고 console.log로 줄바꾸어
               출력하세요.
==> html에서만 가능!
[1단계:확인] *4. [js] prompt창으로 두개의 숫자를 입력받아, 사칙연산을 처리한 결과를 p태그로 출력하세요. 
var num01 = prompt("첫번째 숫자입력","0")
var num02 = prompt("두번째 숫자입력","0")
var show = document.querySelector("#show")
show.innerHTML += num01+" + "+num02+" = "+(parseInt(num01)+parseInt(num02))+"<br>"
show.innerHTML += num01+" - "+num02+" = "+(num01-num02)+"<br>"
show.innerHTML += num01+" * "+num02+" = "+(num01*num02)+"<br>"
show.innerHTML += num01+" / "+num02+" = "+parseInt(num01/num02)+"<br>"
[1단계:확인] *9. [js] 배열1에는 아이디 3개, 배열2에는 이름 3개를 선언하고, 반복문을 이용해서 테이블 리스트로
            출력하세요
function createInfo(){
	// ajax를 이용하면 js단에서 서버에 접근해서 데이터를 가져와서 동적인 로딩 처리가 가능하다.
	var tab01 = document.querySelector("#tab01")
	var ids = ['himan','goodman','badgirl']
	var names = ['홍길동','김길동','김영자']
	var addHTML = "<tr><th>아이디</th><th>이름</th></tr>";
	for(var idx = 0;idx<ids.length;idx++){
		addHTML+="<tr><td>"+ids[idx]+"</td><td>"+names[idx]+"</td></tr>"
	}
	tab01.innerHTML = addHTML;
}
[1단계:확인] *12. [jsp]form화면에 구매 물건 3개의 (물건명/가격)을 입력하게하고, 구매 눌렀을 때, 구매 물건 리스트와
           총비용을 출력하게 하세요.

--%>
<table id="show"></table>
<p id="show"></p>

<h2 onclick="createInfo()">회원정보 생성</h2>
<table id="tab01"></table>

<h2>구매물건</h2>
<!-- 
action 속성이 있으면 해당 화면 jsp에 데이터를 넘기고,
없으면 현재 jsp에 요청데이터를 넘긴다.
 -->
<form>
	<table>
		<tr><td>no</td><td>물건명</td><td>가격</td></tr>
		<%for(int cnt=1;cnt<=3;cnt++){ %>
		<tr><td><%=cnt %></td>
			<td><input type="text" name="pname"/></td>
			<td><input type="text" name="price"/></td></tr>
		<%} %>
		<tr><td colspan="3"><input type="submit" value="구매"/></td></tr>
	</table>
</form>
<%
int tot=0;
String buyList="";
for(int cnt=0;cnt<=3;cnt++){
	String pname=request.getParameter("pname"+cnt);
	String price=request.getParameter("price"+cnt);
	if(pname!=null) buyList+=pname+", ";
	if(price!=null) tot+=Integer.parseInt(price);
}
if(tot!=0){
%>
	<h2>구매목록리스트:<%=buyList %></h2>
	<h2>총비용:<%=tot %></h2>
<%} %>
</body>
<script>
/*

*/



</script>
</html>