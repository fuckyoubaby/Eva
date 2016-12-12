<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员项目结构评审问题信息</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
		<script type="text/javascript">
			function deleteEntity(){
				var url = '${basePath}/structureProblemAction!deleteProblem.action?structureProblemId=${structureProblem.id}';
				var r = confirm('确认删除此问题?');
				if(r){
					window.location.href=url;
				}
			};
		</script>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3 bolder">${structureProblem.name }</div>
			<div class="row mg-b15">
				<div class="col-md-1">项目</div>
				<div class="col-md-3">${project.projectName}</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">阶段</div>
				<div class="col-md-3">${structureProblem.phase.phaseName }--结构评审</div>
			</div>
			<div class="row mg-b30">
				<div class="col-md-1">责任人</div>
				<div class="col-md-3">${structureProblem.employee.name }</div>
			</div>
			<div class="row hr mg-b30"></div>
			<div class="h4 mg-b30 bolder">内容描述</div>
			<div class="row mg-b15">
				<div class="col-md-1">编号</div>
				<div class="col-md-7">${structureProblem.id}</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">名称</div>
				<div class="col-md-7">${structureProblem.name}</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">问题类型</div>
				<div class="col-md-7">${structureProblem.problemtype.typeName }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">扣分</div>
				<div class="col-md-7">${structureProblem.score}</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">原因说明</div>
				<div class="col-md-7">${ empty structureProblem.strExplain?'<未说明>':structureProblem.strExplain}</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">时间</div>
				<div class="col-md-7"><fmt:formatDate value="${structureProblem.createDate}" pattern="yyyy-MM-dd"/></div>
			</div>
			<div class="row hr mg-b30"></div>
				<!--start more process-->
			<div class="main-more-process">
				
			<!--end more process-->
			</div>
		</div>
		
	</body>
</html>
