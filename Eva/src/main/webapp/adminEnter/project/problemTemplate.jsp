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
		<td>
		<fmt:formatDate value="${problem.createTime}" pattern="yyyy-MM-dd"/>
		</td>
		<td>${problem.employee.name}</td>
		<td><a href="problemAction!getProblemById.action?problemId=${problem.problemId}" >查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${problems==null || fn:length(problems) ==0}">
   <tr><td colspan="7" style="padding:100px;">
  	<h3 class="empty" style="text-align:center">友情提示：暂无您所需要的数据....</h3>
  </td></tr>
</c:if>

