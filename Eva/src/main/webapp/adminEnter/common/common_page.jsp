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
			/*strat the left side*/
			.left-content{
				width:240px;
				background:#fff;
				height:90vh;
				position:fixed;
				top:0;
				left:0;
				z-index:1000;
				z-index*:1000;
			}
			.log{
				padding:15px 10px;
				border-top:1px solid #C0C0C0;
				border-left:1px solid #C0C0C0;
			}
			.icon-padr{padding-right: 8px;}
			.icon-padr10{padding-right:12px}
			.list-group-item{padding:12px 40px;}
			.list-group-item:hover i{
				/*加点动画效果*/
			}
			
			.p-relative{position:relative}
			.left-sub-menu{position:absolute;top:0;left:100%;z-index:20;text-align:center}
			a.link_clear, a.link_clear:focus, a.link_clear:active, a.link_clear:hover{text-decoration: none;color:#000}

			/*end of the left side*/

			/*start of the right side*/
			.right-content{
				margin-left:240px;
				height:1500px;
				background-color:#F3F4F5;
				border-left:1px solid #ccc;
			}
			.right-content-header{
				height:40px;
				width:100vw;
				margin-left:-240px;
				background-color:#E5E5E5;
				line-height: 40px;
				font-size:12px;
				border-top:1px solid #CFD0D0;
				border-bottom:1px solid #CFD0D0;
				position:fixed;
				top:0;
				left:240px;
			}
			.local-position{
				margin-left:280px;
			}
			.current-user{
				margin-right:40px;
			}
			.right-content-body{
				margin-top:40px;
			}
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
		<!--start the left side-->
		<div class="left-content">
			<div class="log">
				<img src="../../img/log.jpg" alt="logo"  width="220px;" heigth="70px;"/>
			</div>
			<div class="list-group">
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-list-alt icon-padr10"></i>项目相关</a>
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-share icon-padr10"></i>经验库相关</a>
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-tasks icon-padr10"></i>培训相关</a>
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-pencil icon-padr10"></i>考试相关</a>
				<!--<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-calendar icon-padr"10></i>评分相关</a>-->
				<div class="list-group-item p-relative">
					<a href="javascript:void(0);" class="dropdown-toggle link_clear" data-toggle="dropdown">
						<i class="glyphicon glyphicon-calendar icon-padr"10></i>评分相关<span class="caret"></span>
					</a>
					<ul class="dropdown-menu left-sub-menu">
						<li ><a href="../score/make_score.html" >评分处理</a></li>
						<li ><a href="../score/score_model_index.html" >配置模型</a></li>
					</ul>
				</div>
				
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-list icon-padr"10></i>员工相关</a>
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-book icon-padr"10></i>数据词典相关</a>
				<a href="javascript:void(0);" class="list-group-item "><i class="glyphicon glyphicon-cog icon-padr10"></i>设置相关</a>
			</div>
		<!--end the left side-->
		</div>
		<!-- start the right side-->
		<div class="right-content">
			<div class="right-content-header clearfix">
				<span class="local-position pull-left"><i class="glyphicon glyphicon-map-marker icon-padr"></i>当前位置</span>
				<span class="current-user pull-right">
					<i class="glyphicon glyphicon-user icon-padr"></i><a href="javascript:void(0);">fanweihua</a> , &nbsp;<i class="glyphicon glyphicon-off icon-padr"></i><a href="javascript:void(0);">登出</a>
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
