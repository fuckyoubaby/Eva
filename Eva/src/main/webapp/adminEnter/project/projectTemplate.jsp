<%@page import="com.changhong.support.FinalConstant"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	int adminPermission = FinalConstant.SUPER_ADMIN;
	pageContext.setAttribute("adminPermission", adminPermission);
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:if test="${projects!=null && fn:length(projects)>0}">
	<c:forEach items="${projects}" var="project">
	<tr data-itemcount='${itemcount}'>
		<td>${project.projectId}</td>
		<td>${project.projectName}</td>
		<td>${project.startTime}</td>
		<td>${project.endTime}</td>
		<td>${project.review.phase.phaseName}--${project.review.reviewName}</td>
		<td>${project.employee.name }</td>
		<td>
			<a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a>
			<c:if test="${loginer.permission == adminPermission}">
			<a href="javascript:void(0);" onclick="doDelete(this)" data-target="<%=basePath %>projectAction!delete.action?projectId=${project.projectId}" title="删除空项目">删除</a>
			</c:if>
		</td>
		<%-- <td><a href="projectAction!getProjectById.action?projectId=${project.projectId }">查看</a></td> --%>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${projects==null || fn:length(projects) ==0}">
  <tr><td colspan="8" style="padding:100px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
  </td></tr>
</c:if>

