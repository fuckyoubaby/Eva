
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${resultShowTemplates!=null && fn:length(resultShowTemplates)>0}">
	<c:forEach items="${resultShowTemplates}" var="mode">
	<tr data-itemcount='${itemcount}'>
		<td>${mode.scoreRank }</td>
		<td>${mode.result.employee.id }</td>
		<td>${mode.result.employee.name }</td>
		 <c:forEach items="${mode.list }" var="li">
			<td>${li.score }</td>
		</c:forEach>
		<td>${mode.result.designAbility }</td>
		
		<td class="t_td">
			<c:if test="${mode.result.employee.name!='平均值' }">
				<div class="t_action">
				<a href="resultAction!getResultById.action?resultId=${mode.result.resultId}">查看</a>
			</div>
			</c:if>
		</td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${resultShowTemplates==null || fn:length(resultShowTemplates) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

