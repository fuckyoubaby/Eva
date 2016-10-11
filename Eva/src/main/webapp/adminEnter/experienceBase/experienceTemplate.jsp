<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${experiences!=null && fn:length(experiences)>0}">
	<c:forEach items="${experiences}" var="experience">
	<tr data-itemcount='${itemcount}'>
		<td><input type="checkbox"  value="${experience.experienceId}" name="chkName" /></td>
		<td>${experience.experienceName}</td>
		<td>${experience.employee.name}</td>
		<td>${experience.exTime}</td>
		<td>${experience.exState}</td>
		<td><a href="experienceAction!getExperienceById.action?experienceId=${experience.experienceId }">查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${experiences==null || fn:length(experiences) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

