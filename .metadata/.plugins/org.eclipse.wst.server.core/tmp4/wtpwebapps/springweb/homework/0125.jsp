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
2023-01-25
[1단계:개념] 1. 새로운 dao패키지, 새로운 dao와 새로운 mapper를 추가했을 때, 새로운 vo를 mybatis에 추가할 때, 처리할 내용을 기술하세요.
	- 새로운 dao패키지
	XXXMapper.xml에 dao추가
	<mapper namespace="a01_diexp.mybatis.dao.A02_ExpDao">
	
	- 새로운 dao와 새로운 mapper를 추가했을 때
	사용 XXXMapper.xml을 추가
	<mapper resource="a01_diexp/mybatis/resource/A01_EmpMapper.xml"/>
	
	- 새로운 vo를 mybatis에 추가할 때
	사용할(XXXMapper.xml) 패키지명 포함 vo클래스를 alias 선언
	<typeAlias alias="emp" type="springweb.z01_vo.Emp"/>
[1단계:확인] *2. salgrade활용하여 select * from salgrade를 처리할려고 한다. 처리순서를 기술하세요. 
	1) sql : select * from salgrade
	2) vo : Salgrade
	3) dao : public Salgrade getSalgrade();
	4) mapper
		<select id="getSalgrade" resultType="salgrade">
			select * from salgrade
		</select>
	5) main()
		Salgrade sal = dao.getSalgrade();
		sal.getGrade();	
[1단계:확인] 3. a01_diexp.mybatis하위에 dao3패키지를 만들어 회원테이블을 조회할려고 한다. 처리순서와 내용 코드를 기술하세요.
	- sql
		SELECT * FROM member;
	- vo
		Member
	- dao
		public List<Member> getMemberList();
	- 공통 mybatis alias등록
		<typeAlias alias="member" type="springweb.z01_vo.Member"/>
	- mapper
		<select id="getMemberList" resultType="member">
			SELECT * FROM member
		</select>
	- main()
		List<Member> mList = dao.getMemberList()
		System.out.println("데이터 건수:"+mList.size());
		for(Member m:mList) {
			System.out.print(m.getId()+"\t");
			System.out.print(m.getName()+"\t");
			System.out.print(m.getAuth()+"\t");
			System.out.print(m.getPoint()+"\n");
		}
[1단계:개념] *4. resultType을 쓰는 경우와 resultMap을 쓰는 경우의 차이점을 기술하세요.  
	1) 컬럼명과 property 동일한 경우
		resultType 활용
	2) 컬럼명과 property 다르게 설정 해야하는 경우
		resultMap 활용
[1단계:확인] *5. 1대 다 resultMap 활용
	1. select ename name, mgr manager, sal salaray from emp로 sql을 처리하여 mybatis에서 처리할려고 한다.vo를 변경하지 않고 처리하세요.
		<resultMap type="emp" id="empSult">
			<result column="name" property="ename"/>	
			<result column="manager" property="mgr"/>	
			<result column="salaray" property="sal"/>	
		</resultMap>
		
		public List<Emp> getEmpData();
		
		<select id="getEmpData" resultMap="empSult">
			select ename name, mgr manager, sal salaray from emp
		</select>
	2. select deptno no, dname departname, loc location from dept sql 처리
		<resultMap type="dept" id="deptSult">
			<result column="no" property="deptno"/>	
			<result column="departname" property="dname"/>	
			<result column="location" property="loc"/>	
		</resultMap>
		
		public List<Dept> getDeptData();
		
		<select id="getDeptData" resultMap="deptSult">
			select deptno no, dname departname, loc location from dept
		</select>

## 풀이 ##
[1단계:확인] *2. salgrade활용하여 select * from salgrade를 처리할려고 한다. 처리순서를 기술하세요. 
	sql : select * from salgrade
	vo : Salgrade
	dao : public List<Salgrade> getSalgrade();
	공통 mybatis
	mapper : 
		<select id="getSalgrade" resultType="salgrade">
			select * from salgrade
	main()
		List<Salgrade> slist = dao.getSalgrade();
		System.out.println("등급 데이터 크기:"+slist.size());
[1단계:개념] *4. resultType을 쓰는 경우와 resultMap을 쓰는 경우의 차이점을 기술하세요.  
	resultType : column과 vo property가 동일한 경우
	resultMap : column과 vo property가 다른 경우 및 1:다, 1:1객체로 설정해야 하는 경우
		select sal + nvl(comm,0) tot
		from emp
		column tot ==> Emp에 setSal 할당이 필한 경우에 resultMap을 활용
[1단계:확인] *5. 1대 다 resultMap 활용
	1. select ename name, mgr manager, sal salaray from emp로 sql을 처리하여 mybatis에서 처리할려고 한다.vo를 변경하지 않고 처리하세요.
		sql : select ename name, mgr manager, sal salaray from emp
		vo : emp
		dao : public List<Emp> getEmpList()
		mapper 
			<resultMap id="empResult" type="emp">
				<result column="name" proeprty="ename"/>
				<result column="manager" proeprty="mgr"/>
				<result column="salgray" proeprty="sal"/>
			<select id="getEmpList" resultMap="empResult">
				select ename name, mgr manager, sal salaray 
				from emp
	2. select deptno no, dname departname, loc location from dept sql 처리
		sql : select deptno no, dname departname, loc location from dept
		vo : dept
		dao : public List<dept> getdeptList()
		mapper 
			<resultMap id="deptResult" type="dept">
				<result column="no" proeprty="deptno"/>
				<result column="departname" proeprty="dname"/>
				<result column="location" proeprty="loc"/>
			<select id="getdeptList" resultMap="deptResult">
				select deptno no, dname departname, loc location 
				from dept
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