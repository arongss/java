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
2023-01-19
[1단계:개념] 1. 스프링의 컨테이너 안에 backend단 처리순서를 기술하세요.
	1. 스프링은 backend단은 다음과 같은 구조로 처리되고 있다.
		Controller <==> Service <==> Dao <==> DB서버
	2. 요청값을 받은 WAS는 web.xml과 front controller단을 처리되어 이와 연관관계가 있는 컨테이너를 거쳐 controller단에서 상호작용을 처리하다.
	3. 위 객체들은 컨테이너에서 메모리를 로딩한 후 실행된다.
	4. 그리고, Autowired옵션에 의해서 객체들은 필드에 선언하여 연관관계를 가지고 처리가 된다.
	5. Database의 경우는 보통 서버마다 환경설정(ip,port,sid,계정,비번)을 Dao에서 처리할 때, 컨테이너에서 설정하는 경우가 많다.
		- 그래서, autowired 하기보다 컨테이너에서 클래스를 선언하여, 위에 필요한 속성값을 처리해주는 경우가 많다.(연결객체)
	6. 그 외에서 컨테이너에 올려져 있다는 가정하에 호출하여 의존성 자동 주입 연결하여 사용하는 경우가 많다.
	7. 가상환경 설정
		1) DIExp21.java
			호출해서 테스트할 메인 화면, Controller의 기능메서드에 의해, Service, Dao, DB처리가 된 결과를 확인
		2) di21.xml
			a01_diexp.backend 패키지에 있는 클래스 자동 메모리 로딩 및 DB.java의 DB연결 정보 설정
		3) a01_diexp.backend 패키지의 클래스
			- @Comtroller, @Service, @Dao를 통해 객체가 컨테이너에서 자동 로딩 및 의존성 자동 주입으로 연관관계 설정
			- DB.java : 데이터 연결정보를 컨테이너에서 설정
[1단계:확인] 2. 다음은 컨터이너 객체 처리방법입니다. 단계별로 처리하세요
1) a01_diexp.z06_vo 패키지 만들기 1:1, 1:다 관계로 (물건, 마트)  (쇼핑몰,회원)클래스 선언
2) di91.xml에 위 패키지 클래스 로딩 처리
	<context:component-scan base-package="a01_diexp.z06_vo">
		<context:include-filter type="regex" expression=".*"/>
	</context:component-scan>
3) DIExp91.java에 해당 클래스 소스 코딩을 통해 autowire를 호출
	Product product = ctx.getBean("product", Product.class);
	System.out.println("컨테이너의 객체호출:"+product);
	product.setName("사과");
	product.setPrice(3000);
	product.setCnt(3);
	Mart mart = ctx.getBean("mart", Mart.class);
	System.out.println("컨테이너의 객체호출:"+mart);
	mart.setMname("행복마트");
	mart.buyList();
[1단계:확인] *3. 다음은 컨터이너 객체 처리방법입니다. 단계별로 처리하세요
1) a02_diexp.z07_web 패키지 만들기 controller, service, dao, A02_EmpDao.java(기본 dao 복사) 객체 할당.
2) di92.xml에 위 패키지 클래스 로딩 처리
3) DIExp92.java에 해당 클래스 소스 코딩을 통해 autowire를 호출 controller를 통해 사원정보 조회 출력하세요.
[1단계:개념] 4. mybatis 환경 설정 순서를 기술하세요.
	1) 마이바티즈라는 DB연동 처리하는 프레임워크를 활용해서 DB연동 sql 처리
	2) 컨테이너에 DB연결 객체 선언
		DBCP연결 객체를 통해 드라이버, 아이피, 계정, 패스워드를 통해 연결
	3) mybatis 프레임워크 설정
		- 위 선언된 연결객체를 통해서,
		- mybatis 공통 xml선언
			- 사용하게될 sql을 처리하는 xml 선언 위치
	4) 사용하게될 DAO 인터페이스 폴드 선언 : 이 폴드에서 선언된 인터페이스가 실제 dao 객체와 연동

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