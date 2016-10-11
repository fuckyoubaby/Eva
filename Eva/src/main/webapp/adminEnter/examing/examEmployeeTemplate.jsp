<%@page language="java" import="java.util.*" pageEncoding="utf-8"
	trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:if test="${employeeexamrs!=null && fn:length(employeeexamrs)>0}">
	<c:forEach items="${employeeexamrs}" var="item">
		<tr data-itemcount='${itemcount}'>
			<td><input type="checkbox" value="${item.employeeExamRid}"
				name="chkName" /></td>
			<td>${item.employee.name}</td>
			<td>${item.employee.id}</td>
			<td>${item.score}</td>
			<td class="t_td">
				<div class="t_action">
					<a href="examAction!getExamScoreForUpdate.action?examEmployeeId=${item.employeeExamRid }" class="a_edit glyphicon glyphicon-edit" title="编辑"></a>
					<a href="examAction!deleteScoreList.action?examEmployeeId=${item.employeeExamRid }" class="a_delete glyphicon glyphicon-trash" title="删除"></a>
				</div>
			</td>
			<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
		</tr>
	</c:forEach>
</c:if>
<c:if test="${employeeexamrs==null || fn:length(employeeexamrs) ==0}">
	<tr>
		<td colspan="8" style="padding:100px;tex-align:center;">
			<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
		</td>
	</tr>
</c:if>

