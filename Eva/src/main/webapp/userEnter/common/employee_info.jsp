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
		<title>管理员-员工详情界面</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.sub-title{color:#AEAEAE;font-size:12px;text-indent: 5em;}
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.bolder{font-weight:700}
			
			/*start main process area*/
			.main-process{}
			.main-process a.btn-title{text-decoration:none;color:#ccc;}
			.main-process a.btn-title:hover{color:#282828;}
			.main-process a.btn-info{margin-left:75px;font-size:12px;}
			.icon-padr{padding-right: 5px;}
			.icon-padr10{padding-right:12px}
			/*end main process area*/
			
			.info-type{padding-right:10px;}
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder">基本信息</h3>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="bolder mg-b15">${employee.name }(ID:${employee.id })</div>
			<div class="row mg-b15">
				<div class="col-md-4">
					<span class="info-type">性别</span>
					<span>${employee.sex }</span>
				</div>
				<div class="col-md-4">
					<span class="info-type">居住地</span>
					<span>${employee.address }</span>
				</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-4">
					<span class="info-type">部门</span>
					<span>${employee.department.departmentName }</span>
				</div>
				<div class="col-md-4">
					<span class="info-type">岗位</span>
					<span>${employee.job.jobName }</span>
				</div>
			</div>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="bolder mg-b15">联系方式</div>
			<div class="row mg-b15">
				<div class="col-md-4">
					<span class="info-type">手机</span>
					<span>${employee.phone }</span>
				</div>
				<div class="col-md-4">
					<span class="info-type">V网</span>
					<span>${employee.VPhone }</span>
				</div>
				<div class="col-md-4">
					<span class="info-type">座机</span>
					<span>${employee.tel }</span>
				</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-4">
					<span class="info-type">邮箱地址</span>
					<span>${employee.email }</span>
				</div>
				<div class="col-md-4">
					<span class="info-type">紧急联系人</span>
					<span>${employee.emergencyName }</span>
				</div>
				<div class="col-md-4">
					<span class="info-type">紧急联系人电话</span>
					<span>${employee.emergencyTel }</span>
				</div>
			</div>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="main-process">
				<%-- <a href="employeeAction!getEmployeeByIdForUpdate.action?employeeId=${employee.id }" class="btn btn-info"><i class="glyphicon glyphicon-edit icon-padr"></i>修改信息</a> --%>
				
			<!--end the main process area-->
			</div>
		</div>
	</body>
</html>

