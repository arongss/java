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
function Team(nat,win,eq,def,gd,pt){
	this.nat = nat
	this.win = win
	this.eq = eq
	this.def = def
	this.gd = gd
	this.pt = pt
	this.prn = function(){
		return "<tr><td>"+this.nat+"</td><td>"+this.win+"</td><td>"+this.eq+"</td><td>"+
				this.def+"</td><td>"+this.gd+"</td><td>"+this.pt+"</td></tr>"
	}
}
	var grpA = []
	grpA.push(new Team("네델란드",2,1,0,4,7))
	grpA.push(new Team("세네갈",2,0,1,1,6))
	grpA.push(new Team("에콰도르",1,1,1,1,4))
	grpA.push(new Team("카타르",0,0,3,-6,0))
</script>
</head>
<body>
	<table id="tab02">
		<thead><tr><th>국가</th><th onclick="ord('win')">승</th>
				<th onclick="ord('eq')">무</th><th onclick="ord('def')">패</th>
				<th onclick="ord('gd')">GD</th><th onclick="ord('pt')">승점</th></thead>
		<tbody></tbody>
	</table>
<script type="text/javascript">
	var tab02 = document.querySelector("#tab02 tbody")
	function ord( pro ){
		grpA.sort(function(left, right){
			// js에서 객체 속성 객체명.속성, 객체명[속성] : 문자열과 변수명 구별 right.변수명
			return right[pro] - left[pro];
		})
		show2();
	}
	show2()
	function show2(){
		var addHTML = ""
		grpA.forEach(function(team){
			addHTML+=team.prn()
		})
		tab02.innerHTML=addHTML
	}
</script>

<table id="tab01">
	<col width="30%">
	<thead><tr><th>no</th><th>점수</th></tr></thead>
	<tbody></tbody>
</table>
[임의점수생성][내림차순][오름차순][상위Rank3]
<input type="button" value="임의점수생성" onclick="funRandom()"/>
<input type="button" value="내림차순" onclick="funDesc()"/>
<input type="button" value="오름차순" onclick="funAsc()"/>
<input type="button" value="상위Rank3" onclick="funRank3()"/>
<script type="text/javascript">
// 임의의 영어 점수 할당.
var engs = []
var tab01 = document.querySelector("#tab01 tbody")
function show(){
	var addHTML=""
	engs.forEach(function(eng,idx){
		addHTML+="<tr><td>"+(idx+1)+"</td><td>"+eng+"</td></tr>"
	})
	tab01.innerHTML=addHTML
}
function funRank3(){
	engs.sort(function(left, right){
		return right-left;
	})
	engs = engs.slice(0,3)
	show();
}
function funAsc(){
	engs.sort(function(left, right){
		return left-right;
	})
	show();
}
function funDesc(){
	engs.sort(function(left, right){
		return right-left;
	})
	show();
}
funRandom(); // 초기에 로딩을 위해 처리
function funRandom(){
	engs = []
	for(var cnt=1;cnt<=10;cnt++){
	engs.push(parseInt(Math.random()*101))
	}
	show();
}
</script>
<%--
# 

--%>
<div id="container"></div>
</body>
<script type="text/javascript">
var div = document.querySelector("#container")
/*
2022-11-30
[1단계:개념] 1. [js] 배열과 반복문 처리형식 4가지를 예제를 통해서 설명하세요.
	# 배열과 반복문 처리
	1. for문
		1) for(var idx=0;idx<배열.length;idx++){
				배열[idx] : 배열의 index로 접근해서 가져온다.
		2) for(var idx in 배열)
			idx : 배열의 index를 문자열로 가져온다.
			배열[idx] : 배열에 할당된 값을 가져온다.
		3) for(var 단위데이터 of 배열)
			배열의 단위데이터를 변수에 할당하여 가져온다.
		4) 배열.forEach(function(단위데이터, index, 배열전체{}))
[1단계:확인] 2. [js] Math.random(), parseInt()를 이용해서 학생 10명의 국어점수를 임의로 발생하여 배열 할당하여 테이블로 출력하세요.
	var show="<h2>학생 10명의 국어점수</h2>"
	var studs = []
	for(var no=1;no<=10;no++){
		var stud = {}
		stud.no = no
		stud.kor = parseInt(Math.random()*101)
		studs.push(stud)
	}
	div.innerHTML=show
	studs.sort(function(left,right){ 
		return right.kor-left.kor;
	})
	var show = "<table><tr><th>학생번호</th><th>국어점수</th></tr>"
	studs.forEach(function(stud){
		show+="<tr><td>"+stud.no+"</td><td>"+stud.kor+"</td></tr>"
	})
	show+="</table>"
	div.innerHTML+=show
[1단계:확인] 3. [js] 위 2번 문제를 기능메서드를 활용하여 1~3등을 출력하세요.
	var kor = []
	for(var cnt=1;cnt<=10;cnt++){
		kor.push(parseInt(Math.random()*101))
	}
	kor.sort(function(left,right){ 
		return right-left;
	})
	div.innerHTML+=""+kor+"<br>"
	div.innerHTML+="1~3등 국어점수: "+kor.slice(0,3)+"<br>"
[1단계:확인] 4. [js] 위 2번 문제를 메서드를 활용하여 최대점수와 최저점수를 삭제처리하고 출력하세요.
	var kor = []
	for(var cnt=1;cnt<=10;cnt++){
		kor.push(parseInt(Math.random()*101))
	}
	div.innerHTML+=""+kor+"<br>"
	kor.sort(function(left,right){ 
		return left-right;
	})
	div.innerHTML+="오름차순정렬:"+kor+"<br>"
	div.innerHTML+="최고점수삭제:"+kor.pop()+"<br>"
	kor.sort(function(left,right){ 
		return right-left;
	})
	div.innerHTML+="내림차순정렬:"+kor+"<br>"
	div.innerHTML+="최저점수삭제:"+kor.pop()+"<br>"
	div.innerHTML+="최고,최저점수 삭제 후:"+kor+"<br>"
[3단계:확인] 5. [js] 영어점수 10명을 초기화면에 테이블로 만들고 기능버튼에 따라 처리한 테이블 내용을 출력하세요
               [임의점수생성][내림차순][오름차순][상위Rank3]

[1단계:개념] 6. [js] sort()기능메서드의 한계점을 [1,5,92,124,234]를 기준으로 설명하세요.
	# sort의 처리
	1. 기본 sort()는 첫번째자리부터 비교해서 정렬하고,
		그다음 자리에 데이터를 비교하기에, 자리수가 같지 않으면
		원하는 정렬이 처리되지 않는다.
	2. 숫자의 데이터를 비교해서 정리를 위한 처리..
		배열.sort(function(){
			return left - right; // 0, +, - 값에 따라서 정렬을 처리
		})
[1단계:확인] 7. [js] 월드컵 선수(나라,이름,골,도움)를 3명을 배열로 설정한 후, 초기 화면을 테이블로 출력하고,
                   골기준으로 내림차순 정렬처리하는 화면을 처리하세요.
	var player = []
	player.push({nation:"한국",name:"손흥민",goal:0,assist:0})
	player.push({nation:"한국",name:"조규성",goal:2,assist:0})
	player.push({nation:"한국",name:"이강인",goal:0,assist:1})
	var show = "<h2>월드컵 선수</h2>"
	show+="<table>"
	show+="<tr><th>나라</td><th>이름</td><th>골</td><th>도움</td></tr>"
	player.sort(function(left,right){
		return right.goal-left.goal
	})
	player.forEach(function(p){
		show+="<tr><td>"+p.nation+"</td><td>"+p.name+"</td><td>"+
			p.goal+"</td><td>"+p.assist+"</td></tr>"
	})
	show+="</table>"
	div.innerHTML=show
[1단계:개념] 8. [js] 특정 조의 팀속성(국가, 승점)를 배열로 등록한 후(승점은 임의로 입력), 승점기준으로 내림차순으로 테이블로 출력하세요.
	var team = []
	team.push({nation:"대한민국",score:1})
	team.push({nation:"가나",score:3})
	team.push({nation:"우루과이",score:1})
	team.push({nation:"포르투갈",score:6})
	var show = "<h2>월드컵 H조 순위</h2>"
	show+="<table>"
	show+="<tr><th>국가</td><th>승점</td></tr>"
	team.sort(function(left,right){
		return left.score-right.score
	})
	team.forEach(function(t){
		show+="<tr><td>"+t.nation+"</td><td>"+t.score+"</td></tr>"
	})
	show+="</table>"
	div.innerHTML=show
[3단계:개념] 8. [js] 특정 조를 데이터로 넣고, 팀속성(국가,승,무,패,골득실,승점)을 기준으로 테이블로 출력한 후, 테이블 상단항목을
            클릭시, 해당 내용의 내림차순으로 정렬되게 하세요.

*/
/* 풀이
2022-11-30
[1단계:개념] 1. [js] 배열과 반복문 처리형식 4가지를 예제를 통해서 설명하세요.
[1단계:확인] 2. [js] Math.random(), parseInt()를 이용해서 학생 10명의 국어점수를 임의로 발생하여 배열 할당하여 테이블로 출력하세요.
[1단계:확인] *3. [js] 위 2번 문제를 기능메서드를 활용하여 1~3등을 출력하세요.
*/
var kors = []
for(var cnt=1;cnt<=10;cnt++){
	kors.push(parseInt(Math.random()*101))
}
var con = document.querySelector("#container")
con.innerHTML = kors+"<br>"
kors.sort(function(left, right){
	return right - left; // 내림차순 sorting 처리
})
var rank3 = kors.slice(0,3)
con.innerHTML = rank3+"<br>"
/*
[1단계:확인] *4. [js] 위 2번 문제를 메서드를 활용하여 최대점수와 최저점수를 삭제처리하고 출력하세요.
내림차순 정렬 후는
최대 점수는 첫번째 데이터 : splice(0,1) - 첫번째 위치에 있는 데이터 삭제 처리
최저 점수는 마지막 데이터 : pop() - 마지막 데이터 삭제
*/
kors.splice(0,1); kors.pop()
con.innerHTML+=kors+"<br>"
/*
[3단계:확인] *5. [js] 영어점수 10명을 초기화면에 테이블로 만들고 기능버튼에 따라 처리한 테이블 내용을 출력하세요
               [임의점수생성][내림차순][오름차순][상위Rank3]
	1) 영어점수 10명 임의 점수 배열 만들기
	2) DOM 테이블에 출력하기
	3) 기능 버튼을 핸들러 함수를 통해 호출해서 출력처리 하기

// body 부분 table선언
<table id="tab01">
	<thead><tr><th>no</th><th>점수</th></tr></thead>
	<tbody></tbody>
</table>
[임의점수생성][내림차순][오름차순][상위Rank3]
<input type="button" value="임의점수생성"/>
<input type="button" value="내림차순"/>
<input type="button" value="오름차순"/>
<input type="button" value="상위Rank3"/>

// 임의의 영어 점수 할당.
var engs = []
var tab01 = document.querySelector("#tab01 tbody")
funRandom();
function funRandom(){
	engs = []
	for(var cnt=1;cnt<=10;cnt++){
	engs.push(parseInt(Math.random()*101))
	}
	var addHTML=""
	engs.forEach(function(eng,idx){
		addHTML+="<tr><td>"+(idx+1)+"</td><td>"+eng+"</td></tr>"
	})
	tab01.innerHTML=addHTML
}

[1단계:개념] 6. [js] sort()기능메서드의 한계점을 [1,5,92,124,234]를 기준으로 설명하세요.
[1단계:확인] 7. [js] 월드컵 선수(나라,이름,골,도움)를 3명을 배열로 설정한 후, 초기 화면을 테이블로 출력하고,
                   골기준으로 내림차순 정렬처리하는 화면을 처리하세요.
[1단계:개념] *8. [js] 특정 조의 팀속성(국가, 승점)를 배열로 등록한 후(승점은 임의로 입력), 승점기준으로 내림차순으로 테이블로 출력하세요.
[3단계:개념] *8. [js] 특정 조를 데이터로 넣고, 팀속성(국가,승,무,패,골득실,승점)을 기준으로 테이블로 출력한 후, 테이블 상단항목을
            클릭시, 해당 내용의 내림차순으로 정렬되게 하세요.
function Team(nat,win,eq,def,gd,pt){
	this.nat = nat
	this.win = win
	this.eq = eq
	this.def = def
	this.gd = gd
	this.pt = pt
	this.prn = function(){
		return "<tr><td>"+this.nat+"</td><td>"+this.win+"</td><td>"+this.eq+"</td><td>"+
				this.def+"</td><td>"+this.gd+"</td><td>"+this.pt+"</td></tr>"
	}
	var grpA = []
	grpA.push(new Team("네델란드",2,1,0,4,7))
	grpA.push(new Team("세네갈",2,0,1,1,6))
	grpA.push(new Team("에콰도르",1,1,1,1,4))
	grpA.push(new Team("카타르",0,0,3,-6,0))
}
*/
</script>
</html>