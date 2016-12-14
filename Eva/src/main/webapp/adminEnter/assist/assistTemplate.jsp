
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${assists!=null && fn:length(assists)>0}">
	<c:forEach items="${assists}" var="assist">
	<tr data-itemcount='${itemcount}'>
		<td>${assist.assistName}</td>
		<td>${assist.score}</td>
		<td>${assist.employee.name}</td>
		<td>${assist.assistExplain}</td>
		<td>${assist.date}</td>
		
		<%-- <td><a href="assistAction!deleteOther.action?assistId=${assist.assistId }">删除</a></td> --%>
		<td><a onclick="deleteOther('${assist.assistId}')">删除</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${assists==null || fn:length(assists) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

