<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.a13_database.*"
   	import="jspexp.a13_database.vo.*"
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
	border: 1px solid #dbdbdb;
}
a{
	width: 100%;
	text-align: center;
	color: inherit;
	text-decoration: none;
	color: inherit;
	cursor: pointer;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
}
li{
	display: list-item;
	text-align: -webkit-match-parent;
}
ol, ul{
	list-style: none;
}
p{
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
body, code, div, form, h1, h2, h3, h4, h5, h6, input, li, ol, p, td, textarea, th, ul {
	margin: 0;
	padding: 0;
}
.div1{
	padding-top: 40px;
	width: calc(100% - 30px);
	margin: auto;
}
.div2{
	width: 360px;
	margin: 0px auto;
	padding: 60px 0px;
}
.joinname{
	font-size: 20px;
	font-weight: bold;
}
.div3{
	margin: 30px 0px;
	padding-bottom: 30px;
	border-bottom: 1px solid rgb(237, 237, 237);
}
.div4{
	font-size: 12px;
	text-align: center;
	margin: 15px 0px;
	color: rgb(117, 117, 117);
}
.ul1{
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
}
.li1{
	margin: 0px 10px;
}
.a2{
	display: block;
}
.a3{
	text-decoration: underline;
	font-weight: bold;
}
.p1{
	color: rgb(66, 66, 66);
	font-size: 15px;
	text-align: center;
	margin-top: 30px;
}
.button01{
	width: 100%;
	font-size: 17px;
	line-height: 26px;
	padding: 11px 10px;
	background-color: #35c5f0;
	border-color: #35c5f0;
	color: #fff;
	user-select: none;
	display: inline-block;
	box-sizing: border-box;
	font-family: "Noto Sans KR", "Noto Sans CJK KR", "맑은 고딕", "Malgun Gothic", sans-serif;
	font-weight: 700;
	text-align: center;
	cursor: pointer;
	margin: 0px;
	border-width: 1px;
	border-style: solid;
	border-color: transparent;
	border-image: initial;
	text-decoration: none;
	transition: color 0.1s ease 0s, background-color 0.1s ease 0s, border-color 0.1s ease 0s;
	border-radius: 4px;
}
button.button01:hover{
	background-color: #2aabd1;
}
.title{
	display: block;
	margin-bottom: 12px;
	font-size: 16px;
	line-height: 20px;
	font-weight: 700;
	color: rgb(47, 52, 56);
	letter-spacing: -0.3px;
	word-break: keep-all;
}
.input2{
	display: inline-block;
	width: 100%;
	margin: 0;
	padding: 8px 15px 9px;
	border: 1px solid #dbdbdb;
	background-color: #fff;
	color: #000;
	border-radius: 4px;
	box-sizing: border-box;
	font-family: Noto Sans KR,Noto Sans CJK KR,맑은 고딕,Malgun Gothic,sans-serif;
	font-size: 15px;
	line-height: 21px;
	transition: border-color .1s,background-color .1s;
	resize: none;
	-webkit-appearance: none;
}
input.input2:hover{
	background-color: #FAFAFA;
}
.div5{
	margin-bottom: 30px;
	padding-top: 2px;
}
.div6{
	margin-bottom: 10px;
	font-size: 14px;
	line-height: 18px;
	color: rgb(130, 140, 148);
	letter-spacing: -0.3px;
}
.errSpan{
	padding-top: 10px;
	font-size: 14px;
	line-height: 18px;
	color: rgb(255, 119, 119);
}
</style>
</head>
<body>
	<div class="div1">
		<a class="a1">
			<img src="/project_study/th_img1.PNG" width="88" height="31"/>
		</a>
		<div class="div2">
			<h1 class="joinname">회원가입</h1>
			<div class="div3">
				<div class="div4">SNS계정으로 간편하게 회원가입</div>
				<ul class="ul1">
					<li class="li1">
						<a class="a2"><img src="/project_study/th_img2.PNG" width="50" height="50"/></a>
					</li>
					<li class="li1">
						<a class="a2"><img src="/project_study/th_img3.PNG" width="50" height="50"/></a>
					</li>
					<li class="li1">
						<a class="a2"><img src="/project_study/th_img4.PNG" width="50" height="50"/></a>
					</li>
				</ul>
			</div>
			<form>
				<div class="div5">
					<label class="title">아이디</label>
					<div>
						<label>
							<input class="input2" type="text" placeholder="아이디" onkeyup="ckId(this)"/>
							<span class="errSpan" id="errId"></span>
						</label>
					</div>
				</div>
				<div class="div5">
					<label class="title">비밀번호</label>
					<div class="div6">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
					<label>
						<input class="input2" name="password" type="password" placeholder="비밀번호" onkeyup="ckPw1(this)"/>
						<span class="errSpan" id="errPw1"></span>
					</label>
				</div>
				<div class="div5">
					<label class="title">비밀번호 확인</label>
					<label>
						<input class="input2" name="confirmPassword" type="password" placeholder="비밀번호 확인" onkeyup="ckPw2(this)"/>
						<span class="errSpan" id="errPw2"></span>
					</label>
				</div>
				<div class="div5">
					<label class="title">닉네임</label>
					<div class="div6">다른 유저와 겹치지 않도록 입력해주세요. (2~15자)</div>
					<label>
						<input class="input2" name="nickname" type="text" placeholder="별명 (2~15자)"  onkeyup="ckNic(this)"/>
						<span class="errSpan" id="errNic"></span>
					</label>
				</div>
				<button class="button01">회원가입하기</button>
			</form>
			<p class="p1">이미 아이디가 있으신가요?
			<a class="a3" href="/project_study/todayhouse_login.jsp">로그인</a>
			</p>
		</div>
	</div>
	
</body>
<script type="text/javascript">
function ckId(obj){
	var len = obj.value.length
	var idErr = document.querySelector("#errId")
	if(len<6){
		idErr.innerText="6자이상 입력하세요"
	}else{
		idErr.innerText=""
	}
}
function ckPw1(obj){
	var len = obj.value.length
	var pwErr1 = document.querySelector("#errPw1")
	if(len<8){
		pwErr1.innerText="8자이상 입력하세요"
	}else{
		pwErr1.innerText=""
	}
}
function ckPw2(obj){
	var len = obj.value.length
	var pwErr2 = document.querySelector("#errPw2")
	if(len<8){
		pwErr2.innerText="8자이상 입력하세요"
	}else{
		pwErr2.innerText=""
	}
}
function ckNic(obj){
	var len = obj.value.length
	var nicErr = document.querySelector("#errNic")
	if(len<2||len>15){
		nicErr.innerText="2~15자 입력하세요"
	}else{
		nicErr.innerText=""
	}
}
</script>
</html>