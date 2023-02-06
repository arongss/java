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
2023-02-06
[1단계:개념] 1. 게시판의 등록을 위한 프로세스와 이와 연결되는 코드 파일과 관련성을 기술하세요
	1) 리스트 화면에서 등록 버튼 클릭시 등록 화면 이동
	2) 등록 화면
		- 등록할 form 데이터 입력 및 등록 처리
			제목(subject), 작성자(writer), 내용(content)
			답글(refno-hidden)
			첨부파일
		- 기능 버튼 : 등록, 조회화면
	3) 등록 컨트롤러
		- 등록서비스, Dao를 통해 등록 처리
		- 등록 완료 메시지 모델 처리
	4) 등록 화면
		- 등록 완료 메시지 및 조회화면 이동/계속 등록 처리
[1단계:개념] 2. 게시판의 상세화면을 위한 프로세스와 이와 연결되는 코드 파일과 관련성을 기술하세요
	1) 리스트 화면에서 특정 데이터 더블 클릭시
	2) 해당 데이터에 있는 key인 no으로 요청값으로 하여
	3) 컨트롤러를 처리되어 
		- 이 글에 대한 조회수를 update한 후,
		- 이 글의 상세 데이터를 DB에 데이터를 가져온 후, 
			이 모델데이터 기반으로
	4) 상세화면이 로딩된다
		- 게시물 번호, 답글 번호, 제목, 작성자, 조회수,
			등록일, 수정일, 내용
	5) 다음 단계를 위한 수정/삭제/답글/메인화면 기능 버튼과 
		함께 리스트 된다.
[1단계:확인] 3. 현재프로젝트에 진행하는 게시물이나 등록/상세화면 내용이 있으면 그것으로 진행하고
      그외는 baseballtream테이블을 만들기 기준으로 스프링으로 팀리스트를 만들고, 팀등록과 상세화면을 처리하여 출력하세요.
[1단계:개념] 4. 파일 업로드를 위한 환경 설정을 기술하세요.
	1) 스프링에서 지원하는 파일업로드 모듈 컨테이너에 설정
		<bean id="multipartResolver"
			class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>
	2) 사용자 정의 다운로드 뷰 선언
	3) 공통 설정 파일 config
		파일 서버의 경로 위치를 지정  =c:\....
[1단계:확인] 5. /uploadFrm2.do로 업로드 화면, /upload2.do로 파일업로드 처리하게 처리하세요
	컨테이너
		<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>
	config
		file.upload=C:/a01_javaexp/workspace/springweb/src/main/webapp/z01_upload
	controller
		@GetMapping("/uploadFrm2.do")
		public String uploadFrm() {
			return "WEB-INF\\views\\a05_mvc\\a10_fileUpload.jsp";
		}
		@PostMapping("/upload2.do")
		public String upload(@RequestParam("report") MultipartFile report) {
			System.out.println("서버까지 온 파일:"+report.getOriginalFilename());
			return "WEB-INF\\views\\a05_mvc\\a10_fileUpload.jsp";
		}
	view
		<input type="file" name="report" class="form-control mr-sm-2" placeholder="제목" />
		<button class="btn btn-info" type="submit">파일업로드</button>

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