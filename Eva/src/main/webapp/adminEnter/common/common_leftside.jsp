<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>菜单项</title>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.css"/>
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*strat the left side*/
			.left-content{width:240px;background:#fff;height:90vh;position:fixed;top:0;left:0;z-index:1000;z-index*:1000;}
			.log{padding:15px 10px;border-top:1px solid #C0C0C0;border-left:1px solid #C0C0C0;}
			.icon-padr{padding-right:8px;}
			.icon-padr10{padding-right:12px}
			.list-group-item{padding:12px 40px;}
			.list-group-item:hover i{}
			.p-relative{position:relative}
			.left-sub-menu{position:absolute;top:0;left:100%;z-index:20;text-align:center}
			a.link_clear,a.link_clear:focus,a.link_clear:active,a.link_clear:hover{text-decoration:none;color:#000}
			/*end of the left side*/
		</style>
	</head>
	<body style="background:#fff">
		<!--start the left side-->
		<div class="left-content">
			<div class="log">
				<a href="${basePath}/adminEnter/common/common_main.jsp" target="main"><img src="../../img/log.jpg" alt="logo"  width="220px;" height="50px;"/></a>
			</div>
			<div class="list-group">
				<a href="${basePath}/adminEnter/project/project_index.jsp" class="list-group-item " target="main"><i class="glyphicon glyphicon-list-alt icon-padr10"></i>项目相关</a>
				<a href="${basePath}/experienceAction!getAllNum.action" class="list-group-item " target="main"><i class="glyphicon glyphicon-share icon-padr10"></i>经验库相关</a>
				<a href="${basePath}/adminEnter/training/training_index.jsp" class="list-group-item " target="main"><i class="glyphicon glyphicon-tasks icon-padr10"></i>培训相关</a>
				<a href="${basePath}/adminEnter/examing/examing_index.jsp" class="list-group-item " target="main"><i class="glyphicon glyphicon-pencil icon-padr10"></i>竞赛相关</a>
				<div class="list-group-item p-relative">
					<a href="javascript:void(0);" class="dropdown-toggle link_clear" data-toggle="dropdown">
						<i class="glyphicon glyphicon-calendar icon-padr"></i>评分相关<span class="caret"></span>
					</a>
					<ul class="dropdown-menu pull-right">
						<li ><a href="scoreAction!getAllJob.action" target="main">评分处理</a></li>
						<li ><a href="../score/score_model_index.jsp" target="main">配置模型</a></li>
						<li ><a href="../score/score_made_index.jsp" target="main">评分结果展示</a></li>
					</ul> 
				</div>
				<a href="${basePath}/adminEnter/employee/employees_index.jsp" class="list-group-item " target="main"><i class="glyphicon glyphicon-list icon-padr"></i>员工相关</a>
				<a href="${basePath}/dataDirt/allLists.action" class="list-group-item " target="main"><i class="glyphicon glyphicon-book icon-padr"></i>数据词典相关</a>
				<a href="${basePath}/adminEnter/setting/setting_index.jsp" class="list-group-item " target="main"><i class="glyphicon glyphicon-cog icon-padr10"></i>设置相关</a>
				<a href="${basePath}/adminEnter/assist/assist_index.jsp" class="list-group-item " target="main"><i class="glyphicon glyphicon-plus icon-padr10"></i>辅助项相关</a>
			</div>
		<!--end the left side-->
		</div>

	</body>
</html>
