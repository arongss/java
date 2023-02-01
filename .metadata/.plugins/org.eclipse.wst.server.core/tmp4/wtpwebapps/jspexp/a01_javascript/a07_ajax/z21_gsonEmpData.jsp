<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
jspexp.a13_database.A02_EmpDao empSchList
 --%>
<jsp:useBean id="dao" class="jspexp.a13_database.A02_EmpDao"/>
<jsp:useBean id="sch" class="jspexp.vo.Emp"/>
<jsp:setProperty name="sch" property="*"/>
<c:if test="${empty param.ename}">${sch.setEname('')}</c:if>
<c:if test="${empty param.job}">${sch.setJob('')}</c:if>
<c:if test="${empty param.toSal}">${sch.setToSal(9999)}</c:if>
<jsp:useBean id="json" class="com.google.gson.Gson"/>
${json.toJson(dao.getEmpSch(sch))}