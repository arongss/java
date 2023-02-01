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
2022-12-08
[1단계:개념] 1. form요소객체의 하위 속성을 속성값을 동적으로 변경하는 코드를 기술하세요
	# form요소객체들의 속성변경 처리
	1. form의 하위요소들을 여러가지 속성들을 포함하고 있다.
	2. js에서는 이러한 속성을 속성과 속성값을 통해 동적으로 변경을 할 수 있다.
	3. 기본 속성
		1) input
			- value
			- readonly : 읽기 전용 필드
			- required : 필수 입력 필드
			- type : 형식을 설정
				hidden 보이지 않는 형식
				text/search/tel/url/email/password/date/button/file..
				등 여러 속성값으로 설정할 수 있다.
				radio/checkbox : checked 속성 포함
[1단계:확인] 2. 회원아이디를 입력하고 옆에 유효 CHECK 버튼을 클릭시,
               글자수가 8~16이고, himan가 아닐 때만 유효여부 checkbox표기하고, readOnly 속성으로 설정하세요.
               회원아이디 [    ] [유효check]  []유효여부

[1단계:확인] 3. checkbox, radio, select의 js로 접근할 때, 차이점을 기술하세요.
	checkbox : 다중선택가능
	radio : 단인선택으로 this 이벤트가 일어나는 radio 객체
	select : select의 하위에 선택 옵션
[1단계:확인] 4. checkbox와 월드컵 출전팀을 리스트하고, check 후, 16강진출 버튼 클릭시, 선택된 팀만 하단에 리스트하게 하세요.
<h2>월드컵 출전팀(H조)</h2>
	<input type="checkbox" name="wcup" value="포르투갈"/>포르투갈
	<input type="checkbox" name="wcup" value="대한민국"/>대한민국
	<input type="checkbox" name="wcup" value="우루과이"/>우루과이
	<input type="checkbox" name="wcup" value="가나"/>가나<br>
	<p id="show"></p>
<script>
	var wcup = document.querySelectorAll("[name=wcup]")
	for(var idx=0;idx<wcup.length;idx++){
		wcup[idx].onclick=function(){
			var add = ""
			for(var idx=0;idx<wcup.length;idx++){
				if(wcup[idx].checked){
					add += wcup[idx].value+","
				}
			}
			show.innerText=add;
		}
	}
</script> 
[1단계:확인] 5. radio를 이용해서 현재 해결해야 할 문제(3가지) 중에 가장 중요한 것을 클릭시, 하단에 표현되게 하세요.
	<h2>현재 해결해야 할 문제</h2>
	<input type="radio" name="r01" value="문제1"/>문제1
	<input type="radio" name="r01" value="문제2"/>문제2
	<input type="radio" name="r01" value="문제3"/>문제3
	<div id="container"></div>
<script>
	var r01Arr = document.querySelectorAll("[name=r01]")
	var con = document.querySelector("#container")
	for(var idx=0;idx<r01Arr.length;idx++){
		r01Arr[idx].onclick=function(){
			var ck=""
			if(this.checked){ 
				ck=this.value
			}
			con.innerText=ck
		}
	}
</script>
[1단계:확인] 6. 물건명, 가격select(1000단위~9000), 갯수(select 1~9) 가격나 갯수를 선택시, 하단에 구매한 물건과 총비용을 출력되게 하세요
	구매할 사과 갯수:
	<select name="cnt" > 
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
		<option>6</option>
		<option>7</option>
		<option>8</option>
		<option>9</option>
	</select>
	구매할 사과 가격:
	<select name="price" > 
		<option>1000</option>
		<option>2000</option>
		<option>3000</option>
		<option>4000</option>
		<option>5000</option>
		<option>6000</option>
		<option>7000</option>
		<option>8000</option>
		<option>9000</option>
	</select>
	<input type="button" onclick="chCnt()" value="갯수선택"/>
	<input type="button" onclick="chPrice()" value="가격선택"/>
	<h2>사과 갯수:<span id="chC"></span></h2>
	<h2>사과 가격:<span id="chP"></span></h2>
<script type="text/javascript">
var chC = document.querySelector("#chC")
var chP = document.querySelector("#chP")
function chCnt(){
	var opts1 = document.querySelectorAll("[name=cnt]>option")
	for(var idx=0;idx<opts1.length;idx++){
		if(opts1[idx].selected){ 
			chC.innerText = opts1[idx].value
		}
	}
}
function chPrice(){
	var opts2 = document.querySelectorAll("[name=price]>option")
	for(var idx=0;idx<opts2.length;idx++){
		if(opts2[idx].selected){ 
			chP.innerText = opts2[idx].value
		}
	}
}
</script>

[1단계:확인] 7. 쿠키와 세션의 궁극적인 차이점으로 설정 코드와 함께 설명하세요
	 사용자의 정보가 저장되는 위치의 차이
	 쿠키는 서버의 자원을 전혀 사용하지 않으며, 세션은 서버의 자원을 사용한다.
[1단계:확인] 8. Emp Vo로 세션을 설정하고, 세션이 없을 때, 세션설정하는 페이지로 이동하게 하되, 세션 확인하는 페이지에서
                   10/20/30/40  테이블 리스트에서 클릭시, 해당 부서만 접근가능 alert() 그 외는 접근 불가능 alert()로딩되게 처리하세요.
--%> 
<%-- 풀이
2022-12-08
[1단계:개념] 1. form요소객체의 하위 속성을 속성값을 동적으로 변경하는 코드를 기술하세요
[1단계:확인] *2. 회원아이디를 입력하고 옆에 유효 CHECK 버튼을 클릭시,
               글자수가 8~16이고, himan가 아닐 때만 유효여부 checkbox표기하고, readOnly 속성으로 설정하세요.
               회원아이디 [    ] [유효check]  []유효여부
--%>
<h2>회원 아이디 유효성 check</h2>
회원아이디:<input type="text" name="id"/>
<input type="button" value="유효check" onclick="ckValid(this)"/>
<input type="checkbox" id="isValid"/>유효여부
<script type="text/javascript">
	var idOb = document.querySelector("[name=id]")
	var ckValOb = document.querySelector("#isValid")
	function ckValid(obj){
		if(obj.value=="유효check"){
			var len = idOb.value.length
			if(len>=8 && len<=16 && idOb.value!='himan'){
				ckValOb.checked = true
				idOb.readOnly = true
				obj.value="아이디재입력"
				// 실무적으로는 입력내용과 패턴만 유효성 check 하고
				// 데이터에 대한 확인은 ajax(비동기적으로 서버 접근) 처리하여
				// 유효 여부를 확인한다.
			}
		}else{
			ckValOb.checked = false
			idOb.readOnly = false
			idOb.value="";idOb.focus()
			obj.value="유효check"
		}
	}
</script>
<%-- 
[1단계:확인] 3. checkbox, radio, select의 js로 접근할 때, 차이점을 기술하세요.
[1단계:확인] 4. checkbox와 월드컵 출전팀을 리스트하고, check 후, 16강진출 버튼 클릭시, 선택된 팀만 하단에 리스트하게 하세요.
[1단계:확인] 5. radio를 이용해서 현재 해결해야 할 문제(3가지) 중에 가장 중요한 것을 클릭시, 하단에 표현되게 하세요.
[1단계:확인] *6. 물건명, 가격select(1000단위~9000), 갯수(select 1~9) 가격나 갯수를 선택시, 하단에 구매한 물건과 총비용을 출력되게 하세요
--%>
<h2>구매</h2>
물건명:<input type="text" name="pname"/>
가격:<select name="price" onchange="cal()"></select>
갯수:<select name="cnt" onchange="cal()"></select>
<h3 id="shwBuy"></h3>
<script type="text/javascript">
/*
var pnameOb = document.querySelector("[name=pname]")
var priceOb = document.querySelector("[name=price]")
var cntOb = document.querySelector("[name=cnt]")
var shwBuyOb = document.querySelector("#shwBuy")
var add=""
for(var cnt=1;cnt<=9;cnt++) add+="<option>"+cnt*1000+"</option>"
priceOb.innerHTML = add;
add=""
for(var cnt=1;cnt<=9;cnt++) add+="<option>"+cnt+"</option>"
cntOb.innerHTML = add;
function cal(){
	var tot = priceOb.value*cntOb.value
	shwBuyOb.innerText="구매물건:"+pnameOb.value+", 총비용:"+tot
}
*/
var pnameOb = document.querySelector("[name=pname]")
var priceOb = document.querySelector("[name=price]")
var cntOb = document.querySelector("[name=cnt]")
var shwBuyOb = document.querySelector("#shwBuy")
var add1=""
var add2=""
for(var cnt=1;cnt<=9;cnt++) {
	add1+="<option>"+cnt*1000+"</option>"
	add2+="<option>"+cnt+"</option>"
}
priceOb.innerHTML = add1;
cntOb.innerHTML = add2;
function cal(){ // 주의 : 반드시 선택할 당시 value를 가져오게 처리
	var tot = priceOb.value*cntOb.value
	shwBuyOb.innerText="구매물건:"+pnameOb.value+", 총비용:"+tot
}
</script>
<%--
[1단계:확인] 7. 쿠키와 세션의 궁극적인 차이점으로 설정 코드와 함께 설명하세요
[1단계:확인] *8. Emp Vo로 세션을 설정하고, 세션이 없을 때, 세션설정하는 페이지로 이동하게 하되, 세션 확인하는 페이지에서
                   10/20/30/40  테이블 리스트에서 클릭시, 해당 부서만 접근가능 alert() 그 외는 접근 불가능 alert()로딩되게 처리하세요.
	1) 세션 처리 페이지 및 리스트 페이지 이동(ex)로그인 후, 세션설정 후 리스트 페이지)
		z43_makeSession.jsp
	2) 1208.jsp
		- 세션가져오기(만약에 session이 없으면 세션페이지에서 세션 처리하기)
		- 현재 페이지에서 테이블 리스트 출력
			메뉴 리스트를 클릭시, 지정된 메뉴의 권한 내용과 세션에 
			있는 권한과 비교하여 같으면 접근, 다르면 접근불가능 경고창 처리
--%>
<%
Emp emp = (Emp)session.getAttribute("emp");
boolean hasSess = emp!=null; // null이 아니면 true
// 세션이 있을 때만 메서드 호출, 없을 때는 0으로 할당.
// js 코드로 넘겨서 메뉴 check시 활용..
int sesDeptno = hasSess?emp.getDeptno():0;

List<Dept> dlist = new ArrayList<Dept>();
dlist.add(new Dept(10,"인사",""));
dlist.add(new Dept(20,"회계",""));
dlist.add(new Dept(30,"네트웍",""));
dlist.add(new Dept(40,"총무",""));
%>
<table>
	<tr><th>부서리스트</th></tr>
	<%for(Dept d:dlist){ %>
	<tr><td ondblclick="ckAuth('<%=d.getDeptno()%>')"><%=d.getDname() %></td></tr>
	<%} %>
</table>

</body>
<script type="text/javascript">
var hasSess = <%=hasSess%>
if(!hasSess){
	alert("세션이 없습니다.\n세션 설정 페이지로 이동하겠습니다.")
	location.href="z43_makeSession.jsp"
} 
var sesNo = <%=sesDeptno%> // 주의 세션이 없으면 sesNo= 
function ckAuth(deptno){
	// 세션에 있는 deptno와 부서리스트에서 전달하는 deptno가 같을 때는 
	// 권한 있기 때문에 이동가능
	if(sesNo==deptno){
		alert("권한이 있습니다. 이동 성공")
	}else{
		alert("메뉴사용권한이 없습니다.")
	}
}
/*
z43_makeSession.jsp
	<h2>세션 설정</h2>
*/
</script>
</html>