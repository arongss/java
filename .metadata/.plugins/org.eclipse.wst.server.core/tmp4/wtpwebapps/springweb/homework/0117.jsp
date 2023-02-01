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
2023-01-17
[1단계:개념] 1. 출력을 처리하는 기능메서드를 기술하고, 이 기능메서드에 callback함수가 처리될 때 어떤 효과가 나는지 기술하세요
	# 데이터 처리 기능 메서드의 callback함수 처리
	1. text(), html(), val()
	2. text(function(idx){
			// 다중의 요소객체의 경우 index값을 매개변수로 받고
			// 리턴값을 해당 데이터에 대한 처리를 할 수 있다.
			return "처리할 데이터";
		})
[1단계:확인] 2. callback함수를 이용하여 5*5 테이블에 1~25번호를 붙이고, 짝/홀별로 배경색상을 다르게 처리하세요
	$(document).ready(function(){
		$("#show td").text(function(idx, txt){
			console.log(idx+""+txt)
			return idx
		})	
		var colors = ["pink","skyblue"]
		$("#show td").val(function(idx){
			$(this).css("background",colors[idx%2])
			return colors[idx];
		})
	});
	<table id="show" width="300pt" height="300pt" border>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td><td></td><td></td></tr>
	</table>
[1단계:개념] 3. 부모/조상객체를 선택하는 기능메서드를 기술하세요
	1) 부모 및 조상 요소객체 선택 
		$("요소객체").praent() : 바로 상위 부모
		$("요소객체").praents("선택할조상객체") : 요소객체를 포함하고 있는 모든 조상객체
			상위 조상객체들 가운데 지정
		$("요소객체").praentsUtil("지정") : 모든 조상객체에서 특정한 객체까지
[1단계:확인] 4. <p><h2>,<p><h2>,<p><h2> 구조로 된 상황에서 h2를 클릭시, 상위 p태그이 border의 테두리가 파랑색으로 처리되게 하세요
[1단계:개념] 5. 자식/후손 객체를 선택하는 기능메서드를 기술하세요
	2) 하위 자식 객체
		$("요소객체").children()
		$("요소객체").find("하위 중에 찾을 객체")
[1단계:개념] 6. 형제 객체를 선택하는 기능메서드를 기술하세요
	3) 형제 객체
		같은 부모를 둔 형제 객체들을 선택
		$("요소객체").siblings() : 요소객체와 같은 부모객체를 둔 모든 형제객체를 선택
		$("요소객체").next() : 형제객체 중, 바로 다음에 나오는 객체
		$("요소객체").nextAll() : 형제객체 중, 바로 다음에 나오는 모든 객체
		$("요소객체").nextUntil() : 형제객체 중, 바로 다음에 지정한 객체까지 객체
		$("요소객체").prev() : 형제객체 중, 바로 이전객체
		$("요소객체").prevAll() : 형제객체 중, 바로 이전객체들
		$("요소객체").prevUntil() : 형제객체 중, 바로 이전객체까지 객체들
[1단계:활용] 7. 입력시, next()를 활용해서 유효성(글자수 8~16)에 대한 내용을 표시하게 하세요.
[1단계:활용] *8. eq()를 활용하여 화살표로 커서를 움직일 때 마다, 3X3테이블의 특정한 td의 배경색상이 위치가 이동이 되게 하세요
	1) 이벤트 커서 이벤트로 처리되는 것을 확인
		$("대상객체").on("keyup",function(){
			console.log(event.keyCode)
		})
	2) table에 key에 따른 변경 처리..
		- 테이블 3*3 생성
	3) 오른쪽 왼쪽을 키를 입력시, 좌우 이동 및 배경색 변경
		전역변수로 tIdx=0;
		$("td").eq(인덱스번호).css("background",pink);
		tIdx++; tIdx--
	4) 위아래 키 입력시, 상하 이동 및 배경색 변경
		0 1 2
		3 4 5
		6 7 8
		아래키 입력시 : 0 ==> 3 ==> 6
		위로키 입력시 : 8 ==> 5 ==> 2
		
[1단계:개념] 9. 의존성 자동 주입이란 무엇이고 이것과 관련한 옵션은 어떤 것들이 있는가?
	# 의존성 자동 주입 설정
	1. 컨테이너는 여러가지 객체들이 선언하여 메모리에 로딩되에 사용할 수 있다.
	2. 이때, 서로 연관관계가 있는 객체 즉, 메서드나 필드에 선언되어 호출되는 관계의 객체들이 있다.
	3. 컨테이너에서 autowiring 옵션을 이용하면, 객체가 현재 메모리에 로딩된 
		상태이기에 바로 new XXXX() 형태로 객체를 생성하여 할당 없이 처리가
		가능한데 이것을 의존성 자동 주입 설정이라고 한다.
	4. 의존성 자동 주입 설정 옵션
		1) autowire="byType"
			스프링 컨테이너 메모리가 해당 객체 타입으로 들어올 수 있는 
			메서드가 정의가 되어 있으면 자동으로 할당이 되게 처리하는 것을 말한다.
		2) autowire="byName"
			byType은 컨테이너에 들어올 수 있는 객체가 하나일 때, 처리가 가능한데, 
			특정 객체가 여러 개 선언되어 있는 경우 byName으로 하면 일단 type일 같고 
			id값이 같은 property가 있는 메서드가 있을 경우 할당하는 것을 말한다.
		3) autowire="constructor"
			생성자를 통해서 해당 타입이 할당될 때, 자동 주입된다.
		4) autowire="autodetect"
			우선 할당할 수 있는 생성자를 살피고, 없을 때는 기능메서드 살펴서 byType으로 할당한다.
		5) autowire="no"
			자동 주입을 하지 못하게 한다. default이다.
[1단계:확인] 10. Pencil과 Eraser를 1:1관계로 설정하고 의존성 자동 주입으로 처리해보세요.(byType)
	<bean id="p01" class="a01_diexp.z01_vo.Pencil" c:_0="샤프" c:_1="일본"/>
	<bean id="e01" class="a01_diexp.z01_vo.Eraser"	p:name="홍길동" autowire="byType"/>
	- 호출
	Eraser e01 = ctx.getBean("e01", Eraser.class);
	e01.usingEraser();
[1단계:확인] 11. BusDriver와 Bus를 선언하고 버스기사가 여러 대의 버스가운데 선택된 의존성 자동 주입을 처리해보세요(byName)
	<bean id="bus01" class="a01_diexp.z01_vo.Bus" c:_0="1004" c:_1="홍대-강북"/>
	<bean id="bus02" class="a01_diexp.z01_vo.Bus" c:_0="7000" c:_1="잠실-서울대"/>
	<bean id="bus03" class="a01_diexp.z01_vo.Bus" c:_0="1000" c:_1="구로-종로"/>
	<bean id="bd01" class="a01_diexp.z01_vo.BusDriver" c:_0="홍길동" autowire="byName"/>
	- vo 추가
	public void setBus03(Bus bus) {
		this.bus = bus;
	}
	- 호출
	BusDriver bd01 = ctx.getBean("bd01", BusDriver.class);
	bd01.driving();
[1단계:개념] 12. 특정 패키지 자동 클래스 선언 형식을 기술하세요
	# 기본형식:컨테이너안에 선언
	1) <context:component-scan base-package="적용할 최상위패키지명">
		- 일단, @Component로 선언된 모든 클래스는 자동으로 메모리에 로딩된다.
	2) 특정 패키지에 있는 객체들을 @Component선언없이 메모리 로딩할려면
		아래의 옵션을 추가하여야 한다.
		<context:component-scan base-package="적용할 최상위패키지명">
			<context:include-filter type="regex" expression=".*"/>
			정규식표현식에 해당하는 클래스를 메모리에 로딩하는 것을 .*란 하위에 있는 모든 클래스를 지칭한다.
[1단계:확인] 13. z06_vo 패키지에 Person, Product, Music 클래스를 복사하고  컨테이너에서 해당 객체들을 호출하게 처리하세요
	<context:component-scan base-package="a01_diexp.z06_vo"></context:component-scan>
	- 호출
	Person person = ctx.getBean("person", Person.class);
	Product product = ctx.getBean("product", Product.class);
	Student music = ctx.getBean("music", Music.class);
	System.out.println("컨테이너의 객체호출:"+person);
	System.out.println("컨테이너의 객체호출:"+product);
	System.out.println("컨테이너의 객체호출:"+music);
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
		var tIdx = 4 // 정중앙 cel index
		$("td").height("100pt")
		$("td").eq(tIdx).css("background","pink")
		$("td").text(function(idx){
			$(this).css({fontSize:"100px"})
			return idx+1;
		})
		$(this).keyup(function(){
			$("td").css("background","")
			// 화살표 왼쪽부터 시계방향으로 37,38,39,40
			// 좌 37, 우 39
			console.log(event.keyCode)
			if(event.keyCode==37) tIdx--
			if(event.keyCode==39) tIdx++
			// 상 38, 하 40
			// +=3,	  +=3
			if(event.keyCode==38) tIdx-=3
			if(event.keyCode==40) tIdx+=3
			tIdx%=9 // 범위가 0~9까지만 변경되게 처리
			$("td").eq(tIdx).css("background","pink")
		})
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>테이블 eq연습</h2>
</div>
<div class="container" id="showList">
	<table height="300pt" class="table table-hover table-striped">
	<col width="33%">
	<col width="33%">
	<col width="33%">
	<tbody>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
		<tr><td></td><td></td><td></td></tr>
	</tbody>
	</table>
</div>
</body>
</html>