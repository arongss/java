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
2023-01-16
[1단계:개념] 1. DI로 설정한 Collections 객체들의 기본 컨테이너 선언 방법을 기술하세요.
	1) list
		public void setPlist(List<Product> add){}
		<property name="plist">
			<list>
	2) set(중복불가)
		public void setAgent(Set<String> agent){}
		<property name="agent">
			<set
				value 입력값
	3) map(key/value)
		public void setConfig(Map<String, 
							Integer> config){}
		<property name="config"
			<entry>
				key/value형식 처리
	4) Properties : key/value형식 collection
			prop key = ""/value
[1단계:확인] 2. 호주머니 클래스를 선언하고 여기담긴 구슬을 Set로 할당하고, 호출하는 클래스와 di를 설정하고 호출하세요
	- 호출
	Pocket pk01 = ctx.getBean("pk01", Pocket.class);
	System.out.println(pk01.getBalls());
	- 할당
	<bean id="pk01" class="a01_diexp.z01_vo.Pocket">
		<property name="balls">
			<set>
				<value>빨간구슬</value>
				<value>빨간구슬</value>
				<value>노란구슬</value>
				<value>노란구슬</value>
				<value>빨간구슬</value>
				<value>빨간구슬</value>
				<value>파란구슬</value>
				<value>빨간구슬</value>
			</set>
		</property>
	</bean>
[1단계:확인] *3. Car클래스에 Tire클래스(제조사,가격)을 List로 추가하여 1:다로 처리되는 di를 선언하고 호출하세요.
[1단계:확인] *4. Map/Properties의 차이점을 기술하고, BaseTeam클래스에 타석 순서별 선수명를 Map으로, 
수비역할별 선수명을 Properties로 DI로 할당하여 출력 처리하세요
[1단계:개념] 5. di에서 namespace처리를 위한 ddl 선언과 선언형식을 기술하세요
	1. 컨테이너 xml dd 부분 선언
		xmlns:p="XXXX"
		xmlns:c="XXXX"
		형식으로 선언이 되어 있어야 한다.
	2. property 선언 변경
		<bean>
			<property name="프로퍼티명" value="데이터할당">
			<property name="프로퍼티명" ref="참조명">
		==>
		<bean p:프로퍼티명 = "데이터할당"
			  p:프로퍼티명-ref = "참조명"
		형식으로 변경하여 보다 코드를 간편화 한다.
	3. constructor 선언 변경
		<bean>
			<constructor-arg>데이터설정
			<constructor-arg>참조명
		==>
		<bean c:생성자매개변수=데이터할당
			  c:_0 ="데이터할당
			  c:_1 ="데이터할당
			  c:생성자매개변수-ref="참조명"
[1단계:확인] *6. callback메서드를 이용하여, 등록회원확인하기 누를때, 등록된 회원리스트나오고, alert(조회완료), 
다시 등록회원닫기 누를때, 닫아지면 등록회원확인 완료 alert()이 로딩되게 하세요.

## 풀이 ##
[1단계:확인] *3. Car클래스에 Tire클래스(제조사,가격)을 List로 추가하여 1:다로 처리되는 di를 선언하고 호출하세요.
1) Tire클래스 company, price
2) Car클래스
	String kind;
	List<Tire> tlist;
	public void setTlist(List<Tire> tlist)
	public void showMyTire(){
		System.out.println("차량종류:"+kind);
		if(tlist!=null && tlist.size()>0){
			for(Tire t:tlist){
				System.out.println(t.getCompany()+"\t"+t.getPrice());
			}
		}else{
			System.out.println("타이어가 장착되지 않았습니다.");
		}
	}
3) DI선언
	<property name="tlist">
		<list>
			<bean ref="tire01">
			<bean ref="tire02">
			
[1단계:확인] *4. Map/Properties의 차이점을 기술하고, BaseTeam클래스에 타석 순서별 선수명를 Map으로, 
수비역할별 선수명을 Properties로 DI로 할당하여 출력 처리하세요
Map : generic으로 type지정 <map><entry key="" value="">
Properties : type을 자유롭게 사용 <props><prop key="">값설정</prop>
class BaseTeam{
	private Map<Integer, String> hitOrders;
	private Properties defends;
}
	<property name="hitOrders">
		<map>
			<entry key="1" value="홍길동"/>
			<entry key="2" value="김길동"/>
			<entry key="3" value="신길동"/>
			..
			<entry key="9" value="마길동"/>
	<property name="defends">
		<props>
			<prop key="투수" value="김길동"/>
			<prop key="포수" value="신길동"/>
			<prop key="1루수" value="오길동"/>
			<prop key="1루수" value="마길동"/>

[1단계:확인] *6. callback메서드를 이용하여, 등록회원확인하기 누를때, 등록된 회원리스트나오고, alert(조회완료), 
다시 등록회원닫기 누를때, 닫아지면 등록회원확인 완료 alert()이 로딩되게 하세요.
	1) 화면 구현
		<input type="button" id="chBtn" value="등록회원확인"/>
		<div id="showList">
			<h2>등록회원리스트</h2>
		</div>
	2) script
		$("#chBtn").click(function(){
			if($(this).val()=="등록회원확인"){
				$(this).val("등록회원닫기")
				$("#showList").show("slow",function(){
					alert("조회회원 확인")
				});
			}else{
				$(this).val("등록회원확인")
				$("#showList").hide("slow",function(){
					alert("등록회원확인 완료")
				});
			}
		});
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
		$("#showList").hide();
		$("#chBtn").click(function(){
			if($(this).val()=="등록회원확인"){
				$(this).val("등록회원닫기")
				$("#showList").show("slow",function(){
					alert("조회회원 확인")
				});
			}else{
				$(this).val("등록회원확인")
				$("#showList").hide("slow",function(){
					alert("등록회원확인 완료")
				});
			}
		});	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>callback연습</h2>
  <input type="button" id="chBtn" value="등록회원확인"/>

</div>
<div class="container" id="showList">
	<h2>등록회원리스트</h2>
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