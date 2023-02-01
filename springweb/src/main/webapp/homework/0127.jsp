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
2023-01-27
[1단계:개념] 1. db가 연결된 스프링 MVC패턴의 개발 순서를 기술하세요.
	1. 초기 화면 호출
		1) url 주소로 화면호출
			- controller, view(jsp)
		2) view단(jsp)
			- 기본적인 화면 ui 구현
	2. DB 처리
		1) sql
		2) vo
		3) dao(인터페이스)
		4) 공통 mybatis 설정 
		5) mapper처리
	3. service 호출
		1) 중간에 요청값 변경 처리 등등..비지니스 로직/알고리즘 처리
	4. controller단 model데이터 설정.
	5. view단 처리
		모델 데이터와 요청값에 대한 설정 처리
[1단계:확인] 2. 회원관리 화면을 처리하세요(member테이블 활용하여 리스트)
	A03_MemberController.java
		@Controller("memCtrl")
		public class A03_MemberController {
			@Autowired
			private A03_MemberService service;
			// http://localhost:7080/springweb/myMemberList.do
			@RequestMapping("/myMemberList.do")
			public String memberList(@ModelAttribute("sch") Member sch, Model d) {
				d.addAttribute("mlist", service.getMemberList(sch));
				return "WEB-INF\\views\\z01_homework\\0127_member.jsp";
			}
		}
	A03_MemberService.java
		@Service
		public class A03_MemberService {
			@Autowired
			private A03_MemberDao dao;
			public List<Member> getMemberList(Member sch){
				if(sch.getName()==null) sch.setName("");
				if(sch.getAuth()==null) sch.setAuth("");
				return dao.getMemberList(sch);
			}
		}
	A03_MemberDao.java
		public interface A03_MemberDao {
			public List<Member> getMemberList(Member sch);
		}
	A03_MemberMapper.xml
		<mapper namespace="springweb.a05_mvc.a03_dao.A03_MemberDao">
			<select id="getMemberList" resultType="member" parameterType="member">
				select id, name, auth, point 
				from member
				where name like '%'||#{name}||'%'
				and auth like '%'||#{auth}||'%'
			</select>
		</mapper>
	mybatis.Spring.xml
		<typeAliases>
			<typeAlias alias="member" type="springweb.z01_vo.Member"/>
		</typeAliases>
		<mappers>
			<mapper resource="resource/A03_MemberMapper.xml"/>
		</mappers>
	view
		<form id="frm01" class="form-inline"  method="post">
	  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		    <input name="name" value="${sch.name}" class="form-control mr-sm-2" placeholder="회원명입력" />
		    <input name="auth" value="${sch.auth}" class="form-control mr-sm-2" placeholder="권한입력" />
		    <button class="btn btn-info" type="submit">Search</button>
	 	</nav>
		</form>
		<table class="table table-hover table-striped">
			<col width="25%"><col width="25%"><col width="25%"><col width="25%">
		    <thead>
		      <tr class="table-success text-center">
		        <th>아이디</th><th>이름</th><th>권한</th><th>포인트</th></tr>
		    </thead>	
		    <tbody>
		    	<c:forEach var="member" items="${mlist}">
		    	<tr><td>${member.id}</td><td>${member.name}</td>
		    		<td>${member.auth}</td><td>${member.point}</td></tr>
		    	</c:forEach>
		    </tbody>
		</table>
[1단계:확인] 3. 회원관리 화면을 처리하세요(member테이블 활용하여 단일 데이터 조회)
	sql : select count(*) from member
	dao의 메서드 선언 : public int memberCount();
	XXXMapper.xml
		<select id="memberCount" resultType="int">
			select count(*) from member
		</select>
	main()에서 호출 : System.out.println("사원수:"+dao.empCount());
[1단계:확인] *4. 회원관리 화면을 처리하세요(member테이블 활용하여 수정)
[1단계:확인] *5. 회원관리 화면을 처리하세요(member테이블 활용하여 삭제)
[1단계:개념] 6. 모델어트리뷰트로 콤보박스를 사용하는 경우 처리하는 순서를 기술하세요.
	1. select형태의 콤보형선택은 DB연결되어서 처리되는 경우가 많다.
	2. controller단에서 공통으로 사용되는 key/value형식의 데이터는 ModelAttribute로 선언하여 사용한다.
	3. 처리 순서
		1) sql ==> dao 기능 메서드 추가
		2) controller단 modelattribute 선언
		3) view단에서 공통 modelattribute호출
	4. 부서정보 및 관리자번호 콤보박스만들기
		1) Code테이블 생성 key/value
		2) sql 작성
		3) dao기능 메서드 선언
		4) controller의 모델 attribute생성
		5) view단 처리
[1단계:확인] *7. 회원테이블(member)에 권한을 콤보박스를 사용하여 검색조건으로 추가하여 처리하세요.
	A03_MemberController.java
		@ModelAttribute("authCom")
		public List<String> getAuthComb(){
			return service.getAuthComb();
		}
	A03_MemberService.java
		public List<String> getAuthComb(){
			return dao.getAuthComb();
		}
	A03_MemberDao.java
		public List<String> getAuthComb();
	A03_MemberMapper.xml
		<select id="getAuthComb" resultType="string">
			SELECT DISTINCT auth
			FROM member
		</select>
	view
		<select name="auth" class="form-control mr-sm-2">
	    	<option value="">권한선택</option>
	    	<c:forEach var="auth" items="${authCom}">
	    	<option>${auth}</option>
	    	</c:forEach>
	    </select>
	    
## 풀이 ##
[1단계:확인] *4. 회원관리 화면을 처리하세요(member테이블 활용하여 수정)
[1단계:확인] *5. 회원관리 화면을 처리하세요(member테이블 활용하여 삭제)
[1단계:확인] *7. 회원테이블(member)에 권한을 콤보박스를 사용하여 검색조건으로 추가하여 처리하세요.
sql
	SELECT DISTINCT auth
	FROM member200
	
	select * from member200
	where id like '%'||#{id}||'%'
	and name like '%'||#{name}||'%'
	<if test="auth!=''">
	and auth = #{auth}
	</if>
	select * from member200
	where id = #{id}
	update member200
		set name=#{name},
			pass=#{pass},
			point=#{potin},
			auth=#{auth}
		where id = #{id}
	delete member200
	where id = #{id}
vo Member
	springweb.z01_vo.Member
공통mybatis member, MemberMapper.xml
dao 
	A03_MemberDao.java
	public List<String> getAuthCom();
	public List<Member> getMemberList(Member sch);
	public Member getMember(String id);
	public void uptMember(Member upt);
	public void delMember(String id);
mapper
	<select id="getAuthCom" resultType="string">
		SELECT DISTINCT auth
		FROM member200
	<select id="getMemberList" paramteType="member" 
		resultType="member">
	<select id="getMember" paramteType="string">
	<update id="uptMember" paramteType="member">
	<delete id="delMember" paramteType="string">

# 화면 처리(리스트화면)
1. 초기화면 호출
	controller(공통콤보, 초기리스트), model, view
	A03_MemberController.java
		@ModelAttribute("authCom")
		public Member getAuthCom(){
			return service.getAuthCom()
		}
		/memberListMy.do
		d.addAttribute("mlist",service.getMemberList(sch));
	A03_MemberService.java
		.. dao.단 	처리 메서드 호출
			
2. 화면 - 데이터
	1) form형식 처리
	2) model데이터 출력 jstl처리
# 화면 처리(수정 삭제를 위한 단일 화면)
1. 위 리스트 화면에서 클릭시, id값을 통해 요청 화면 로딩
	controller, model(proc(schOne)), view
2. 화면 - 데이터
	1) 단일 데이터 로딩키, 요청 id값을 기준으로 모달창 로딩 후,
	2) model데이터 출력 jstl처리
# 수정 버튼 클릭시
1. 수정 처리 controller 호출
	controller, model(수정 처리 로딩 표시 proc-upt), view
2. 화면 - 데이터
	1) 수정 처리 후임을 표시
# 삭제 버튼 클릭시
1. 수정 처리 controller 호출
	controller, model(수정 처리 로딩 표시 proc-upt), view
2. 화면 - 
	삭제 alert띄우고, 다시 location.href
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