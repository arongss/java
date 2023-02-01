<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">
<script type="text/javascript">
/*

*/
</script>
</head>
<body>

<%--
2022-11-25
[2단계:확인] 1. [jsp] 회원등록리스트(회원아이디,회원명,포인트,권한(select-관리자/일반사용자/방문객))로 출력 리스트를 처리하세요.

--%>
<h2>회원등록리스트</h2>
	<%
	List<Member> mlist = new ArrayList<Member>();
	mlist.add(new Member("user01","홍길동",3000,"관리자"));
	mlist.add(new Member("user02","김길동",1000,"일반사용자"));
	mlist.add(new Member("user03","신길동",500,"일반사용자"));
	mlist.add(new Member("user04","오길동",2000,"방문객"));
	%>
	<table>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<tr><th>회원아이디</th><th>회원명</th><th>포인트</th><th>권한</th></tr>
		<%for(int idx=0;idx<mlist.size();idx++){ 
			Member m = mlist.get(idx);
		%>
		<tr><td><input type="text" name="id" value="<%=m.getId()%>"/></td>
			<td><input type="text" name="name" value="<%=m.getName()%>"/></td>
			<td><input type="text" name="point" value="<%=m.getPoint()%>"/></td>
			<td><select name="auth">
					<option value="관리자" <%=m.getAuth().equals("관리자")?"selected":""%>>관리자</option>
					<option value="일반사용자" <%=m.getAuth().equals("일반사용자")?"selected":""%>>일반사용자</option>
					<option value="방문객" <%=m.getAuth().equals("방문객")?"selected":""%>>방문객</option>
				</select></td></tr>
		<%} %>
	</table>
</body>
<script type="text/javascript">
/*

*/
</script>
</html>