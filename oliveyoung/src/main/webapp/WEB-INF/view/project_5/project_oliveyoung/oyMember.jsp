<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>올리브영</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
.backImg{
	background-image: url('img/bar.png');
	background-size: cover;
	height:90px;
	width:90%;
	margin-left:60px;
}
input{
	border-radius:8px;
	background:lightgray;
	border:none;
}
select{
	border-radius:8px;
}
th{
	background:lightgray;
	border-left:none;
	border-right:none;
	font-weight:bold;
	color:black;
	height:50px;
}
button{

}
</style>
	<fmt:requestEncoding value="utf-8"/>   
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="${path}/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${path}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${path}/css/style.css" rel="stylesheet">
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("[name=name]").val("${sch.name}");
		$("[name=id]").val("${sch.id}");
		$("[name=auth]").val("${sch.auth}");
		<%-- 
		
		--%>	
	});
</script>
</head>
<body>
   <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-4 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                  　<img style="width:80%" src="/project_oliveyoung/img/main.png">
                </a>
            </div>
            <div class="col-lg-3 col-3 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-success">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div style="margin-left:150px;" class="col-lg-4 col-4">
               <a class="text-dark" href="">회원가입</a>
               <span class="text-muted px-2">|</span>
               <a class="text-dark" href="">로그인</a>
               <span class="text-muted px-2">|</span>
               <a class="text-dark" href="">고객센터</a>
        </div>
        </div>
    </div>
    <!-- Topbar End -->
      <!-- Navbar Start -->
    <div style="margin-top:30px" class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-success text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0"><b>카테고리</b></h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">기초화장품 <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">스킨케어</a>
                                <a href="" class="dropdown-item">마스크팩</a>
                                <a href="" class="dropdown-item">클렌징</a>
                                <a href="" class="dropdown-item">선케어</a>
                            </div>
                        </div>
                        <a href="" class="nav-item nav-link">더모코스메틱</a>
                        <a href="" class="nav-item nav-link">메이크업/네일</a>
                        <a href="" class="nav-item nav-link">바디케어</a>
                        <a href="" class="nav-item nav-link">헤어케어</a>
                        <a href="" class="nav-item nav-link">향수/디퓨저</a>
                    </div>
                </nav>
            </div>
                <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.html" class="nav-item nav-link"><b>오특</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>신상</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>랭킹</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>프리미엄관</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>기획전</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>세일</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>기프트카드</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>멤버쉽/쿠폰</b></a>
                            <a href="index.html" class="nav-item nav-link"><b>이벤트</b></a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Topbar Start 
    <div class="container-fluid">
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-4 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                  　<img style="width:80%" src="${path}/img/main.png">
                </a>
            </div>
            <div style="margin-left:100px;font-weight:bold;font-size:25px;">
               <a class="text-dark" href="">회원조회</a>
               <span style="margin-left:30px;" class="text-muted px-2">|</span>
               <a style="margin-left:30px;" class="text-dark" href="">상품관리</a>
               <span style="margin-left:30px;" class="text-muted px-2">|</span>
               <a style="margin-left:30px;" class="text-dark" href="">고객센터관리</a>
        	</div>
        	<div style="margin-left:400px;font-size:25px;font-weight:bold;">
        		홍길동 사원
        	</div>
        </div>
        <div class="backImg">
        	<h1 style="font-weight:bold;margin-left:100px;margin-top:30px;padding-top:20px;">관리자페이지  &nbsp<span style="font-size:25px;">- 회원조회</span></h1>
		</div>
    </div>
     Topbar End -->
    
    <!-- main -->
    <h2 style="font-weight:bold;margin-left:320px;margin-top:30px;">회원 검색</h2>
	<div class="row">
		<div class="col-2"></div>
		<div style="border:2px solid #A6CD48;border-left:none;border-right:none;" class="col-8">
		<form>
			<div style="margin-top:15px;" class="row text-center">
				<div class="col">
					<span style="font-size:18px;font-weight:bold;">이름 </span>
					<input name="name" value="${sch.name}" type="text" size="10"/>
				</div>
				<div class="col">
					<span style="font-size:18px;font-weight:bold;">아이디 </span>
					<input name="id" value="${sch.id}" type="text" size="10"/>
				</div>
				<div class="col">
					<span style="font-size:18px;font-weight:bold;">회원등급 </span> 
					<select name="auth">
				    	<option value="">회원등급선택</option>
				    	<c:forEach var="auth" items="${authCom}">
				    	<option>${auth}</option>
				    	</c:forEach>
				    </select>
				</div>
			</div>
			<!--  
			<div style="margin-top:20px;" class="row text-center">
				<div class="col">
					<span style="font-size:18px;font-weight:bold;">가입날짜 </span>
					<input type="number" name="year" min="2000" max="2023" placeholder="2023">년
					<input type="number" name="month" min="1" max="12" placeholder="1">월
					<input type="number" name="day" min="1" max="31" placeholder="25">일
				</div>
				<div class="col">
					<span style="font-size:18px;font-weight:bold;">생년월일 </span>
					<input type="number" name="birthYear" min="1960" max="2023" placeholder="2023">년
					<input type="number" name="birthMonth" min="1" max="12" placeholder="1">월
					<input type="number" name="birthDay" min="1" max="31" placeholder="25">일
				</div>
			</div>
			<div style="margin-top:20px;margin-bottom:15px;" class="row text-center">
				<div class="col">
					<span style="font-size:18px;font-weight:bold;">휴대전화번호 </span>
					<select>
						<option>010</option>
					</select>
					-
					<input type="number" placeholder="12345678">
				</div>
				<div class="col">
				 <div class="col-sm input-group">
					<span style="font-size:18px;font-weight:bold;">이메일 </span>
					<input type="text" placeholder="이메일 아이디" size="25">
					<div class="input-group-text">@</div>
				      <select style="border:none">
				      	<option>naver.com</option>
				      	<option>nate.com</option>
				      	<option>google.com</option>
				      	<option>hanmail.com</option>
				      </select>
				  </div>
				</div>
			</div>
			-->
			<div style="margin-top:30px;margin-bottom:15px;" class="row text-center">
				<div class="col center">
					<button style="color:white;font-weight:bold;width:10%;height:50px;border-radius:5px;" type="submit" class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
		</div>
		<div class="col-2"></div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10 text-center">
			<table width="80%">
			<thead>
				<tr><th>아이디</th><th>이름</th><th>주소</th><th>포인트</th><th>핸드폰번호</th><th>이메일주소</th><th>회원등급</th><th>가입날짜</th><th>생년월일</th></tr>
			</thead>
			<tbody>
				<c:forEach var="ovmember" items="${mlist}">
		    	    <tr><td>${ovmember.id}</td><td>${ovmember.name}</td><td>${ovmember.address}</td>
		    	    	<td>${ovmember.point}</td><td>${ovmember.phone}</td><td>${ovmember.email}</td>
		    	    	<td>${ovmember.auth}</td>
		    	    	<td><fmt:formatDate value="${ovmember.joindate}"/></td>
		    	    	<td><fmt:formatDate value="${ovmember.birthday}"/></td></tr>
		    	</c:forEach>
				<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
			</tbody>
			</table>
		</div>
		<div class="col-2"></div>
	</div>
	


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/lib/easing/easing.min.js"></script>
    <script src="${path}/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="${path}/mail/jqBootstrapValidation.min.js"></script>
    <script src="${path}/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="${path}/js/main.js"></script>
</body>
</html>