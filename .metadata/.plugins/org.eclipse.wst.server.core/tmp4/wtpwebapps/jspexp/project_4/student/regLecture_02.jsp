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
  border:1px solid lightgray;
  color: white;
  
}
table{
    border-collapse: collapse;
    border:1px solid lightgray;
    
}
table td{
   border:1px solid lightgray;
   text-align:center;
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
                        <span class="span-margin" id="span1">수강내역조회</span>
                     </div>
                     <div>
                        <span class="span-margin">수강신청 > 수강신청내역</span>
                     </div>
                  </div>
               </div>

               <div class="main-box-flex">
                  <div id="main-box2">
                     <div>
                     	<h3 style="margin:30px;">신청 과목</h3>
                     	<table width="1370" align="center">
                     		<col width="100px">
                     		<col width="100px">
                     		<col width="100px">
                     		<col width="100px">
                     		<col width="500px">
                     		<col width="150px">
                     		<col width="100px">
                     		<col width="100px">
	                     	<thead>
	                     		<tr><th>강의번호</th><th>학부</th><th>학년</th><th>구분</th><th>강의명</th>
	                     		<th>강의실</th><th>강의시간</th><th>학점</th><th></th></tr>
	                     	</thead>
	                     	<tbody>
	                     	<jsp:useBean id="dao" class="jspexp.project_4.stdMgr"/>
	                     	<jsp:useBean id="sch" class="jspexp.project_4.vo.Lecture"/>
	                     	<jsp:setProperty property="*" name="sch"/>
	                     	 <c:if test="${empty mem.id}">${sch.setId("")}</c:if>
	                     		<c:forEach var="stdLec" items="${dao.getStdLecture(mem.id)}">
	                     			<tr><td>${stdLec.lecNum}</td><td>${stdLec.majorName}</td>
	                     			<td>${stdLec.class_l}</td><td>${stdLec.sort}</td>
	                     			<td>${stdLec.lecName}</td><td>${stdLec.lecLoc}</td><td>${stdLec.times}</td>
	                     			<td>${stdLec.grade}</td>
	                     			<td><input type="button" class="del" value="취소"
	                     			 onclick="delLec(${stdLec.lecNum})"/></td></tr>
	                     		</c:forEach>
	                     		
	                     	</tbody>
	                    </table>
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

function delLec(lecNum){
	callAjax(lecNum)
}

function callAjax(lecNum){
	
	var xhr = new XMLHttpRequest()
	var qstr = "?id=${mem.id}&lecNum="+lecNum
	xhr.open("get","delStdLec.jsp"+qstr,true)
	xhr.send()
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			var data = JSON.parse(xhr.responseText)
			console.log(data.hasLec)
			if(data.hasLec){
				alert("수강신청이 취소되었습니다.")
				location.reload(true)
			}
		}
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