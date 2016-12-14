<%@page import="com.changhong.entities.Project"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:useBean id="now" class="java.util.Date" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-项目评审问题添加</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrapValidator.min.js" type="text/javascript" charset="utf-8" ></script>
		<script src="<%=basePath %>/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<link href="<%=basePath %>/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
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
	<% Project project = (Project)session.getAttribute("project"); %>
	<fmt:formatDate value="${empty project.endTime ? now:project.endTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="maxDate"/>
	<c:choose>
		<c:when test="${empty project.startTime}">
			<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="minDate"/>
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${project.startTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="minDate"/>
		</c:otherwise>
	</c:choose>
		<div class="container">
			<h3 class="bolder">项目设计评审问题录入</h3>
			<div class="hr mg-b15"></div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						<div class="form-content">
							<div class="form-group">
								<label class="control-label">项目编号</label>
								<div class="form-control-static"><%=project.getProjectId() %></div>
							</div>
							<div class="form-group">
								<label class="control-label">项目名称</label>
								<div class="form-control-static"><%=project.getProjectName() %></div>
							</div>
							<c:if test="${not empty project.projectState}">
								<div class="form-group">
									<label class="control-label">状态</label>
									<div class="form-control-static"><%=project.getProjectState() %></div>
								</div>
							</c:if>
							<div class="form-group">
								<label class="control-label">项目阶段</label>
								<div class="form-control-static">${comment.phase.phaseName}</div>
							</div>
							<div class="form-group">
								<label class="control-label">评审名称</label>
								<div class="form-control-static">${comment.name}</div>
							</div>
						</div>
					</div>	
				</div>
				
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">输入问题信息</div>
						<form id="mistake_add" action="<%=basePath %>/problemAction!save.action" class="form-content" method="post">
							<div class="form-group">
								<label class="control-label">名称</label>
								<input type="text" name="problemName" class="form-control"/>
							</div>
							<div class="form-group">
								<label class="control-label">内容</label>
								<textarea name="problemContent" rows="3" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<label class="control-label">问题级别</label>
								<select name="problemLevel" id="questionLevel" class="form-control">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">问题类型</label>
								<select name="problemTypeId" id="questionType" class="form-control">
									<option value="">请选择问题类型</option>
									<c:forEach items="${problemtypes }" var="problemType">
										<option value="${problemType.typeId }">${problemType.typeName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">问题状态</label>
								<select name="problemStateId" id="questionType" class="form-control">
									<option value="">请选择问题状态</option>
									<c:forEach items="${problemstates }" var="problemState">
										<option value="${problemState.stateId }">${problemState.problemStateName }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">责任人</label>
								<!-- <div class="form-control-static">需选择<a href="javascript:void(0);">（添加）</a></div> -->
								<select name="employeeId" id="status" class="form-control">
										<option value="">请选择责任人</option>
										<c:forEach items="${employees}" var="employee">
											<option value="${employee.id }">${employee.name }</option>
										</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">评审日期</label>
								<div class="input-group">
									<input type="text" class="form-control" id="prdate" name="prdate" readonly="readonly" 
										placeholder="评审日期" style="cursor:not-allowed" jrequired="required"
										  />
									<span class="input-group-addon" onclick="WdatePicker({el:'prdate',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc,oncleared:pickedFunc,realDateFmt:'yyyy-MM-dd',minDate:'${minDate}',maxDate:'${maxDate}'})">
										<i class="glyphicon glyphicon-time"></i>
									</span>
								</div>

							</div>
							<div class="form-group">
								<label class="control-label">原因</label>
								<textarea name="reason" id="reason"  rows="3" class="form-control"></textarea>
							</div>
							
							<div class="form-group">
								<input type="submit" class="btn btn-info" value="保存"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		
			function pickedFunc()
			{
				$('#mistake_add').data('bootstrapValidator')  
		                    .updateStatus('prdate', 'NOT_VALIDATED',null)  
		                    .validateField('prdate'); 
		         $("#mistake_add").bootstrapValidator(formOptions);
			}
			$(function(){
				var feedbackIcons = {
						feedbackIcons : {
							valid: 'glyphicon glyphicon-ok',
			                invalid: 'glyphicon glyphicon-remove',
			                validating: 'glyphicon glyphicon-refresh'
						}
				};
				var formOptions = {
					fields:{
						problemName : {
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请填写问题名称！'
								},
								stringLength: {
 			                        max: 225,
 			                        message: '请确保内容在225字内！'
 			                    }
							}
						},
						problemContent:{
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请填写问题内容！'
								},
								stringLength: {
 			                        max: 120,
 			                        message: '请确保内容在120字内！'
 			                    }
							}
						},
						problemLevel:{
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请选择问题级别！'
								}
							}
						},
						problemTypeId:{
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请选择问题类型！'
								}
							}
						},
						problemStateId:{
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请选择问题解决状态！'
								}
							}
						},
						prdate:{
							 validators: {
			                        notEmpty: {
			                            message: '时间不能为空'
			                        }
			                    }
						},
						employeeId:{
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请选择问题责任人！'
								}
							}
						},
						reason:{
							trigger:'blur',
							validators : {
								callback:{
									message:'原因内容限定在120字内！',
									callback:function(value, validator){
										if(!value) return true;
										else return value.length<=120;
									}
								}
							}
						}
					}
				};
				$.extend(formOptions, feedbackIcons);
				$("#mistake_add").bootstrapValidator(formOptions);
			});
		</script>
	</body>
</html>
