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

<%-- *:풀이
2022-11-22
[1단계:개념] 1. jsp의 request 객체의 기능와 기능메서드를 기술하세요
	# request 기본 객체
	1. 웹 브라우저가 웹 서버에 전송한 요청 관련 정보 제공
	2. 주요 기능
		1) 클라이언트(웹 브라우저)와 관련된 정보 읽기 기능
		2) 서버와 관련된 정보 읽기 기능
		3) 클라이언트가 전송한 요청 파라미터 읽기 기능
		4) 클라이언트가 전송한 쿠키 읽기 기능
		5) 속성 처리 기능
	3. request 기본 객체 - 주요 정보 제공 메소드
		기준이 되는 서버 : http://localhost:8080/a02_jsp/a02_startJSP/a03_request.jsp
		1) getRemoteAddr()
			웹 서버에 연결한 클라이언트의 ip 주소를 구한다.
			게시판이나 방명록 등에서 글 작성자의 ip 주소가 자동으로 입력되기도 하는데,
			이 때 입력되는 ip 주소가 바로 이 메서드를 사용하여 구현되는 것이다.
		2) getMethod()
			웹 브라우저가 정보를 전송할 때, 사용한 방식을 구한다.
		3) getRequestURI() : 웹 브라우저가 요청한 URL에서 경로를 구한다.
		4) getContextPath() : JSP 페이지가 속한 웹 어플리케이션의 컨텍스트 경롤ㄹ 구한다.
		5) getServerName() : 연결할 때 사용한 서버 이름을 구한다.
		6) getSerPort() : 서버가 실행중인 포트 번호를 구한다.
[1단계:개념] 2. request.getParameter(), request.getParameterValues()의 차이를 기술하세요.
	request.getParameter(String name)
		: 이름이 name인 파라미터의 값을 구한다. 존재하지 않을 경우 null로 리턴
	request.getParameterValues(String name)
		: 이름이 name인 모든 파라미터의 값을 배열로 구한다. 존재하지 않을 경우 null을 리턴한다.
[1단계:확인] 3. form 하위 요소객체와 request.getParameterNames()를 이용하여 사원명/사원번호/부서이름을 등록리스트하세요

	<form>
		사원명:<input type="text" name="ename" value="홍길동">
		사원번호:<input type="text" name="empno" value="1001">
		부서이름:<input type="text" name="dname" value="인사">
		<input type="submit" value="등록">
	</form>
	<table>
		<tr><th>항목</th><th>사원정보</th></tr>
	<%
	Enumeration e = request.getParameterNames();
	while(e.hasMoreElements()){
		String key = (String)e.nextElement();
	%>
		<tr><td><%=key%></td><td><%=request.getParameter(key) %></td></tr>
	<%} %>
	</table>
 
[1단계:확인] *4.(선택) form요소객체를 이용하여 학생3명의 이름입력하고 요청값을 처리하세요.
<h2>학생</h2>
<%
	//String []names = {"홍길동","김길동","신길동"};
%>
<form>
	<table>
		<tr><th>이름</th></tr>
		<%
		for(int cnt=1;cnt<=3;cnt++){
		%>
			<tr><td><input type="text" name="name" value=""/>
			</td></tr>
		<%
		}
		%>
		<tr><td><input type="submit"/></td></tr>
	</table>
</form>
	<p align="center">
	<%
		String []names = request.getParameterValues("name");
		if(names!=null){
			for(String name:names){
				out.print(name+",");
			}
		}
	%>
	</p>
[2단계:확인] *4.(선택) form요소 객체를 이용하여 학생3명의 국어점수를 입력하고 요청값을 처리하여 합산을 출력하세요
<h2>학생</h2>
<%
	//String []names = {"홍길동","김길동","신길동"};
%>
<form>
	<table>
		<tr><th>이름</th><th>국어</th></tr>
		<%
		for(int cnt=1;cnt<=3;cnt++){
		%>
			<tr><td><input type="text" name="name" value=""/></td>
				<td><input type="text" name="kor" value="0"/></td></tr>
		<%
		}
		%>
		<tr><td colspan="2"><input type="submit"/></td></tr>
	</table>
</form>
	<p align="center">
	<%
		String []names = request.getParameterValues("name");
		String []kors = request.getParameterValues("kor");
		if(names!=null){ // 초기 로딩 화면과 구분
			for(String name:names){
				out.print(name+",");
			}
		}
		out.print("<br>국어점수:");
		if(kors!=null){
			int tot = 0;
			for(String kor:kors){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(kor);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>국어합산:"+tot+", 국어평균:"+(tot/3));
		}
	%>
	</p>

[3단계:확인] *4.(선택) form요소객체를 이용하여 학생3명의 이름/국어/영어/수학 입력하고 요청값을 처리하세요.
               각, 학생의 평균 점수와 과목별 평균점수를 출력하세요.
<h2>학생</h2>
<%
	//String []names = {"홍길동","김길동","신길동"};
%>
<form>
	<table>
		<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th></tr>
		<%
		for(int cnt=1;cnt<=3;cnt++){
		%>
			<tr><td><input type="text" name="name" value=""/></td>
				<td><input type="text" name="kor" value="0"/></td>
				<td><input type="text" name="eng" value="0"/></td>
				<td><input type="text" name="math" value="0"/></td>
			</tr>
		<%
		}
		%>
		<tr><td colspan="4"><input type="submit"/></td></tr>
	</table>
</form>
	<p align="center">
	<h3>
	<%
		String []names = request.getParameterValues("name");
		String []kors = request.getParameterValues("kor");
		String []engs = request.getParameterValues("eng");
		String []maths = request.getParameterValues("math");
		int totAll = 0;
		if(names!=null){ // 초기 로딩 화면과 구분
			for(String name:names){
				out.print(name+",");
			}
		}
		out.print("<br>국어점수:");
		if(kors!=null){
			int tot = 0;
			for(String kor:kors){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(kor);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>국어합산:"+tot+", 국어평균:"+(tot/3));
		}
		out.print("<br>영어점수:");
		if(engs!=null){
			int tot = 0;
			for(String eng:engs){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(eng);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>영어국어합산:"+tot+", 영어평균:"+(tot/3));
		}
		out.print("<br>수학점수:");
		if(maths!=null){
			int tot = 0;
			for(String math:maths){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(math);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>수학합산:"+tot+", 수학평균:"+(tot/3));
			totAll+=tot/3;
		}
		out.print("<br>전체과목학생 평균:"+(totAll/3));
	%>
	</h3>
	</p>
--%>
<h2>학생</h2>
<%
	//String []names = {"홍길동","김길동","신길동"};
%>
<form>
	<table>
		<tr><th>이름</th><th>국어</th><th>영어</th><th>수학</th></tr>
		<%
		for(int cnt=1;cnt<=3;cnt++){
		%>
			<tr><td><input type="text" name="name" value=""/></td>
				<td><input type="text" name="kor" value="0"/></td>
				<td><input type="text" name="eng" value="0"/></td>
				<td><input type="text" name="math" value="0"/></td>
			</tr>
		<%
		}
		%>
		<tr><td colspan="4"><input type="submit"/></td></tr>
	</table>
</form>
	<p align="center">
	<h3>
	<%
		String []names = request.getParameterValues("name");
		String []kors = request.getParameterValues("kor");
		String []engs = request.getParameterValues("eng");
		String []maths = request.getParameterValues("math");
		int totAll = 0;
		if(names!=null){ // 초기 로딩 화면과 구분
			for(int idx=0;idx<names.length;idx++){
				int tot = Integer.parseInt(kors[idx])+
						  Integer.parseInt(engs[idx])+
						  Integer.parseInt(maths[idx]);
				out.print(names[idx]+", 평균:"+(tot/3)+"<br>");
			}
		}
		out.print("<br>국어점수:");
		if(kors!=null){
			int tot = 0;
			for(String kor:kors){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(kor);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>국어합산:"+tot+", 국어평균:"+(tot/3));
		}
		out.print("<br>영어점수:");
		if(engs!=null){
			int tot = 0;
			for(String eng:engs){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(eng);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>영어국어합산:"+tot+", 영어평균:"+(tot/3));
		}
		out.print("<br>수학점수:");
		if(maths!=null){
			int tot = 0;
			for(String math:maths){
				// 공백, null 숫자형에 대한 처리 ==>0
				int pt = 0;
				try{
					pt+=Integer.parseInt(math);
					out.print(pt+" ");
				}catch(Exception e){}
				tot+=pt;
			}
			out.print("<br>수학합산:"+tot+", 수학평균:"+(tot/3));
			totAll+=tot/3;
		}
		out.print("<br>전체과목학생 평균:"+(totAll/3));
	%>
	</h3>
	</p>

<%-- 
[1단계:확인] 5. form요소 객체를 활용하여 장바구니 담긴 물건 3개 중, check된 물건명 요청하여 구매갯수와 물건명 출력
[2단계:확인] 5. form요소 객체를 활용하여 장바구니 담긴 물건 3개 중, check된 물건명의 가격을 계산하여 총가격 출력하세요
[3단계:확인] *5. form요소 객체를 활용하여 장바구니 담긴 물건 3개 중, check된 물건명과 가격 구매갯수 총계가 계산 되게 하세요.
[1단계:개념] 6. 요청값을 encoding하는 이유를 기술하고, meothod의 get방식과 post방식의 차이점을 기술하세요.
	# form 데이터 처리 방식 : method 속성
	1. 요청 파라미터를 전송하는 방식
		1) get 방식 : url 주소창에 쿼리스트링으로 전송을 한다.
			- tomcat 서버에서 요청값 encoding을 처리
		2) post 방식 : 요청 몸체에서 쿼리스트링을 숨겨서 전송한다.
			- 직접적으로 코드를 통해 encoding을 처리
				request.setCharacterEncoding("utf-8");
[1단계:확인] *7. post 방식으로 월드컵 A조의 팀명과 점수를 입력하고 현재 대전 결과를 출력하세요.
                     팀1    팀2 
                팀명[   ]  [    ]
                점수[   ]  [    ]
                      [결과] 
                    @@@ vs @@@
                      1 - 2
                      @@@ 승
--%>
<h2>월드컵 결과</h2>
<form method="post">
	<table>
		<tr><th></th><th>팀1</th><th>팀2</th></tr>
		<tr>
			<th>팀명</th><td><input type="text" name="tname"></td>
			<td><input type="text" name="tname"></td>
		</tr>
		<tr>
			<th>점수</th><td><input type="text" name="point"></td>
			<td><input type="text" name="point"></td>
		</tr>
		<tr><td colspan="3"><input type="submit" value="결과"></td></tr>
	</table>
</form>
<%
	String tnames[] = request.getParameterValues("tname");
	String points[] = request.getParameterValues("point");
	if(tnames!=null){
		out.print(tnames[0]+" vs "+tnames[1]+"<br>");
		out.print(points[0]+" : "+points[1]+"<br>");
		int pt1 = Integer.parseInt(points[0]);
		int pt2 = Integer.parseInt(points[1]);
		String result = "무승부";
		if(pt1>pt2) result = tnames[0]+"승";
		if(pt1<pt2) result = tnames[1]+"패";
		out.print(result);
	}
%>
</body>
<script type="text/javascript">
/*

*/
</script>
</html>