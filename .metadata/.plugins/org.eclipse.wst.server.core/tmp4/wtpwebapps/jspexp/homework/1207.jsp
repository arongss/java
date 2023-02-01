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
2022-12-07
[1단계:개념] 1. 쿠키값의 생명주기(생성,변경,소멸)을 서버와 클라이언트 위치와 관계에서 코드와 함께 설명하세요.
	1. 쿠키의 생성 시점
		1) 쿠키는 클라이언트에서 요청에 의해서, 서버안에서 객체를 생성(key,value)
			하여 response객체에 쿠키를 추가하여 클라이언트에 보내어지면 
			클라이언트(브라우저)에서 지정한 경로에 저장이된다.
	2. 쿠키의 활용
		1) 쿠키가 서버에서 생성되어 클라이언트에 저장되면, 다시 요청객체 request에
			의해 서버에 보내지면서 쿠키값을 key/value 형식으로 호출하여 사용할 수 있다.
		2) 쿠키는 동일한 키로 addCookie로 할당하면 동일한 키로 설정된 내용을 변경해준다.
			price ==> 3000
			price ==> 5000 (최종으로 값으로 설정된 값이 해당 쿠키의 key에 할당된 값이 된다)
	3. 쿠키의 소멸
		1) 쿠키는 서버에서 해당 쿠키의 키명으로 유효시간으로 기능메서드로 설정하여
			다시 클라이언트로 보내지면, 해당 시간이 지나면 클라이언트 안에서 사라지게 된다.
			삭제할 쿠키를 참조변수로 가져와서 setMaxAge(0)으로 설정하여
			다시 response.addCookie(참조변수); 처리하면 해당 쿠키값을 삭제가 된다.
[1단계:확인] 2. 쿠키값(coffee/americano)로 설정 후, 페이지 링크로 설정된 쿠키값을 리스트하세요.
[1단계:확인] 3. 쿠키값(coffee/vanilla)로 변경후, 페이지 링크로 설정된 쿠키값을 리스트하세요.
[1단계:확인] 4. 쿠키값(커피) 삭제 후,  페이지 링크로 설정된 쿠키값을 리스트하세요.
[1단계:개념] 5. form 요소객체의 주요 속성을 기술하세요.
	# form객체의 내용을 통한 js 요소 객체 처리
	1. form 하위 요소객체의 특징
		1) 선택자 : name, id
			document.querySelector("[name=속성값]")
			var dom01 = document.querySelector("#아이디명")
		2) 속성값 변경 : value를 통해서 처리
			dom01.value
			dom01.value="할당처리"
[1단계:확인] 6. 오늘 월드컵 대전 팀과 결과를 날짜/팀1/팀2/결과를 입력해서 테이블로 추가리스트 되게 처리하세요.

	<h2>월드컵 대전 팀</h2>
	날짜:<input type="text" name="date"/>
	팀1:<input type="text" name="team1"/>
	팀2:<input type="text" name="team2"/>
	결과:<input type="text" name="result"/>
	<input type="button" value="추가" onclick="add()"/>
	<table id="tab01">
		<thead>
		<tr><th>날짜</th><th>팀1</th><th>팀2</th><th>결과</th></tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<script type="text/javascript">
	var dateObj = document.querySelector("[name=date]")
	var team1Obj = document.querySelector("[name=team1]")
	var team2Obj = document.querySelector("[name=team2]")
	var resultObj = document.querySelector("[name=result]")
	var rsObj = document.querySelector("#tab01 tbody")
	function add(){
		rsObj.innerHTML += "<tr><td>"+dateObj.value+"</td><td>"+
			team1Obj.value+"</td><td>"+team2Obj.value+"</td><td>"+
			resultObj.value+"</td></tr>";
		dateObj.value=""; dateObj.focus()
		team1Obj.value="";
		team2Obj.value="";
		resultObj.value="";
	}
	</script>

[1단계:확인] 7. 가위/바위/보를 select로 선택하게 하고, 컴퓨터와 play를 클릭해서, 나의 선택과 컴퓨터 선택 결과가 나와서 승/무/패가 출력되게 하세요.
가위0 바위1 보2
바위1 보2 가위0
보2 가위0 바위1

	<h2>가위바위보게임</h2>
	컴퓨터:<input type="text" name="com"/>
	나:<select>
		<option value="0">가위</option>
		<option value="1">바위</option>
		<option value="2">보</option>
		</select>
	<input type="button" value="합산" onclick="cal()"/>
	<script type="text/javascript">
	
	</script>

[1단계:확인] 8. [@@][select +,-,*,/][@@] [결과확인] 임의의 숫자 두개가 나오고 연산자의 선택하고 결과확인에 따라 연산처리결과가 하단에 h2로 출력되게 하세요
	<input type="text" name="num01"/>
	<select onchange="changeValue(this)">
		<option value="0">+</option>
		<option value="1">-</option>
		<option value="2">*</option>
		<option value="3">/</option>
	</select>
	<input type="text" name="num02"/>
	<input type="button" value="계산" onclick="cal()"/>
	<p id="show"></p>
	<script type="text/javascript">
	var num01Obj = document.querySelector("[name=num01]")
	var num02Obj = document.querySelector("[name=num02]")
	var pObj = document.querySelector("#show")
	num01Obj.value=Math.floor(Math.random()*8+2)
	num02Obj.value=Math.floor(Math.random()*8+2)
	function cal(){
		var num01 = Number(num01Obj.value);
		var num02 = Number(num02Obj.value);
		var plu = num01 + num02;
		var min = num01 - num02;
		var mul = num01 * num02;
		var div = num01 / num02;
		if(option.value==0){
			pObj.innerText = num01+" + "+num02+" = "+plu;
		}
	}
	</script>
--%>
<%-- 풀이
2022-12-07
[1단계:개념] 1. 쿠키값의 생명주기(생성,변경,소멸)을 서버와 클라이언트 위치와 관계에서 코드와 함께 설명하세요.
[1단계:확인] 2. 쿠키값(coffee/americano)로 설정 후, 페이지 링크로 설정된 쿠키값을 리스트하세요.
[1단계:확인] 3. 쿠키값(coffee/vanilla)로 변경후, 페이지 링크로 설정된 쿠키값을 리스트하세요.
[1단계:확인] 4. 쿠키값(커피) 삭제 후,  페이지 링크로 설정된 쿠키값을 리스트하세요.
[1단계:개념] 5. form 요소객체의 주요 속성을 기술하세요.
[1단계:확인] 6. 오늘 월드컵 대전 팀과 결과를 날짜/팀1/팀2/결과를 입력해서 테이블로 추가리스트 되게 처리하세요.
[1단계:확인] 7. 가위/바위/보를 select로 선택하게 하고, 컴퓨터와 play를 클릭해서, 나의 선택과 컴퓨터 선택 결과가 나와서 승/무/패가 출력되게 하세요.
[1단계:확인] *8. [@@][select +,-,*,/][@@] [결과확인] 임의의 숫자 두개가 나오고 연산자의 선택하고 결과확인에 따라 연산처리결과가 하단에 h2로 출력되게 하세요
 --%>
<h2>계산기</h2>
<table>
	<tr>
	<td><input type="text" name="num01" value="0" size="2"/></td>
	<td><select name="cal">
			<option value="0">+</option>
			<option value="1">-</option>
			<option value="2">*</option>
			<option value="3">/</option>
		</select></td>
	<td><input type="text" name="num02" value="0" size="2"/></td>
	<td><input type="button" value="결과 확인" onclick="result()"/></td>
	</tr>
</table>
<script type="text/javascript">
	var num01Ob = document.querySelector("[name=num01]")
	var num02Ob = document.querySelector("[name=num02]")
	var calOb = document.querySelector("[name=cal]")
	var options = document.querySelectorAll("[name=cal]>option")
	// 임의의 값 할당
	num01Ob.value = Math.floor(Math.random()*10+1);
	num02Ob.value = Math.floor(Math.random()*10+1);
	var rIdx = Math.floor(Math.random()*4);
	for(var idx=0;idx<options.length;idx++){
		console.log(rIdx+":"+idx)
		if(rIdx==idx){
			// selected 선택되어진 것에 대한 속성 설정
			options[idx].selected=true;
		}
	}
	function result(){
		var num01 = Number(num01Ob.value)
		var num02 = Number(num02Ob.value)
		var cIx = calOb.value
		var calR = [num01+num02,num01-num02,num01*num02,num01/num02]
		var cal = [" + "," - "," X "," / "]
		alert(num01+cal[cIx]+num02+" = "+calR[cIx])
	}
</script>
</body>
<script type="text/javascript">
/*

*/

</script>
</html>