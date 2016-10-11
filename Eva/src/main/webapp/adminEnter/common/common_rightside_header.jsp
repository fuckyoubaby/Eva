<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>菜单项</title>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.css"/>
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*start of the right side*/
			.right-content{margin-left:240px;height:1500px;background-color:#F3F4F5;border-left:1px solid #ccc;}
			.right-content-header{height:40px;width:100vw;margin-left:-240px;background-color:#E5E5E5;line-height:40px;font-size:12px;border-top:1px solid #CFD0D0;border-bottom:1px solid #CFD0D0;position:fixed;top:0;left:240px;}
			.local-position{margin-left:40px;}
			.current-user{margin-right:40px;}
			.current-user a:hover{font-weight:700;color:#337ab7;text-decoration: none}
			.right-content-body{margin-top:40px;}
			.icon-padr{padding-right: 8px;}
			/*end of the right side*/
			/*start of the page footer*/
			.footer{height:10vh;background:#E5E5E5;}
			/*end of the page footer*/
		</style>
	</head>
	<body style="background:#fff">
		<div class="right-content">
			<div class="right-content-header clearfix">
				<span class="local-position pull-left"><i class="glyphicon glyphicon-map-marker icon-padr"></i>当前位置</span>
				<span class="current-user pull-right">
					<i class="glyphicon glyphicon-user icon-padr"></i><a href="javascript:void(0);">${sessionScope.loginer.name}</a> , &nbsp;<i class="glyphicon glyphicon-off icon-padr"></i><a href="${basePath}/employeeAction!logout.action" target="main">登出</a>
				</span>
			</div>
			<div class="right-content-body">
				<!--content location-->
				加内容
			</div>
			<!--end the right side-->
			<div class="footer">
				<p style="text-align: center;padding:25px 0;"><span>四川长虹网络科技有限责任公司 © 版权所有</span></p>
			</div>
		</div>
		<!--start the page footer-->
	</body>
</html>
