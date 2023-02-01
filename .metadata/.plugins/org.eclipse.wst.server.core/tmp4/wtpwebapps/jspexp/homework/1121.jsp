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

*/

</script>
</head>
<body>
	
<%-- 
2022-11-21
[1단계:확인] 1. [js] 가변매개변수 arguments를 활용하여 가변적으로 구매 정보를 매개변수로 처리하여 출력하게 하세요.
	<h2 onclick="call(1000)">가변형 매개변수1</h2>
	<h2 onclick="call(1000,2000)">가변형 매개변수2</h2>
	<h2 onclick="call(1000,2000,3000)">가변형 매개변수3</h2>
	<h2 onclick="call('사과','바나나','딸기')">가변형 매개변수4</h2>
	<div></div>
	
function call(){
	var show = ""
	for(var idx in arguments){
		show += arguments[idx]+","
	}
	body.innerHTML+=show+"<br>"
}
[1단계:확인] 2. [js] ... 가변매개변수에 따라 등록할 물건의 이름 1/2/3개 다른 매개변수로 설정하여 하단에 p태그로 클릭시 마다 처리되게 하세요
	<h2 onclick="fun02('사과')">사과</h2>
	<h2 onclick="fun02('사과','바나나')">사과,바나나</h2>
	<h2 onclick="fun02('사과','바나나','딸기')">사과,바나나,딸기</h2>
	<p></p>

function fun02(...prods){
	for(var prod of prods){
		var pObj = document.querySelector("p")
	}
	pObj.innerHTML = "구매할 물건:"+prods
}
[1단계:확인] 3. [js] default 가변매개변수를 활용하여 사원번호, 사원명, 부서번호를 클릭시 마다, 처리하는 내용을 하단에 테이블로 추가 하여 출력하세요
               login(), login(7780) login(7880,'오길동') login(8000,'이영자','인사')
	<h1 onclick="login()">회원등록(기본)</h1>
	<h1 onclick="login('himan')">회원등록('himan')</h1>
	<h1 onclick="login('goodman','8888')">회원등록('goodman','8888')</h1>
	<h1 onclick="login('higirl','5555','이현성')">회원등록('higirl','5555','이현성')</h1>
	<p></p>
	<table>
		<tr><th>사원번호</th><th>사원명</th><th>부서명</th></tr>
		<tr><td id="td1"></td><td id="td2"></td><td id="td3"></td></tr>
	</table>
	
function login(empno="입력없음",ename="입력없음",dname="입력없음"){
	var tdObj = document.querySelector("#td1")
	tdObj.innerHTML+=empno+"<br>"
	var tdObj = document.querySelector("#td2")
	tdObj.innerHTML+=ename+"<br>"
	var tdObj = document.querySelector("#td3")
	tdObj.innerHTML+=dname+"<br>"
}
[1단계:확인] 4. [js] 화살표 함수를 활용하여 사칙연산을 처리 및 출력하세요.
const calcu1 = (no1, no2) => no1+no2
const calcu2 = (no3, no4) => no3-no4
const calcu3 = (no5, no6) => no5*no6
const calcu4 = (no7, no8) => no7/no8

	<h1 onclick="this.innerText=calcu1(30,10)">더하기</h1>
	<h1 onclick="this.innerText=calcu2(30,10)">빼기</h1>
	<h1 onclick="this.innerText=calcu3(30,10)">곱하기</h1>
	<h1 onclick="this.innerText=calcu4(30,10)">나누기</h1>
[1단계:확인] *5. [js] 키오스크 메뉴판(3가지)과 동일하게 메뉴가 나오고 +/-에 따라서 갯수가 선택되게 하여
               아래에 메뉴내용과 총금액이 나오게 처리하세요.
var mlist = "";
var tot = 0;
function chMenu(menu, price){
	mlist+=menu+" "
	tot+=price
	document.querySelector("p").innerText="총금액:"+tot+
		", 메뉴내용:"+mlist
}

	<h2>메뉴</h2>
	<table>
		<tr><th>짜장면(6000)</th>
			<td onclick="chMenu('+짜장면',6000)">+</td>
			<td onclick="chMenu('-짜장면',-6000)">-</td></tr>
		<tr><th>짬뽕(7000)</th>
			<td onclick="chMenu('+짬뽕',7000)">+</td>
			<td onclick="chMenu('-짬뽕',-7000)">-</td></tr>
		<tr><th>탕수육(12000)</th>
			<td onclick="chMenu('+탕수육',12000)">+</td>
			<td onclick="chMenu('-탕수육',-12000)">-</td></tr>
	</table>
	<p></p>
[1단계:확인] *6. [jsp] jsp에서 숫자형 데이터가 요청값이 없더라도 숫자형 데이터가 에러 나지 않게 할려고 한다.
                 아래 화면을 입력값이 없더라도 전송시 에러 발생하지 않게
                첫번째 숫자 : [   ]
                두번째 숫자 : [   ]  [합산]
               1) javascript 단 처리 부분
               2) jsp 처리 부분을 나누어서 처리하세요
	
[1단계:확인] *7. [jsp] script의 declare를 활용하여, 입력값이 70이상 일때, 합격 그외 불합격 처리하는 기는
            메서드를 선언하고, expression으로 호출하여 처리하세요.

--%>
<%-- 풀이
[1단계:확인] *5. [js] 키오스크 메뉴판(3가지)과 동일하게 메뉴가 나오고 +/-에 따라서 갯수가 선택되게 하여
               아래에 메뉴내용과 총금액이 나오게 처리하세요.
	1) 화면구성
	2) +/-에 대한 이벤트 핸들러 함수 선언과 이벤트 처리
	3) 메뉴내용과 총금액 처리.
--%>
<script type="text/javascript">
	var orcnts = [0,0,0] // 클릭시 마다, 함수 전역적으로 주문갯수를 증가.
	function cal(cIdx,ch){
		var menus = ["짜장면","짬뽕","탕수육"]
		var prices = [6000,7000,12000]
		if(ch=="+"){
			orcnts[cIdx]++;
		}else{
			if(orcnts[cIdx]<=0){
				alert("0 이하는 감소되지 않습니다.");
			}else{
				orcnts[cIdx]--;
			}
		}
		var showList = "" // 하단에 메뉴 내용 출력
		var tot = 0; // 총비용 출력..
		for(var idx=0;idx<orcnts.length;idx++){ // orcnts = [0,0,0]  주문량이 있을 때만 반복해서 출력
			if(orcnts[idx]>0){
				showList+=menus[idx]+"("+prices[idx]+"원) "+orcnts[idx]+"<br>"
				tot += prices[idx]*orcnts[idx]
			}
		}
		showList+="총비용:"+tot+"원"
		document.querySelector("#show").innerHTML = showList
	}
</script>
<h2>주문하세요</h2>
<style>
	span{border:1px solid black; border-radius:5px;display:inline-block;width:20px;}
</style>
<table>
	<tr><td>짜장면(6000원)<span onclick="cal(0,'+')">+</span><span onclick="cal(0,'-')">-</span></td></tr>
	<tr><td>짬뽕(7000원)<span onclick="cal(1,'+')">+</span><span onclick="cal(1,'-')">-</span></td></tr>
	<tr><td>탕수육(12000원)<span onclick="cal(2,'+')">+</span><span onclick="cal(2,'-')">-</span></td></tr>
</table>
<p id="show" align="center"></p>
<%--
[1단계:확인] *6. [jsp] jsp에서 숫자형 데이터가 요청값이 없더라도 숫자형 데이터가 에러 나지 않게 할려고 한다.
                 아래 화면을 입력값이 없더라도 전송시 에러 발생하지 않게
                첫번째 숫자 : [   ]
                두번째 숫자 : [   ]  [합산]
               1) javascript 단 처리 부분
               2) jsp 처리 부분을 나누어서 처리하세요
--%>
<script>
   function calPlus(){
      var num01Ob=document.querySelector("[name=num01]")
      var num01=num01Ob.value;
      var num02Ob=document.querySelector("[name=num02]")
      var num02=num02Ob.value;
      if(num01==""||isNaN(num01)){
         alert("공백이거나 숫자가 아님")
         num01Ob.value=""; num01Ob.focus()
         return;
      }
      if(num02==""||isNaN(num02)){
         alert("공백이거나 숫자가 아님")
         num02Ob.value=""; num02Ob.focus()
         return;
      }
      document.querySelector("form").submit();
   }

</script>
<%
   String num01S=request.getParameter("num01");
   String num02S=request.getParameter("num02");
   int num01=0; int num02=0; int sum=0;
   boolean isValid1=false;
   boolean isValid2=false;
   if(num01S!=null&&!num01S.equals("")){
      try{
         num01=Integer.parseInt(num01S);
      }
      catch(Exception e){
      }
      isValid1=true;
   }
   if(num02S!=null&&!num02S.equals("")){
      try{
         num02=Integer.parseInt(num02S);
      }
      catch(Exception e){
      }
      isValid2=true;
   }
%>
<form>
   첫번째 숫자 : <input type="text" name="num01"><br>
   두번째 숫자 : <input type="text" name="num02"><br>
   <input type="button" onclick="calPlus()" value="합산">
   <%=isValid1&&isValid2?num01+"+"+num02+"="+(num01+num02):"" %>
</form>
<%--
[1단계:확인] *7. [jsp] script의 declare를 활용하여, 입력값이 70이상 일때, 합격 그외 불합격 처리하는 기는
            메서드를 선언하고, expression으로 호출하여 처리하세요.
 --%>
<%!
	String chPass(String pt){
		String re = "";
		if(pt!=null){
			try{
				int point = Integer.parseInt(pt);
				if(point>=70){
					re="결과:합격";
				}else{
					re="결과:불합격";
				}
			}catch(Exception e){
				re = "입력데이터이상(입력,숫자형)";
			}
		}
		return re;
	}
%>
<%
	String pt = request.getParameter("pt");
%>
<form>
	점수:<input type="text" name="pt"/>
	<input type="submit"/>
</form>
	<%=chPass(pt) %>
</body>
<script>
/*

*/
</script>
</html>