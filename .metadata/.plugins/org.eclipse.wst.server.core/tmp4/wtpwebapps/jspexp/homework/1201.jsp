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
<style>
iframe{border:1px solid blue;width:30%;height:30%;}
</style>
<script type="text/javascript">
function alloc(idx){
	var tname = document.querySelector("[name=tname]").value
	if(idx==0) team1.document.body.innerHTML+=tname+", "
	if(idx==1) team2.document.body.innerHTML+=tname+", "
}
</script>
</head>
<body>
선수명입력:<input type="text" name="tname"/>
<input type="button" value="1팀에 추가" onclick="alloc(0)"/>
<input type="button" value="2팀에 추가" onclick="alloc(1)"/>
<iframe name="team1" src="z23_sub.jsp"></iframe>
<iframe name="team2" src="z24_sub.jsp"></iframe>

<form>
	팀명:<input type="text" name="tname"/>
	승점:<input type="text" name="point"/>
	<input type="submit" value="전송"/>
</form>
<div style="border:1px solid green;">
	<%@ include file="z21_sub.jsp" %>
	<h2><%=tname %></h2>
	<h2><%=point %></h2>
</div>

<form>
	국가:<input type="text" name="nation"/>
	이름:<input type="text" name="name"/>
	점수:<input type="text" name="record"/>
	<input type="submit" value="전송"/>
</form>
<div style="border:1px solid green;">
	<%@ include file="z22_sub.jsp" %>
	<h2><%=nation %></h2>
	<h2><%=name %></h2>
	<h2><%=record %></h2>
</div>

<div id="container"></div>
<div id="show01"></div>
<%-- 풀이
[3단계:확인] 3. 기념일 계산 : 기준일 [    ] 계산할 일수 : [    ] [이전][이후]  
	기준일(type="date")은 default로 오늘 날짜가 년-월-일로 입력되고, 
	해당날짜를 입력 후, 버튼 클릭시, 기념을 계산할 날짜가 하단에 출력되게 하세요.
# 처리순서
1. 화면구현 : 입력/출력
2. 이벤트 핸들러 선언
	1) 필요한 DOM 객체 선언
	2) 기준일 : 년-월-일  2022-12-02 ==> 년/월/일 분리 추출..
		substring, split("-")
	3) Date()에 생성과 할당
		기능메서드 +,- setDate(getDate()_@@)
	4) 출력 DOM에 toLocaleString()
--%>
기준일 <input type="date" name="date01"/><br>
계산할 일수 : <input type="text" name="dcnt" value="0"/>
<input type="button" value="이전" onclick="calcu(false)"/>
<input type="button" value="이후" onclick="calcu(true)"/>
<p align="center"></p>
<script type="text/javascript">
var date01=document.querySelector("[name=date01]")
var dcnt=document.querySelector("[name=dcnt]")
var show01=document.querySelector("#show01")
var d = new Date()
date01.value=d.toISOString().split("T")[0]
function calcu(isAfter){
	var d = date01.value.split("-")
	//console.log(d)
	//console.log(d[1]-1+"월(-1)처리")
	// 입력
	var dt01 = new Date(d[0],d[1]-1,d[2])
	var datecnt = parseInt(dcnt.value) // 입력된 내용을 형변환
	// 날수 처리
	if( !isAfter ) datecnt = -datecnt
	console.log(datecnt)
	dt01.setDate(dt01.getDate()+datecnt)
	show01.innerText = dt01.toLocaleString()
}
// 오늘 날짜 설정.
//console.log(d.toISOString())
//console.log(d.toISOString().split("T")[0])
//console.log(d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate())
//date01.value=d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()
</script>
<%--
[1단계:확인] 7. include 액션태그를 활용하여 하위페이지 z21_sub.jsp에 월드컵 B조별리그 1위 팀명과 승점을 전송해보세요.
--%>
	<h2>B조 1위</h2>
	<h2>
	<%=request.getParameter("nation") %>
	<%=request.getParameter("point") %>
	</h2>
<%--
[1단계:확인] 8. include 지시자를 활용하여 메인헤서 최고 득점 선수 정보(국가, 이름, 점수) 정보를 form으로 입력하게 하고 
	하위페이지 z22_sub.jsp에서 요청값을 처리하고, 다시 메인에서 입력된 요청변수를 출력하게 하세요

[2단계:확인] 9. select[장바구니1/장바구니2]로 선택하게 하고 3X3 과일명을 리스트하고, 
	해당 과일명을 클릭시마다 포함된 장바구니1(iframe), 장바구니2(iframe)에 포함되게 하세요.
1. 화면구현
2. 이벤트 처리
--%>
<style>td{width:33%;height:33%}</style>
<h2>두 개의 장바구니에 담기</h2>
	<select name="cart">
		<option value="cart1">장바구니1</option>
		<option value="cart2">장바구니2</option>
	</select>
<table>
	<%
	String []fruits={"사과","바나나","오렌지","수박","키위","멜론",
					"자몽","블루베리","딸기"};
	for(int idx=0;idx<fruits.length;idx++){
		if(idx%3==0) out.print("<tr>");
		out.print("<td onclick='ch01(this.innerText)'>"+fruits[idx]+"</td>");
		if(idx%3==2) out.print("</tr>");
	}
	%>
</table>
<iframe name="cart01" src="z23_sub.jsp" height="200px"></iframe>
<iframe name="cart02" src="z24_sub.jsp" height="200px"></iframe>
<script type="text/javascript">
function ch01(fruit){
	var chCart = document.querySelector("[name=cart]").value
	if(chCart=="cart1") cart01.document.body.innerHTML+=fruit
	if(chCart=="cart2") cart02.document.body.innerHTML+=fruit
}
</script>
</body>
<script type="text/javascript">
var div = document.querySelector("#container") 
div.innerHTML+="<br>"
/*
2022-12-01
[1단계:개념] 1. 날짜객체(Date)의 기능메서드(년/월/일, 요일, 시간/분,초)를 기술하세요
	# 날짜의 호출 저장 메서드
	1. 형식
		getXXX():호출, setXXX():저장
	2. 종류(XXX)
		FullYear, Month, Date, Day, Hours, Minutes, Seconds, Milliseconds
		ex) getFullYear(), getHours(), setSeconds(25)
[1단계:확인] 2. 현재날짜로 부터 2000시간 이후의 년도, 월, 일, 시간:분 형식으로 출력하세요.
	var toDay = new Date()
	toDay.setHours(toDay.getHours()+2000)
	div.innerHTML+="현재날짜로 부터 2000시간 이후:"+toDay.toLocaleString()+"<br>" 
[1단계:확인] 3. 기념일 계산 : 기준 년 [    ] 월[    ] 일[     ] 계산할 일수 : 
	[select 100/500/1000] 이후 ==> 선택했을 때, 해당 날짜를 출력
[3단계:확인] 3. 기념일 계산 : 기준일 [    ] 계산할 일수 : [    ] [이전][이후]  
	기준일(type="date")은 default로 오늘 날짜가 년-월-일로 입력되고, 
	해당날짜를 입력 후, 버튼 클릭시, 기념을 계산할 날짜가 하단에 출력되게 하세요.
[1단계:개념] 4. 날짜의 기능메서드(년/월/일, 요일, 시간/분,초)를 기술하세요
[1단계:개념] 5. 전체 날짜 시간 기능메서드(형식 따른 내용) 기술하세요.
	# Date객체 전체 날짜 시간 출력형태
	1. 형식 : toXXXXString()
	2. XXX
		Date, GMT, ISO, UTC, JSON, Locale, LocaleDate, LocaleTime, Time
[1단계:개념] 6. include 액션태그와 include 지시자와 기능적인 차이점을 기술하세요.
	# <jsp include 액션 태그와 include 디렉티브
	1. <jsp include
		1) 요청 시간에 처리
		2) 별도의 파일로 요청 처리 흐름을 이동
		3) request 기본 객체나 <jsp param을 이용한 파라미터 전달
		4) 화면의 레이아웃의 일부분을 모듈화할 때, 주로 사용된다.
	2. <include 디렉티브
		1) jsp 파일을 자바 소스로 변환할 때 처리
		2) 현재 파일에 삽입시킴
		3) 페이지 내에 변수를 선언 후, 변수에 값 저장
		4) 다수의 jsp 페이지에서 공통으로 사용되는 변수를 지정하는 코드나 저작원과 같은 문장을 포함한다.
[1단계:확인] 7. include 액션태그를 활용하여 하위페이지 z21_sub.jsp에 월드컵 B조별리그 1위 팀명과 승점을 전송해보세요
[1단계:확인] 8. include 지시자를 활용하여 메인헤서 최고 득점 선수 정보(국가, 이름, 점수) 정보를 form으로 입력하게 하고 
	하위페이지 z22_sub.jsp에서 요청값을 처리하고, 다시 메인에서 입력된 요청변수를 출력하게 하세요
[1단계:확인] 9. 2개 iframe을 활용하여 이름을 입력하게 하고 선택하게 하여 2개 팀에 선수를 나누어 출력하게 하세요.
[2단계:확인] 9. select[장바구니1/장바구니2]로 선택하게 하고 3X3 과일명을 리스트하고, 
	해당 과일명을 클릭시마다 포함된 장바구니1(iframe), 장바구니2(iframe)에 포함되게 하세요.
*/

</script>
</html>