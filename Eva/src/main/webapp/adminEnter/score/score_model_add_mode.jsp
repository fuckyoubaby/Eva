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
		<title>管理员-新增评分模型</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b20{margin-bottom:20px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.icon-padr{padding-right: 5px;}
			.icon-padl{padding-left:5px;}
			.bolder{font-weight:700}
			.clear{clear:both;}
			.form-border{border:1px solid #ccc;border-radius:5px;}
			.form-title{width:100%;padding:10px 15px;font-size:16px;line-height: 1.1;background-color:#f5f5f5;border:1px solid transparent;border-bottom-color: #ddd;border-radius: 5px 5px 0 0;}
			.form-content{padding:15px;}
			
			/*start main process area*/
			.main-process{padding:15px;}
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
			<h3 class="bolder mg-b20">新增模型</h3>
			<div class="hr mg-b20"></div>
			<form action="modeAction!save.action" method="post">
			<div class="row">
				<div class="col-md-6">
					<div class="form-border mg-b20">
						<div class="form-title bolder">基本信息</div>
						<div class="form-group">
							<label class="control-label">模型名称</label> <input type="text"
								name="modelName" class="form-control" />
						</div>
						<div class="main-process mg-b30">
						<input type="submit" value="下一步" class="btn btn-info"/>
							<!-- <a href="javascript:void(0);" class="btn btn-info"><i
								class="glyphicon glyphicon-saved icon-padr"></i>保存</a> -->
							<!--end the main process area-->
						</div>
					</div></form>
			</div>
		
	</body>
</html>
