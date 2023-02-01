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


 


<%--
${param.lecNum} 
${param.lecTimes}
<jsp:useBean id="sch" class="jspexp.vo.StdLecture"/>
 <jsp:setProperty property="*" name="sch"/>

<jsp:setProperty property="id" name="sch" value="${mem.id}"/>
<jsp:setProperty property="lecNum" name="sch" value="${param.lecNum}"/>
  --%>


<%--{"hasLec":${dao.checkLec(mem.id,param.lecNum)}}
{"hasTimes":${dao.checkTimes(mem.id,param.lecTimes)}}
--%>
<jsp:useBean id="dao" class="jspexp.project_4.stdMgr"></jsp:useBean>
{"hasLec":${dao.checkDupLec(mem.id,param.lecTimes,param.lecNum,param.major)}}


<c:if test="${not dao.checkDupLec(mem.id,param.lecTimes,param.lecNum,param.major)}">
	${dao.insStdLec(mem.id,param.lecNum)}
</c:if>


