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

<jsp:useBean id="dao" class="jspexp.project_4.stdMgr"></jsp:useBean>
{"hasLec":${dao.checkLec(mem.id,param.lecNum)}}
<c:if test="${dao.checkLec(mem.id,param.lecNum)}">
	${dao.delStdLec(mem.id,param.lecNum)}
</c:if>