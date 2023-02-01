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
2023-01-11
[1단계:개념] 1. 스프링에서 매개변수로 VO객체를 선언하는 의미를 기술하세요.
	1. 스프링은 요청값을 VO객체로 property개념으로 처리할 수 있다.
		- 이것을 modelAttribute라는 개념으로 사용하기도 한다.
	2. useBean
		&ename=홍길동&empno=7800&sal=3500.0
		이런 요청값이 있을 때, 선언된 클래스의 기능메서드
		setEname(String), setEmpno(int), setSal(double)
		이 선언되어 있으면 <jsp:setProperty name="*" 을 통해서
		자동 할당이 객체에서 일어난다.
	3. 스프링에서 요청값의 VO객체 할당 처리
		1) public String empSch(Emp sch){}
			이렇게 선언만 하면, 요청값이 위 객체 Emp에 property에
			타입과 이름이 맞는 요청값이 들어오면 객체에 할당이 된다.
			모델명은 객체의 소문자 시작명으로 처리된다.
			Emp ==> emp, Dept ==> dept		
		2) 모델데이터까지 객체로 선언이 자동으로 된다. ${emp.ename}
		3) 요청값이 없으면 해당 객체로 default 처리를 한다.
[1단계:확인] 2. VO 객체 요청 활용
	*1) 카운트 클릭시, 모델단에서 증가되게 하여 증가된 카운트 버튼을 출력되게 하세요
	[카운트: @@] 
	
	*2) 선수이름, 타석과 안타를 입력시, 선수명과 타율(모델에서 계산)이 출력되게 하세요.
	
[1단계:개념] 3. 스프링을 데이터베이스를 처리시, 처리 순서를 기술하세요.
	1) 처리할 데이터 sql, dao 처리
	2) controller 작성 및 초기화면 로딩
	3) dao호출 및 모델 데이터 할당
	4) 모델 데이터에 맞게 화면단 구현
[1단계:확인] 4. DAO에 있는 회원리스트 화면을 구현하세요.
	private A06_PreparedDao dao;
	public Z01_HomeWorkCtrl() {
		dao = new A06_PreparedDao();
	}
	// http://localhost:7080/springweb/memberList.do
	@RequestMapping("/memberList.do")
	public String memberList(Member sch, Model d) {
		if(sch.getName()==null) sch.setName("");
		if(sch.getAuth()==null) sch.setAuth("");
		d.addAttribute("memberList", dao.getMemberList(sch));
		return "WEB-INF\\views\\z01_homework\\a05_memberFrm.jsp";
	}
	<c:forEach var="mem" items="${memberList}">
		<tr><td>${mem.id}</td><td>${mem.pass}</td>
		<td>${mem.name}</td><td>${mem.auth}</td>
		<td>${mem.point}</td><td>${mem.address}</td></tr>
	</c:forEach>
[1단계:확인] 5. 회원 등록 처리를 구현하세요
	@RequestMapping("/insertMember.do")
	public String insertMember(Member ins, Model d) {
		dao.insertMember(ins);
		d.addAttribute("msg", "등록완료");
		return "redirect:/memberList.do";
	}
[1단계:확인] *6. 로그인 화면에서 로그인 되었을 때는 회원리스트 화면, 그렇지 않을 때는 로그인 화면으로 가게 처리하세요.

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