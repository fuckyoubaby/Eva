
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${patents!=null && fn:length(patents)>0}">
	<c:forEach items="${patents}" var="patent">
	<tr data-itemcount='${itemcount}'>
		<td>${patent.patentId}</td>
		<td>${patent.patentName}</td>
		<td>${patent.patentType}</td>
		<td>${patent.employee.name}</td>
		<td>${patent.patentExplain}</td>
		<td>${patent.date}</td>
		
		<%-- <td><a href="assistAction!deletePatent.action?patentId=${patent.patentId }" >删除</a></td> --%>
		<td><a onclick="deletePatent('${patent.patentId }');" >删除</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${patents==null || fn:length(patents) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

