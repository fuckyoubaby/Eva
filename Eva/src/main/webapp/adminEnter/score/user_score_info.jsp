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
		<title>管理员-用户评分主页</title>
		<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"/>
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.main-charts{margin-top:20px;width:98%;margin-left:1%;}
			/*table area*/
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";text-align:center;}
			.main-table .r_table table thead tr{background-color:#EEE;}
			.main-table .r_table table thead tr th{text-align:center;}
			.main-table .page-search{padding:0 10px 5px 10px;font-size:12px;color:#AEAEAE}
			/*end the table area*/
		</style>
	</head>
	<body>
		<div class="container">
			<style type="text/css">
				.main-charts{margin-top:20px;width:98%;margin-left:1%;}
				.first-row{padding-left:15px;padding-right:15px;}
				.main-header{width:100%;height:60px;border:1px solid #ccc;margin-top: 20px;background: #eee;}
				.main-header-name {font-size:20px;font-weight:800;height:60px;line-height: 60px;margin-left:2em;}
				.main-header-message{height:60px;padding-top:12px;margin-right:16%}
				.main-header-message ul li{float:left;list-style: none;margin-right:30px;}
				.main-header-message ul li div {font-size:12px;color:#777}
				.main-header-message ul li div em{font-size:14px;color:#282828;display: block;font-style: normal;font-weight:800;text-align: center;}
			</style>
			<div class="row first-row">
				<div class="main-header clearfix">
					<span class="main-header-message pull-right">
						<ul>
							<li>
								<div>参与项目<em>12</em></div>
							</li>
							<li>
								<div>参与培训<em>5</em></div>
							</li>
							<li>
								<div>参与考试<em>6</em></div>
							</li>
						</ul>
					</span>
					<span class="main-header-name pull-left">郭xx</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<div class="main-charts">
						Echarts图形
					</div>
				</div>
				<div class="col-md-6">
				  <div class="main-table">
					<div class="r_title">
						<i class="glyphicon glyphicon-calendar icon-btton"></i>
						<span class="table-title">评分数据展示</span>
					</div>
					<div class="r_table">
						<table class="table ">
							<thead><tr>
								<th></th>
								<th>合规</th>
								<th>专业技术</th>
								<th>沟通能力</th>
								<th>学习积极性</th>
								<th>工作积极性</th>
								<th>综合</th>
							</tr></thead>
							<tbody>
								<tr>
									<td>本人</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>8</td>
								</tr>
								<tr>
									<td>平均水平</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>8</td>
								</tr>
								<tr>
									<td>最高水平</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>8</td>
								</tr>
								
							</tbody>
						</table>
						<div class="page-search">
							<a href="javascript:void(0)">查看往年数据>></a>
						</div>
					<!--end the table area-->
					</div>
				<!--end table column-->	
				</div>
			  </div>	
			<!--end table row-->
			</div>
			
		</div>
	</body>
</html>
