<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import = "java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
</head>
<body>
<%--
2023-01-09
[1단계:개념] 1. MVC패턴으로 ajax를 구현할려고 한다. 주요 자바프로그램과 프로세스를 설명하세요
            controller, service, view
	1) 초기 화면 로딩 : html
	2) key이벤트에 의해서 ajax호출(요청값 전달)
	3) controller단에서 요청값 전달
	4) 전달할 json문자열 만들기(List객체 ==> json 문자열)
	5) client단에서 받은 json문자열 객체로 변환 : JSON.parse()
	6) js 반복 처리로 출력 처리
[1단계:개념] 2. Gson lib는 어떤 역할을 하는지 예제를 통해서 설명하세요
	Gson은 Java에서 Json을 파싱하고, 
	생성하기 위해 사용되는 구글에서 개발한 오픈소스.
	Java Object를 Json 문자열로 변환할 수 있고, 
	Json 문자열을 Java Object로 변환할 수 있다.
[1단계:개념] 3. controller의 PrintWriter out =response.getWriter();는 어떤 역할을 하는가?
	Servlet으로 들어온 요청은 대체로 텍스트(HTML)로 응답을 보내기 때문에,
	PrintWriter out = response.getWriter(); 
	이런 식으로 응답으로 내보낼 출력 스트림을 얻어낸 후,
	out.println("json 데이터 호출"); 
	이런 식으로 스트림에 텍스트를 기록.
[1단계:확인] *4. 회원등록form을 로딩하고, id중복여부를 확인하는 기능을 처리하는 MVC ajax를 구현하세요.
           기존 dao에서 검색메서드 활용
controller
	A13_MemberController.java(/member.do)
		String id = request.getParameter("id");
		if(id==null){
			request.getRequestDispatcher("WEB-INF\a01_mvc\a12_memberReg.html"
				).forward(request,response);
		}else{
			PrintWriter out = request.getPrintWriter()
			out.print(service.checkIdJson(id))
		}
		
service
	A14_MemberService.java, A06_PareparedDao.java(checkId(String id))
		public String checkIdJson(String id){
			return dao.checkId(id);
		}
		
view
	WEB-INF\a01_mvc\a12_memberReg.html
	<h2>회원등록</h2>
		아이디:<input type="text" name="id"/>
			<input type="button" value="등록여부확인" id="chIdBtn"/>
			<input type="hidden" id="passIdck" value="false"/>
	<script>
		var idObj = document.querySelector("[name=id]");
		var chIdBtn = document.querySelector("#chIdBtn");
		var passIdckObj = document.querySelector("#passIdck");
		idObj.onkeyup=function(){
			// 글자 유효성 check(8~18)
			if(event.keyCode==13){
				validChk();
			}
		}
		chIdBth.onclick=validChk;
		function validChk(){
			var idVal = idObj.value;
			if(idVal>=8 && idVal<=18){
				idCkAjax()
			}else{
				alert("등록할 아이디는 8~18 가능합니다")
			}
		}
		function idCkAjax(){
			var xhr = new XMLHttpRequest();
			xhr.open("get","/member.do", true);
			xhr.send()
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4 && xhr.status==200){
					console.log(xhr.responseText)
					var hasId = JSON.parse(xhr.responseText)
					if( hasId ){
						alert("등록된 아이디 입니다");
						passIdckObj.value="true" // 최종적으로 회원등록시
						idObj.readOnly="readOnly" // 일단 인증이 되었을 때는 변경 못하게
					}else{
						alert("등록 가능한 아이디 입니다");
					}
				}
			}
		}

[1단계:개념] 5. 스프링 환경 설정을 위한 순서를 기술하세요
	1) 단계별 스프링 환경
		- 1단계 : dynamic web project기반 스프링환경 결정
		- 2단계 : sts(spring tool suits) 툴을 이용한 스프링 부트 활용
	2) lib : 필요한 jar 파일 복사
	3) 컨테이너 설정
		스프링 핵심(core) 처리로 xml파일로 설정한다.(dispatcher-servlet.xml)
		src\main\webapp\WEB-INF 가 default 설정 위치
	4) web.xml 설정
		스프링 프레임워크 시작	front-controller설정
			dispatcherservlet(프레임워크 지원 클래스)
			- 위 컨테이너 설정의 위치를 변경할 수 있다.
		요청값(get/post)의 한글 처리를 위한 filtering 선언
			(프레임워크 지원 클래스)
	5) MVC처리를 위한
		사용자 정의 controller/service/dao 선언
		view단 선언 : WEB-INF하위에 보안폴드로 jsp/html호출
	6) 기타 front 프레임워크 및 lib설정
		- boot strap 설정
		- jquery 설정
	7) 초기 view단에서 위 front단 프레임워크 lib 호출 처리
[1단계:개념] 6. dispather.xml와 web.xml의 역할을 기술하세요.
	1) dispather.xml
	DispatcherServlet은 httpServlet을 상속 받는 실제 서블릿이다.
	그리고 code-based 또는 web.xml에서 설정한다. 
	2) web.xml
	WEB-INF 디렉토리 에 있는 web.xml 파일이며 
	DispatcherServlet이 처리할 url-mapping을 반드시 같이 작성해주어야 한다.
[1단계:확인] 7. 다이나믹 웹프로젝트로 springweb2로 만들고, 스프링의 front단과 컨트롤러를 등록하고 backend를 호출하세요.
            ppt자료 작성 및 제출
[1단계:개념] *8. 오늘 한 예제 밑에 바로 및에 기능 메서드 추가하여 start2.do로 a02_start.jsp가 호출되는 예제를 작성하세요.
	// http://localhost:7080/springweb/start2.do
	// url 주소
	@RequestMapping("/start2.do")
	public String start2() {
		return "WEB-INF\\views\\a01_start\\a02_start.jsp";
	}
 --%>
</body>
</html>