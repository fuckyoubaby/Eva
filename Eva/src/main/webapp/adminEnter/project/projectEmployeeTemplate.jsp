<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<c:if test="${employees!=null && fn:length(employees)>0}">
<c:forEach items="${employees}" var="employee" varStatus="status">
	<tr data-itemcount='${itemcount}'>
		<td class="emp-name">${employee.name}</td>
		<td class="member">${employee.id}</td>
		<td>${employee.job.jobName}</td>
		<td>${employee.email}</td>
		<td><a href="javascript:void(0);" onclick="addMember(this)" title="添加"><i class="glyphicon glyphicon-plus-sign"></i></a></td>
	</tr>		
</c:forEach>
</c:if>
<c:if test="${employees==null || fn:length(employees) ==0}">
  <tr>
  <td colspan="5" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td>
  </tr>
</c:if>

