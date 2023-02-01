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

<%--
2022-12-05
[1단계:개념] 1. JSON객체의 형변환메서드 2개의 기능을 예제를 통해서 기술하세요.
	JSON.stringify() : 자바스크립트 객체를 JSON문자열로 변환
	JSON.parse() : JSON문자열을 자바스크립트 객체로 변환
[1단계:확인] 2. 임의의 구구단 출력 h2로 출력 eval함수를 활용하여 3X3 테이블에  0~9 정답확인 문자열 생성
            @@@ X @@  = ?
            테이블 ==> cell 클릭시 ?에 입력될 숫자를 출력하고,
            정답확인 버튼 클릭시 출력되게 처리. 정답여부를 출력되게 하세요
--%>
	
<%--
[1단계:개념] 3. DOM의 선택자의 종류와 출력기능 속성을 구분하여 기술하세요.
	1) dom 객체의 선택자
		- css의 선택자를 통하여 객체를 선택할 수 있다.
			태그, #아이디, .클래스
			document.querySelector("h1")
		- 단일
			var ch01 = document.querySelector("#ch01")
		- 다중선택
			var cls01 = document.querySelectorAll(".cls01")
		복합선택자,[속성=속성값] 등 css의 선택자를 활용하여 선택자 처리를 할 수 있다.	
[1단계:확인] 4. 4X4 테이블을 1~16까지 출력하고, 가장 밑라인 클래스로 cls01은 배경색상을 노랑색 ,  왼쪽라인 클래스로 cls02 글자색상을 파랑색, 
      왼쪽라인 클래스로 cls03 빙고라고 표시, 위쪽 라인은 클래스로 cls04 처리하고 글자를 오른쪽 정렬 처리 처리되게 하세요.

<table>
	<tr class="cls04"><td class="cls02">1</td><td>2</td><td>3</td><td>4</td></tr>
	<tr><td class="cls02">5</td><td>6</td><td>7</td><td>8</td></tr>
	<tr><td class="cls02">9</td><td>10</td><td>11</td><td>12</td></tr>
	<tr class="cls01"><td class="cls02">13</td><td>14</td><td>15</td><td>16</td></tr>
</table>
<script>
var cls01 = document.querySelector(".cls01")
cls01.style.background="yellow"
var cls02 = document.querySelectorAll(".cls02")
cls02[0].style.color="blue"
cls02[1].style.color="blue"
cls02[2].style.color="blue"
cls02[3].style.color="blue"
</script>

[1단계:개념] 5. DOM의 css 속성과 일반 속성의 차이점을 기술하세요.
	.속성 = 속성값 : 태그가 가지고 있는 기본 속성을 읽어 오거나 설정할 수 있다.
	.style.속성 = 속성값 : css 속성이 적용된 내용을 설정할 수 있다.
[1단계:개념] 6. DOM의 innerText와 innerHTML의 차이점을 기술하세요.
	.innerHTML : 화면에 출력할 내용을 랜더링(html 적용)한 내용의 태그를 가져오거나 처리하는 속성
	.innerText : 화면에 출력할 내용을 html 적용하지 않는 순서한 내용 자체를 가져오거나 랜더링하지 않은 속성
[1단계:확인] 7. 5X5 테이블을 임의의 25개 숫자(0~100)로 출력하고, 이 중 짝수 열의 글자색상을 파랑색으로 출력하세요.

	<table id="tab01">
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
	</table>
	<script type="text/javascript">
	for(var idx=0;idx<=25;idx++){
		var tds = document.querySelectorAll("#tab01 td")
		tds[idx].innerText = parseInt(Math.random()*101)
		if(idx%2==0){
			tds[idx].style.color="blue"
		}	
	}
	</script>
--%>
<%-- 풀이
2022-12-05
[1단계:개념] 1. JSON객체의 형변환메서드 2개의 기능을 예제를 통해서 기술하세요.
[1단계:확인] *2. 임의의 구구단 출력 h2로 출력 eval함수를 활용하여 4X3 테이블에  0~9 정답확인 문자열 생성
            @@@ X @@  = ?
            테이블 ==> cell 클릭시 ?에 입력될 숫자를 출력하고,
            정답확인 버튼 클릭시 출력되게 처리. 정답여부를 출력되게 하세요
	1) 화면구현
		//- 문제출력 h2, ?(정답입력 출력내용 span)
		- 테이블 구현
			0~9, 상단에 문제출력 td, 입력한 정답출력 td, 입력 초기화 td, 정답확인 td
	2) DOM 객체 선언 및 임의의 문제 출력
		//var gugu = document.querySelector("h2")
		//var inNum = document.querySelector("span")
		var tds = document.querySelector("#tab01 td")
		//var gugu = tds[0]
		//var inNum = tds[1]
		ranGugu(); // 초기 문제
		var corNum = 0
		function ranGugu(){
			var grade = Math.floor(Math.random()*8+2)
			var cnt = Math.floor(Math.random()*9+1)
			corNum = grade*cnt
			tds[0].innerText = grade + " X " + cnt
		}
	3) 이벤트 처리(익명)
		- 클릭시, ?에 입력한 숫자 출력
		for(var idx=0;idx<tds.length;idx++){
			tds[idx].onclick=function(){
				if( this.innerText == "정답확인" ) {
					// 입력한 내용과 정답여부가 같은지
					if(tds[1].innerText==corNum){
						alert("정답\n다음 문제");
						ranGugu();
					}else{
						alert("오답\n다시 풀어보세요");
						tds[1].innerText=""
					}
				}else{
					// 번호를 클릭시, 입력한 내용을 출력하는 곳에 출력 처리
					tds[1].innerText += this.innerText
					if( this.innerText == "C" ) tds[1].innerText=""
				}
			}
		}
--%>
<h2></h2>
<table id="tab01">
	<col width="33%"><col width="33%"><col width="33%">
	<tr style="height:40px"><td colspan="2">@@ X @@</td><td>0</td></tr>
	<tr><td>7</td><td>8</td><td>9</td></tr>
	<tr><td>4</td><td>5</td><td>6</td></tr>
	<tr><td>1</td><td>2</td><td>3</td></tr>
	<tr><td>C</td><td>0</td><td>정답확인</td></tr>
</table>
<script>
var tds = document.querySelectorAll("#tab01 td")
var corNum = 0
ranGugu(); // 초기 문제
function ranGugu(){
	var grade = Math.floor(Math.random()*8+2)
	var cnt = Math.floor(Math.random()*9+1)
	corNum = grade*cnt
	tds[0].innerText = grade + " X " + cnt
}
for(var idx=0;idx<tds.length;idx++){
	tds[idx].onclick=function(){
		if( this.innerText == "정답확인" ) {
			// 입력한 내용과 정답여부가 같은지
			if(tds[1].innerText==corNum){
				alert("정답\n다음 문제");
				ranGugu();
			}else{
				alert("오답\n다시 풀어보세요");
			}
			tds[1].innerText=""
		}else{
			// 번호를 클릭시, 입력한 내용을 출력하는 곳에 출력 처리
			tds[1].innerText += this.innerText
			if( this.innerText == "C" ) tds[1].innerText=""
		}
	}
}
</script>
<%--
[1단계:개념] 3. DOM의 선택자의 종류와 출력기능 속성을 구분하여 기술하세요.
[1단계:확인] *4. 4X4 테이블을 1~16까지 출력하고, 가장 밑라인 클래스로 cls01은 배경색상을 노랑색 ,  왼쪽라인 클래스로 cls02 글자색상을 파랑색, 
      왼쪽라인 클래스로 cls03 빙고라고 표시, 위쪽 라인은 클래스로 cls04 처리하고 글자를 오른쪽 정렬 처리 처리되게 하세요.
	1) 화면 구현
		<td class="cls01">
		<td class="cls02">
		<td class="cls03">
		<td class="cls04">
	2) DOM 객체 호출
		var tds2 = document.querySelectorAll("#tab02 td")
		var cls01 = document.querySelectorAll(".cls01")
		var cls02 = document.querySelectorAll(".cls02")
		var cls03 = document.querySelectorAll(".cls03")
		var cls04 = document.querySelectorAll(".cls04")
		for(var idx=0;idx<tds2.length;idx++){
			tds2[idx].innerText=idx+1+"번째"
		}
		for(var idx=0;idx<cls01.length;idx++){
			cls01[idx].style.background="yellow"
		}
		for(var idx=0;idx<cls02.length;idx++){
			cls02[idx].style.color="blue"
		}
		for(var idx=0;idx<cls03.length;idx++){
			cls03[idx].innerText="빙고"
		}
		for(var idx=0;idx<cls04.length;idx++){
			cls04[idx].style.textAlign="right"
		}
--%>
<h2>테이블 DOM 클래스 선택자</h2>
<table id="tab01" height="300px">
	<col width=25%><col width=25%><col width=25%><col width=25%>
	<tr><td class="cls04 cls02 cls03">1</td><td class="cls04">2</td><td class="cls04">3</td><td class="cls04">4</td></tr>
	<tr><td class="cls02 cls03">5</td><td>6</td><td>7</td><td>8</td></tr>
	<tr><td class="cls02 cls03">9</td><td>10</td><td>11</td><td>12</td></tr>
	<tr><td class="cls01 cls02 cls03">13</td><td class="cls01">14</td><td class="cls01">15</td><td class="cls01">16</td></tr>
</table>
<script type="text/javascript">
var tds2 = document.querySelectorAll("#tab02 td")
var cls01 = document.querySelectorAll(".cls01")
var cls02 = document.querySelectorAll(".cls02")
var cls03 = document.querySelectorAll(".cls03")
var cls04 = document.querySelectorAll(".cls04")
for(var idx=0;idx<tds2.length;idx++){
	tds2[idx].innerText=idx+1+"번째"
}
for(var idx=0;idx<cls01.length;idx++){
	cls01[idx].style.background="yellow"
}
for(var idx=0;idx<cls02.length;idx++){
	cls02[idx].style.color="blue"
}
for(var idx=0;idx<cls03.length;idx++){
	cls03[idx].innerText="빙고"
}
for(var idx=0;idx<cls04.length;idx++){
	cls04[idx].style.textAlign="right"
}
</script>
<%--
[1단계:개념] 5. DOM의 css 속성과 일반 속성의 차이점을 기술하세요.
[1단계:개념] 6. DOM의 innerText와 innerHTML의 차이점을 기술하세요.
[1단계:확인] *7. 5X5 테이블을 임의의 25개 숫자(0~100)로 출력하고, 이 중 짝수 열의 글자색상을 파랑색으로 출력하세요.
1. 화면구현
2. DOM객체 선택
	var tds3 = document.querySelectorAll("#tab03 td")
	var tdsEven = document.querySelectorAll("#tab02 td:nth-child(2n)")
	for(var idx=0;idx<tds3.length;idx++){
		tds3[idx].innerText = Math.floor(Math.random()*101);
	}
	for(var idx=0;idx<tdsEven.length;idx++){
		tdsEven[idx].style.color = "blue";
	}
 --%>
<table id="tab03">
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
</table>
<script type="text/javascript">
var tds3 = document.querySelectorAll("#tab03 td")
var tdsEven = document.querySelectorAll("#tab03 td:nth-child(2n)")
for(var idx=0;idx<tds3.length;idx++){
	tds3[idx].innerText = Math.floor(Math.random()*101);
}
for(var idx=0;idx<tdsEven.length;idx++){
	tdsEven[idx].style.color = "blue";
}
</script>
<div id="container"></div>
</body>
<script type="text/javascript">
/*

*/
var div = document.querySelector("#container")
div.innerHTML+="<br>"
</script>
</html>