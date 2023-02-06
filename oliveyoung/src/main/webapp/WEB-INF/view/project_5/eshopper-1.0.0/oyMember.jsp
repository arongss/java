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
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
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
                  　<img style="width:80%" src="img/main.png">
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
    <!-- Topbar End -->
    
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
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>