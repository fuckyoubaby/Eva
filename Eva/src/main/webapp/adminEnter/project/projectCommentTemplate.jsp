<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
	String path =request.getContextPath();
    int port = request.getServerPort();
    String basePath = null;
    if(port==80){
    	basePath=request.getScheme()+"://"+request.getServerName()+path;
    }else{
    	basePath=request.getScheme()+"://"+request.getServerName()+":"+port+path;
    }
    request.setAttribute("basePath",basePath);
%>
<c:if test="${commentExts!=null && fn:length(commentExts)>0}">
	<c:forEach items="${commentExts}" var="commentExt">
	<tr data-itemcount='${itemCount}'>
		<td class="word-press">${commentExt.comment.name}</td>
		<td>
		<fmt:formatDate value="${commentExt.comment.date}" pattern="yyyy-MM-dd"/>
		</td>
		<td>${commentExt.name }</td>
		<td><a href="${basePath}/commentAction!getInfoById.action?id=${commentExt.comment.id}">详情</a></td>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${commentExts==null || fn:length(commentExts) ==0}">
   <tr><td colspan="4" style="padding:100px;">
  	<h3 class="empty" style="text-align:center">友情提示：暂无您所需要的数据....</h3>
  </td></tr>
</c:if>

