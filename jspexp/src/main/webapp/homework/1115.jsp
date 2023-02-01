<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	import="java.util.*"
   	import="jspexp.a13_database.*"
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
2022-11-15
[1단계:개념] 1. jsp를 이용하여 객체형 배열을 처리할려고 한다. 처리하는 순서를 기술하세요.
	객체형 List 처리..
	1. 구조만들기/import 처리
	2. 리스트로 데이터 넣기
	3. 반복문 처리하기..
[1단계:확인] 2. Computer 클래스에 제조사, 가격, 종류 속성을 선언하고, jsp 화면에 테이블로 리스트를 출력하세요.
Computer cp = new Computer("삼성",1000000,"노트북");
	<table width="50%" border>
		<tr><th>제조사</th><td>cp.getCompany()</td></tr>
		<tr><th>가격</th><td>cp.getPrice()</td></tr>
		<tr><th>종류</th><td>cp.getKind()</td></tr>
	</table>
[1단계:개념] 3. jsp에서 DB처리를 위해 필요한 설정을 기술하세요.
	WEB-INF 하위에 ojdbc8-12.2.0.1.jar를 넣는다.
	==> 사용하고자 하는 파일을 import
[1단계:확인] 4. dao에 부서정보를 찾아서, jsp로 부서정보를 출력하세요.

[1단계:확인] 5. dao에 회원정보리스트 처리 기능메서드를 추가하고 jsp로 회원정보리스트를 출력하세요.

[1단계:개념] 6. js의 함수의 기본형식을 기술하고 매개변수로 밑면과 높이를 전달하고, 삼각형의 면적으로 리턴값을 alert() 출력되게 처리해보세요.
	# js의 함수 처리
	1. 함수는 기능처리를 위한 코드의 집합체라고 할 수 있다.
	2. 기본 형식
		function 함수명(매개변수,...){
			프로세스 처리
			return 리턴값;
		}
	function calcu(bottom, height){
		var area = (bottom*height)/2;
		return area;
	}
	alert(calcu(30,15));
[1단계:개념] 7. 이벤트와 이벤트핸들러 함수와의 관계를 실제 이벤트 처리 코드를 기준으로 설명하세요.
	# 이벤트와 이벤트핸들러 함수 처리
	1. js에서의 이벤트
		js에서는 속성으로 on이벤트명="이벤트핸들러"를 통해서 해당 이벤트가 발생을 했을 때,
		처리할 코드를 특정한 함수를 통해서 정의한 내용을 수행할 수 있다.
	2. 처리 순서
		1) 이벤트 핸들러 함수 선언 : 이벤트를 통해 처리할 내용 함수 선언
		2) 이벤트 속성 선언 및 이벤트 핸들러 함수 호출
			태그 on이벤트명="이벤트핸들러함수()"
		3) 이벤트 핸들러에 매개변수 전달
			- 함수에 매개변수를 선언하여 문자열, 숫자데이터를 전달할 수 있다.
[1단계:확인] 8. 학생의 이름 정보와 국어,영어,수학점수를 입력 후, 클릭시, 총점과 평균이 출력되게 하세요.
function inform(){
	var name = document.querySelector("[name=name]").value;
	var kor = document.querySelector("[name=kor]").value;
	var eng = document.querySelector("[name=eng]").value;
	var math = document.querySelector("[name=math]").value;
	var tot = Number(kor)+Number(eng)+Number(math);
	var avg = (Number(kor)+Number(eng)+Number(math))/3;
	var h3Obj = document.querySelector("h3");
	h3Obj.innerText = name+"의 총점:"+tot+", 평균:"+avg
}
	이름:<input type="text" name="name"/>
	국어점수:<input type="text" name="kor"/>
	영어점수:<input type="text" name="eng"/>
	수학점수:<input type="text" name="math"/>
	<input type="button" value="합산" onclick="inform()"/><br>
	<h3>학생정보</h3>	
[1단계:확인] 9. 1~9까지 번호가 있는 3X3테이블을 만들고 해당 td를 클릭시 마다, 클릭한 td만 배경색상과 글자 색상이 변경되게 처리하세요.
function chColor(obj){
	obj.style.color="white";
	obj.style.background=obj.innerText
}
	<table>
		<tr><td onclick="chColor(this)">red</td><td onclick="chColor(this)">orange</td><td onclick="chColor(this)">yellow</td></tr>
		<tr><td onclick="chColor(this)">green</td><td onclick="chColor(this)">blue</td><td onclick="chColor(this)">navy</td></tr>
		<tr><td onclick="chColor(this)">purple</td><td onclick="chColor(this)">pink</td><td onclick="chColor(this)">black</td></tr>
	</table>
[3단계:확인] 10. 좋아요버튼과 싫어요 버튼 만들고, 좋아요 버튼을 누를 때 마다 
                  하단에 ♥가 증가되고, 싫어요 버튼을 누를 때 마다♡ 증가 되게 처리해보세요 
function like(obj){
	document.querySelector("#likeList").innerText+=obj.innerText+"♥";
}
function dislike(obj){
	document.querySelector("#likeList").innerText+=obj.innerText+"♡";
}
	<input type="button" value="좋아요" onclick="like(this)"/>
	<input type="button" value="싫어요" onclick="dislike(this)"/>
	<h2>좋아요리스트:</h2>
	<h2 id="likeList"></h2>
*/
/* 풀이
[1단계:개념] *3. jsp에서 DB처리를 위해 필요한 설정을 기술하세요.
	1) jdbc드라이버를 설정(웹프로그래밍단위)
		\webapp\WEB-INF\lib
	2) dao를 위한 설정처리(ip,port,sid,계정,비번)
		연결부분확인
	3) dao을 기능 메서드 구현..
	4) jsp에서 해당 dao import, vo import
	
[1단계:확인] *4. dao에 부서정보를 찾아서, jsp로 부서정보를 출력하세요.
	1) 부서정보 기능 메서드 확인
	2) jsp import 확인
	3) dao객체 생성
	4) 반복문을 통해서 출력확인
	5) script(scriplet, expression)을 통해서 table형식으로 출력 처리.
	// import jspexp.vo.* 삭제 처리..
[1단계:확인] *5. dao에 회원정보리스트 처리 기능메서드를 추가하고 jsp로 회원정보리스트를 출력하세요.
1. dao 기능메서드 처리 순서
	1) sql 확인
	2) vo 추가
	3) 기능메서드 추가
	4) dao 호출
	5) for script
 */
</script>
</head>
<body>
<%
	A06_PareparedDao dao = new A06_PareparedDao();
%>
<h2>부서정보</h2>
<table>
	<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
	<%for(Dept d:dao.getDeptList(new Dept("",""))){ %>
	<tr><td><%=d.getDeptno() %></td><td><%=d.getDname() %></td>
		<td><%=d.getLoc() %></td></tr>
	<%} %>
</table>
</body>
</html>