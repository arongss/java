<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.vo.*"
   	import="jspexp.a13_database.*"
   	import="jspexp.a13_database.vo.*"
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
<%
	// 프로세스 : 등록/수정/삭제
	String proc = request.getParameter("proc");
	// check된 index 번호
	String[] cidx = request.getParameterValues("cidx");
	// 쿠키의 키와 값
	String[] ckey = request.getParameterValues("ckey");
	String[] cval = request.getParameterValues("cval");
	if(proc!=null){
		for(String cidxS:cidx){
			// checkbox로 선택되어진 key/value
			int idx = Integer.parseInt(cidxS);
			String key = ckey[idx];
			String val = cval[idx];
			Cookie c = new Cookie(key,val);
			if(proc.equals("del")){
				c.setMaxAge(0);
			}
			response.addCookie(c);
			if(proc.equals("add")||proc.equals("upt")){
				Cookie c1 = new Cookie(key,val);
				response.addCookie(c1);
			}
			if(proc.equals("del")){
				for(Cookie c1: request.getCookies()){
					if(c.getName().equals(key)){
						c1.setMaxAge(0);
						response.addCookie(c1);
					}
				}
			}
		}
	}
	response.sendRedirect("a05_CookieList.jsp");
%>
<%--
# 

--%>
</body>
<script type="text/javascript">
/*

*/

</script>
</html>