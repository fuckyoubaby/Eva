<%@page import="com.changhong.support.FinalConstant"%>
<%@page import="com.changhong.entities.Employee"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int adminPermission = FinalConstant.SUPER_ADMIN;
	pageContext.setAttribute("adminPermission", adminPermission);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户设置页面</title>
		<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"/>
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrapValidator.min.js"></script>
		<style type="text/css">
			/*start common style*/
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.bolder{font-weight:700}
			.sub-title{color:#AEAEAE;font-size:12px;text-indent: 5em;}
			.title-addon{color:#AEAEAE;font-size:12px;}
			/*end common style*/
			/*start 面包屑按钮*/
			#crumbs{overflow:hidden;}
			#crumbs ul{width:98%;margin-left:1%;padding-left:0;}
			#crumbs ul li{box-sizing:content-box;list-style:none;}
			#crumbs ul li a{display:block;float:left;height:32px;/*background:#3498db;*/
			background:#6DC6F2;text-align:center;padding:0 20px 0 40px;line-height:32px;position:relative;margin:0 6px 0 0;font-size:16px;text-decoration:none;color:#fff;}
			#crumbs ul li a:after{content:"";position:absolute;/*border-color:transparent transparent transparent #3498db;*/
			border-color:transparent transparent transparent #6DC6F2;border-width:16px 0 16px 16px;border-style:dashed dashed dashed solid;right:-16px;top:0;z-index:1}
			#crumbs ul li a:before{content:"";position:absolute;border-color:transparent transparent transparent #fff;border-width:16px 0 16px 16px;border-style:dashed dashed dashed solid;left:0;top:0;}
			#crumbs ul li:first-child a{border-radius:5px 0 0 5px;padding-left:30px;}
			#crumbs ul li:first-child a:before{display:none;}
			#crumbs ul li:last-child a{border-radius:0 5px 5px 0;}
			#crumbs ul li:last-child a:after{display:none;}
			#crumbs ul li:hover a{background:#007CB8;}
			#crumbs ul li:hover a:after{border-left-color:#007CB8;}
			#crumbs ul li.actived a{background:#007CB8;}
			#crumbs ul li.actived a:after{border-left-color:#007CB8;}
			/*end 面包屑导航*/
			
			/*start 主区域*/
			.main-content{width:98%;margin-left:1%;padding:10px 30px 30px 30px;border:1px solid #ccc;}
			.main-content .main-content-userInfo .value{padding-left:10px;}
			.main-content .main-content-userInfo .userInfo-process{text-align:center;}
			.container{margin-top: 50px;}
			
			.tab-content .tab-pane.active{border:1px solid #ccc;}
			div.tab-pane{padding:30px 20px 20px 30px;}
			div.tab-pane div.control-label{padding-top:7px;font-weight:700;}
			.form-control-feedback {top:0px !important; right:-30px}
		</style>
	</head>
	<body>
		<div class="container">
			<!--start userInfo change-->
			<div class="userInfo-change row">
				<div class="col-md-2" style="padding-right:0;">
					<ul class="nav nav-pills nav-stacked">
					<!-- class=active 表示选中当前tab页，高亮显示，通过js控制tab切换 -->
		             	<li class="active"><a href="#commonInfo" data-toggle="tab">基本资料</a></li>
		             	<li><a href="#contactWay" data-toggle="tab">联系方式</a></li>
		             	<li><a href="#jobInfo" data-toggle="tab">工作信息</a></li>
            		</ul>
				</div>
				<div class="col-md-8">
					<div class="tab-content">
						<div class="tab-pane active" id="commonInfo">
							<form id="selef-info-form" action="employeeAction!updateEmployeeSexAndArea.action" id="form1">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">${employee.name }</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">性别
								</div>
								<div class="col-md-4">
									 <select name="sex" class="form-control ">
										<option value="男" ${employee.sex =="男" ?'selected':'' }>男</option>
										<option value="女" ${employee.sex =="女" ?'selected':'' }>女</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">居住地</div>
								<div class="col-md-4"><input type="text" name="employeeLocation" value="${employee.address }"  class="form-control"></div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">密码</div>
								<div class="col-md-4"><input type="password" name="password" value="" placeholder="如果不修改密码请留空"  class="form-control"></div>
							</div>
							<div class="row form-group">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="submit" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div>
						<div class="tab-pane" id="contactWay">
							<form id="contact-way-form" action="employeeAction!updateEmployeeTelAndMail.action" id="form2">
							<div class="form-group row">
								<div class="col-md-3 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">${employee.name}</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-3 control-label">手机*
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" name="phoneNum" id="tel" value="${employee.phone }" />
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-3 control-label">V网短号
								</div>
								<div class="col-md-4">
									<input type="text" name="shortPhone" class="form-control" value="${employee.VPhone }">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-3 control-label">邮箱*</div>
								<div class="col-md-4"><input type="text" name="email" class="form-control" value="${employee.email }"></div>
							</div>
							<div class="row form-group">
								<div class="col-md-3 control-label">紧急联系人</div>
								<div class="col-md-4"><input type="text" name="emergencyName" class="form-control" value="${employee.emergencyName }"></div>
							</div>
							<div class="row form-group">
								<div class="col-md-3 control-label">紧急联系人电话</div>
								<div class="col-md-4"><input type="text" name="emergencyTel" class="form-control" value="${employee.emergencyTel }"></div>
							</div>
							<div class="row mg-b15">
								<div class="col-md-3"></div>
								<div class="col-md-4"><button type="submit" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div>
						<div class="tab-pane" id="jobInfo">
							<form id="depart-info-form" action="employeeAction!updateEmployeeJob.action" id="form3">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">${employee.name }</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">部门</div>
								<div class="col-md-4">
								<select name="departmentId"  class="form-control">
									<option value="${employee.department.departmentId }">${employee.department.departmentName }</option>
									<c:forEach items="${departments }" var="department">
										<c:choose>
											<c:when test="${department.departmentId==employee.department.departmentId }">
											</c:when>
											<c:otherwise>
												<option value="${department.departmentId }">${department.departmentName }</option>
											</c:otherwise>
										</c:choose>
										
									</c:forEach>
								</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">工作岗位</div>
								<div class="col-md-4">
								<select name="jobPosition" class="form-control">
									<option value="${employee.job.jobId }">${employee.job.jobName }</option>
									<c:forEach items="${jobs }" var="job">
										<c:choose>
											<c:when test="${job.jobId==employee.job.jobId }">
											</c:when>
											<c:otherwise>
												<option value="${job.jobId }">${job.jobName }</option>
											</c:otherwise>
										</c:choose>
										
									</c:forEach>
								</select>
								</div>
								<%-- <div class="col-md-4"><input class="form-control" type="text" name="job" value="${employee.job.jobName }"></div> --%>
							</div>
							
							<%-- <%if(loginer.getPermission()==FinalConstant.SUPER_ADMIN){ %> --%>
							<c:if test="${loginer.permission == adminPermission}">
								<div class="row form-group">
								<div class="col-md-2 control-label">权限</div>
								<div class="col-md-4">
								<select name="permission"  class="form-control">
									<option value="1" ${employee.permission==1?'selected':''}>系统用户</option>
									<option value="0" ${employee.permission==0?'selected':''}>系统管理员</option>
									<option value="2" ${employee.permission==2?'selected':''}>超级管理员</option>
								</select>
								</div>
								</div>
							<%-- <%} %> --%>
							</c:if>
							<div class="row form-group">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="submit" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div> <!--end tab-pane*-->
					</div><!--end tab-content*-->
					
				</div>
			</div>	
		<!--end userInfo change-->
		</div>
		
		<script type="text/javascript">
			$(function(){
				var feedbackIcons = {
						feedbackIcons : {
							valid: 'glyphicon glyphicon-ok',
			                invalid: 'glyphicon glyphicon-remove',
			                validating: 'glyphicon glyphicon-refresh'
						}	
				};
				var selfInfoForm = {
						fields :{
							sex:{
								trigger:'blur',
								validators:{
									notEmpty:{
										message:'请选择该员工性别！',
									}
								}
							},
							employeeLocation:{
								trigger:'blur',
								validators:{
									callback:{
										message:'地址请确保50字以内！',
										callback: function(value, validators){
											if(!value) return true;
											else return value.length>50? false: true;
										}
									}
								}
							},
							password:{
								trigger:'blur',
								validators:{
									callback:{
										message:'密码请确保15位以内！',
										callback: function(value, validators){
											if(!value) return true;
											else return value.length>15? false: true;
										}
									}
								}
							}
						}	
				};
				var departInfoForm ={
						fields : {
							departmentId : {
								trigger : 'blur',
								validators: {
									notEmpty : {
										message : '请选择工作部门！'
									}
								}
							},
							jobPosition : {
								trigger : 'blur',
								validators: {
									notEmpty : {
										message : '请选择工作岗位！'
									}
								}
							}
							<c:if test="${loginer.permission == adminPermission}">
							,
							permission : {
								trigger : 'blur',
								validators: {
									notEmpty : {
										message : '请选择用户权限！'
									}
								}
							} 
							</c:if>
						}
				};
				var contactWayForm ={
					fields : {
						phoneNum : {
							trigger : 'blur',
							validators: {
								notEmpty :{
									message:'请填写手机号！'
								},
								regexp:{
									regexp:/0?(13|14|15|18)[0-9]{9}/ ,
									message:'请设置正确格式的手机号！'
								}
							}
						}/* ,
						shortPhone : {
							trigger : 'blur',
							validators: {
								callback : {
									messgae : '请设定3-6位短号',
									callback : function(value, validator){
										if(!value) return true;
										else (value.length>=3&&value.length<=6);
									}
								}
							}
						},
						email : {
							trigger : 'blur',
							validators: {
								notEmpty :{
									message:'请填写邮箱地址！'
								},
								emailAddress: {
			                        message: '请填写正确格式的邮箱地址! 如：admin@changhong.com'
			                    }
							}
						},
						emergencyName : {
							trigger : 'blur',
							validators: {
								callback : {
									messgae : '请确保紧急联系人姓名在3-6位！',
									callback : function(value, validator){
										if(!value) return true;
										else (value.length>=2&&value.length<=20);
									}
								}
							}
						},
						emergencyTel : {
							trigger : 'blur',
							validators: {
								callback : {
									messgae : '请设定正确格式的紧急联系人联系方式！',
									callback : function(value, validator){
										if(!value) return true;
										else {
											var reg = /0?(13|14|15|18)[0-9]{9}/;
											return reg.test(value);
										}
									}
								}
							}
						} */
					}
				}
				$.extend(selfInfoForm, feedbackIcons);
				$.extend(departInfoForm, feedbackIcons);
				$.extend(contactWayForm, feedbackIcons);
				console.log(selfInfoForm);
				$("#selef-info-form").bootstrapValidator(selfInfoForm);
				$("#depart-info-form").bootstrapValidator(departInfoForm);
				$("#contact-way-form").bootstrapValidator(contactWayForm);
			});
		</script>
	</body>
</html>
