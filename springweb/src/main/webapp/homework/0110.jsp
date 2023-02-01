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
2022-01-10
[1단계:개념] 1. 스프링의 요청값 처리방식을 요청 키와 값을 기준으로 controller단에 선언하는 내용을 기술하세요
	@RequestMapping("/call01.do")
	public String call01(@RequestParam("name") String name){
		System.out.println("####이름:"+name);
		return "";
	}
[1단계:개념] 2. 스프링의 모델데이터 선언방식을 예제를 통해서 기술하세요.
	# Model데이터의 처리
	1. 메서드의 매개변수값을 Model d을 설정
	2. d.addAttribute("모델명", 모델값)
	3. view단에서 ${모델명}
[1단계:확인] 3. 스프링 요청값, 모델, 뷰 연습(RequestParam으로 요청처리)  
	1) 점수를 입력하고 점수에 따른 등급분류(A~F)를 모델로 처리하고  화면에 출력하세요.(get/post 구분)
		// http://localhost:7080/springweb/exp03_1.do
		@GetMapping("/exp03_1.do")
		public String exp03_1() {
			return "WEB-INF\\views\\homework\\view_0110.jsp";
		}
		@PostMapping("/exp03_1.do")
		public String exp03_1(@RequestParam("record") int record,Model d) {
			d.addAttribute("grade", (record>90)?'A':((record>80)?'B':((record>70)?'C':((record>60)?'D':'F'))));
			return "WEB-INF\\views\\homework\\view_0110.jsp";
		}
	*2) 아이디와 패스워드를 입력하여 인증 여부 모델로 설정하고 화면에 출력하세요(get/post 구분)
	*3) 초기화면에 임의의 구구단이 나오게 하고 정답을 입력하면 그 결과에 따라 정답/오답 출력되게 처리하세요(get/post 통합)
	*4) 컴퓨터와 하는 가위바위보라는 타이틀로 해당 내용을 선택했을 때, 컴퓨터와 나의 결과에 따라 승/무/패가 처리되게 하세요.(get/post 통합)
[1단계:확인] 4. 스프링 요청값, 모델, 뷰 연습(VO객체로 요청처리)                 
	1) 프리미어리그 팀의 정보(팀명, 승,무,패,골득실)를 VO객체를 만들고, form으로 등록 처리했을 때, 입력된 정보를 vo를 통해서 하단에 출력되게 하세요.
		// http://localhost:7080/springweb/exp04_1.do
		@RequestMapping("/exp04_1.do")
		public String exp04_1(Player player) {
			System.out.println("#요청값#");
			System.out.println("팀명:"+player.getTname());
			System.out.println("승:"+player.getWin());
			System.out.println("무:"+player.getDraw());
			System.out.println("패:"+player.getLose());
			System.out.println("골득실:"+player.getGoal());
			return "WEB-INF\\views\\homework\\view_0110.jsp";
		}
	2) 회원정보(회원아이디, 이름, 패스워드, 권한, 포인트 )를 vo객체 만들고, 등록시 등록되게 하세요.
		// http://localhost:7080/springweb/exp04_2.do
		@RequestMapping("/exp04_2.do")
		public String exp04_2(Member member) {
			System.out.println("#요청값#");
			System.out.println("아이디:"+member.getId());
			System.out.println("이름:"+member.getName());
			System.out.println("패스워드:"+member.getPass());
			System.out.println("권한:"+member.getAuth());
			System.out.println("포인트:"+member.getPoint());
			return "WEB-INF\\views\\homework\\view_0110.jsp";
		}
	*3) 김밥의 갯수나 가격   가격[0] 갯수 @ 총계 @@@  [다음 1개 확인] 초기화면이고 클릭시 마다 입력된 가격에서 한개씩 갯수가 올라가
	계산되게 하세요..
	[3000] 갯수 1  총계 3000  [다음 2개 확인-버튼] 
	[3000] 갯수 2  총계 6000  [다음 3개 확인-버튼] 

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