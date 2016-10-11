<%@page language="java" import="java.util.*" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../taglib.jsp" %>
<c:if test="${fileInfoLists!=null && fn:length(fileInfoLists)>0}">
<c:forEach items="${fileInfoLists}" var="fileInfo" varStatus="status">
	<tr>
		<td><input type="radio" name="chooseName" value="${fileInfo.name}"/></td>
		<td class="td-file-name"><img src="${basePath}/images/excel-icon2.png" width="21" height="21">${fileInfo.name}</td>
		<td>${fileInfo.size}</td>
		<td>
		<fmt:formatDate value="${fileInfo.lasModify}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</td>
		<td>
			<div class="t_action" data-filename="${fileInfo.name}">
				<a href="${basePath}/fileUploadAction!downloadFile.action?itemName=${itemName}&chooseFileName=${fileInfo.name}" target="_blank" class="a_see glyphicon glyphicon-save" title="下载" ></a>
				<a href="#" class="a_delete glyphicon glyphicon-trash" onclick="deleteFile(this);" title="删除"></a>
			</div>
		</td>
	</tr>		
</c:forEach>
</c:if>
<c:if test="${fileInfoLists==null || fn:length(fileInfoLists) ==0}">
  <tr>
  <td colspan="5" style="padding:50px;tex-align:center;">
  	<h1 class="empty">友情提示：暂无文件，请上传....</h1>
  </td>
  </tr>
</c:if>

