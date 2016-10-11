
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${comprehensives!=null && fn:length(comprehensives)>0}">
	<c:forEach items="${comprehensives}" var="comprehensive">
	<tr data-itemcount='${itemcount}'>
		<td class="word-press">${comprehensive.name}</td>
		<td>${comprehensive.lowPoint}</td>
		<td>${comprehensive.oneStep}</td>
		<td><img onclick="addComprehensive(${comprehensive.comprehensiveId});" src="../../img/ico_add.png" width="15" height="15"></td>
		<%-- <td><img onclick="add(${problemmode.problemModeId},${problemmode.a},${problemmode.b},${problemmode.c},${problemmode.problemtype.typeName });" src="../../img/ico_add.png" width="15" height="15"></td> --%>
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
		
	</tr>
	</c:forEach>
</c:if>
<c:if test="${comprehensives==null || fn:length(comprehensives) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

