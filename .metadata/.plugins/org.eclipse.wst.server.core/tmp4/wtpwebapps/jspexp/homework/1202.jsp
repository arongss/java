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
# 
2022-12-02
[1단계:개념] 1. [jsp] forward란 무엇인가? 페이지 처리의 scope 범위를 기술하세요.
		# forward 처리
		1. 특정한 페이지에서 request와 response 객체와 함께 
			대상 페이지로 전송하는 기능을 하는 액션 스크립트
		2. 다음 페이지에서 요청값을 받을 수 있다.
			ex) a17_goPage.jsp
			<h1>forward된 페이지</h1>
			<h2>페이지:<%=pageContext.getAttribute("pag_name")%></h2>
			<h2>요청:<%=request.getAttribute("req_name")%></h2>
		3. 요청값을 받아서 중간 페이지에서 분기 처리할 때, 주로 활용된다.
			1) 로그인 화면 ==> 중간 페이지 ==> 다시 로그인이냐? 메인페이지냐
[1단계:확인] *2. [jsp] 물건명:[   ][재고여부] 클릭시, form으로 submit 처리하여 
               a50_check.jsp에 이동해서 a53_main.jsp(재고 있음),  a54_main.jsp(재고 없음),  
	<form>
		물건명:<input type="text" name="name"/>
		<input type="submit"/>
	</form>
	<%
	String id = request.getParameter("name");
	if(id!=null){
	%>	
		<jsp:forward page="a53_main.jsp"/>
	<%}else{ %>		
		<jsp:forward page="a54_main.jsp"/>
	<%
	}
	%>

[2단계:확인] *3. [jsp] form으로 물건명 가격 갯수를 입력해서 전송했을 때, 두번째 페이지(z40_cal.jsp)에서 총비용이
               100000이상이면 MVP페이지(z41_mvp.jsp)로 forward처리 그렇지 않으면 Normal페이지(z42_normal.jsp)로 이동하게 하세요.
[3단계:확인] *3. [jsp] id:[   ][등록여부] 클릭시, form으로 submit 처리하여 a51_check.jsp에 이동해서 DB에 있을 때와 없을 때는 나누어 
            request setAttribute("hasId","Y"/"N")로 설정하여 등록가능 여부를 처리하세요
[1단계:개념] 4. [js] 날짜 객체의 getTime()은 어떤 메서드 인가?
	# Date 객체의 시간간격에 대한 처리
	1. getTime()를 통해서 1970/1/1기준으로 1/1000시간을 가져올 수 있다.
[1단계:확인] 5. [js] 2022/12/01와 2023/01/01의 사이의 시간과 날짜수를 출력하세요.
var d1 = new Date(2022,11,1)
var d2 = new Date(2023,0,1)
var diff = d2.getTime() - d1.getTime()
div.innerHTML+="차이(시단위):"+parseInt(diff/1000/60/60)+"<br>"
div.innerHTML+="차이(일단위):"+parseInt(diff/1000/60/60/24)+"<br>"
div.innerHTML+="<br>"
[2단계:확인] *5. [js] 오늘로 부터 몇일? [@@@@-@@-@@][날짜 확인] 날짜를 @@@-@@-@@ 형식으로 입력하고,
               날짜 확인 버튼을 클릭시, 며칠되었지 출력하세요.

[1단계:개념] 7. [js] map(), filter()의 차이점을 기술하세요
	# 배열객체의 기능메서드
	1. isArray() : 배열인지 확인
	2. indexOf(위치)//lastIndexOf : 특정한 데이터의 위치를 확인
	3. forEach(function(ele, index, array){})
	4. map(function(ele){ return @@ })
		배열의 구성요소를 return값으로 변경해서 새로운 구성요소로 만듦
	5. filter(function(ele){return 조건})
		조건에 맞는 구성요소로 filtering해서 배열을 새로만들어 처리
[1단계:확인] 8. [js] 0~100점의 임의의 국어점수 5명을 만들고 출력하고, 이 점수를 15% 점수를 올린 배열과 60점이상인 배열을 출력하세요.
var div = document.querySelector("#container")
var kor = []
for(var cnt=1;cnt<=5;cnt++){
	kor.push(Math.floor(Math.random()*100))
}
div.innerHTML+="임의의 국어점수:"+kor+"<br>"
var kor1 = kor.map(function(point){return Math.round(point*1.15)})
div.innerHTML+="15%올린 점수:"+kor1+"<br>"
var kor2 = kor1.filter(function(point){return point>=60})
div.innerHTML+="60점 이상:"+kor2+"<br>"
[3단계:확인] *8. [js] 월드컵 조별팀의 기본속성(나라,승,무,패)로 특정조의 팀들을 현재 성적으로 등록시키고, 승수를 한번에 1씩 올리고,
해당 팀들을 테이블로 출력하고, 이중 승률이 50%이상인 팀만 추출하여 배열 출력하세요
--%>
<%-- 풀이
2022-12-02
[1단계:개념] 1. [jsp] forward란 무엇인가? 페이지 처리의 scope 범위를 기술하세요.
[1단계:확인] *2. [jsp] 물건명:[   ][재고여부] 클릭시, form으로 submit 처리하여 
               a50_check.jsp에 이동해서 a53_main.jsp(재고 있음),  a54_main.jsp(재고 없음),  
1. 화면구성/파일만들기.
2. 요청값 처리
	1) 요청값에 따라, 요청범위로 설정
	2) 요청 페이지 처리..(forward)
	a50_check.jsp
	String pname = request.getParameter("pname");
	if(pname!=null){
		if(pname.equals("사과")){
			request.setAttribute("msg","재고 있음");
			page="a53_main.jsp";
		}else{
			request.setAttribute("msg","재고 없음");
			page="a54_main.jsp";
		}
		RequestDisPatcher rd = request.getRequestDispatcher(page);
		rd.forward(request,response);
	}
3. 최종 페이지 가져오기.
	a53_main.jsp(재고 있음),  
		<h2><%=request.getAttribute("msg")%></h2>
	a54_main.jsp(재고 없음) 
		<h2><%=request.getAttribute("msg")%></h2>
--%>
<form method="post" action="a50_check.jsp">
	물건명:<input type="text" name="pname"/>
	<input type="submit" value="재고여부"/>
</form>
<%--
[2단계:확인] *3. [jsp] form으로 물건명 가격 갯수를 입력해서 전송했을 때, 두번째 페이지(z40_cal.jsp)에서 총비용이
               100000이상이면 MVP페이지(z41_mvp.jsp)로 forward처리 그렇지 않으면 Normal페이지(z42_normal.jsp)로 이동하게 하세요.
z40_cal.jsp
	String price = request.getParameter("price"); if(price==null) price="0";
	String cnt = request.getParameter("cnt"); if(cnt==null) cnt="0";
	int priceI = Integer.parseInt(price);
	int cntI = Integer.parseInt(cnt);
	int tot = priceI*cntI;
	request.setAttribute("tot",tot);
	String page01 = "z42_normal.jsp";
	if(tot>=100000){
		page01 = "z41_mvp.jsp";
	}
	<jsp:forward page="<%=page01%>"/>
z41_mvp.jsp
	<h2><%=request.getParameter("name")%>구매 MVP 페이지</h2>
	<h3><%=request.getParameter("tot")%>원 구매</h3>
z42_normal.jsp
	<h2><%=request.getParameter("name")%>구매 일반 페이지</h2>
	<h3><%=request.getParameter("tot")%>원 구매</h3>
--%>
<h2>구매 처리에 따른 등급페이지 이동</h2>
<form method="post" action="z40_cal.jsp">
	물건명:<input type="text" name="name"/>
	가격:<input type="text" name="price"/>
	갯수:<input type="text" name="cnt"/>
	<input type="submit" value="구매"/>
</form>
<%--
[3단계:확인] *3. [jsp] id:[   ][등록여부] 클릭시, form으로 submit 처리하여 a51_check.jsp에 이동해서 DB에 있을 때와 없을 때는 나누어 
            request setAttribute("hasId","Y"/"N")로 설정하여 등록가능 여부를 처리하세요
1. 화면구현
	<form method="post" action="a51_check.jsp">
		아이디:<input type="text" name="id"/>
		<input type="submit" value="등록여부"/>
	</form>
2. a51_check.jsp
	<%
	String id = request.getParameter("id");
	if(id!=null){
		A06_PareparedDao dao = new A06_PareparedDao();
		// dao.checkId(id)
		request.setAttribute("hasId",dao.checkId(id)?"Y":"N");
	%>
		<jsp:forward page="1202.jsp"/>
	<%
	}
	%>
3. 현재페이지
	String id = request.getParameter("id");
	String hasId = request.setAttribute("hasId");
	boolean isCheck=false;
	if(hasId!=null){ // 초기 페이지와 구분..
		isCheck=true;
	}
	<script>
	var isFirst  <%=isFirst%>
	if( isFirst ){ // 입력을 받아서 forward되었을 때..
		var hasId = "<%=hasId%>"
		if(hasId=="Y"){
			alert("등록된 아이디가 있습니다.");
		}else{
			alert("등록 가능합니다.");
			document.querySelector("[name=id]").value="<%=id%>"
		}
	}
--%>
<h2>아이디 등록 유효 check</h2>
<form method="post" action="a51_check.jsp">
	아이디:<input type="text" name="id"/>
	<input type="submit" value="등록여부"/>
</form>
<%
String hasId = (String)request.getAttribute("hasId");
boolean isCheck=false;
if(hasId!=null){
	isCheck=true;
}
String id = request.getParameter("id");
%>
<script type="text/javascript">
var isFirst = <%=isCheck%>
if( isFirst ){
	var hasId = "<%=hasId%>"
	if(hasId=="Y"){
		alert("등록된 아이디가 있습니다.");
	}else{
		alert("등록 가능합니다.");
		document.querySelector("[name=id]").value="<%=id%>"
	}
}
</script>
<%--
[1단계:개념] 4. [js] 날짜 객체의 getTime()은 어떤 메서드 인가?
[1단계:확인] 5. [js] 2022/12/01와 2023/01/01의 사이의 시간과 날짜수를 출력하세요.
[2단계:확인] *5. [js] 오늘로 부터 몇일? [@@@@-@@-@@][날짜 확인] 날짜를 @@@-@@-@@ 형식으로 입력하고,
               날짜 확인 버튼을 클릭시, 며칠되었지 출력하세요.
--%>
오늘로부터 몇일?<input type="date" name="indate"/>
<input type="button" value="날짜확인" onclick="calDate()"/>
<h3 id="showDt"></h3>
<script>
	function calDate(){
		var toDay = new Date() // 오늘날짜.
		var inDate = document.querySelector("[name=indate]").value.split("-")
		var stDay = new Date(inDate[0], inDate[1]-1, inDate[2])
		var diff = toDay.getTime()-stDay.getTime()
		// 날짜수만 나올 수 있게 내림처리..
		var dayCnt = Math.floor(diff/1000/60/60/24)
		donsole.log(dayCnt)
		// Math.abs(dayCnt) : 오늘 이전은 +, 오늘 이후는 - 값  절대값 처리
		// ((dayCnt>0)?"전":"이후") : 오늘 이후는 - 이므로 이후로 그외는 전
		document.querySelector("#showDt").innerText
			= Math.abs(dayCnt)+"일 "+ ((dayCnt>0)?"전":"이후")
	}
</script>
<%--
[1단계:개념] 7. [js] map(), filter()의 차이점을 기술하세요
[1단계:확인] 8. [js] 0~100점의 임의의 국어점수 5명을 만들고 출력하고, 이 점수를 15% 점수를 올린 배열과 60점이상인 배열을 출력하세요.
[3단계:확인] *8. [js] 월드컵 조별팀의 기본속성(나라,승,무,패)로 특정조의 팀들을 현재 성적으로 등록시키고, 승수를 한번에 1씩 올리고, 해당 팀들을 테이블로 출력하고, 이중 승률이 50%이상인 팀만 추출하여 배열 출력하세요
 --%>
<table id="fifa">
	<thead><tr><th>팀</th><th>승</th><th>무</th><th>패</th><th>승률</th></tr></thead>
	<tbody></tbody>
</table>
<script>
var hgrp = []
hgrp.push({nat:"포르투갈",win:2,eq:0,def:1})
hgrp.push({nat:"한국",win:1,eq:1,def:1})
hgrp.push({nat:"우루과이",win:1,eq:1,def:1})
hgrp.push({nat:"가나",win:0,eq:0,def:2})
console.log(hgrp)
hgrp.map(function(team){
	team.win = team.win+1
	team.winRatio = Math.round(team.win/(team.win+team.def)*100)
	return team
})
// 새로운 배열에 할당
var hgrp = hgrp.filter(function(team){
	return team.winRatio>=50
})
var show=""
hgrp.forEach(function(t){
	show+="<tr><td>"+t.nat+"</td><td>"+t.win+"</td><td>"+
		t.eq+"</td><td>"+t.def+"</td><td>"+t.winRatio+"%</td></tr>"
})
document.querySelector("#fifa tbody").innerHTML = show
console.log(hgrp)
</script>
<div id="container"></div>
</body>
<script type="text/javascript">
/*

*/

</script>
</html>