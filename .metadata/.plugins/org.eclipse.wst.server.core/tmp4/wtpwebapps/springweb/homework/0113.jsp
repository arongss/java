<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
2023-01-13
[1단계:개념] 1. 스프링에서 DI란 무엇인가?
	spring framework에서 사용되는 컨테이너의 처리개념이다.
	스프링 프레임웍의 핵심 개념으로 이에 대한 이론과 실제 처리 방법을
	확인하고, 스프링의 환경설정과 객체 사용에 대한 명확한 기준을
	정립하고 활용할 수 있게 된다.
[1단계:개념] 2. 스프링에서 IOC란 무엇인가
	제어권의 역전이란?
		객체의 생성, 사용, 소멸로 처리되는 생명 주기의 관리까지
		기존에 개발자의 각 객체 안에서 호출해서 처리되는 내용을
		컨테이너에 의해서 처리되게끔 객체에 대한 제어권을 바뀌었다는 것을 의미한다.
		컴포넌트 의존 관계 결정, 설정 및 생명주기를 해결하기 위한 디자인 패턴을 말한다.
		스프링 프레임워크도 객체에 대한 생성 및 생명주기를 관리할 수 있는
		기능을 제공하고 있음을 말하고, 이것을 IOC라고 한다.
		IOC는 컨테이너에서 객체의 생성을 책임지고, 의존성을 관리한다.
		의존성관리 객체간에 Controller ==> service ==> Dao 형태로
		상호의존을 하여 처리하는 것을 말하고, 이것한 것을 컨테이너에서 관리하는 것을 말한다.
[1단계:개념] 3. DI설정의 위한 가상환경 설정 방법을 기술하세요
	만능키트와 같은 컨테이너(dispatcher-servlet.xml)
	==> 스프링에서 핵심 객체들을 컨테이너 메모리에 올려서 호출하게 한다.
	즉, 스프링 웹 프로그래밍은 다음과 같은 과정을 거쳐서 처리된다.
	url로 주소와 요청값 전달 ==> 웹서버 호출 ==>
	웹서버안에 web.xml ==> 컨테이너 호출(dispatcher-servlet.xml)
	==> 객체 메모리 로딩 ==> 특정 호출 mapping controller
	호출 및 메서드 호출 ==> 모델처리(service, dao처리후)
	==> view단 호출 ==> 화면단을 클라이언트에 전달
[1단계:확인] 4. property를 활용해서 가상 컨테이너안에서 BaseBallPlayer(이름, 팀명, 타율)를 선언하세요
	<bean id="bs01" class="a01_diexp.z01_vo.BaseBallPlayer">
		<property name="name" value="홍길동" />
		<property name="tname" value="두산" />
		<property name="hitRatio" value="0.345" />
	</bean>
[1단계:확인] 5. constructor를 활용해서 가상 컨테이너안에서 BaseBallTeam를(팀명, 승,무,패) 선언하세요
	<bean id="bt01" class="a01_diexp.z01_vo.BaseBallTeam">
		<constructor-arg value="삼성라이온즈" />
		<constructor-arg value="2" />
		<constructor-arg value="0" />
		<constructor-arg value="1" />
	</bean>
[1단계:확인] 6. BaseBallPlayer에 소속 팀 객체를 선언하여 1:1로 할당하고, 해당 선수와 소속팀 정보를 출력 메서드를 선언하세요.
	//객체 호출 처리
	BaseBallPlayer bs01 = ctx.getBean("bs01", BaseBallPlayer.class);
	BaseBallPlayer bs02 = ctx.getBean("bs02", BaseBallPlayer.class);
	bs01.teamInfo();
	bs02.teamInfo();
	//컨테이너
	<bean id="bt01" class="a01_diexp.z01_vo.BaseBallTeam">
		<constructor-arg value="삼성라이온즈"/>
		<constructor-arg value="2"/>
		<constructor-arg value="1"/>
		<constructor-arg value="0"/>
	</bean>
	<bean id="bs01" class="a01_diexp.z01_vo.BaseBallPlayer">
		<constructor-arg value="홍길동"/>
		<constructor-arg value="0.304"/>
	</bean>
	<bean id="bs02" class="a01_diexp.z01_vo.BaseBallPlayer">
		<constructor-arg value="마길동"/>
		<constructor-arg value="0.334"/>
		<property name="baseBallTeam" ref="bt01"/>
	</bean>
	//teamInfo()
	public void teamInfo() {
		System.out.println("# 소속팀 정보 #");
		System.out.println("선수명:"+name);
		System.out.println("타율:"+hitRatio);
		if(baseBallTeam!=null) {
			System.out.println("팀명:"+baseBallTeam.getTname());
			System.out.println("전적:"+baseBallTeam.getWin()+"승 "+baseBallTeam.getDraw()+"무 "+baseBallTeam.getLose()+"패");
		}else {
			System.out.println("소속한 팀이 없네요.");
		}
	}
 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>