<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    session.setAttribute("basePath", basePath);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员项目信息页面</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.css"/>
		<script src="<%=basePath%>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.icon-padr{padding-right: 5px;}
			.bolder{font-weight:700}
			.clear{clear:both;}
		</style>
		<style type="text/css">
			#crumbs ul li{box-sizing: content-box; list-style: none;float:left}
			#crumbs ul li a{display:block;height:32px;background:#6DC6F2;text-align:center;padding:0 20px 0 40px;line-height:32px;position:relative;margin:0 6px 0 0;font-size:16px;text-decoration:none;color:#fff;}
			#crumbs ul li a:after{content:"";position:absolute;border-color:transparent transparent transparent #6DC6F2;border-width:16px 0 16px 16px;border-style:dashed dashed dashed solid;right:-16px;top:0;z-index:1}
			#crumbs ul li a:before{content:"";position:absolute;border-color:transparent transparent transparent #fff;border-width:16px 0 16px 16px;border-style:dashed dashed dashed solid;left:0;top:0;}
			#crumbs ul li:first-child a{border-radius:5px 0 0 5px;padding-left:30px;}
			#crumbs ul li:first-child a:before{display:none;}
			#crumbs ul li:last-child a{border-radius:0 5px 5px 0;}
			#crumbs ul li:last-child a:after{display:none;}
			#crumbs ul li.completed a{background:#663F90;}
			#crumbs ul li.completed a:after{border-left-color:#663F90;}
			#crumbs ul li.doing a{background:#007CB8;}
			#crumbs ul li.doing a:after{border-left-color:#007CB8;}
			#crumbs ul li.todo:hover a{background:#007CB8;}
			#crumbs ul li.todo:hover a:after{border-left-color:#007CB8;}
			
			/*start 面包屑导航 右下处理区域*/
			.r_cofig_process a{font-size:12px;float:right;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3 bolder">基本信息</div>
			<p class="h4 mg-b15 bolder">${project.projectName }</p>
			<div class="row mg-b15">
				<span class="col-md-2">编号</span>
				<span class="col-md-7">${project.projectId }</span>
			</div>
			<div class="row mg-b15">
				<span class="col-md-2">启动时间</span>
				<span class="col-md-7">${project.startTime }</span>
			</div>
			<div class="row mg-b15">
				<span class="col-md-2">项目成员</span>
				<span class="col-md-7">${project.employee.name }（项目经理）&nbsp; <c:forEach items="${employeeprojectrs }" var="ep">
						${ep.employee.name }
					</c:forEach></span>
			</div>
			<div class="row mg-b15">
				<span class="col-md-2">简介</span>
				<span class="col-md-9">${project.introduction }</span>
			</div>
			<div class="row mg-b15">
				<span class="col-md-2">进度</span>
				<span class="col-md-9">${project.review.phase.phaseName}--${project.review.reviewName}</span>
			</div>
			<div class="row hr mg-b15"></div>
			<p class="h4 bolder">项目进度</p>
			<span class="help-text mg-b30">括弧含义是：(电路评审数 - 项目评审数)</span>
			<div id="crumbs" class="row mg-b15 clearfix">
				<ul>
					<c:forEach items="${phases}" var="phase">
						<%-- <li class="doing"><a href="problemAction!getReviewByPhaseId.action?phaseId=${phase.phaseId }">${phase.phaseName }</a></li> --%>
						<c:set value="${qcMaps[phase.phaseId]}" var="questionCount" />
						<c:choose>
   						   <c:when test="${phase.priority < project.review.phase.priority}">  
               					<li class="completed"><a href="problemAction!getReviewByPhaseIdForUser.action?phaseId=${phase.phaseId }&&projectId=${project.projectId}">${phase.phaseName }<small>(${questionCount.commentCount}-${questionCount.projectReviewCount})</small></a></li>
						   </c:when>
						   <c:when test="${phase.priority==project.review.phase.priority}">  
               					<li class="doing"><a href="problemAction!getReviewByPhaseIdForUser.action?phaseId=${phase.phaseId }&&projectId=${project.projectId}">${phase.phaseName }<small>(${questionCount.commentCount}-${questionCount.projectReviewCount})</small></a></li>
						   </c:when>
						   <c:otherwise> 
						  	 	<li class="todo"><a href="javascript:volid(0);">${phase.phaseName }<small>(${questionCount.commentCount}-${questionCount.projectReviewCount})</small></a></li>
   						   </c:otherwise>
						</c:choose>
					</c:forEach>
					<%-- <li class="completed"><a onclick="turnPage('problemAction!getProblemsByProjectIdAndPhase.action?projectId=${project.projectId }&phase=启动阶段')">启动阶段</a></li>
					<li class="doing"><a onclick="turnPage('problemAction!getProblemsByProjectIdAndPhase.action?projectId=${project.projectId }&phase=设计阶段')">设计阶段</a></li>
					<li class="todo"><a onclick="turnPage('problemAction!getProblemsByProjectIdAndPhase.action?projectId=${project.projectId }&phase=样品阶段')">样品阶段</a></li>
					<li class="todo"><a onclick="turnPage('problemAction!getProblemsByProjectIdAndPhase.action?projectId=${project.projectId }&phase=交付阶段')">交付阶段</a></li> --%>
				</ul>
				<div class="clear"></div>
			</div>
			<div class="row hr mg-b15"></div>
		</div>
		
	</body>
</html>
