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
2022-11-24
[1단계:개념] 1. response는 request와 대비해서 어떤 역할을 하는 객체인가?
	# response 기본 객체
	1. 웹 브라우저에 전송하는 응답 정보 설정
	2. 주요 기능 
		1) 헤더 정보 입력
		2) 리다이렉트 처리
	3. 기능 메서드
		1) addDateHeader(String name, long date)
			name 헤더에 value를 값으로 추가 한다.
		2) addHeader(String name, String value)
			name 헤더에 value를 값으로 추가 한다.
		3) addIntHeader(String name, in value)
			name 헤더에 정수값 value를 추가한다.
		4) setDateHeader(String name, long date)
			name 헤더의 값을 date로 지정한다. date는 1970년1월1일 이후 흘러간
			시간을 1/1000초 단위로 나타낸다.
		5) setHeader(String name, String value)
			name 헤더의 값을 value로 지정한다.
		6) setIntHeader(String name, int value)
			name 헤더의 값을 정수 값 value로 지정한다.
[1단계:개념] 2. response.sendRedirect와 location.href의 차이점을 기술하세요.
	# 리다이렉트
		1) 특정 페이지로 이동하라고 웹 브라우저에 응답
		2) 서버 안에서 명령문으로 특정 페이지로 이동 처리
			response.sendRedirect(String location)
		cf) location.href="이동페이지" 브라우저에서 특정한 페이지로 이동 처리
[1단계:확인] 3. 조건(부서번호와 (DB처리)부서명이 있을 때, 해당 부서페이지로 이동하고, 그렇지 않을 때, 해당 부서가 없습니다. 경고창 처리하세요.
--%>

<%--
[2단계:확인] 3. (DB처리)부서번호와 부서명이 있을 때, 해당 부서페이지로 이동하고, 그렇지 않을 때, 해당 부서가 없습니다. 경고창 처리하세요.
--%>
<h3>부서정보</h3>
	<form>
		부서번호:<input type="text" name="deptno"/>
		부서명:<input type="text" name="dname"/>
		<input type="submit" value="이동"/>
	</form>
	<%
	String deptno = request.getParameter("deptno");
	if(deptno==null || deptno.equals("")) deptno="0";
	String dname = request.getParameter("dname");
	int deptnoInt = Integer.parseInt(deptno);
	boolean isFail = false;
	if(deptno!=null&&dname!=null){
		A06_PareparedDao dao = new A06_PareparedDao();
		if( dao.deptlogin(deptnoInt, dname) ){
			response.sendRedirect("1124_dept.jsp");
		}else{
			isFail = true;
		}
	}
	%>
<%--
[1단계:확인] 4. [화면구현] 배열로 월드컵 D조팀  ul로 리스트 출력하세요.
--%>
<ul>
	<%
	String []teamD = {"프랑스","튀니지","덴마크","호주"};
	for(String team:teamD){
		out.print("<li>"+team+"</li>");
	}
	%>
</ul>
<%--
[2단계:확인] 5. [화면구현] 2차원 배열로 월드컵 A,B조 및 그 팀들을 선언하고 ol/ul을 계층적으로 출력하세요.
--%>
<ol type="A">
<%
	String [][]teams = {{"네덜란드","에콰도르","세네갈","카타르"},
						{"잉글랜드","웨일스","미국","이란"}};
	for(int a=0;a<teams.length;a++) {
		out.print("<li><ul>");
		for(int b=0;b<teams[a].length;b++) {
			out.print("<li>"+teams[a][b]);
		}
		out.print("</li></ul>");
	}
%>
</ol>
<%--
[1단계:확인] 6. [화면구현] 오늘 월드컵 출전 팀과 경기 시간을 배열로 선언하고 select의 value는 시간, 
			레이블은 팀명을 출력하되, 선택했을 시간을 경고창으로 출력되게 하세요.(배열, Code객체)
--%>
<%
	String []teamW = {"스페인vs코스타리카","벨기에vs캐나다","스위스vs카메룬","우루과이vs대한민국"};
	String []times = {"01:00","04:00","19:00","22:00"};
%>
<h2>사원정보</h2>
<select name="time" onchange="alert(this.value)">
	<%for(int idx=0;idx<times.length;idx++){%>
	<option value="<%=teamW[idx]%>"><%=times[idx]%></option>
	<%}%>
</select>
<%--
[1단계:확인] 7. [화면구현] 사이트 상단 메뉴항목을 배열로 5개 선언하고, 각 메뉴별로 배경색상을 지정한후, 수평으로 리스트 출력되게 하세요.
--%>
<%
String menus[] = {"베스트","카테고리","마이페이지","장바구니","검색"};
String colors[] = {"red","yellow","green","blue","purple"};
for(int idx=0;idx<menus.length;idx++){
%>	
<span style='background:<%=colors[idx]%>'><%=menus[idx]%></span>
<%}%>
<%--
[1단계:확인] 8. [화면구현] jsp에서 테이블로 2X3, 3X4, 5X2를 만들고, 2의 배수, 4의 배수, 5의 배수로 출력하세요.(배경색상은 홀짝 다르게 출력)
--%>
<h2>2X3</h2>
<table>
<%
	for(int cel=1;cel<=6;cel++){
		if(cel%3==1) out.print("<tr>");
		out.print("<td style='background:"+(cel%2==0?"yellow":"pink")+"'>"+cel*2+"</td>");
		if(cel%3==0) out.print("</tr>");
	}
%>
</table>
<h2>3X4</h2>
<table>
<%
	for(int cel=1;cel<=12;cel++){
		if(cel%4==1) out.print("<tr>");
		out.print("<td style='background:"+(cel%2==0?"yellow":"")+"'>"+cel*4+"</td>");
		if(cel%4==0) out.print("</tr>");
	}
%>
</table>
<h2>5X2</h2>
<table>
<%
	for(int cel=1;cel<=10;cel++){
		if(cel%2==1) out.print("<tr>");
		out.print("<td style='background:"+(cel%2==0?"skyblue":"")+"'>"+cel*5+"</td>");
		if(cel%2==0) out.print("</tr>");
	}
%>
</table>
<%--
2022-11-24
[1단계:개념] 1. response는 request와 대비해서 어떤 역할을 하는 객체인가?
[1단계:개념] 2. response.sendRedirect와 location.href의 차이점을 기술하세요.
[1단계:확인] *3. 조건(부서번호와 (DB처리)부서명이 있을 때, 해당 부서페이지로 이동하고, 그렇지 않을 때, 해당 부서가 없습니다. 경고창 처리하세요.
	1) 화면구현
		부서번호 [   ]
		부서명 [   ]
		[등록확인]
	2) 요청값처리 : null, 숫자형
		String deptnoS = request.getParameter("deptno");
		int deptno = 0; if(deptnoS!=null) deptno = Integer.parseInt(deptnoS);
		String dname = request.getParameter("dname");
		
	3) 요청값에 따른 페이지 전환
		boolean isInValid = false;
		if(deptnoS!=null && dname!=null){
			if(deptno==10 && dname.equals("회계")){
				response.sendRedirect("z04_main.jsp");
			}else{
				isInValid = true;
			}
		}
		var isInValid = <%=isInValid%>
		if(isInValid){
			alert("해당 부서정보가 없습니다");
		}
--%>
<form>
	부서번호 : <input type="text" name="deptno1"/>
	부서명 : <input type="text" name="dname1"/>
	<input type="submit" value="등록확인"/>
</form>
<%
String deptnoS = request.getParameter("deptno1");
int deptno1 = 0; if(deptnoS!=null) deptno1 = Integer.parseInt(deptnoS);
String dname1 = request.getParameter("dname1");
boolean isInValid = false;
if(deptnoS!=null && dname!=null){
	if(deptno1==10 && dname1.equals("회계")){
		response.sendRedirect("1124_dept.jsp");
	}else{
		isInValid = true;
	}
}
%>
<script>
var isInValid = <%=isInValid%>
if(isInValid){
	alert("해당 부서정보가 없습니다");
}
</script>
<%--
[2단계:확인] *3. (DB처리)부서번호와 부서명이 있을 때, 해당 부서페이지로 이동하고, 그렇지 않을 때, 해당 부서가 없습니다. 경고창 처리하세요.
	1. dao 기능메서드 선언
		1) sql : select * from dept where deptno = ? and dname = ?
		2) vo
		3) 기능메서드 선언
			public boolean chkDept(int deptno, String dname){
			}
	2. jsp
		if(deptnoS!=null && dname!=null){
			if(dao.ckDept(deptno, dname)){
				response.sendRedirect("@@@@.jsp");
			}else{
			
			}
		}
[1단계:확인] 4. [화면구현] 배열로 월드컵 D조팀  ul로 리스트 출력하세요.
[2단계:확인] *5. [화면구현] 2차원 배열로 월드컵 A,B조 및 그 팀들을 선언하고 ol/ul을 계층적으로 출력하세요.
--%>
<% 
String[][]teamss={{"카타르","에콰도르","세네갈","네덜란드"},
					{"잉글랜드","이란","미국","웨일스"},
					{"아르헨티나","사우디아라비아","멕시코","폴란드"},
					{"아르헨티나","사우디아라비아","멕시코"},
					{"아르헨티나","사우디아라비아"}
					};
out.print("<ol type='A'>");
for(String team[]:teamss){ // 나라들 배열은 1차원 배열
	out.print("<li>조");
	out.print("   <ul>");
	for(String nation:team){ // 나라명은 문자열 하나씩 입력된다.
		out.print("<li>"+nation+"</li>");
	}
	out.print("   </ul>");
	out.print("</li>");
}
out.print("</ol>");
%>
<%--
[1단계:확인] *6. [화면구현] 오늘 월드컵 출전 팀과 경기 시간을 배열로 선언하고 select의 value는 시간, 레이블은 팀명을 출력하되, 선택했을 시간을 경고창으로 출력되게 하세요.(배열, Code객체)
--%>
<h2>월드컵 대전팀과 일정(해당 팀을 클릭시 시간 확인)</h2>
<select onchange="alert(this.value)">
<%
List<Code> sch = new ArrayList<Code>();
sch.add(new Code("오늘 오후 7:00","웨일스:이란"));
sch.add(new Code("오늘 오후 10:00","카타르:세네갈"));
sch.add(new Code("내일 오전 1:00","네덜란드:에콰도르"));
sch.add(new Code("내일 오전 4:00","잉글랜드:미국"));
for(Code c:sch){
	out.print("<option value='"+c.getKey()+"'>"+c.getVal()+"</option>");
}
%>
	<!-- 
	<option value="튀니지:호주">튀니지:호주</option> -->
	<option>튀니지:호주</option>
	<!-- 레이블은 설정하면 value도 동일하게 적용되므로 
		 value를 설정할 필요가 없다. -->
</select>
<%--
[1단계:확인] *7. [화면구현] 사이트 상단 메뉴항목을 배열로 5개 선언하고, 각 메뉴별로 배경색상을 지정한후, 수평으로 리스트 출력되게 하세요.
	<style> css 메뉴 리스트
	for문 배열 처리.
	<ul><li><a href='#'>메뉴내용</a></li></ul>
--%>
<style>span{border-radius:5px;padding:5px;}</style>
<%
String []menu={"로그인","메인화면","상품분류1","상품분류2","관리자"};
String []bks={"orange","yellow","pink","skyblue","lightgreen"};
for(int idx=0;idx<menu.length;idx++){
%>
	<span style='background:<%=bks[idx]%>'><%=menu[idx]%></span>
<%} %>
<%--
[1단계:확인] *8. [화면구현] jsp에서 테이블로 2X3, 3X4, 5X2를 만들고, 2의 배수, 4의 배수, 5의 배수로 출력하세요.(배경색상은 홀짝 다르게 출력)
--%>


</body>
<script type="text/javascript">
var isFail = <%=isFail%>
if(isFail){
	alert("해당 부서가 없습니다.")
}
/*

*/
</script>
</html>