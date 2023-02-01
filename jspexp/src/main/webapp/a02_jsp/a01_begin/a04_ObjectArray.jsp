<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.a13_database.vo.*"
    import="java.util.*"
    import="jspexp.vo.Player"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 객체형 List 처리..
// 1. 구조만들기/import 처리
// 2. 리스트로 데이터 넣기
// 3. 반복문 처리하기..
	List<Dept> dlist = new ArrayList<Dept>();
	dlist.add(new Dept(10,"인사","서울"));
	dlist.add(new Dept(20,"회계","부산"));
	dlist.add(new Dept(30,"총무","제주도"));
	for(int idx=0;idx<dlist.size();idx++){
		Dept d = dlist.get(idx);
		log(d.getDeptno()+":"+d.getDname()+":"+d.getLoc());
	}
%>
<table border>
	<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
	<%for(Dept d:dlist){%>
	<tr><td><%=d.getDeptno() %></td><td><%=d.getDname() %></td><td><%=d.getLoc() %></td></tr>
	<%} %>
</table>
<%-- 팀명 선수명 성적을 Player라는 vo 클래스를 만들고 출력 처리해보세요. --%>
<%
	List<Player> plist = new ArrayList<Player>();
	plist.add(new Player("ssg","홍길동",0.381));
	plist.add(new Player("키움","김길동",0.305));
	plist.add(new Player("ssg","신길동",0.356));
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