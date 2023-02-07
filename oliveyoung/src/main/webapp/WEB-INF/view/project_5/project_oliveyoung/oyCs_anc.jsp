<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <fmt:requestEncoding value="utf-8"/>     
    <title>올리브영</title>
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
<style type="text/css">
</style>

</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-4 d-none d-lg-block">
                <a href="oyMain.jsp" class="text-decoration-none">
                  　<img style="width:80%" src="img/main.png">
                </a>
            </div>
            <div class="col-lg-5 col-8 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div style="margin-left:150px;" class="col-lg-4 col-4">
               <a class="text-dark" href="oyJoin.jsp">회원가입</a>
               <span class="text-muted px-2">|</span>
               <a class="text-dark" href="oyLogin.jsp">로그인</a>
               <span class="text-muted px-2">|</span>
               <a class="text-dark" href="oyCs.jsp">고객센터</a>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div style="margin-top:30px" class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0"><b>카테고리</b></h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">기초화장품 <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="#" class="dropdown-item">스킨케어</a>
                                <a href="#" class="dropdown-item">마스크팩</a>
                                <a href="#" class="dropdown-item">클렌징</a>
                                <a href="#" class="dropdown-item">선케어</a>
                            </div>
                        </div>
                        <a href="#" class="nav-item nav-link">더모코스메틱</a>
                        <a href="#" class="nav-item nav-link">메이크업/네일</a>
                        <a href="#" class="nav-item nav-link">바디케어</a>
                        <a href="#" class="nav-item nav-link">헤어케어</a>
                        <a href="#" class="nav-item nav-link">향수/디퓨저</a>
                    </div>
                </nav>
            </div>
                <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="#" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="#" class="nav-item nav-link"><b>오특</b></a>
                            <a href="#" class="nav-item nav-link"><b>신상</b></a>
                            <a href="#" class="nav-item nav-link"><b>랭킹</b></a>
                            <a href="#" class="nav-item nav-link"><b>프리미엄관</b></a>
                            <a href="#" class="nav-item nav-link"><b>기획전</b></a>
                            <a href="#" class="nav-item nav-link"><b>세일</b></a>
                            <a href="#" class="nav-item nav-link"><b>기프트카드</b></a>
                            <a href="#" class="nav-item nav-link"><b>멤버쉽/쿠폰</b></a>
                            <a href="#" class="nav-item nav-link"><b>이벤트</b></a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
     </div>
    <!-- Navbar End -->

   
<style type="text/css">
ul{
	list-style:none;
}
#container{
	font-family: Montserrat,-apple-system,NotoSansCJKkr,AppleSDGothicNeo,Roboto,dotum,"돋움",sans-serif;
}
#csTitle{
	width: 100%;
    background: #faeee1;
    height: 100px;
    display: inline-flex;
}
#csTitle h1{
	font-weight:700;
	font-size:40px;
	margin: auto 0;
    padding-left: 50px;
}
#csTitle span{
	margin: auto 0;
    font-size: 18px;
    padding-left: 5px;
}

#csbody{
	padding:0 70px;
}
#cslist{
	padding-top:30px;
}

#cslist ul{
	width:1020px;
	display:inline-flex;
	justify-content: space-between;
	padding-left: 0px;
}
#cslist li{
	display:flex;
	width:100%;
	padding:13px;
	background:#f6f6f6;
	color:#666666;
	font-size:17px;
	font-weight: 900;
	justify-content: center;
}
#cslist li#faq{
	border-right:#5C5C5C solid 0.5px;
}
#cslist li#oneone{
	border-right:#5C5C5C solid 0.5px;
}


#ancList ul{
	width:1020px;
	display:inline-flex;
	justify-content: space-between;
	margin-top:35px;
	border:#5C5C5C solid 0.5px;
	padding-left: 0px;
}
#ancList li{
	display:flex;
	width:100%;
	padding:7px;
	color:#666666;
	font-weight:900;
	font-size:15px;
	justify-content: center;
}

#ancList li#ancL01{
	border-right:#5C5C5C solid 0.5px;
}
#ancList li#ancL02{
	border-right:#5C5C5C solid 0.5px;
}
#ancList li#ancL03{
	border-right:#5C5C5C solid 0.5px;
}


table{
	border-spacing:0;
	border-collapse:seperate;
	text-indent:initial;
	font-size:18px;
	width:1020px;
	border-top:2px soild #888;
}

.tcontents thead tr th {
    padding: 22px 0 20px;
    border-bottom: 1px solid #888;
    border-top: 2px solid #888;
    font-weight: bold;
    text-align:center;
    line-height:20px;
}

thead{
	vertical-align:middle;
}

.tcontents tbody tr td{
	padding: 23px 0 24px;
    border-bottom: 1px solid #e6e6e6;
    color: #666;
    font-size: 14px;
    text-align: center;
    line-height: 20px;
    vertical-align: middle;
}
.tcontents tbody tr td.title{
	position: relative;
    padding-left: 15px;
    text-align: left;
}

strong.dnormarl{
	background: #9bce26;
}
strong.devent{
	background: #ed95b7;
}
strong{
	display: inline-block;
    width: 70px;
    height: 20px;
    border-radius: 10px;
    color: #fff;
    font-size: 12px;
    text-align: center;
    line-height: 20px;
    margin-right:15px;
}

.tcontents tbody tr td.title a{
	color: #666;
	font-weight: bold;
}

</style>

   <!-- Board Start -->
  <div id="container">

    <div id="csTitle">
    	<h1>고객센터</h1>
    	<span>무엇을 도와드릴까요?</span>
    </div>
    
  <div id=csbody>
    <div id="cslist">
    	<ul>
    		<li id="faq">FAQ작성</li>
    		<li id="oneone">1:1문의</li>
    		<li id="announce" style="background:#555555; color:#fff">공지사항</li>
    	</ul>
    </div>
    <div id="ancList">
    	<ul>
    		<li id="ancL01" style="background:#9bce26; color:white">전체</li>
    		<li id="ancL02">일반</li>
    		<li id="ancL03">매장</li>
    		<li id="ancL04">이벤트</li>
    	</ul>
    </div>   
    
	<table class="tcontents">
	<col width="9%">
	<col width="79%">
	<col width="12%">
		<thead>
			<tr><th>번호</th><th>제목</th><th>등록일</th></tr>
		</thead>
		<tbody>
			<tr>
				<td>3</td>
				<td class="title">
					<strong class="dnormarl">일반</strong><a href="">올리브영 쌍용점 리뉴얼로 인한 영업중단안내</a>
				</td>
				<td>2023.01.30</td>
			</tr>
			<tr>
				<td>2</td>
				<td class="title">
					<strong class="devent">이벤트</strong><a href="">[올영-산타]이벤트 당첨자 발표</a>
				</td>
				<td>2022.12.25</td>
			</tr>
			<tr>
				<td>1</td>
				<td class="title">
					<strong class="dnormarl">일반</strong><a href="">[공지]개인정보 처리방침 개정 안내</a>
				</td>
				<td>2022.12.22</td>
			</tr>
		</tbody>
	</table>

    	<div>페이징처리 단</div>
   </div>
   
  </div>
   <!-- Board End -->

    <!-- Footer Start -->
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="#" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold">
                    <img src="img/foot_logo.png"></h1>
                </a>
          
                <p class="mb-2">공지사항</p>
                <p class="mb-2">고객센터이용안내</p>
                <p class="mb-2">온라인몰 고객센터</p>
                <h1 class="mb-4 display-5 font-weight-semi-bold">
                <p class="mb-4">
                    <span class="text-primary font-weight-bold border px-3 mr-1">1522-0882</span></p></h1>
                <p class="mb-2">매장 고객센터</p>
                <h1 class="mb-4 display-5 font-weight-semi-bold">
                <p class="mb-4">
                    <span class="text-primary font-weight-bold border px-3 mr-1">1577-4887</span></p></h1>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">고객센터 운영<br>[평일09:00-18:00]</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="#">주말 및 공휴일은<br> 1:1문의하기를 이용해주세요</a>
                            <a class="text-dark mb-2" href="#">업무가 시작되면 바로 처리해드립니다.</a>
                            <button class="footbtn">1:1문의하기</button>
                           <button class="footbtn">자주하는 질문</button>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4"></h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="#"></a>
                            <a class="text-dark mb-2" href="#"></a>
   
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">올리브영 모바일웹</h5>
                      <img src="img/qr.png">
            </div>
        </div>
        <div class="row border-top border-light mx-xl-5 py-4">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="#">씨제이올리브영 주식회사</a>. 
대표이사 : 구창근 | 사업자등록번호 : 809-81-01574
주소 : (04323) 서울특별시 용산구 한강대로 372, 24층
(동자동, KDB타워)
호스팅사업자 : CJ 올리브네트웍스
통신판매업신고번호 : 2019-서울용산-1428
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->


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