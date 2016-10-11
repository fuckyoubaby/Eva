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
		<title>管理员-经验分享修改</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.mg-r5{margin-right:5px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.icon-padr{padding-right: 5px;}
			.bolder{font-weight:700}
			.clear{clear:both;}
			.form-border{border:1px solid #ccc;border-radius:5px;}
			.form-title{width:100%;padding:10px 15px;font-size:16px;line-height: 1.1;background-color:#f5f5f5;border:1px solid transparent;border-bottom-color: #ddd;border-radius: 5px 5px 0 0;}
			.form-content{padding:15px;}
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder">分享评分</h3>
			<div class="hr mg-b15"></div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						<div class="form-content">
					  	<h4 class="bolder">${experience.experienceName }</h4>
						<div class="small text-left mg-b10" >${experience.employee.name }</div>
						
						<div class="form-group">
							<label  class="control-abel">地区</label>
							<div class="form-control-static">${experience.county }</div>
						</div>
						<div class="form-group">
							<label  class="control-abel">分类</label>
							<div class="form-control-static">${experience.classify.classifyName }</div>
						</div>
						<div class="form-group">
							<label  class="control-abel">主芯片</label>
							<div class="form-control-static">${experience.mainChip }</div>
						</div>
						<div class="form-group">
							<label  class="control-abel">关键词</label>
							<div class="form-control-static">${experience.keyword }</div>
						</div>
						<div class="form-group">
						<label  class="control-abel">摘要</label>
						<div class="form-control-static">${experience.abstract_ }</div>
					</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">评分</div>
						<div class="form-content">
							<form action="experienceAction!update.action" role="form">
								<div class="form-group">
									<label class="control-label"></label>
									<select name="score" id="grade" class="form-control">
										<option value="1">1星</option>
										<option value="2">2星</option>
										<option value="3">3星</option>
										<option value="4">4星</option>
										<option value="5">5星</option>
									</select>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-info" value="提交"/>
								</div>
							</form>
						</div>
				</div>
			</div>
		</div>
	</body>
</html>
