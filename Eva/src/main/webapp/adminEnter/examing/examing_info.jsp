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
		<title>管理员-竞赛详情页面</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*start common style*/
			.sub-title{color:#AEAEAE;font-size:12px;text-indent: 5em;}
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.bolder{font-weight:700}
			/*end common style*/
			
			/*start messsage table style*/
			table.t_table{*border-collapse:collapse;border-collapse:separate;width:98%;}
			.t_table{text-align:center;border:1px solid #ddd;margin:0 1%;-moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px;}
			.t_table td,.t_table th{border-left:1px solid #ddd;border-top:1px solid #ddd;}
			.t_table th{border-top:none;}
			.t_table td:first-child,.t_table th:first-child{border-left:none;}
			.t_table tr th:first-child{-moz-border-radius:6px 0 0 0;-webkit-border-radius:6px 0 0 0;border-radius:6px 0 0 0;}
			.t_table tr th:last-child{-moz-border-radius:0 6px 0 0;-webkit-border-radius:0 6px 0 0;border-radius:0 6px 0 0;}
			.t_table tr th:only-child{-moz-border-radius:6px 6px 0 0;-webkit-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0;}
			table.t_table tr th{line-height:40px;background-color:#eee;text-align:center;}
			table.t_table tr td{line-height:40px;}
			/*end message table style*/
			
			/*start main process area*/
			.main-process{}
			.main-process a.btn-title{text-decoration:none;color:#ccc;}
			.main-process a.btn-title:hover{color:#282828;}
			.main-process a.btn-info{margin-left:75px;font-size:12px;}
			.icon-padr{padding-right: 5px;}
			.icon-padr10{padding-right:12px}
			/*end main process area*/
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder">${exam.examName }</h3>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">竞赛时间</div>
				<div class="col-md-3">${exam.examTime }</div>
			</div>
			<%-- <div class="row mg-b15">
				<div class="col-md-2">竞赛级别</div>
				<div class="col-md-3">${exam.examLevel }</div>
			</div> --%>
			<div class="row mg-b15">
				<div class="col-md-2">竞赛策划</div>
				<div class="col-md-3">${exam.organizer }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">参与人数</div>
				<div class="col-md-3">${examCount }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">竞赛内容</div>
				<div class="col-md-7">${exam.examContent }</div>
			</div>

			<div class="row mg-b15">
				<div class="col-md-2">竞赛成绩</div>
				<div class="col-md-6">
						<table class="t_table">
						<thead>
							<tr>
								<td>分类</td>
								<td>成绩</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>最高</td>
								<td>${max }</td>
							</tr>
							<tr>
								<td>平均</td>
								<td>${avg }</td>
							</tr>
							<tr>
								<td>最低</td>
								<td>${min }</td>
							</tr>
						</tbody>				
					</table>
				</div>
			</div>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			
			<div class="main-process">
				<a href="examAction!getExamByIdForUpdate.action?examId=${exam.examId }" class="btn btn-info"><i class="glyphicon glyphicon-edit icon-padr"></i>修改信息</a>
				<a href="examAction!turntolist.action?examId=${exam.examId }" class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-list icon-padr"></i>具体成员</a>
			<!--end the main process area-->
			</div>
		</div>
	</body>
</html>
