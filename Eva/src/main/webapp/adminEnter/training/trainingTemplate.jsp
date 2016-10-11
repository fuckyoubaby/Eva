<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${trains!=null && fn:length(trains)>0}">
	<c:forEach items="${trains}" var="train">
	<tr data-itemcount='${itemcount}'>
		<td><input type="checkbox" value="${train.trainId}" name="chkName" /></td>
		<td>${train.trainName}</td>
		<td>${train.teacher} ${train.employee.name} </td>
		<td>${train.trainTime}</td>
		<td>${train.trainLocation}</td>
		<td>${train.trainLevel}</td>
		<td><a href="trainAction!getTrainById.action?trainId=${train.trainId}">查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${trains==null || fn:length(trains) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

