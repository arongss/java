<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="jspexp.project_4.*"
	import="jspexp.project_4.vo.*" %>
<%
	// post방식에서 한글요청값을 받을 때, 반드시 설정되어야한다.
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용대학교</title>
<link href="img/ss.png" rel="shortcut icon" type="image/x-icon">
<link href="PJ_css/noticeNo1.css" type="text/css" rel="stylesheet">
<link href="PJ_css/input.css" type="text/css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<style>
table th {
  padding-top: 5px;
  padding-bottom: 12px;
  background-color: #808080;
  color: white;
}
table td{
   border:1px solid lightgray;
   text-align:center;
}
table{
   margin-left:auto;
   margin-right:auto;
}
</style>
</head>
<body>
   <div>
      <div>
         <div class="flex-box1">
            <div id="box1">
               <div id="top-box1">
                  <span id="tob-box1-span">쌍용대학교</span>
               </div>

            </div>
            <div id="top-box2">
                <span id="tob-box2-span">ID ${mem.id} 학생</span>
               <span id="tob-box2-span"><input type="button" id="bt2" value="로그아웃" onclick="logout()" /></span>
            </div>
         </div>

         <div class="flex-box2">
            <div id="flex-box2_box1">
               <div>
                  <div id="nav-box">
                     <ul id="navi">
                        <li class="group">
                           <div class="title">공지사항</div>
									<ul class="sub">
										<li><a href="noticeBoard.jsp">공지사항 게시판</a></li>
									</ul>
								</li>
								<li class="group">
									<div class="title">수강신청</div>
									<ul class="sub">
										<li><a href="regLecture_01.jsp">수강신청</a></li>
                              			<li><a href="regLecture_02.jsp">수강신청내역</a></li>
                             			<li><a href="timeTable.jsp">시간표</a></li>
									</ul>
								</li>
								<li class="group">
									<div class="title">강의 관리</div>
									<ul class="sub">
										<li><a href="std_grade_sch.jsp">성적조회</a></li>
										<li><a href="std_lecPlan_sch.jsp">강의계획서 조회</a></li>
										<li><a href="std_lecEval_ins.jsp">강의평가</a></li>
									</ul>
								</li>
								<li class="group">
									<div class="title">학적 관리</div>
									<ul class="sub">
										<li><a href="std_inform_sch.jsp">학적정보</a></li>
										<li><a href="std_inform_upt.jsp">학적정보 변경</a></li>
										<li><a href="std_inform_uptpw.jsp">비밀번호 변경</a></li>
										<li><a href="tuition_bill.jsp">등록금 고지서 조회</a></li>
                           </ul>
                        </li>
                     </ul>
                  </div>

               </div>
            </div>
            <div id="flex-box2_box2">
               <div class="main-box-flex">
                  <div id="main-box1">
                     <div id="main-box1-iteam">
                        <span class="span-margin" id="span1">시간표</span>
                     </div>
                     <div>
                        <span class="span-margin">수강신청 > 시간표</span>
                     </div>
                  </div>
               </div>

               <div class="main-box-flex">
                  <div id="main-box2">
                     <div>
                     	<table width="1300" height="650" align="center" >
                     		<col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="15%">
                     		<tr><th></th><th name="월">월</th><th>화</th><th>수</th><th>목</th><th>금</th></tr>
                     		<tr><th>1교시(9:00~9:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>2교시(10:00~10:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>3교시(11:00~11:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>4교시(12:00~12:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>5교시(1:00~1:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>6교시(2:00~2:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>7교시(3:00~3:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>8교시(4:00~4:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>9교시(5:00~5:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     		<tr><th>10교시(6:00~6:50)</th><td></td><td></td><td></td><td></td><td></td></tr>
                     	</table>
                     	
                     	
                     	<jsp:useBean id="dao" class="jspexp.project_4.stdMgr"/>
	                     	<jsp:useBean id="sch" class="jspexp.project_4.vo.Lecture02"/>
	                     	<jsp:setProperty property="*" name="sch"/>
	                     	 <c:if test="${empty mem.id}">${sch.setId("")}</c:if>
	                     		<c:forEach var="stdLec" items="${dao.getTimes(mem.id)}" varStatus="sts">
	                     			<h2 id="${sts.count}" onclick="test('${stdLec.times}','${stdLec.lecName}')"></h2>
	                     			<c:if test="${sts.last}">
	                     				<input type="hidden" value="${sts.count}" name="hidden">
	                     			</c:if>
	                     			
	                     		</c:forEach>
								
								                    		
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>
   </div>
   <div></div>
</body>
<script>
var cnt = document.querySelector("[name=hidden]").value
var cntInt = Number(cnt)

	$(document).ready(function(){
		for(var idx=1; idx<=cntInt; idx++){
			$('#'+idx).trigger('click')
		}
	})
	
	

function test(times,lecName){
	var day = 0
	var str01 = times.substr(0,1)
	var str02 = Number(times.substr(1,1))
	var str03 = Number(times.substr(2,1))
	var td = document.querySelectorAll("td")
	if(str01=='월'){
		day = 0
		var idx = day+5*(str02-1)
		var jdx = day+5*(str03-1)
		td[idx].style.background = "lightgoldenrodyellow"
		td[jdx].style.background = "lightgoldenrodyellow"
		td[idx].innerText=lecName
		td[jdx].innerText=lecName
	}
	if(str01=='화'){
		day = 1
		var idx = day+5*(str02-1)
		var jdx = day+5*(str03-1)
		td[idx].style.background = "lightsalmon"
		td[jdx].style.background = "lightsalmon"
		td[idx].innerText=lecName
		td[jdx].innerText=lecName
	}
	if(str01=='수'){
		day = 2
		var idx = day+5*(str02-1)
		var jdx = day+5*(str03-1)
		td[idx].style.background = "palegreen"
		td[jdx].style.background = "palegreen"
		td[idx].innerText=lecName
		td[jdx].innerText=lecName
	}
	if(str01=='목'){
		day = 3
		var idx = day+5*(str02-1)
		var jdx = day+5*(str03-1)
		td[idx].style.background = "lavender"
		td[jdx].style.background = "lavender"
		td[idx].innerText=lecName
		td[jdx].innerText=lecName
	}
	if(str01=='금'){
		day = 4
		var idx = day+5*(str02-1)
		var jdx = day+5*(str03-1)
		td[idx].style.background = "lightcyan"
		td[jdx].style.background = "lightcyan"
		td[idx].innerText=lecName
		td[jdx].innerText=lecName
	}
}

   $(document).ready(function() {

      //모든 서브 메뉴 감추기
      $(".sub").css({
         display : "none"
      });
      //$(".sub").hide(); //위코드와 동일 

      $(".title").click(function() {
         //일단 서브메뉴 다 가립니다.
         //$(".sub").css({display:"none"});

         //열린 서브메뉴에 대해서만 가립니다.
         $(".sub").each(function() {
            console.log($(this).css("display"));
            if ($(this).css("display") == "block") {
               //$(".sub").css({display:"none"});
               //$(this).hide();
               $(this).slideUp("fast");
            }
         });

         //현재 요소의 다음 요소를 보이게 합니다.
         //$(this).next("ul").css({display:"block"});
         //$(this).next("ul").show();
         $(this).next("ul").slideDown("fast");

      })
   });

// 로그아웃
	function logout(){
		Swal.fire({
			title: '로그아웃하시겠습니까?',
			icon: 'question',
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소' // cancel 버튼 텍스트 지정
		}).then((result) => {
			if (result.value) {
				//"확인" 버튼을 눌렀을 때 작업할 내용
				location.href="/project_4/a01_login_DB.jsp"
			}
		})
	}
</script>
</html>