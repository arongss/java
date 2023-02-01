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
		var msg = "${msg}"
	      if(msg!=""){
	    	  alert(msg);
	      }
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>회원정보조회</h2>

</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="name" value="${mem.name}" class="form-control mr-sm-2" placeholder="회원명" />
	    <input name="auth" value="${mem.auth}" class="form-control mr-sm-2" placeholder="권한" />
	    <button class="btn btn-info" type="submit">조회</button>
	    &nbsp;
	    <button data-toggle="modal" data-target="#exampleModalCenter"
          class="btn btn-primary" type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
    <thead>
    
      <tr class="table-success text-center">
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>권한</th>
        <th>포인트</th>
        <th>주소</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="mem" items="${memberList}">
			<tr><td>${mem.id}</td><td>${mem.pass}</td>
			<td>${mem.name}</td><td>${mem.auth}</td>
			<td>${mem.point}</td><td>${mem.address}</td></tr>
		</c:forEach>
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
		<form id="frm02" action="${path}/insertMember.do" class="form"  method="post">
	     <div class="row">
            <div class="col">
              <input type="text" class="form-control" placeholder="아이디 입력" name="id">
            </div>
            <div class="col">
              <input type="text" class="form-control" placeholder="비밀번호 입력" name="pass">
            </div>
        </div>
        <div class="row">
            <div class="col">
              <input type="text" class="form-control" placeholder="이름 입력" name="name">
            </div>
            <div class="col">
              <input type="text" class="form-control" placeholder="권한 입력" name="auth">
            </div>
        </div>
        <div class="row">
            <div class="col">
              <input type="text" class="form-control" placeholder="포인트 입력" name="point">
            </div>
            <div class="col">
              <input type="text" class="form-control" placeholder="주소 입력" name="address">
            </div>
        </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="insertMember()" class="btn btn-primary">회원등록</button>
      </div>
      <script type="text/javascript">
         function insertMember(){
            document.querySelector("#frm02").submit();
         }
      </script>
    </div>
  </div>
</div>
</body>
</html>