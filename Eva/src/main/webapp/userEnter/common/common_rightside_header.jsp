<%@page import="com.changhong.entities.Employee"%>
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
		<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"/>
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*start of the right side*/
			.right-content{margin-left:240px;height:1500px;background-color:#F3F4F5;border-left:1px solid #ccc;}
			.right-content-header{height:40px;width:100vw;margin-left:-240px;background-color:#E5E5E5;line-height:40px;font-size:12px;border-top:1px solid #CFD0D0;border-bottom:1px solid #CFD0D0;position:fixed;top:0;left:240px;}
			.local-position{margin-left:280px;}
			.current-user{margin-right:40px;}
			.right-content-body{margin-top:40px;}
			/*end of the right side*/
			/*start of the page footer*/
			.footer{
				height:10vh;
				background:#E5E5E5;
			}
			/*end of the page footer*/
		</style>
	</head>
	<body style="background:#fff">
		<% Employee employee = (Employee)session.getAttribute("employee"); %>
		<div class="right-content">
			<div class="right-content-header clearfix">
				<span class="local-position pull-left"><i class="glyphicon glyphicon-map-marker icon-padr"></i>当前位置</span>
				<span class="current-user pull-right">
					<i class="glyphicon glyphicon-user icon-padr"></i><a href="employeeAction!showEmployeeInfo.action" target="main"><%=employee.getName() %></a> , &nbsp;<i class="glyphicon glyphicon-off icon-padr"></i><a href="employeeAction!logout.action">登出</a>
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
