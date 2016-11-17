
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${overallscores!=null && fn:length(overallscores)>0}">
	<c:forEach items="${overallscores}" var="overallscore">
	<tr data-itemcount='${itemcount}'>
		<td class="word-press">${overallscore.name}</td>
		<td>${overallscore.startTime}</td>
		<td>${overallscore.endTime}</td>
		<td>${overallscore.mode.modeName}</td>
		<td>${overallscore.createTime}</td>
		<td><a href="scoreAction!saveModeId.action?modeId=${overallscore.id }">详情</a>&nbsp|&nbsp<a href="scoreAction!deleteOverAll.action?modeId=${overallscore.id }">删除</a></td>
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${overallscores==null || fn:length(overallscores) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

