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
<div id="container"></div>
<%--
2022-11-29
[1단계:개념] 1. [js] 대입연산자를 통한 변수의 대입과 객체의 대입의 메모리 할당의 차이점을 예제를 통해서 기술하세요 
[1단계:확인] 2. [js] 선수1(소속,이름,득점)을 json 객체로 선언하여, 대입연산자로 선수2할당한 경우와 ...(spread) 키워드로 
                  deep복사한 선수2를 만들어 득점을 증가했을 때, 차이를 출력하세요.
[1단계:확인] 3. [js] 회원 아이디를 입력하면 입력된 수를 옆에 표시하세요.
[2단계:확인] *3. [js] 회원 아이디를 입력시 글자수 제한을 8~16로 처리하기로 했다. 입력시, 해당 범위에 맞지 않으면
               하단에 입력범위는 8~16 표시하고 그외에는 입력가능으로 표시하게 하세요.
--%>
	<script type="text/javascript">
	function ckId(obj){
		var len = obj.value.length
		var spanOb = document.querySelector("span")
		var msg = "아이디는 8~16 입력가능합니다."
		spanOb.style.color="red"
		if(len>=8 && len<=16){
			msg = "유효한 아이디입력"
			spanOb.style.color="blue"
		}
		spanOb.innerText = msg
	}
	</script>
	회원아이디: <input type="text" name="id" onkeyup="ckId(this)"/>
	<span>아이디입력</span>
<%--
[2단계:확인] *4. [js] 팀인원등록[    ][등록] ==> 선수명을 ,단위로 구분해서 등록 버튼을 누르면 바로 밑에 테이블 형식으로 번호(1.2...)와 함께 이름이 출력되게 하세요
--%>
	<script type="text/javascript">
	function regTab(){
		var data = document.querySelector("[name=regMem]").value
		var players = data.split(",") 
		// "홍길동,김길동,신길동" ==> ["홍길동","김길동","신길동"]
		var shHTML = "<table><tr><th>번호</th><th>이름</th></tr>"
		players.forEach(function(player, idx){
			shHTML+="<tr><td>"+(idx+1)+"</td><td>"+player+"</td></tr>"
		})
		shHTML+="</table>"
		document.querySelector("#show").innerHTML = shHTML;
	}
	</script>
	<h2>팀인원등록</h2>
	<input type="text" name="regMem"/>
	<input type="button" value="등록" onclick="regTab()"/>
	<div id="show"></div>
<%-- 
[1단계:확인] *5. [jsp] 웹 서버단위로 초기 설정값을 설정할려고 한다. 처리 방식을 기술하세요
	web.xml : 설정
	application : 호출(서버단위 설정값

[1단계:확인] *6. [jsp] 웹 서버에서 DB 주소, port, sid, 계정, 비번설정해서 DB를 접속할려고 한다. 처리하고, 호출하세요.
	자바의 변경이나 서버 단위 설정정보변경(web.xml..)은 실행시 반드시 서버를 재기동 하여야 한다.
--%>
	<h2>DB 정보</h2>
	<h3>주소:<%=application.getInitParameter("ip") %></h3>
	<h3>포트:<%=application.getInitParameter("port") %></h3>
	<h3>DB명:<%=application.getInitParameter("sid") %></h3>
	<h3>계정:<%=application.getInitParameter("username") %></h3>
	<h3>패스워드:<%=application.getInitParameter("pass") %></h3>
<%-- 
[1단계:개념] 7. [jsp] 세션 scope의 4가지 범위를 예제와 함께 기술하세요.
[1단계:확인] 8. [jsp] 회원을 아이디(page), 이름(request), 포인트(session), 권한(application) 범위로 설정하여, 출력하세요.
               요청값 범위 확인, 세션값 범위 확인 클릭을 통해 해당 범위 데이터를 확인하세요.
[3단계:확인] *9. [jsp] 로그인페이지(z10_login.jsp) 아이디와 패드워드를 입력해서,  z11_checkValid.jsp로 submit처리하여
                  인증이되면 session범위로 id를  설정하여 z11_main.jsp에 @@님 로그인되었습니다. 출력하게하고,
                  그렇지 않으면 request의 forward메서드로 처리 z01_login.jsp 화면에서 로그인 실폐하였습니다가 
                  출력되게 하세요.
# 처리순서
1. 업무처리 flow 확인
	로그인페이지 아이디 패스워드 입력 ==> 인증여부에 따라서 ==> 로그인페이지
													메인페이지
2. 개발 순서
	1) 로그인 화면 구성( z10_login.jsp )
		- 4) 항목을 같이 처리해도 무방하다.
		<form action="z11_checkValid.jsp"
	2) form action 요청페이지 호출 설정(유효성 check-js)
	3) 요청값을 받은 내용을 처리( z11_checkValid.jsp )
		- DB나 조건에 의해 인증되었을 때, 세션값 설정 z11_main.jsp 이동 처리
		- 인증되지 않았을 때, forward로 z10_login.jsp 이동
			if(id.equals("himan") && pass.equals("7777")){
				session.setAttribute("id",id);
				response.sendRedirect("z12_main.jsp");
			}else{
				// request.setAttribuet()로 처리해도 되지만.
				// request.getParameter("id")로 처리가 되기에 생략가능
				request.getRequestDispatcher("z10_login.jsp"
				).forward(request, response);
			}
	4) 유효화하지 않는 id에 대한 로그인 화면 요청값 처리 ( z10_login.jsp )
		- request 객체로 요청값 확인 및 인증되지 않음 경고창 처리
		String id = request.getParameter("id")
		boolean isInvalid = false;
		if(id!=null){
			isInvalid = true;
		}
		js
		var isInvalid = <%=isInvalid%>;
		if(isInvalid) alert("<%=id%>는 인증된 계정이 아닙니다");
	5) 메인 화면에서 session 출력 z12_main.jsp
		<h2><%=session.getAttribute("id")%>님 로그인 중입니다.</h2>

--%>


</body>
<script type="text/javascript">
var div = document.querySelector("#container")
div.innerHTML+="<br>"

/*
2022-11-29
[1단계:개념] 1. [js] 대입연산자를 통한 변수의 대입과 객체의 대입의 메모리 할당의 차이점을 예제를 통해서 기술하세요 
	- 일반변수는 stack영역에 데이터를 바로 할당하기에 대입을 하더라도 다른 메모리를 사용한다.
	- 배열을 포함한 객체는 대입연산자에 의해 객체가 실제 저장하는 주소값을 할당하기에
		주소값을 복사해서 할당했으므로 동일한 객체를 참조하기에 이름이 다르지만
		동일한 객체를 바라보고 있어서 한쪽에 데이터가 변경되면 다른쪽도 동일하게 처리된다.
[1단계:확인] 2. [js] 선수1(소속,이름,득점)을 json 객체로 선언하여, 대입연산자로 선수2할당한 경우와 ...(spread) 키워드로 
                  deep복사한 선수2를 만들어 득점을 증가했을 때, 차이를 출력하세요.
var p01 = {team:"삼성",name:"홍길동",record:2}
var p02 = {...p01}
p02.record = 3
div.innerHTML += "<h2>복사후</h2>"
div.innerHTML += JSON.stringify(p01)+"<br>"
div.innerHTML += JSON.stringify(p02)+"<br>"
[1단계:확인] 3. [js] 회원 아이디를 입력하면 입력된 수를 옆에 표시하세요.
	function ckLen(obj){
		var len = obj.value.length
		var span = document.querySelector("span")
		span.innerText=len
	}
아이디:<input type="text" onkeyup="ckLen(this)"/>
<span>0</span>
[2단계:확인] 3. [js] 회원 아이디를 입력시 글자수 제한을 8~16로 처리하기로 했다. 입력시, 해당 범위에 맞지 않으면
               하단에 입력범위는 8~16 표시하고 그외에는 입력가능으로 표시하게 하세요.
	function ckLen1(obj){
		var len = obj.value.length
		var span = document.querySelector("span")
		if(len<8 || len>16){
			alert("8~16자까지 입력가능합니다")
			obj.value = obj.value.substring(8,16)
		}else{
			span.innerText=len+"/16"
		}
	}
	
아이디:<input type="text" onkeyup="ckLen1(this)"/>
<span>0/16</span>
[2단계:확인] 4. [js] 팀인원등록[    ][등록] ==> 선수명을 ,단위로 구분해서 등록 버튼을 누르면 바로 밑에 테이블 형식으로 번호(1.2...)와 함께 이름이 출력되게 하세요
팀인원등록:<input type="text" name="teamAdd"/>
<input type="button" value="등록" onclick="teamAdd()"/>
<table id="add"><tr><th>no</th><th>이름</th></tr></table>

	var idx=1
	function teamAdd(){
		var players = document.querySelector("[name=teamAdd]").value.split()
		var add = document.querySelector("#add");
		var show = "";
		players.forEach(function(player){
			show += "<tr><td>"+(idx++)+"</td><td>"+player+"</td></tr>"
		})
		add.innerHTML += show;
	}
[1단계:확인] 5. [jsp] 웹 서버단위로 초기 설정값을 설정할려고 한다. 처리 방식을 기술하세요

[1단계:확인] 6. [jsp] 웹 서버에서 DB 주소, port, sid, 계정, 비번설정해서 DB를 접속할려고 한다. 처리하고, 호출하세요.

[1단계:개념] 7. [jsp] 세션 scope의 4가지 범위를 예제와 함께 기술하세요.
	1) page 영역 : 하나의 jsp 페이지를 처리할 때 사용되는 영역
	2) request 영역 : 하나의 http 요청을 처리할 때 사용되는 영역
	3) session 영역 : 하나의 웹 브라우저와 관련된 영역
	4) application 영역 : 하나의 웹 어플리케이션 관련된 영역
[1단계:확인] 8. [jsp] 회원을 아이디(page), 이름(request), 포인트(session), 권한(application) 범위로 설정하여, 출력하세요.
               요청값 범위 확인, 세션값 범위 확인 클릭을 통해 해당 범위 데이터를 확인하세요.
pageContext.setAttribute(“id”,”아이디”)
request.setAttribute(“name”,”이름”)
session.setAttribute(“point”,”포인트”)
application.setAttribute(“auth”권한”)

<h2>아이디:< % = pageContext.getAttribute(“id”) % ></h2>
<h2>이름:< % = request.getAttribute(“name”) % ></h2>
<h2>포인트:< % = session.getAttribute(“point”) % ></h2> 
<h2>권한:< % = application.getAttribute(“auth”) % ></h2>
[3단계:확인] 9. [jsp] 로그인페이지(z10_login.jsp) 아이디와 패드워드를 입력해서,  z11_checkValid.jsp로 submit처리하여
                  인증이되면 session범위로 id를  설정하여 z11_main.jsp에 @@님 로그인되었습니다. 출력하게하고,
                  그렇지 않으면 request의 forward메서드로 다리 z01_login.jsp 화면에서 로그인 실폐하였습니다가 
                  출력되게 하세요.
*/

</script>
</html>