
<%@page language="java" import="java.util.*" pageEncoding="utf-8"
	trimDirectiveWhitespaces="true"%>

<%@include file="../taglib.jsp"%>


<c:if test="${experiences!=null && fn:length(experiences)>0}">
	<c:forEach items="${experiences}" var="experience">
		<%-- <tr data-itemcount='${itemcount}'>
		<td><input type="checkbox"  value="${experience.expId}" name="chkName" /></td>
		<td>${experience.title}</td>
		<td>${experience.employee.employeeName}</td>
		<td>${experience.expDate}</td>
		<td>${experience.expState}</td>
		<td><a onclick="turnPage('experienceAction!getExperienceById2.action?experienceId=${experience.expId}')">查看</a></td>
	</tr> --%>
		<li data-itemcount='${itemcount}'>
			<h4 class="exp-title">
				<a href="experienceAction!getExperienceByIdForUser.action?experienceId=${experience.experienceId }">${experience.experienceName}</a>
			</h4> <span class="exp-outhor"><em class="short-cut">[录入]</em>${experience.employee.name}
				--${experience.exTime}</span>
			<div>
				<em class="short-cut">[评分]</em>${experience.score}星
			</div>
			<div>
				<em class="short-cut">[摘要]</em>
				<div class="exp-desc">${experience.abstract_}</div>
			</div>
		</li>
	</c:forEach>
</c:if>
<c:if test="${experiences==null || fn:length(experiences) ==0}">
	<tr>
		<td colspan="8" style="padding:100px;tex-align:center;">
			<h1 class="empty">友情提示：暂无您所需要的数据....</h1>
		</td>
	</tr>
</c:if>

