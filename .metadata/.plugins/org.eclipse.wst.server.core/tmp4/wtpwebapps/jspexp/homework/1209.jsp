<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
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
2022-12-09
[1단계:개념] 1. 세션의 삭제방법을 기술하세요
	# 세션의 중단
	1. 세션은 3가지 형태로 중단을 처리할 수 있다.
		1) 명시적으로 중단메서드에 의해서 
			session.invalidate()
			ex) 로그아웃하면 지금까지 설정된 세션을 중단 시켜 준다.
		2) 시간을 설정해서 해당 시간이후 중단 처리(초)
			session.setMaxInactiveInterval(1000)
			해당 시간동안 요청이 없을 때 중단
		3) web.xml에서 서버단위로 설정
			서버 단위에 분단위로 요청이 없을 때 중단
			<session-config>
		  		<session-timeout>30</session-timeout>
		  	</session-config>
[1단계:확인] 2. 로그인 클릭시 session에 설정 후 다시 Member의 아이디와 이름이 출력되고 하고,
           로그아웃 클릭시, 로그인해야합니다가 출력되게 하세요.
--%>
<h2 onclick="makeSess()">세션 설정(로그인 후 세션 생성)</h2>
<h2 onclick="delSess()">세션 삭제(로그아웃)</h2>
<script type="text/javascript">
   function makeSess(){
      location.href="z01_makeSession.jsp?sess=y"
   }
   function delSess(){
      location.href="z01_makeSession.jsp?sess=n"
   }
</script>
<h2>세션 상태</h2>
<%
   String id = (String)session.getAttribute("id");
   String pass = (String)session.getAttribute("pass");
   if(id!=null&&pass!=null){
      out.print("<h3>세션생성됨 id:"+id+",비밀번호:"+pass+"</h3>");
   }else{
      out.print("<h3>세션생성됨:로그인해야합니다</h3>");
   }
%>
<%--
z01_makeSession.jsp 
<%
   String sess = request.getParameter("sess");
   if(sess!=null){
      if(sess.equals("y")){
         session.setAttribute("id","himan");
         session.setAttribute("pass","7777");
      }
      if(sess.equals("n")){
         // session.invalidate(); 전체세션 종료 처리
         session.removeAttribute("id"); // 특정한 세션 종료 처리
         session.removeAttribute("pass");
      }
      response.sendRedirect("1209.jsp");
   }
%>
--%>
<%--
[1단계:확인] 3. el로 session범위로 사원 정보 사원번호, 사원명, 부서명을 저장후, 페이지가 이동해서도
           해당 정보를 출력하는 것을 확인하세요.
--%>
<%
	session.setAttribute("empno","1004");
	session.setAttribute("ename","홍길동");
	session.setAttribute("dname","회계");
%>
	<h2>사원번호:${empno}</h2>
	<h2>사원명:${ename}</h2>
	<h2>부서명:${dname}</h2>	
	<a href="z02_exp3.jsp">세션값 확인하러가기?(과연 무슨 일이??)</a>
<%--
	z02_exp3.jsp
	<h2>사원번호:${empno}</h2>
	<h2>사원명:${ename}</h2>
	<h2>부서명:${dname}</h2>	
 --%>
<%--
[1단계:확인] 4. 1~100까지 임의의 숫자를 session객체에 국어/영어/수학 점수로 할당후, el로 각 점수와 총점,
            평균, 평균70이상일때 합격 그외는 불합격을 출력하세요.
--%>
<%
	session.setAttribute("kor", Math.floor(Math.random()*100+1));
	session.setAttribute("eng", Math.floor(Math.random()*100+1));
	session.setAttribute("math", Math.floor(Math.random()*100+1));
%>
	<h2>국어:${kor}</h2>
	<h2>영어:${eng}</h2>
	<h2>수학:${math}</h2>
	<h2>총점:${kor+eng+math}</h2>
	<h2>평균:${(kor+eng+math)/3}</h2>
	<h2>합격여부:${(kor+eng+math)/3>70?'합격':'불합격'}</h2>
<%--
[1단계:개념] 5. el의 property란 무엇인가 기술하세요.
	# el활용한 VO객체 처리
	1. el은 VO객체를 property라는 개념으로 접근해서 호출할 수 있다.
	2. 저장시, 호출시
		1) scope에 따른 객체로 저장.
			request.setAttribute("p01", new Person());
		2) 가져올 때..
			<%=p01.getName()%> ==> 
				${p01.name} 필드를 호출하는 것이 아님 getName()
				get삭제 Name() ==> name 변경해서 처리..
			VO
				필드를 name01로 해도 접근 가능?
				getName() ==> getName88()	${p01.name88}
				==> el는 없으면 nullpointerException 발생하지 않고 
				공백으로 처리된다. (조건문 처리 하지 않더라도)
[1단계:확인] 6. Member객체로 session객체로 할당한 후, 해당 객체를 el로 호출하여 출력하세요.
--%>
<%
	request.setAttribute("mem", new Member("홍길동","관리자"));
%>
	<h2>이름:${mem.name}</h2>
	<h2>권한:${mem.auth}</h2>
</body>
<script type="text/javascript">
/*

*/
</script>
</html>