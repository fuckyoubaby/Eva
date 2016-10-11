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
		<td><input type="checkbox" name="chkName" value="${employee.id}"/></td>
		<td>${employee.id}</td>
		<td>${employee.name}</td>
		<td>${employee.job.jobName}</td>
		<td>${employee.phone}</td>
		<td>${employee.email}</td>
		<td><a href="employeeAction!getEmployeeById.action?employeeId=${employee.id }">查看</a></td>
	</tr>		
</c:forEach>
</c:if>
<c:if test="${employees==null || fn:length(employees) ==0}">
  <tr>
  <td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td>
  </tr>
</c:if>

