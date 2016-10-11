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
		<title>管理员-项目评审配置</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.icon-padr{padding-right: 5px;}
			.icon-padl{padding-left:5px;}
			.bolder{font-weight:700}
			.clear{clear:both;}
			
			select[multiple]{height:150px;}
			
			/*列表区域*/
			.process-control{text-align:center}
			.process-control a.btn:first-child{margin-right:25px;}
		</style>
	</head>
	<body>
		<div class="container">
			<!--head-->
			<h3 class="bolder">土耳其HD8600<span class="small icon-padl">评审配置</span></h3>
			<div class="mg-b15 help-text">添加新的可用评审，请在数据词典中配置</div>
			<div class="hr mg-b15"></div>
			
			<!--body-->
			<div class="row mg-b15">
				<form action="#" role="form">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">已有评审</label>
							<select  multiple="multiple" name="projectProcess" class="form-control">
								
							</select>
						</div>
						<div class="process-control">
							<a href="javascript:void(0);" class="btn btn-default">移除</a>
							<a href="javascript:void(0);" class="btn btn-default">&gt;&gt;</a>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">可用评审</label>
							<select multiple="multiple" name="leftProcess" class="form-control">
								<option value="evaluation-Id">结构评审</option>
								<option value="evaluation-Id">结构评审</option>
								<option value="evaluation-Id">结构评审</option>
								<option value="evaluation-Id">结构评审</option>
							</select>
						</div>
						<div class="process-control">
							<a href="javascript:void(0);" class="btn btn-default">&lt;&lt;</a>
							<a href="javascript:void(0);" class="btn btn-default">全部移动</a>
						</div>
					</div>
					<div class="col-md-2"></div>
				</form>
			</div>
			<div class="row mg-b30"><span class=" col-md-6 help-text">移除时，会清空评审所涉及问题</span></div>
			
			<a href="javascript:void(0);" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</a>
		</div>
	</body>
</html>
