<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>

<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="UTF-8">
	<title>管理员-项目设计评审添加</title>
   	
   	<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
	<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script src="${basePath}/js/bootstrapValidator.min.js" type="text/javascript" charset="utf-8" ></script>
	<script src="${basePath}/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
	<link href="${basePath}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
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
			.form-border{border:1px solid #ccc;border-radius:5px;}
			.form-title{width:100%;padding:10px 15px;font-size:16px;line-height: 1.1;background-color:#f5f5f5;border:1px solid transparent;border-bottom-color: #ddd;border-radius: 5px 5px 0 0;}
			.form-content{padding:15px 35px;}
			.form-control-feedback {top:25px !important; right:-30px}
		</style>
  </head>
  
  <body>
   		<div class="container">
			<h3 class="bolder">新的设计评审录入</h3>
			<div class="hr mg-b15"></div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">输入评审信息</div>
						<form id="comment_add" action="${basePath}/commentAction!saveComment.action" role="form" class="form-content" method="post">
							<div class="form-group">
								<label class="control-label">评审名称</label>
								<input type="text" name="commentName" class="form-control"/>
							</div>
							<div class="form-group">
								<label class="control-label">评审日期</label>
								<div class="input-group">
									<input type="date" class="form-control" id="commentDate" name="commentDate" readonly="readonly"
									placeholder="评审日期" style="cursor:not-allowed" />
									<div class="input-group-addon" onclick="WdatePicker({el:'commentDate',dateFmt:'yyyy-MM-dd'})"> 
									<i class="glyphicon glyphicon-calendar"></i> 
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</button>
							</div>
						</form>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						<div class="form-content">
							<div class="form-group">
								<label class="control-label">项目编号</label>
								<div class="form-control-static">${project.projectId}</div>
							</div>
							<div class="form-group">
								<label class="control-label">项目名称</label>
								<div class="form-control-static">${project.projectName}</div>
							</div>
							<div class="form-group">
								<label class="control-label">阶段</label>
								<div class="form-control-static">${phase.phaseName}</div>
							</div>
							<div class="form-group">
								<label class="control-label">评审</label>
								<div class="form-control-static">设计评审</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#comment_add').bootstrapValidator({
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
						commentName : {
							trigger : 'blur',
							validators : {
								notEmpty:{ message:'评审名称不能为空！'},
								stringLength: {
									max:16,
									min:2,
									message:'名称请限定在2-16位'
								}
							}
						},
						commentDate : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'评审日期不能为空'
								},
								date:{
									format:'YYYY-MM-DD',
									message:'评审日期格式错误yyyy-MM-dd'
								}
							}
						}
					}
				});
			});
		</script>
  </body>
</html>
