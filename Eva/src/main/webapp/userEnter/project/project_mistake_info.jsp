<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>项目评审问题描述</title>
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
		</style>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3">${problem.problemName }</div>
			<div class="row mg-b15">
				<div class="col-md-2">阶段</div>
				<div class="col-md-3">${problem.phase.phaseName }--${problem.review.reviewName }</div>
			</div>
			<div class="row mg-b30">
				<div class="col-md-2">责任人</div>
				<div class="col-md-3">${problem.employee.name }</div>
			</div>
			<div class="row hr mg-b30"></div>
			<div class="h4 mg-b30">内容描述</div>
			<div class="row mg-b15">
				<div class="col-md-2">编号</div>
				<div class="col-md-7">${problem.problemId }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">内容</div>
				<div class="col-md-7">
					<p>${problem.problemContent }</p>
					<%-- <c:if test="${not empty problem.imageurl}">
						<img src="${basePath}/${problem.imageurl}" class="img-responsive" />
					</c:if> --%>
				</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-4">问题级别</div>
						<div class="col-md-4">${problem.problemLevel }</div>
					</div>
				</div>
				<div class="col-md-6">
				</div>
			</div>
			<div class="row hr mg-b30"></div>
		</div>
	</body>
</html>
