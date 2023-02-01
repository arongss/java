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
2023-01-30
[1단계:개념] 1. form화면을 두개 사용하는 이유를 기술하세요
	각각 다른 컨트롤러를 호출하는 action 속성을 주기 위해 form 화면 두개 사용
[2단계:확인] *2. 오늘 처리한 회원관리 화면에서 회원등록 처리를 다이얼로그 박스를 활용해 처리 해보세요.
sql
	insert into member200 values(#{id}, #{pass}, #{name}, #{auth}), #{point})
vo Member
	springweb.z01_vo.Member
공통mybatis member, MemberMapper.xml
dao 
	A03_MemberDao.java
	public void insMember(Member ins);
mapper
	<insert id="insMember" parameterType="member">
			insert into member200 values(#{id}, #{pass}, #{name}, #{auth}), #{point})
	</insert>
[1단계:개념] 3. 컨테이너에서 viewResolver를 선언하는 이유를 기술하세요.
	# viewResolver
	1. 뷰단에 대한 여러가지 형식을 지정하여 처리하는 lib를 말한다.
	2. container에서 default 웹화면 html, jsp를 지원하고 있다.
	3. 컨트롤러에서 마지막 리턴값으로 형식으로 호출
	4. 이외에서 container 설정에 따라서, 여러가지 viewer를 viewresolver로 설정이 가능하다.
		뷰리졸버로 설정하는 것들을 파일다운로드, 파일업로드, 엑셀/pdf다운로드, json데이터등 여러가지가 있다.
	5. 여러가지 view 사용을 위한 컨테이너 설정
		1) 1순위로 컨테이너에 bean으로 viewer를 선언했을 때, 처리되게 선언
		2) 그외는 html이나 jsp가 로딩되게 처리
[1단계:개념] 4. jsp와 컨테이너에서 bean으로 선언된 view의 우선 순위 설정 방법을 기술하세요
	1. viewResolver 1순위 선언 : bean을 선언되어 있으면 해당 뷰를 찾게 처리
		<bean id="btnViewResolver" class="org.springframework.web.servlet.view.BeanNameViewResolver">
			<property name="order" value="0"/>
		</bean>
	2. 위에 선언된 viewer이외는 모두 html/jsp 뷰.
		<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
			<property name="order" value="1"/>
		</bean>
[1단계:확인] 5. Member객체를 json view로 출력하세요.
	@Autowired(required=false)
	private A03_MemberService service3;
	@GetMapping("callJson05.do")
	public String callJson05(Model d) {
		d.addAttribute("memberList", service3.getMemberList(new Member()));
		return "pageJsonReport";
	}
[1단계:확인] *6. select * from emp으로 데이터 처리(dao,mapper에 추가)하여 json view로 출력하세요.

## 풀이 ##
[2단계:확인] *2. 오늘 처리한 회원관리 화면에서 회원등록 처리를 다이얼로그 박스를 활용해 처리 해보세요.
	1) DB 처리
		- sql insert into member200 values('goodMan','9999','정수라','normal',3000);
		- vo 확인
		- mybatis 공통 점검 member
		- dao public void insertMember(Member ins);
		- mapper
			<insert id="insertMember" parameterType="member">
				insert into member200 values(#{id}, #{pass}, #{name}, #{auth}), #{point})
		- service 호출.
	2) view 처리
		- 등록 버튼 추가 - 모달창 로딩 (form데이터에 데이터가 없어야 함)
		- 모달창 안에 form 데이터
			타이틀 : 회원등록, ps) 상세화면에서 회원상세정보로 처리
			form 데이터에 데이터가 없어야 함
			버튼 : 등록버튼/닫기  ps) 상세화면에서는 수정/삭제버튼만 있게 처리.
			모달창안에 등록 버튼 클릭시, 
				입력여부 및 유효성 처리.. 권한 추가시를 위해 고려?
				$("#frm02 [name=proc]).val("ins"); 
				$("#frm02").attr("action","${path}/insertMember.do")
	3) controller 처리
		- @PostMapping("insertMember.do")
			public String insertMember(Member ins, Model d){
				service.insertMember(ins);
				d.addAttribute("mem", service.getMember(ins.getId());
				return "";
			}
	4) view 단
		if(proc=="ins"){
			alert("등록완료");
		}
[1단계:확인] *6. select * from emp으로 데이터 처리(dao,mapper에 추가)하여 json view로 출력하세요.
	vo Emp
	dao public List<Emp> getEmpAll();
	mapper
		<select id="getEmpAll" resultType="emp">
			select * from emp100
		</select>
	
	service 호출
	
	controller
		@RequestMapping("/getEmpAll.do")
		public String getEmpAll(Model d){
			d.addAttribute("empList",service.getEmpAll())'
			return "pageJsonReport";
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