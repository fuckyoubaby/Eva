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
		<title>管理员-评分模型信息</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
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
			<h3 class="bolder mg-b20">默认模型信息展示</h3>
			<div class="hr mg-b20"></div>
			
			<div class="row mg-b20">
				<div class="col-md-6">
					 <div class="form-border">
						<div class="form-title bolder">专业技术</div>
						<div class="form-content">
							<div class="form-group">
								<label class="control-label">设计缺陷&nbsp;(扣分项)</label>
								<div class="form-control-static">每个项目总分为100分，一般设计缺陷按照ABC三个等级依次扣除12，9，6分；低级错误按照ABC等级依次扣除5,3,1分。</div>
							</div>
							<div class="form-group">
								<label class="control-label">设计共享&nbsp;(加分项)</label>
								<div class="form-control-static">主要是指经验分享，按照星级1-5星，依次加1-5分。年度设计分享的达标线是20分</div>
							</div>
							<div class="form-group">
								<label class="control-label">学习积极性&nbsp;(加分项)</label>
								<div class="form-control-static">主要是参与培训的次数，1次加分为5分。年度学习积极性的达标线式30分</div>
							</div>
						</div>
					 </div>	
				</div>
				<div class="col-md-6">
					 <div class="form-border">
						<div class="form-title bolder">合规</div>
						<div class="form-content">
							<div class="form-group">
								<label class="control-label">设计规定&nbsp;(扣分项)</label>
								<div class="form-control-static">每个项目100分，按照ABC级别依次扣除7、5、3分。</div>
							</div>
							<div class="form-group">
								<label class="control-label">流程规定&nbsp;(扣分项)</label>
								<div class="form-control-static">每个项目100分，按照ABC级别依次扣除7、5、3分。</div>
							</div>
						</div>
					 </div>	
				</div>
			</div>
			
			<div class="row mg-b20">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title bolder">
							沟通管理
						</div>
						<div class="form-content">
							<div class="form-group">
								<label class="control-label">工作积极性&nbsp;(评分项)</label>
								<div class="form-control-static">在项目的每个阶段都会有一次评分，之后有项目平均评分以及总评分</div>
							</div>
							<div class="form-group">
								<label class="control-label">沟通积极性&nbsp;(评分项)</label>
								<div class="form-control-static">在项目的每个阶段都会有一次评分，之后有项目平均评分以及总评分</div>
							</div>
							<div class="form-group">
								<label class="control-label">工作计划性&nbsp;(评分项)</label>
								<div class="form-control-static">在项目的每个阶段都会有一次评分，之后有项目平均评分以及总评分</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--start the main process area-->
			<div class="main-process mg-b30">
				<div><a href="javascript:void(0);" class="btn-title">更多操作&gt;&gt;</a></div>
					<a href="javascript:void(0);" class="btn btn-info"><i class="glyphicon glyphicon-edit icon-padr"></i>修改模型</a>
					<a href="javascript:void(0);" class="btn btn-info"><i class="glyphicon glyphicon-trash icon-padr"></i>删除模型</a>
			<!--end the main process area-->
			</div>
		</div>
	</body>
</html>
