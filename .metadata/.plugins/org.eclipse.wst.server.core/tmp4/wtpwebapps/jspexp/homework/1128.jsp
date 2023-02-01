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
<div id="container"></div>
<%--
2022-11-28
[1단계:개념] 1. [jsp] 세션 scope의 첫단계 객체 pageContext 는 어디까지 데이터가 유지 되는 것인가?
# pageContext 기본 객체
1. 다른 기본 객체에 대한 접근 메서드 제공을 하는 객체이다.
2. session scope로는 page 범위로 설정되는 객체이다.
	setAttribute("페이지범위설정키",페이지범위설정값) : 페이지 범위 설정
	getAttribute("페이지범위설정키"); 저장된 페이지 범위 데이터가져오기
3. 기능 메서드
	getRequest() : request 기본 객체를 가져온다.
	getResponse() : response 기본 객체를 가져온다.
	getSession() : session 기본 객체를 가져온다.
	getServletContext() : application 객체를 가져온다.
	getServletConfig() : config 기본 객체를 가져온다.
	getOut() : our 기본 객체를 가져온다.
	getException() : exception 기본 객체를 가져온다.
	getPage() : get기본 객체를 가져온다.
[1단계:확인] 2. [jsp] 물건가격과 갯수를 pageContext로 저장하고, 저장된 내용을 출력하되, 총계까지 출력하세요.
--%>
<%
pageContext.setAttribute("price", 3000);
pageContext.setAttribute("cnt", 5);
%>
	<h2>물건가격:<%=pageContext.getAttribute("price") %></h2>
	<h2>갯수:<%=pageContext.getAttribute("cnt") %></h2>
	<h2>총계:<%=((Integer)pageContext.getAttribute("price")*(Integer)pageContext.getAttribute("cnt"))%></h2>
<%--
[1단계:확인] 3. [jsp] Dept정보를 pageContext범위로 저장하고 호출하세요.
--%>
<%
pageContext.setAttribute("dept", new Dept(10,"총무","서울"));
%>
<%
Dept dp = (Dept)pageContext.getAttribute("dept");
%>
<h1>부서번호:<%=dp.getDeptno()%></h1>
<h1>부서명:<%=dp.getDname()%></h1>
<h1>부서위치:<%=dp.getLoc()%></h1>
<%--
[1단계:개념] 4. [jsp] application 범위를 설명하고 회원 아이디와 권한 이름을 설정하고 다른 페이지에서 호출하세요.
# application 기본 객체 : 초기 파라미터
1. application은 서버(was) 단위로 데이터를 저장하고 호출되는 객체이다.
2. 서버 정보를 설정 및 로딩
	1) 서버 단위로 사용할 정보를 web.xml에서 설정하고,
	2) 모든 소스에서 해당 설정 내용을 호출하여 사용할 수 있다.
3. 초기화 파라미터 설정(web.xml)
	<comtext-param>
		<description>파라미터 설명(필수아님)
		<param-name>파라미터 이름
		<param-value>파라미터 값
4. application 기본 객체의 초기화 파라미터 관련 기능
	1) getInitParameter(String name) : 이름이 name인 웹 어플리케이션
		초기화 파라미터의 값을 읽어온다. 존재하지 않을 경우 null을 리턴한다.
	2) getInitParameterName() : 웹 어플리케이션의 초기 파라미터의 이름 목록을
		리턴한다.
--%>
<%
application.setAttribute("name","홍길동");
application.setAttribute("id","himan");
application.setAttribute("auth","관리자");
%>
<h2>이름:<%=application.getAttribute("name")%></h2>
<h2>아이디:<%=application.getAttribute("id")%></h2>
<h2>권한:<%=application.getAttribute("auth")%></h2>
<a href="1128_show.jsp">페이지 이동</a>
<%--
[1단계:확인] 5. [js] json형식의 객체로 월드컵의 팀명 소속조 승 무 패의 속성을 선언하고, for in 구문 테이블로 출력하세요.
var div = document.querySelector("#container")
var t01 = {nation:"포르투갈",part:"H조",win:1,draw:0,lose:0}
div.innerHTML+="<table><tr><th>팀명</th><th>소속조</th><th>승</th><th>무</th><th>패</th></tr><tr><td>"
	+t01['nation']+"</td><td>"+t01['part']+"</td><td>"+t01.win+"</td><td>"+t01.draw+"</td><td>"+t01.lose+"</td></tr>"
[1단계:확인] 6. [js] 월드컵의 날짜와 시간별 팀1, 팀2의 일정을 출력하는 생성자형 객체를 선언하고, 오늘 한국/가나팀 일정계획을 출력하세요.
var div = document.querySelector("#container")
	function Team(nation, part, win, eq, def){
		this.nation = nation
		this.part = part
		this.win = win
		this.eq = eq
		this.def = def
	}
	var teams = []
	teams.push(new Team("포르투갈","H조",1,0,0))
	teams.push(new Team("대한민국","H조",0,1,0))
	teams.push(new Team("우루과이","H조",0,1,0))
	teams.push(new Team("가나","H조",0,0,1))
	var show = "<h2>F조 결과</h2>"
	show+="<table><tr><th>팀명</th><th>소속조</th><th>승</th><th>무</th><th>패</th></tr>"
	teams.forEach(function(team){
		show+="<tr>"
		for(var pro in team){ 
			show+="<td>"+team[pro]+"</td>"
		}
		show+="</tr>"
	})
	show+="</table>"
	div.innerHTML=show
[1단계:확인] 7. [js] 위 내용을 내일일정 기준으로 여러 경기를 배열로 추가해서 출력하게 하세요.

[1단계:확인] 8. [js] class Product에 물건명과 가격을 선언하여 생성자를 통해 초기화하고 set get 메서드를 통해서 호출하고 저장하는
            필드를 은닉하여 처리하게 하세요.
--%>

</body>
<script type="text/javascript">
/* 풀이
[1단계:확인] 5. [js] json형식의 객체로 월드컵의 팀명 소속조 승 무 패의 속성을 선언하고, for in 구문 테이블로 출력하세요.
	1) 속성/속성값 식별
	2) for in 구문 문법확인
	3) table 기본 형식에 데이터 입력 방식 처리
*/
var team = {tname:"한국",group:"H",win:0,eq:1,def:1,
			record:function(){
				var show = "<table><tr><th>팀명</th><th>조</th><th>승</th><th>무</th><th>패</th></tr>"
				// this는 선언한 team 객체를 지칭하고, 속성이나 기능 메서드 호출할 때 사용
				for(var prop in this){ // 객체안에서 선언할 때, this 현재 객체를 지칭
					if(prop != "record"){
						show+="<td>"+this[prop]+"</td>"
					}
				}
				show+="</tr></table>"
				document.querySelector("#container").innerHTML = show
			}}
team.record()
/*
[1단계:확인] 6. [js] 월드컵의 날짜와 시간별 팀1, 팀2의 일정을 출력하는 생성자형 객체를 선언하고, 오늘 한국/가나팀 일정계획을 출력하세요.
	1) 속성 설정
	2) 출력한 내용 형식 지정
*/
var shw = document.querySelector("#container")
function Schedule(date, time, team01, team02){
	this.date = date
	this.time = time
	this.team01 = team01
	this.team02 = team02
	this.show = function(){
		
		shw.innerHTML += "<h2>"+this.date+","+this.time+","+
						this.team01+" vs "+this.team02+"</h2>"
	}
}
var sch01 = new Schedule("2022/11/28", "22:00", "한국", "가나")
sch01.show()
/*
[1단계:확인] 7. [js] 위 내용을 내일일정 기준으로 여러 경기를 배열로 추가해서 출력하게 하세요.
*/
var shw = document.querySelector("#container")
shw.innerHTML = "<h1>경기일정</h1>"
var schList = []
schList.push(new Schedule("2022/11/30","00:00","에콰도르","세네갈"))
schList.push(new Schedule("2022/11/30","00:00","네델란드","카타르"))
schList.push(new Schedule("2022/11/30","04:00","이란","미국"))
schList.forEach(function(schedule){
	schedule.show()
})
/*
[1단계:확인] 8. [js] class Product에 물건명과 가격을 선언하여 생성자를 통해 초기화하고 set get 메서드를 통해서 호출하고 저장하는
            필드를 은닉하여 처리하게 하세요.
*/
class Product{
	constructor(name, price){
		this._name = name
		this._price = price
	}
	get name(){
		return this._name
	}
	set name(name){
		this._name = name
	}
	get price(){
		return this._price
	}
	set price(price){
		this._price = price
	}
}
var prod = new Product("사과",3000)
shw.innerHTML = "<h1>"+prod.name+","+prod.price+"</h1>"
prod.name = "바나나"; prod.price=2000
shw.innerHTML += "<h1>"+prod.name+","+prod.price+"</h1>"

</script>
</html>