<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@ include file="../taglib.jsp" %>

<c:if test="${struProblems!=null && fn:length(struProblems)>0}">
	<c:forEach items="${struProblems}" var="struProblem">
	<tr data-itemcount='${itemcount}'>
		<td class="word-press">${struProblem.name}</td>
		<td>${struProblem.employee.name}</td>
		<td>${struProblem.problemtype.typeName}</td>
		<td>${struProblem.score}</td>
		<td class="word-press">${struProblem.strExplain}</td>
		<td>
		<fmt:formatDate value="${struProblem.createDate}" pattern="yyyy-MM-dd"/>
		</td>
		<td><a href="${basePath}/structureProblemAction!showInfo.action?structureProblemId=${struProblem.id}" >查看</a></td>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${struProblems==null || fn:length(struProblems) ==0}">
   <tr><td colspan="7" style="padding:100px;">
  	<h3 class="empty" style="text-align:center">友情提示：暂无您所需要的数据....</h3>
  </td></tr>
</c:if>

