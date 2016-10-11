<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-员工录入</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrapValidator.min.js" type="text/javascript" charset="utf-8"></script>
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
			.form-content{padding:15px 35px;}
			 .form-control-feedback {top:25px !important; right:-30px}
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b15">新增员工</h3>
			<div class="hr mg-b20"></div>
			<form  id="employee_add" action="employeeAction!save.action" class="form-content" method="post">
			<div class="row mg-b20">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						<div id="basicInfo"  class="form-content">
						<div class="form-group">
							<label class="control-label">员工编号*</label>
							<input type="text" name="employeeId" class="form-control"/>
						</div>
						<div class="form-group">
							<label class="control-label">姓名*</label>
							<input type="text" name="employeeName" class="form-control" />
						</div>
						<div class="form-group">
							<label  class="control-abel">性别*</label>
							<select name="sex" class="form-control">
								<option value="男" selected="selected">男</option>
								<option value="女">女</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-abel">岗位*</label>
							<!-- <input type="text" name="jobPosition" id="home" class="form-control" /> -->
							<select name="jobPosition" class="form-control">
								<c:forEach items="${jobs}" var="job">
									<option value="${job.jobId }">${job.jobName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label  class="control-label">居住地</label>
							<input type="text" name="employeeLocation" id="home" class="form-control" />
						</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">联系方式</div>
						<div id="contactWay"  class="form-content">
							<div class="form-group">
								<label  class="control-label">手机*</label>
								<input type="text" name="phoneNum" id="telephone" class="form-control"/>
							</div>
							<div class="form-group">
								<label  class="control-label">V网</label>
								<input type="text" name="shortPhone" id="vNet" class="form-control"/>
							</div>
							<div class="form-group">
								<label  class="control-label">邮箱*</label>
								<input type="text" name="email" id="email" class="form-control" placeholder="优先长虹邮箱"/>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存此条数据</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
		<script type="text/javascript">
			$(function(){
				$("#employee_add").bootstrapValidator({
					feedbackIcons : {
						valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
					},
					fields : {
						employeeId : {
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请填写员工编号！'
								},
	  					  	  remote: {
			                        message: '编号已存在，请先确认！',
 			                        url: '<%=basePath%>ajaxRequestAction!checkEmpId.action'
 			                    },
 			                   stringLength: {
 			                        max: 20,
 			                        min: 5,
 			                        message: '请填写5-20位编号！'
 			                    }
							}
						},
						employeeName : {
							trigger:'blur',
							validators : {
								notEmpty : {
									message: '请填写员工姓名！'
								},
			                   stringLength: {
			                        max: 20,
			                        min: 2,
			                        message: '请填写-20位请填写员工姓名！'
			                    }
							}
						},
						sex : {
							trigger:'blur',
							validators : {
								notEmpty : {
									message : '请选择员工性别！'
								}
							}
						},
						jobPosition : {
							trigger:'blur',
							validators : {
								notEmpty : {
									message : '请选择员工岗位！'
								}
							}
						},
						phoneNum : {
							trigger:'blur',
							validators : {
								notEmpty : {
									message : '请填写员工手机！'
								},
								regexp : {
									regexp: /0?(13|14|15|18)[0-9]{9}/ ,
									message: '请填写正确的手机号码！'
								}
							}
						},
						email: {
							trigger:'blur',
							validators : {
								notEmpty : {
									message : '请填写员工邮箱地址！'
								},
								emailAddress: {
			                        message: '请填写正确格式的邮箱地址! 如：admin@changhong.com'
			                    }
							}
						}
					}
				})
			});
		</script>
		
	</body>
</html>
