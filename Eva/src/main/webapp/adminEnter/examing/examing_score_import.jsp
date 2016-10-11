
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-竞赛成绩录入</title>
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
		</style>
	</head>
	<body>
		<div class="container">
			<div class="container">
				<h3 class="bolder">竞赛参与者及成绩录入</h3>
				<div class="hr mg-b15"></div>
				<div class="row">
					<div class="col-md-6">
						<div class="form-border">
							<div class="form-title">竞赛信息</div>
							<div class="form-content">
								<div class="form-group">
									<label class="control-label">名称</label>
									<div class="form-control-static">${exam.examName }</div>
								</div>
								<div class="form-group">
									<label class="control-label">组织者</label>
									<div class="form-control-static">${exam.organizer }</div>
								</div>
								<div class="form-group">
									<label class="control-label">时间</label>
									<div class="form-control-static">${exam.examTime }</div>
								</div>
							</div>
						</div>	
					</div>
					
					<div class="col-md-6">
						<div class="form-border">
							<div class="form-title">参与者信息</div>
							<form action="examAction!addExamGrade.action" role="form" id="examGradeAdd" class="form-content">
								<div class="form-group">
									<label class="control-label">参与者</label>
									<div class="form-control-static">
									<select name="employeeId">
											<option value="00">请选择参考员工</option>
										<c:forEach items="${employees }" var="employee">
											<option value="${employee.id }">${employee.name }</option>
										</c:forEach>
										
									</select>
									</div>
									<!-- <div class="form-control-static">需选择<a href="javascript:void(0);">（添加）</a></div> -->
								</div>
								<div class="form-group">
									<label class="control-label">成绩</label>
									<input type="text" name="grade" class="form-control"/>
								</div>
								
								<div class="form-group">
									<input type="submit"  class="btn btn-info" value="保存"/>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</body>
</html>
