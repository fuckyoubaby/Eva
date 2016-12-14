
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${orders!=null && fn:length(orders)>0}">
	<c:forEach items="${orders}" var="order">
	<tr data-itemcount='${itemcount}'>
		<td>${order.orderName}</td>
		<td>${order.num}</td>
		<td>${order.employee.name}</td>
		<td>${order.orderExplain}</td>
		<td>${order.date}</td>
		
		<%-- <td><a href="assistAction!deleteOrder.action?orderId=${order.orderId }">删除</a></td> --%>
		<td><a onclick="deleteOrder('${order.orderId}')">删除</a></td>
		
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${orders==null || fn:length(orders) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

