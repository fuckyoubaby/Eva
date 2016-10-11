
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${modes!=null && fn:length(modes)>0}">
	<c:forEach items="${modes}" var="mode">
	<tr data-itemcount='${itemcount}'>
		<td><input type="checkbox" value="${mode.modeId}" name="chkName" /></td>
		<td class="word-press">${mode.modeName}</td>
		<td>${mode.createTime}</td>
		<td>${mode.employee.name}</td>
		<td class="t_td">
			<div class="t_action">
				<a href="modeAction!getProblemListForUpdate.action?modeId=${mode.modeId }" class="a_see glyphicon glyphicon-eye-open" title="查看" ></a>
				<!-- <a href="#" class="a_edit glyphicon glyphicon-edit" title="编辑" ></a> -->
				<a href="modeAction!deleteMode.action?modeId=${mode.modeId }" class="a_delete glyphicon glyphicon-trash" title="删除" ></a>
			</div>
		</td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${modes==null || fn:length(modes) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

