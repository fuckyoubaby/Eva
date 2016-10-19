
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test="${problems!=null && fn:length(problems)>0}">
	<c:forEach items="${problems}" var="problem">
	<tr data-itemcount='${itemcount}'>
		<td class="word-press">${problem.problemName}</td>
		<td>${problem.problemLevel}</td>
		<td>${problem.problemstate.problemStateName}</td>
		<td>${problem.problemtype.typeName}</td>
		<td>${problem.project.projectName}</td>
		<td>${problem.employee.name}</td>
		<td><a href="problemAction!getProblemByIdForUser.action?problemId=${problem.problemId }" >查看</a></td>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${problems==null || fn:length(problems) ==0}">
  <tr><td colspan="7" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

