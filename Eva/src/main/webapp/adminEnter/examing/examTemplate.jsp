<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${exams!=null && fn:length(exams)>0}">
	<c:forEach items="${exams}" var="exam">
	<tr data-itemcount='${itemcount}'>
		<td><input type="checkbox"  value="${exam.examId}" name="chkName" /></td>
		<td>${exam.examName}</td>
		<td>${exam.organizer}</td>
		<td>${exam.examTime}</td>
		<td>${exam.examLevel}</td>
		<td><a href="examAction!getExamById.action?examId=${exam.examId }">查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${exams==null || fn:length(exams) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

