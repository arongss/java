<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.project_study.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의집</title>
<style type="text/css">
html {
	color: #424242;
	background: #fff;
}
body, html {
	line-height: 1;
	font-family: OhouseSans,Noto Sans KR,Apple SD Gothic Neo,맑은 고딕,Malgun Gothic,sans-serif;
	-webkit-font-smoothing: antialiased;
	letter-spacing: -.4px;
	font-size: 13px;
}
body, html {
	font-size: 15px;
}
form{
	display: block;
	margin-top: 0em;
}
input{
	width: 300px;
	height: 50px;
	border: 1px solid #dbdbdb;
}
a{
	width: 100%;
	text-align: center;
	color: inherit;
	text-decoration: none;
}
body, div, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, td, textarea, th, ul {
	margin: 0;
	padding: 0;
}
.div1{
	height: 100%;
	display: flex
}
.div2{
	flex: 1 0 auto;
	margin: 0px auto;
	max-width: 300px;
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-direction: column;
	box-sizing: border-box;
	padding: 40px 0px;
}
.a1{
	margin-bottom: 30px
}
.loginform{
	width: 300px;
}
.inputid{
	position: relative;
	display: block;
	width: 100%;
	border-radius: 4px 4px 0px 0px;
	transition: box-shadow 0.2s ease 0s, background-color 0.2s ease 0s;
	z-index: 1;
}
.inputpass{
	position: relative;
	display: block;
	width: 100%;
	border-radius: 0px 0px 4px 4px;
	margin-top: -1px;
	transition: box-shadow 0.2s ease 0s, background-color 0.2s ease 0s;
}
.loginbutton{
	margin: 20px 0px;
    width: 100%;
    height: 52px;
	background-color: #35c5f0;
	border-color: #35c5f0;
	color: #fff;
	padding: 15px 10px;
	line-height: 20px;
	font-size: 17px;
	min-height: 50px;
	border: 1px solid transparent;
	font-family: Noto Sans KR,Noto Sans CJK KR,맑은 고딕,Malgun Gothic,sans-serif;
	font-weight: 700;
	border-radius: 4px;
	cursor: pointer;
}
.section1{
	width: 100%;
	text-align: center;
}
.div3{
	margin: 35px 0px 15px;
	color: rgb(117, 117, 117);
	font-size: 12px;
	font-weight: normal;
	line-height: 1.33;
	text-align: center;
}
.a2{
	margin: 0px 10px;
	transition: opacity 0.1s ease 0s;
}
.section2{
	text-align: center;
	margin-bottom: 24px;
}
.a3{
	margin-top: 24px;
	color: rgb(194, 200, 204);
	font-size: 14px;
	line-height: 18px;
	margin-left: 60px;
}
.button2{
	width: 100%;
	background-color: transparent;
	border: 0px;
	margin: 0px 0px 20px;
	padding: 0px;
	font-size: 15px;
	line-height: 1.4;
	color: rgb(66, 66, 66);
	width: 100%;
	margin-top: 30px;
	padding-top: 30px;
	border-top: 1px solid rgb(219, 219, 219);
}
.a4{
	margin-left: 20px;
}
button.loginbutton:hover{
	background-color: #2aabd1;
}
input.input2:hover{
	background-color: #FAFAFA;
}
</style>
</head>
<body>
	<div class="div1">
		<div class="div2">
			<a class="a1">
				<img src="/project_study/th_img1.PNG" width="147" height="50"/>
			</a>
			<form class="loginform">
			<input class="inputid input2" name="id" type="text" placeholder="아이디" >
			<input class="inputpass input2" name="password"type="password" placeholder="비밀번호">
			<button class="loginbutton">로그인</button>
			<section class="section1">
				<a>비밀번호 재설정</a>
				<a class="a4" href="/project_study/todayhouse_join.jsp">회원가입</a>
			</section>
			<section class="section2">
				<div class="div3">SNS계정으로 간편 로그인/회원가입</div>
				<a class="a2">
					<img src="/project_study/th_img2.PNG" width="48" height="48"/>
				</a>
				<a class="a2">
					<img src="/project_study/th_img3.PNG" width="48" height="48"/>
				</a>
				<a class="a2">
					<img src="/project_study/th_img4.PNG" width="48" height="48"/>
				</a>
			</section>
			<a class="a3">로그인에 문제가 있으신가요?</a>
			<button class="button2" type="button">비회원 주문 조회하기</button>
			</form>
		</div>
	</div>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	boolean isFail = false;
	if(id!=null&&password!=null){
		TodayhouseDao dao = new TodayhouseDao();
		if( dao.login(id,password) ){
			response.sendRedirect("todayhouse_main.jsp");
		}else{
			isFail = true;
		}
	}
%>
<script type="text/javascript">
	var isFail = <%=isFail%>
	if(isFail){
		alert("로그인 실패\n인증된 아이디가 아닙니다")
	}
</script>
</body>
<script type="text/javascript">

</script>
</html>