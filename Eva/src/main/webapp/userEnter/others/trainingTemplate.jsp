
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@include file="../taglib.jsp" %>


<c:if test="${employeetrainrs!=null && fn:length(employeetrainrs)>0}">
	<c:forEach items="${employeetrainrs}" var="etr">
	<tr data-itemcount='${itemcount}'>
		<td>${etr.train.trainId}</td>
		<td>${etr.train.trainName}</td>
		<td>${etr.train.teacher}</td>
		<td>${etr.train.trainTime}</td>
		<td>${etr.train.trainLocation}</td>
		<td>${etr.train.trainLevel}</td>
		<td><a href="trainAction!getTrainByIdForEmployee.action?trainId=${etr.train.trainId}">查看</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${employeetrainrs==null || fn:length(employeetrainrs) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

