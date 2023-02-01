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
.sel01{
   width:100px; height:38px; margin-left:5px;
   border-radius:4px; 
}
#input01{
   width:220px; height:35px; margin-left:10px;
   border-radius:4px; 
   border:1px solid gray;

}
#input02{
   width:220px; height:37px; margin-left:15px;
   border-radius:4px; 
   border:1px solid gray;
}
.btn{
   width:57px; height:33px; margin-left:20px;
   border-radius:4px; 
   background:#0066CC;
   color:white;
   border:1px solid gray;
   font-size:15px;
}
.tab{
   overflow-y:scroll;
   height:490px;
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
                        <span class="span-margin" id="span1">수강신청</span>
                     </div>
                     <div>
                        <span class="span-margin">수강신청 > 수강신청</span>
                     </div>
                  </div>
               </div>

               <div class="main-box-flex">
                  <div id="main-box2">
                     <div>
                     	<form>
	                     	<h5 style="color:#A0A0A0; margin-left:25px; margin-top:30px; display:inline-block;">구분</h5>
	                     	<select class="sel01" name="majSection">
	                     		<option value="major">전공</option>
	                     		<option value="liberal">교양</option>
	                     	</select>
	                     	<h5 style="color:#A0A0A0; margin-left:15px; margin-top:30px; display:inline-block;">종류</h5>
	                     	<select class="sel01" name="lecSection">
	                     		<option value="lecName">강의명</option>
	                     		<option value="lecNo">강의번호</option>
	                     	</select>
	                     	<h5 style="color:#A0A0A0; margin-left:15px; margin-top:30px; display:inline-block;">입력</h5>
	                     	<input id="input01" type="text" name="search" placeholder="검색어를 입력하세요"/>
	                     	<input class="btn" type="submit" value="확인">
                     	</form>
                     	<%

                     	   String sort = "";
                     	   String lecName = "";
                     	   int lecNo = 0;
                     	   String majSection = request.getParameter("majSection");
                     	   String lecSection = request.getParameter("lecSection");
                     	   String search = request.getParameter("search");
                     	   if(majSection==null){
                     	         majSection="";
                     	   }
                     	   if(lecSection==null){
                     	         lecSection="";
                     	   }
                     	   if(majSection.equals("major")){
                     	         sort="전공";
                     	   }else if(majSection.equals("liberal")){
                     	         sort="교양";
                     	   }
                     	   if(lecSection.equals("lecName")){
                     	         lecName=search;
                     	   }else if(lecSection.equals("lecNo")){
                     	         lecNo=Integer.parseInt(search);
                     	   }
                     	         stdMgr dao01 = new stdMgr();
                     	         Lecture01 sch01 = new Lecture01(sort,lecName);
                     	         Lecture01 sch02 = new Lecture01(sort,lecNo);
                     	%>
                     	
                     	<br>
                     	<form>
	                     	<h5 style="color:#A0A0A0; margin-left:25px; margin-top:30px; display:inline-block;">학부</h5>
	                     	<jsp:useBean id="dao" class="jspexp.project_4.stdMgr"/>
	                     	<jsp:useBean id="sch" class="jspexp.project_4.vo.Major"/>
	                     	<jsp:setProperty property="*" name="sch"/>
	                     	<select class="sel01" name="major">
	                     		<c:forEach var="maj" items="${dao.getMajorList()}">
	                     			<option value="${maj.majorName}">${maj.majorName}</option>
	                     		</c:forEach>
	                     	</select>
	                     	<h5 style="color:#A0A0A0; margin-left:15px; margin-top:30px; display:inline-block;">학년</h5>
	                     	<select class="sel01" name="class_l">
	                     		<option value="0">전체</option>
	                     		<option value="1">1</option>
	                     		<option value="2">2</option>
	                     		<option value="3">3</option>
	                     		<option value="4">4</option>
	                     	</select>
	                     	<input class="btn" type="submit" value="확인">
                     	</form>
                     	<%
                     		String major = request.getParameter("major");
                     		String class_l = request.getParameter("class_l");
                     		if(major==null){
                     			major="";
                     		}
                     		if(class_l==null){
                     			class_l="0";
                     		}
                     		
                     		Lecture01 sch03 = new Lecture01(major);
                     		Lecture01 sch04 = new Lecture01(Integer.parseInt(class_l),major);
                     		
                     	%>
                     <div class="tab">
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
	                     		<tr><th>강의번호</th><th>학부</th><th>학년</th><th>구분</th><th>강의명</th><th>강의실</th><th>강의시간</th><th>학점</th><th></th></tr>
	                     	</thead>
	                     	<tbody>
	                     		<%
	                     			if(lecName!=""){
	                     				for(Lecture01 lec : dao01.checkLecName(sch01)){
	                     					
	                     		%>
	                     		<tr><td><%=lec.getLecNum()%></td><td><%=lec.getMajorName()%></td>
	                     		<td><%=lec.getClass_l()%></td><td><%=lec.getSort()%></td><td><%=lec.getLecName()%></td>
	                     			<td><%=lec.getLecLoc()%></td><td><%=lec.getTimes()%></td><td><%=lec.getGrade()%></td>
	                     			<td><input name="addBtn" class="entry" type="button" value="담기" onclick="addLec('<%=lec.getLecNum()%>','<%=lec.getTimes()%>','<%=lec.getMajorName()%>')"/></td>
	                     		</tr>
	                     		<%}
	                     			}else if(lecNo!=0){
	                     				for(Lecture01 lec : dao01.checkLecNum(sch02)){
	                     		%>
	                     		<tr><td><%=lec.getLecNum()%></td><td><%=lec.getMajorName()%></td>
	                     		<td><%=lec.getClass_l()%></td><td><%=lec.getSort()%></td><td><%=lec.getLecName()%></td>
	                     			<td><%=lec.getLecLoc()%></td><td><%=lec.getTimes()%></td><td><%=lec.getGrade()%></td>
	                     			<td><input class="entry" type="button" value="담기" onclick="addLec('<%=lec.getLecNum()%>','<%=lec.getTimes()%>','<%=lec.getMajorName()%>')"></td>
	                     		</tr>
	                     		<%} } 
	                     			if(major!="" && Integer.parseInt(class_l)==0){
	                     				for(Lecture01 lec : dao01.checkMajor(sch03)){
	                     		%>
	                     			<tr><td><%=lec.getLecNum()%></td><td><%=lec.getMajorName()%></td>
	                     			<td><%=lec.getClass_l()%></td><td><%=lec.getSort()%></td><td><%=lec.getLecName()%></td>
	                     			<td><%=lec.getLecLoc()%></td><td><%=lec.getTimes()%></td><td><%=lec.getGrade()%></td>
	                     			<td><input class="entry" type="button" value="담기" onclick="addLec('<%=lec.getLecNum()%>','<%=lec.getTimes()%>','<%=lec.getMajorName()%>')"/></td>
	                     		</tr>
	                     		<%}} else if(major!="" && Integer.parseInt(class_l)!=0){
	                     			for(Lecture01 lec : dao01.checkClass(sch04)){
		                     			%>
		                     			<tr><td><%=lec.getLecNum()%></td><td><%=lec.getMajorName()%></td>
		                     			<td><%=lec.getClass_l()%></td><td><%=lec.getSort()%></td><td><%=lec.getLecName()%></td>
		                     			<td><%=lec.getLecLoc()%></td><td><%=lec.getTimes()%></td><td><%=lec.getGrade()%></td>
		                     			<td><input class="entry" type="button" value="담기" onclick="addLec('<%=lec.getLecNum()%>','<%=lec.getTimes()%>','<%=lec.getMajorName()%>')"/></td>
		                     		</tr> 
	                     		 <%}} %>
	                     	</tbody>
	                    </table>
	                    </div>
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


	function addLec(lecNum,lecTimes,major){
	
		callAjax(lecNum,lecTimes,major)
		
	}
	
	function callAjax(lecNum,lecTimes,major){
	
		var xhr = new XMLHttpRequest()
		var qstr = "?id=${mem.id}&lecNum="+lecNum+"&lecTimes="+lecTimes+"&major="+major
		xhr.open("get","insStdLec.jsp"+qstr,true)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				var data = JSON.parse(xhr.responseText)
				
				console.log(data.hasLec)
				
				if(data.hasLec){
					alert("중복된 강의입니다.\n강의번호 또는 강의시간 또는 학과를 확인하세요")
				}else{
					alert("수강신청이 완료되었습니다")
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