<%@page import="com.changhong.entities.Project"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-项目信息修改</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/style.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/jquery-ui.css" />
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src=".<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrapValidator.min.js" type="text/javascript" charset="utf-8"></script>
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
			.has-feedback .form-control-feedback{top:20px!important ;right:-30px}
		</style>
		<script type="text/javascript">
			function selectReview()
			{
				var phaseId = document.getElementById("projectPhase").value;
				$.ajax({
					type:"post",
					url:"projectAction!getReviewByPhaseId.action",
					dataType:"json",
					data:"phaseId="+phaseId,
					cache:false,
					success:createReview,
					error:errorReview
				});
			}
			function createReview(list){
				$('#reviewId').empty();
				$.each(list,function(n,value){
  					$('#reviewId').append("<option value='"+value.reviewId+"'>"+value.reviewName+"</option>");
  				});
			}
			function errorReview(err)
			{
				alert("err");
			}
		</script>
	</head>
	<body >
		<div class="container">
			<!--head-->
			<h3 class="bolder mg-b15">
				项目信息修改
			</h3>
			<div class="hr mg-b15"></div>
			<!--body-->
			<form id="project_update" action="projectAction!update.action" role="form">
				<div class="form-group">
					<label class="control-label">项目名称</label>
					<input type="text" name="projectName" id="projectName"  class="form-control" value="${project.projectName }" />
				</div>
				<div class="form-group">
					<label class="control-label">项目编号</label>
					<input type="text" readonly="readonly" name="projectId" id="projectId" class="form-control" value="${project.projectId }"/>
				</div>
				<div class="form-group">
					<label class="control-label">项目简介</label>
					<textarea name="projectDescribe" rows="4" class="form-control">${project.introduction }</textarea>
				</div>
				<div class="form-group">
					<label class="control-label">项目经理</label>
					<select name="projectManager" id="projectManager" class="form-control" >
						<c:forEach items="${employeeprojectrs }" var="ep" varStatus="status">
							<option value="${ep.employee.id }" ${ep.employee.id==project.employee.id?'selected':''}>${ep.employee.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">项目阶段</label>
					<select name="projectPhase" id="projectPhase" class="form-control" onchange="selectReview();">
						<option value="${project.review.phase.phaseId }">${project.review.phase.phaseName }</option>
						<c:forEach items="${phases }" var="phase" varStatus="status">
							<c:choose>
								<c:when test="${phase.phaseId==project.review.phase.phaseId }">
								</c:when>
								<c:otherwise>
									<option value="${phase.phaseId }">${phase.phaseName }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">评审阶段</label>
					<select name="reviewId" id="reviewId" class="form-control">
						<option value="${project.review.reviewId }">${project.review.reviewName }</option>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">启动时间</label>
					<div class="input-group">
						<input type="date" name="startTime" id="startTime" class="form-control" value="${project.startTime }" readonly="readonly" style="cursor:not-allowed" />
						<span class="input-group-addon" onclick="WdatePicker({el:'startTime',dateFmt:'yyyy-MM-dd'})"><i class="glyphicon glyphicon-time"></i></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">结项时间</label>
					<div class="input-group">
						<input type="date" name="endTime" id="endTime" class="form-control" value="${project.endTime }" readonly="readonly" style="cursor:not-allowed" />
						<span class="input-group-addon" onclick="WdatePicker({el:'endTime',dateFmt:'yyyy-MM-dd'})"><i class="glyphicon glyphicon-time"></i></span>
					</div>
				</div>
				<div class="process-area">
					<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</button>
					<a class="btn btn-info" style="margin-left:30px" href="${basePath}projectAction!updateMembers.action"><i class="glyphicon glyphicon-edit icon-padr"></i>修改成员</a>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#project_update')
				.bootstrapValidator({
					feedbackIcons: {
						valid:'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating:'glyohicon glyohicon-refresh'
					},
					fields:{
						projectName : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目名称不能为空！'
								},
								remote:{
									message:'该名称已存在，请修改',
									url:'<%=basePath%>ajaxRequestAction!checkNewProjectName.action'
								}
							}
						},
						projectDescribe : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目描述不能为空！'
								}
							}
						},
						projectManager : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目经理不能为空'
								},
							}
						},
						projectPhase : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目阶段不能为空'
								},
							}
						},
						reviewId : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目评审不能为空'
								},
							}
						},
						startTime : {
							trigger:'blur',
							  validators: {
								  notEmpty:{
										message:'项目启动时间不能为空'
									},
				                  date: {
				                        format: 'YYYY-MM-DD',
				                        message: '项目启动时间格式错误'
				                    },
				                    callback:{
				                    	message:'启动时间硬早于结项时间！',
				                    	callback: function(value, validator){
				                    		var startTime = value;
				                    		var endTime = validator.getFieldElements('endTime').val();
				                    		if(!endTime) return true;
				                    		if(startTime>endTime){
				                    			return false;
				                    		}else return true;
				                    	}
				                    }
				                }
						},
						endTime : {
							trigger:'blur',
							  validators: {
								  notEmpty:{
										message:'项目结项时间不能为空'
									},
				                  date: {
				                        format: 'YYYY-MM-DD',
				                        message: '项目结项时间格式错误'
				                    },
				                    callback:{
				                    	message:'结项时间应晚于启动时间',
				                    	callback: function(value, validator){
				                    		var endTime = value;
				                    		var startTime = validator.getFieldElements('startTime').val();
				                    		if(!startTime) return true;
				                    		if(startTime>endTime){
				                    			return false;
				                    		}else return true;
				                    	}
				                    }
				                    
				                }
						}
					}
				});
			});
		
		</script>
	</body>
</html>
