
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@include file="../taglib.jsp" %>


<c:if test="${employeeexamrs!=null && fn:length(employeeexamrs)>0}">
	<c:forEach items="${employeeexamrs}" var="eer">
	<tr data-itemcount='${itemcount}'>
		<td>${eer.exam.examId}</td>
		<td>${eer.exam.examName}</td>
		<td>${eer.exam.examTime}</td>
		<td>${eer.exam.organizer}</td>
		<td>${eer.exam.examLevel}</td>
		<td><a href="examAction!getExamByIdForEmployee.action?examId=${eer.exam.examId}">查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${employeeexamrs==null || fn:length(employeeexamrs) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

