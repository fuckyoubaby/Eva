<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>菜单项</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.css"/>
		<script src="<%=basePath%>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*strat the left side*/
			.left-content{width:240px;background:#fff;height:90vh;position:fixed;top:0;left:0;z-index:1000;z-index*:1000;}
			.log{padding:15px 10px;border-top:1px solid #C0C0C0;border-left:1px solid #C0C0C0;}
			.icon-padr{padding-right:8px;}
			.icon-padr10{padding-right:12px}
			.list-group-item{padding:12px 40px;}
			.list-group-item:hover i{}
			/*end of the left side*/
		</style>
	</head>
	<body style="background:#fff">
		<!--start the left side-->
		<div class="left-content">
			<div class="log">
				<img src="<%=basePath%>/img/log.jpg" alt="logo"  width="220px;" heigth="50px;"/>
			</div>
			<div class="list-group">
				<a href="<%=basePath%>/userEnter/project/project_main.jsp" target="main" class="list-group-item "><i class="glyphicon glyphicon-list-alt icon-padr10"></i>项目 </a>
				<a href="<%=basePath%>/userEnter/experienceBase/expBase_index.jsp" target="main" class="list-group-item "><i class="glyphicon glyphicon-share icon-padr10"></i>分享 </a>
				<a href="<%=basePath%>/userEnter/others/other_index.jsp" target="main" class="list-group-item "><i class="glyphicon glyphicon-tasks icon-padr10"></i>其他</a>
				<a href="<%=basePath%>/userEnter/score/score_made_index.jsp" target="main" class="list-group-item "><i class="glyphicon glyphicon-calendar icon-padr"10></i>评分</a>
				<!-- <a href="employeeAction!showEmployeeInfo.action" target="main" class="list-group-item "><i class="glyphicon glyphicon-cog icon-padr10"></i>设置 </a> -->
				<a href="<%=basePath%>/userEnter/setting/setting_index.jsp" target="main" class="list-group-item "><i class="glyphicon glyphicon-cog icon-padr10"></i>设置 </a>
			</div>
		<!--end the left side-->
		</div>
	</body>
</html>
