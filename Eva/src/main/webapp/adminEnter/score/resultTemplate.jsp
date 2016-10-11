
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${results!=null && fn:length(results)>0}">
	<c:forEach items="${results}" var="result">
	<tr data-itemcount='${itemcount}'>
		<td class="word-press">${result.employee.name}</td>
		<td>${result.employee.id}</td>
		<td>${result.compliance}</td>
		<td>${result.designAbility}</td>
		<td>${result.learningAbility}</td>
		<td>${result.work}</td>
		<td>${result.communication}</td>
		<td><a href="resultAction!getResultById.action?resultId=${result.resultId}">查看</a></td> 
	</tr>
	</c:forEach>
</c:if>
<c:if test="${results==null || fn:length(results) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

