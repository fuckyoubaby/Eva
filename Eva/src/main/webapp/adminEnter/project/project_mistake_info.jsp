<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员项目评审问题描述</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			a{text-decoration: none;outline: none;}
			a:hover{text-decoration: none;}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.bolder{font-weight:700}
			.main-more-process{width:98%;margin-left: 1%;margin-top:20px;}
			.icon-padr{padding-right: 5px;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3 bolder">${problem.problemName }</div>
			<div class="row mg-b15">
				<div class="col-md-1">阶段</div>
				<div class="col-md-3">${problem.phase.phaseName }--${problem.review.reviewName }</div>
			</div>
			<div class="row mg-b30">
				<div class="col-md-1">责任人</div>
				<div class="col-md-3">${problem.employee.name }</div>
			</div>
			<div class="row hr mg-b30"></div>
			<div class="h4 mg-b30 bolder">内容描述</div>
			<div class="row mg-b15">
				<div class="col-md-1">编号</div>
				<div class="col-md-7">${problem.problemId }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">内容</div>
				<div class="col-md-7">
					<p>${problem.problemContent }</p>
					<c:if test="${not empty problem.imageurl}">
						<img src="${basePath}/${problem.imageurl}" class="img-responsive" />
					</c:if>
					
				</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-2">问题级别</div>
						<div class="col-md-4">${problem.problemLevel }</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-2">问题状态</div>
						<div class="col-md-4">${problem.problemstate.problemStateName }</div>
					</div>
				</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">问题类型</div>
				<div class="col-md-7">${problem.problemtype.typeName }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">原因说明</div>
				<div class="col-md-7">${problem.explaintion }</div>
			</div>
			
			<div class="row hr mg-b30"></div>
				<!--start more process-->
			<div class="main-more-process">
				<span class="help-text mg-b15"><a href="javasc:void(0);">更多操作>></a></span>
				<div class="row mg-b15" style="padding-left:85px;">
					<a href="problemAction!getProblemByIdForUpdate.action?problemId=${problem.problemId }" class="btn btn-info" ><i class="glyphicon glyphicon-edit icon-padr"></i>编辑问题</a>
					<a href="problemAction!delete.action?problemId=${problem.problemId }"><button type="button" class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-trash icon-padr"></i>删除问题</button></a>
				</div>
			<!--end more process-->
			</div>
		</div>
	</body>
</html>
