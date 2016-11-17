<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"  %>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员项目评审问题描述</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			a{text-decoration: none;outline: none;}
			a:hover{text-decoration: none;}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.bolder{font-weight:700}
			.main-more-process{width:98%;margin-left: 1%;margin-top:20px;}
			.icon-padr{padding-right: 5px;}
			div.form-control-static{padding-left:7px;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3 bolder"><a href="${basePath}/problemAction!getReviewByPhaseId.action?phaseId=${projectReview.phase.phaseId}&indexNo=${projectReview.phase.phaseId * 2}">${projectReview.project.projectName}评审项信息展示</a>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">阶段</div>
				<div class="col-md-3">${projectReview.phase.phaseName }--项目评审</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-1">责任人</div>
				<div class="col-md-3">${projectReview.employee.name }</div>
			</div>
			<div class="row mg-b30">
				<div class="col-md-1">评审日期</div>
				<div class="col-md-3">${projectReview.prdate }</div>
			</div>
			<div class="row hr mg-b30"></div>
			<div class="h4 mg-b15 bolder">评审内容</div>
			<p class="bolder"><span class="glyphicon glyphicon-star-empty icon-padr" ></span>不合规项</p>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">设计规定</div>
						<div class="form-control-static">${projectReview.designReg}</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">设计规定扣分说明</div>
						<div class="form-control-static">${projectReview.designExplain}</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">流程规定</div>
						<div class="form-control-static">${projectReview.flowsheetReg }</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">流程规定扣分说明</div>
						<div class="form-control-static">${projectReview.flowExplain}</div>
					</div>
				</div>
			</div>
			<p class="bolder"><span class="glyphicon glyphicon-star-empty icon-padr" ></span>组织管理能力</p>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">工作计划性差</div>
						<div class="form-control-static">${projectReview.workplan }</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">工作计划性差扣分说明</div>
						<div class="form-control-static">${projectReview.workPlanExplain}</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">沟通低效</div>
						<div class="form-control-static">${projectReview.communication }</div>
					</div>
				</div>
				
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">沟通低效扣分说明</div>
						<div class="form-control-static">${projectReview.communicationExplain }</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">工作积极性</div>
						<div class="form-control-static">${projectReview.workEnt }</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<div class="control-label">工作积极性扣分说明</div>
						<div class="form-control-static">${projectReview.workEntExplain}</div>
					</div>
				</div>
			</div>
			<div class="mg-b15">
				<div >扣分说明</div>
				<div style="padding:7px">${projectReview.prexplain }</div>
			</div>
			
			<div class="row hr mg-b30"></div>
				<!--start more process-->
			<div class="main-more-process">
				<span class="help-text mg-b15"><a href="javasc:void(0);">更多操作>></a></span>
				<div class="row mg-b15" style="padding-left:85px;">
					<a href="projectReviewAction!updatePRItem.action?proReviewId=${projectReview.projectReviewId }" class="btn btn-info" ><i class="glyphicon glyphicon-edit icon-padr"></i>编辑</a>
					<a data-purl="projectReviewAction!deleteById.action?proReviewId=${projectReview.projectReviewId}&phaseId=${projectReview.phase.phaseId}" href="javascript:void(0);" onclick="deleteProRew(this);"><button type="button" class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-trash icon-padr"></i>删除</button></a>
				</div>
			<!--end more process-->
			</div>
		</div>
		<script type="text/javascript">
			function deleteProRew(obj){
				var hrefUrl = $(obj).data("purl");
				console.log(hrefUrl);
				var r = confirm("确认删除此记录？");
				if(r){
					window.location.href=hrefUrl;
				}
			};
		</script>
	</body>
</html>
