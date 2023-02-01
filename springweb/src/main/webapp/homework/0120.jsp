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
2023-01-20
[1단계:개념] 1. mybatis 설정의 위해 container에서 설정할 내용을 기술하세요.
	# DB연결처리
	1. dbcp(database connection pool)로 연결
		oracle.jdbc.driver.OracleDriver
	<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
		<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
		<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
		<property name="username" value="scott"/>
		<property name="password" value="tiger"/>
	</bean>
	# Mybatis 연동
	1. 위 선언한 dbcp와 연결
	2. mybatis 공통 xml과 연동처리
		src\main\java\resource\mybatis.Spring.xml
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
		<property name="configLocation" value="classpath:resource/mybatis.Spring.xml"></property>
	</bean>
	# 마이바티즈에 의해 자동 생성 dao 인터페이스 선언
	<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
		<property name="basePackage" value="springweb.a05_mvc.a03_dao"></property>
	</bean>
[1단계:개념] 2. mybatis 설정의 위해 mybatis.Spring.xml에서 설정할 내용을 기술하세요
	1. 사용할(XXXMapper.xml) 패키지명 포함 vo클래스를 alias 선언
	2. 사용 XXXMapper.xml을 추가  a01_diexp\mybatis\resource\A01_EmpMapper.xml
[1단계:개념] 3. dao와 XXXMapper.xml의 연동 규칙을 기술하세요.
	1) sql 작성
	2) sql 처리를 위한 DTO(VO)를 작성
	3) db처리 인터페이스 선언(dao패키지하위에)
		public List<Emp> getEmpList(Emp sch);
	4) 공통 mybatis xml에 공통 vo 등록, 각 업무 단위 mapper.xml을 추가 및 선언.
	5) mapper.xml에서
		A01_Emp.Mapper.xml : 선언된 인터페이스 상속하여 실제 사용할 DAO객체를 생성
		- 인터페이스명 ==> namespace명
		- 요소객체 안에 사용할 sql 처리
		- 메서드명 ==> id
		- 메서드의 매개변수 ==> parameterType
		- 메서드의 리턴값 ==> resultType
[1단계:확인] 4. 단일 리턴값 처리 연습(아래와 같은 sql을 처리하는 dao와 mapper.xml을 구현하고  main()에서 호출하세요.
      1) 최고 관리자 번호
      	1) sql : select count(*) from emp100
		2) dao의 메서드 선언 : public int empCount();
		3) XXXMapper.xml
			<select id="empCount" resultType="int">
				select count(*) from emp100
			</select>
		4) main()에서 호출 : System.out.println("사원수:"+dao.empCount());
      2) 40번 부서의 최근 입사자의 입사일
      	1) sql : select count(*) from emp100
		2) dao의 메서드 선언 : public int empCount();
		3) XXXMapper.xml
			<select id="empCount" resultType="int">
				select count(*) from emp100
			</select>
		4) main()에서 호출 : System.out.println("사원수:"+dao.empCount());
      3) 직책이 SALESMAN의 최저 급여
      	1) sql : select count(*) from emp100
		2) dao의 메서드 선언 : public int empCount();
		3) XXXMapper.xml
			<select id="empCount" resultType="int">
				select count(*) from emp100
			</select>
		4) main()에서 호출 : System.out.println("사원수:"+dao.empCount());
      4) 연봉이 2000~4000 구간의 사원의 수
      	1) sql : select count(*) from emp100
		2) dao의 메서드 선언 : public int empCount();
		3) XXXMapper.xml
			<select id="empCount" resultType="int">
				select count(*) from emp100
			</select>
		4) main()에서 호출 : System.out.println("사원수:"+dao.empCount());
      5) 1/4분기에 입사한 사원의 수
      	1) sql : select count(*) from emp100
		2) dao의 메서드 선언 : public int empCount();
		3) XXXMapper.xml
			<select id="empCount" resultType="int">
				select count(*) from emp100
			</select>
		4) main()에서 호출 : System.out.println("사원수:"+dao.empCount());
[1단계:확인] 5. 단일 객체 처리 연습(아래와 같은 sql을 처리하는 dao와 mapper.xml을 구현하고  main()에서 호출하세요.
      1) 직책이 MANAGER인 사원의 최고 급여자
      
      *2) 부서번호가 10인 부서정보 (Dept alias 등록 필요 - dept - 공통 mybatis에)
		1. sql
			SELECT * 
			FROM dept100
			WHERE deptno =10;
		2. vo Dept
		3. dao
		   public Dept getDeptByDeptno();
		4. XXXMapper.xml
		   	  사용할 vo등록
		   	  Dept
		5. XXXMapper.xml
		    <select id="getDeptByDeptno" resultType="dept">
		    	SELECT * 
				FROM dept100
				WHERE deptno =10
		    </select>
      3) 사원명이 TURNER인 사원의 정보
      
      *4) 최초 입사자의 사원 정보 
     	 1. sql
		    SELECT * FROM EMP100
			WHERE HIREDATE = (
			SELECT min(hiredate)
			FROM emp100);
		/*
		2. vo
		3. dao : public Emp getInitHire();
		4. mapper : 
			<select id="getInitHire" resultType="emp">
				SELECT * FROM EMP100
				WHERE HIREDATE = (
					SELECT min(hiredate)
					FROM emp100)
			</select>
		5. main()
			Emp initEmp = dao.getInitHire();
			System.out.print("#최초입사자#");
			System.out.print("사원번호:"+initEmp.getEmpno());
			System.out.print("사원명:"+initEmp.getEname());
      *5) 2/4분기 최고 급여자의 정보
        1. sql
		    SELECT * 
		    FROM EMP100
			WHERE sal = (SELECT max(sal)
						FROM emp100
						where to_char(hiredate,'Q')='2'
						);
		2. vo emp
		3. dao : public Emp getMaxSalByTerms();
		4. mapper : 
			<select id="getMaxSalByTerms" resultType="emp">
				SELECT * 
			    FROM EMP100
				WHERE sal = (SELECT max(sal)
							FROM emp100
							where to_char(hiredate,'Q')='2'
							)
			</select>
		5. main()
			Emp emp = dao.getMaxSalByTerms();
			System.out.print("#2사분기 최고 급여자#");
			System.out.print("사원번호:"+emp.getEmpno());
			System.out.print("사원명:"+emp.getEname());
			System.out.print("급여:"+emp.getSal());

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