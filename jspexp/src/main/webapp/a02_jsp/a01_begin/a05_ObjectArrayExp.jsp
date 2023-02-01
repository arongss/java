<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.vo.Player"
    import="java.util.*"
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
<%-- 팀명 선수명 성적을 Player라는 vo 클래스를 만들고 출력 처리해보세요.
 --%>
<%
	List<Player> plist = new ArrayList<Player>();
	plist.add(new Player("ssg","홍길동",0.476));
	plist.add(new Player("키움","김길동",0.381));
	plist.add(new Player("ssg","신길동",0.348));
	for(int idx=0;idx<plist.size();idx++){
		Player p = plist.get(idx);
		log(p.getTname()+":"+p.getName()+":"+p.getRecord());
	}
%>
	<table border>
		<tr><th>팀명</th><th>선수명</th><th>성적</th></tr>
		<%for(Player p:plist){%>
		<tr><td><%=p.getTname() %></td><td><%=p.getName() %></td><td><%=p.getRecord() %></td></tr>
		<%} %>
	</table>
</body>
</html>