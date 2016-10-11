
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${employeeprojectrs!=null && fn:length(employeeprojectrs)>0}">
	<c:forEach items="${employeeprojectrs}" var="ep">
	<tr data-itemcount='${itemcount}'>
		<td>${ep.project.projectId}</td>
		<td>${ep.project.projectName}</td>
		<td>${ep.project.startTime}</td>
		<td>${ep.project.endTime}</td>
		<td>${ep.project.review.phase.phaseName}--${ep.project.review.reviewName}</td>
		<td>${ep.project.employee.name}</td>
		<td><a href="projectAction!getProjectByIdForUser.action?projectId=${ep.project.projectId }">查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectByIdForUser.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${employeeprojectrs==null || fn:length(employeeprojectrs) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

