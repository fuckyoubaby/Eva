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
		<title>培训详情页面</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.sub-title{color:#AEAEAE;font-size:12px;text-indent: 5em;}
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			*{box-sizing: content-box;}
			table{
				*border-collapse: collapse;
				border-collapse: separate;
				width:98%;
			}
			.t_table{
				text-align:center;
				border:1px solid #ddd;
				margin:0 1%;
    			-moz-border-radius: 6px;
				-webkit-border-radius: 6px;
				border-radius:6px;
				
			}
			.t_table td, .t_table th{
				border-left:1px solid #ddd;
				border-top:1px solid #ddd;
				
			}
			.t_table th{border-top:none;}
			.t_table td:first-child, .t_table th:first-child{
				border-left:none;
			}
			
			.t_table tr th:first-child{-moz-border-radius:6px 0 0 0;-webkit-border-radius:6px 0 0 0;border-radius:6px 0 0 0;}
			.t_table tr th:last-child{-moz-border-radius:0 6px 0 0;-webkit-border-radius:0 6px 0 0;border-radius:0 6px 0 0;}
			.t_table tr th:only-child{-moz-border-radius:6px 6px 0 0;-webkit-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0;}
			table.t_table tr th{
				line-height:40px;
				background-color: #eee;
				text-align:center;
			}
			table.t_table tr td{
				line-height:40px;
			}
			
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="mg-b15">${exam.examName }</h3>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="row mg-b15">
				<div class="col-sm-2">竞赛时间</div>
				<div class="col-sm-3">${exam.examTime }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-sm-2">竞赛策划</div>
				<div class="col-sm-3">${exam.organizer }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-sm-2">参与人数</div>
				<div class="col-sm-3">${examCount }</div>
			</div>
			<%-- <div class="row mg-b15">
				<div class="col-sm-2">考试级别</div>
				<div class="col-sm-3">${exam.examLevel }</div>
			</div> --%>
			<div class="row mg-b15">
				<div class="col-sm-2">竞赛内容</div>
				<div class="col-sm-7">${exam.examContent }</div>
			</div>
			<div class="row">
				<div class="hr col-sm-10 mg-b30"></div>
			</div>
			<div class="row mg-b30">
				<div class="col-sm-2">竞赛成绩</div>
				<div class="col-sm-7">
					<table class="t_table">
						<thead>
							<tr><th>分类</th><th>成绩</th></tr>
						</thead>
						<tr><td>${employeeexamr.employee.name }</td><td>${employeeexamr.score }</td></tr>
						<tr><td>平均</td><td>${avg }</td></tr>
						<tr><td>最高</td><td>${max }</td></tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
		</div>
	</body>
</html>
