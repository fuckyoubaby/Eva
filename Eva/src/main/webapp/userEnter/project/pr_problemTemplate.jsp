<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:if test="${projectReviews!=null && fn:length(projectReviews)>0}">
	<c:forEach items="${projectReviews}" var="proReview">
	<tr data-itemcount='${itemcount}'>
		<td>${proReview.designReg}</td>
		<td>${proReview.flowsheetReg}</td>
		<td>${proReview.workplan}</td>
		<td>${proReview.communication}</td>
		<td>${proReview.workEnt}</td>
		<td class="word-press">${proReview.prexplain}</td>
		<td class="p-hover" data-colname='prdate'>
		<fmt:formatDate value="${proReview.prdate}" pattern="yyyy-MM-dd"/>
		<td>${proReview.employee.name}</td>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${projectReviews==null || fn:length(projectReviews) ==0}">
  <tr><td colspan="9" style="padding:100px;">
  	<h3 class="empty" style="text-align:center">友情提示：暂无您所需要的数据....</h3>
  </td></tr>
</c:if>

