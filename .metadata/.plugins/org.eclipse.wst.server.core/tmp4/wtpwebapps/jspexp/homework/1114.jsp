<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a13_database.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table{border-collapse:collapse;}
		td{text-align:center;}
	</style>
</head>
<body>
<%--
2022-11-14
[1단계:개념] 1. javascript의 출력형식과 입력 형식 함수를 기술하세요.
	# 출력 형식
	1. 경고창 
		alert("출력내용");
	2. console출력
		f12으로 console 확인
		console.log("출력내용")
	3. 화면 출력
		document.write("출력내용")
		==> body하단에 DOM객체로 특정 요소객체 접근해서 처리
	# 입력 형식
	1. prompt("입력시 타이틀", "default입력값")
		리턴내용으로 데이터(문자열)를 입력받아서 처리할 수 있다.
	2. confirm("입력시 타이틀")
		리턴내용으로 boolean(true/false)를 확인과 취소에 의해서 처리할 수 있다.		
[1단계:개념] 2. DOM 객체를 단일객체와 다중 객체의 차이점을 기술하세요.
	1) 단일 객체 인식
		var obj01 = document.querySelector("선택자")
		// 단일 객체 선언과 할당.
		// 여러 개 선언되어 있더라도 첫번째 하나만 처리할 때.
		// #아이디명 형식으로 단일 내용을 선택자로 해서 처리할 때, 주로 사용된다.
	2) 다중 객체 인식
		var array = document.querySelectorAll("선택자")
		// 하나가 아닌 여러개 객체를 선언하고 각각의 DOM객체에 대한 속성을
		// 따로 따로 처리해야 할 때, 활용된다.
		// array[0].innerText="첫번째", array[1].innerText="두번째"
[1단계:확인] 3. js(javascript)의 입력창으로 물건명, 가격, 갯수를 입력받아서, 화면에 출력해보세요. 
	<h1>물건정보</h1>
	<h2>물건정보</h2>
	<h3>물건정보</h3>
</body>
<script type="text/javascript">
	var name = prompt("물건명을 입력하세요","물건명");
	document.querySelector("h1").innerText="물건명:"+name
	var price = prompt("가격을 입력하세요","가격");
	document.querySelector("h2").innerText="가격:"+price
	var cnt = prompt("갯수를 입력하세요","갯수");
	document.querySelector("h3").innerText="갯수:"+cnt
</script>
[1단계:확인] 4. 70점 이상입니까?라는 confirm 입력 받아서 내용에 따라 합격/불합격을 화면에 출력하세요.
	<h4>70점 이상입니까?</h4>
</body>
<script type="text/javascript">
	var point = confirm("70점 이상입니까?")
	document.querySelector("h4").innerText="결과:"+(point?"합격":"불합격");
</script>
[1단계:확인] 5. 테이블 3X3을 만들고, DOM을 활용하여 1행1열 1행2열 1행3열. 9개의 td의 내용을 출력하세요.

[1단계:확인] 6. 위 내용을 열마다 물건명 가격 갯수 class를 따로 선언하여 선택자로 물건명 가격 갯수가 3개 나오게 출력하세요.

[1단계:개념] 7. jsp에서 scriptlet와 expression의 차이를 기술하세요.
	scriptlet : <% %> - java에서 쓰는 모든 것을 사용할 수 있는 자바의 영역이다.
	표현(expression) : <%=%> - java쪽 연산이나 값을 html 영역에서 출력 가능하도록 해준다. 
[1단계:확인] 8. 부서정보 VO을 클래스로 선언하고, 화면에 부서정보를 출력하세요.
<% 
	Dept d = new Dept(10,"회계","서울");
%>
	<table width="50%" border>
		<tr><th>부서번호</th><td><%=d.getDeptno() %></td></tr>
		<tr><th>부서명</th><td><%=d.getDname() %></td></tr>
		<tr><th>부서위치</th><td><%=d.getLoc() %></td></tr>
	</table>
[1단계:확인] 9. 배열로 선수명3개, 선수성적3개, 소속팀3개를 선언하고 for문에 의해 테이블로 출력하세요.
<% 
	String []players = {"홍길동","김길동","신길동"};
	int []records = {100,90,80};
	String []teams = {"두산","기아","한화"};
	for(int idx=0;idx<players.length;idx++){
		System.out.println(players[idx]+":"+records[idx]+":"+teams[idx]);
	}
%>
	<h2>선수정보</h2>
	<table width="50%" style="border-collapse:collapse" border>
		<tr><th>선수명</th><th>선수성적</th><th>소속팀</th></tr>
		<%for(int idx=0;idx<players.length;idx++){ %>
		<tr><td><%=players[idx] %></td>
			<td><%=records[idx] %></td>
			<td><%=teams[idx] %></td></tr>
		<%} %>
	</table>
 --%>
<%-- 풀이
[1단계:확인] *3. js(javascript)의 입력창으로 물건명, 가격, 갯수를 입력받아서, 화면에 출력해보세요. 
<h3>물건 정보 입력..</h3>
<table id="prodTab" width="50%" border>
	<tr><th>물건명</th><td></td></tr>
	<tr><th>가격</th><td></td></tr>
	<tr><th>갯수</th><td></td></tr>
	<tr><th>총계</th><td></td></tr>
</table>
<script type="text/javascript">
	var pname = prompt("물건명","")
	var price = prompt("가격입력","0")
	var cnt = prompt("갯수입력","0")
	var tds = document.querySelectorAll("#prodTab td");
	tds[0].innerText = pname;
	tds[1].innerText = price;
	tds[2].innerText = cnt;
	tds[3].innerText = price*cnt; // js에서 +(덧셈)연산자 이외는 자동형변환을 해준다.
</script>
[1단계:확인] *5. 테이블 3X3을 만들고, DOM을 활용하여 1행1열 1행2열 1행3열. 9개의 td의 내용을 출력하세요.
<table id="tab02" height="300px" border>
	<tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td></tr>
</table>
<script type="text/javascript">
	var tds = document.querySelectorAll("#tab02 td"); // DOM객체를 배열로 받아서
	// index 번호로 접근해서 innerText 속성을 이용해서 값을 할당 처리
	tds[0].innerText="1행1열";tds[1].innerText="1행2열";tds[2].innerText="1행3열";
	tds[3].innerText="2행1열";tds[4].innerText="2행2열";tds[5].innerText="2행3열";
	tds[6].innerText="3행1열";tds[7].innerText="3행2열";tds[8].innerText="3행3열";
</script>
[1단계:확인] *6. 위 내용을 열마다 물건명 가격 갯수 class를 따로 선언하여 선택자로 물건명 가격 갯수가 3개 나오게 출력하세요.
<table id="tab03" height="300px" border>
	<tr><th>물건명</th><th>가격</th><th>갯수</th></tr>
	<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
	<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
	<tr><td class="pname"></td><td class="price"></td><td class="cnt"></td></tr>
</table>
<script type="text/javascript">
	var pnames = document.querySelectorAll("#tab03 .pname"); // DOM객체를 배열로 받아서
	var prices = document.querySelectorAll("#tab03 .price"); // DOM객체를 배열로 받아서
	var cnts = document.querySelectorAll("#tab03 .cnt"); // DOM객체를 배열로 받아서
	// index 번호로 접근해서 innerText 속성을 이용해서 값을 할당 처리
	pnames[0].innerText="사과";pnames[1].innerText="바나나";pnames[2].innerText="딸기";
	// 클래스단위로 접근하기에 클래스마다 0 index 다시 시작
	prices[0].innerText="1200";prices[1].innerText="4000";prices[2].innerText="12000";
	cnts[0].innerText="3";cnts[1].innerText="2";cnts[2].innerText="5";
</script>
[1단계:확인] *9. 배열로 선수명3개, 선수성적3개, 소속팀3개를 선언하고 for문에 의해 테이블로 출력하세요.
<%
	String []players = {"최정","송성문","김성현"};
	String []teams = {"SSG","키움","SSG"};
	double []records = {0.476,0.381,0.348};
	
	for(int idx=0;idx<players.length;idx++){
		log(players[idx]+":"+teams[idx]+":"+records[idx]);
	}
%>
<table height="300px" border>
	<tr><th>번호</th><th>소속팀</th><th>선수명</th><th>성적</th></tr>
	<%for(int idx=0;idx<players.length;idx++){ %>
	<tr><td><%=idx+1 %></td><td><%=players[idx] %></td>
		<td><%=teams[idx] %></td><td><%=records[idx] %></td></tr>
	<%} %>
</table>
 --%>
</body>
</html>