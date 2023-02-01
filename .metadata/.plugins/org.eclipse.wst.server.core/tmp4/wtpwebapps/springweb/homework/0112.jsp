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
2022-01-12
[1단계:개념] 1. jquery의 선택자 선언형식과 특징을 기술하세요
	$(document).ready(function(){
		// 하나의 선택자로 동일한 내용을 적용할 수 있다.
		$("h2").text("안녕하세요(click)")
		$("h3").text("반가워요")
		$("h2").click(function(){
			// 다중의 내용 중, 클릭한 DOM 지정 $(this)
			$(this).text("클릭되었네요")
			$("h3").hide()
		});
[1단계:확인] *2. 1X4테이블에서 td의 배경색상을 파랑색, 글자정렬 중앙으로 처리하고, 판매하는 과일명을 리스트하고, 클릭시마다 하단 p에 구매한 과일정보를 출력하세요
[1단계:확인] *3. 5X4테이블 행열단위로 짝/홀단위 배경색상을 다르게 처리하고, 커서에 따라 글자크기와 글자색상으로 다르게 처리하세요
[1단계:개념] 4. jquery의 이벤트의 종류와 내용을 기술하세요.
	mouseenter() : 커서를 위치시켰을 때,
	mouseleave() : 커서를 벗어났을 때.
	keyup/keydown : 입력시 처리되는 이벤트 : event.keyCode
	focus/blur : 포커실 되었을 때, 처리되는 이벤트
	toggle(1/1000초시간) : 특정한 이벤트에 의해 대상객체가 보였다가/보이지 않았다를 반복처리
[1단계:확인] *5. 3X3테이블에 각 td마다 마우스 커서와 커서를 벗어났을 때, 배경색상을 변경하고, 클릭시 마다 카운트가 증가되게 처리하세요
[1단계:확인] *6. member테이블의 항목을 회원정보 등록 화면 form으로 만들고 유효성을 처리하세요(모두 입력처리, 아이디(5~16), 패스워드, 패스워드 확인 )
[1단계:개념] 7. jquery의 속성 선언 형식을 기술하세요.
	# 다중의 속성 지정하기 json형식 처리
	1. 기본 속성 다중으로 처리
		$("#tab01").attr("속성","속성값")
		$("#tab01").attr({"속성":"속성값","속성2":"속성2값","속성3":"속성3값"})
	2. css 속성 다중 처리
		$("#tab01").css({"속성":"속성값","속성2":"속성2값","속성3":"속성3값"})
[1단계:확인] *8. 회원등록화면에서 회원이미지를 [이미지보이기/보이지않게]로 클릭하면서 확인했다가/사라졌다를 클릭에 따라 반복하게 하세요.
[1단계:개념] 9. 모델어트리뷰트란 무엇인가? 개념과 실제 사용 방법에 대하여 기술하세요.
	@ModelAttribute는 HTTP Body 내용과 HTTP 파라미터의 값들을 Getter, Setter, 생성자를  통해 주입하기 위해 사용한다.
	일반 변수의 경우 전달이 불가능하기 때문에 model 객체를 통해서 전달해야 한다.
	1. select형태의 콤보형선택은 DB연결되어서 처리되는 경우가 많다.
	2. controller단에서 공통으로 사용되는 key/value형식의 데이터는 ModelAttribute로 선언하여 사용한다.
	3. 처리 순서
		1) sql ==> dao 기능 메서드 추가
		2) controller단 modelattribute 선언
		3) view단에서 공통 modelattribute호출
[1단계:확인] *10. 부서정보를 DB와 연동된 콤보박스를 만들어 a01_empList.jsp에 적용하여 출력하세요.(부서정보 추가등록으로 확인)
	controller
	@ModelAttribute("deptCode")
	public List<Code> getDeptInf(){
		return dao.getDeptInf();
	}
	view
	<c:forEach var="dc" items="${deptCode}">
		<option value="${dc.key}">${dc.val}</option>
	</c:forEach>
[1단계:확인] *11. 급여등급(등급,시작범위)-salgrade을 콤보박스 만들어서 선택하게 처리할려고 한다. sql부터시작하여 화면단 출력까지 처리하세요 
1. sql
2. vo - code
3. dao기능메서드
4. 모델어트리뷰터 controller추가
5. 화면단 select 추가	
	
	sql
	SELECT grade code, LOSAL val\r\n"
		+ "FROM SALGRADE s \r\n"
		+ "ORDER BY code
	controller
	@ModelAttribute("salgradeCode")
	public List<Code> getSalgradeInf(){
		return dao.getSalgradeInf();
	}
	view
	<select name="sal" class="form-control" >
		<option value="00">급여시작선택</option>
		<c:forEach var="sc" items="${salgradeCode}">
			<option value="${sc.key}">${sc.val}</option>
		</c:forEach>
	</select>
	
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
		
//[1단계:확인] *2. 1X4테이블에서 td의 배경색상을 파랑색, 글자정렬 중앙으로 처리하고, 판매하는 과일명을 리스트하고, 클릭시마다 하단 p에 구매한 과일정보를 출력하세요
	$(document).ready(function(){
		$("#tab01 td").css({
			background:"blue",
			color:"yellow",
			textAlign:"center",
			fontSize:"30pt"
		}).click(function(){
			var fruit = $(this).text()
			$("#buyList").text($("#buyList").text()+fruit+",")
			// $("#buyList").append(fruit+",")
		})
	});
		/*
		<h2>물건구매</h2>
		<table id="tab01" height="100pt" class="table table-hover table-striped">
		<tbody><tr><td>사과</td><td>바나나</td>
				<td>딸기</td><td>오렌지</td></tr></tbody>
		</table>
		<p id="buyList"></p>
		*/
//[1단계:확인] *3. 5X4테이블 행열단위로 짝/홀단위 배경색상을 다르게 처리하고, 커서에 따라 글자크기와 글자색상으로 다르게 처리하세요
		/*
		$(document).ready(function(){
			$("#tab02 td:odd").css({"background":"blue","text-align":"center"})
			$("#tab02 td:even").css({"background":"red","text-align":"center"})
			$("#tab02 td").on({
				mouseenter:function(){
					$(this).css({"color":"white","font-size":"20px"})
				}
			})
		});
		<table border=1 id="tab02" width="300px" height="300px">
		<col width="20%"><col width="20%"><col width="20%"><col width="20%">
			<tr><td>O</td><td>O</td><td>O</td><td>O</td><td>O</td></tr>
			<tr><td>O</td><td>O</td><td>O</td><td>O</td><td>O</td></tr>
			<tr><td>O</td><td>O</td><td>O</td><td>O</td><td>O</td></tr>
			<tr><td>O</td><td>O</td><td>O</td><td>O</td><td>O</td></tr>
		</table>
		*/
//[1단계:확인] *5. 3X3테이블에 각 td마다 마우스 커서와 커서를 벗어났을 때, 배경색상을 변경하고, 클릭시 마다 카운트가 증가되게 처리하세요
		/*
		<span id="cnt01">카운트:0</span>
		<table id="tab02">
			<tr><td>1</td><td>2</td><td>3</td></tr>
			<tr><td>4</td><td>5</td><td>6</td></tr>
			<tr><td>7</td><td>8</td><td>9</td></tr>
		</table>
		$(document).ready(function(){
			$("#tab02 td").hover(function(){
				$(this).css("background","yellow")
			},function(){
				$(this).css("background","orange")
			})
			var cnt=0;
			$("#tab02 td").click(function(){
				$("#cnt01").text("카운트:"+(++cnt))
			})
		});
		*/
//[1단계:확인] *6. member테이블의 항목을 회원정보 등록 화면 form으로 만들고 유효성을 처리하세요(모두 입력처리, 아이디(5~16), 패스워드, 패스워드 확인 )
		
</script>
</head>

<body>
<div class="jumbotron text-center">
	<h2>물건구매</h2>
	<table id="tab01" height="100pt" class="table table-hover table-striped">
	<tbody><tr><td>사과</td><td>바나나</td>
			<td>딸기</td><td>오렌지</td></tr></tbody>
	</table>
	<p id="buyList"></p>


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