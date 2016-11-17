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
		<title>管理员-培训详情页面</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.sub-title{color:#AEAEAE;font-size:12px;text-indent: 5em;}
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			
			/*start main process area*/
			.main-process{}
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
			<h3>${train.trainName }</h3>
			<%-- <div class="sub-title mg-b10">——${train.teacher }${train.employee.name }</div> --%>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">培训时间</div>
				<div class="col-md-3">${train.trainTime }</div>
			</div>
			<%-- <div class="row mg-b15">
				<div class="col-md-2">培训地点</div>
				<div class="col-md-3">${train.trainLocation }</div>
			</div> --%>
			<div class="row mg-b15">
				<div class="col-md-2">培训人数</div>
				<div class="col-md-3">${train.joinNum }</div>
			</div>
			<%-- <div class="row mg-b15">
				<div class="col-md-2">培训级别</div>
				<div class="col-md-3">${train.trainLevel }</div>
			</div> --%>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">培训内容</div>
				<div class="col-md-7">${train.trainContent }</div>
			</div>
			<div class="row mg-b15">
				<div class="col-md-2">培训通知</div>
				<div class="col-md-7">${train.information }</div>
			</div>
			<div class="row">
				<div class="hr col-sm-10 mg-b15"></div>
			</div>
			<div class="main-process">
				<a href="trainAction!getTrainForUpdate.action?trainId=${train.trainId }" class="btn btn-info"><i class="glyphicon glyphicon-edit icon-padr"></i>修改信息</a>
			<!--end the main process area-->
			</div>
		</div>
	</body>
</html>
