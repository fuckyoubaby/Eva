<%@page import="com.changhong.entities.Project"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<title>管理员-项目评审问题添加</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
			.form-content{padding:15px;}
		</style>
	</head>
	<body>
	<% Project project = (Project)session.getAttribute("project"); %>
		<div class="container">
			<h3 class="bolder">项目评审问题更新</h3>
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
							<c:if test="${not empty project.projectState }">
								<div class="form-group">
									<label class="control-label">状态</label>
									<div class="form-control-static"><%=project.getProjectState() %></div>
								</div>
							</c:if>
							<!-- <div class="form-group">
								<label class="control-label">评审</label>
								<div class="form-control-static">电路评审</div>
							</div> -->
						</div>
					</div>	
				</div>
				
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">输入问题信息</div>
						<form action="problemAction!update.action" class="form-content" method="post">
							
							<div class="form-group">
								<label class="control-label">名称</label>
								<input type="text" name="problemName" value="${problem.problemName }" class="form-control"/>
							</div>
							<div class="form-group">
								<label class="control-label">内容</label>
								<textarea name="problemContent" rows="3" class="form-control">${problem.problemContent }</textarea>
							</div>
							<div class="form-group">
								<label class="control-label">问题级别</label>
								<select name="problemLevel" id="questionLevel" class="form-control">
									<option value="${problem.problemLevel }">${problem.problemLevel }</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">问题阶段</label>
									<select name="phaseId" id="phaseId" class="form-control" onchange="selectReview();">
										<option value="">请选择阶段</option>
										<c:forEach items="${phases }" var="phase">
											<option value="${phase.phaseId }" ${phase.phaseId == problem.phase.phaseId?'selected':'' }>${phase.phaseName }</option>
										</c:forEach>
										<!-- <option>设计阶段</option>
										<option>样品阶段</option>
										<option>交付阶段</option> -->
									</select>
							</div>
							<div class="form-group">
								<label class="control-label">评审阶段</label>
								<%-- <select name="reviewId" id="reviewId" class="form-control">
									 <option value="">请选择评审阶段</option>
									<c:forEach items="${reviews }" var="review">
										<option value="${review.reviewId }">${review.reviewName }</option>
									</c:forEach>
									<!-- <option value="工艺评审">工艺评审</option>
									<option value="结构评审">结构评审</option>
									<option value="电路评审">电路评审</option> -->
								</select> --%>
								<div class="form-control-static">设计评审</div>
							</div>
							<div class="form-group">
								<label class="control-label">问题类型</label>
								<select name="problemTypeId" id="questionType" class="form-control">
									<option value="${problem.problemtype.typeId }">${problem.problemtype.typeName }</option>
									<c:forEach items="${problemtypes }" var="problemType">
										<option value="${problemType.typeId }">${problemType.typeName }</option>
									</c:forEach>
									<!-- <option value="工艺评审">工艺评审</option>
									<option value="结构评审">结构评审</option>
									<option value="电路评审">电路评审</option> -->
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">问题状态</label>
								<select name="problemStateId" id="questionType" class="form-control">
									<option value="${problem.problemstate.stateId }">${problem.problemstate.problemStateName }</option>
									<c:forEach items="${problemstates }" var="problemState">
										<option value="${problemState.stateId }">${problemState.problemStateName }</option>
									</c:forEach>
									<!-- <option value="工艺评审">工艺评审</option>
									<option value="结构评审">结构评审</option>
									<option value="电路评审">电路评审</option> -->
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">责任人</label>
								<!-- <div class="form-control-static">需选择<a href="javascript:void(0);">（添加）</a></div> -->
								<select name="employeeId" id="status" class="form-control">
										<option value="${problem.employee.id }">${problem.employee.name }</option>
										<c:forEach items="${employees}" var="employee">
											<option value="${employee.id }">${employee.name }</option>
										</c:forEach>
										
									</select>
							</div>
							<div class="form-group">
								<label class="control-label">原因</label>
								<textarea name="reason" id="reason" rows="3" class="form-control">${problem.explaintion }</textarea>
							</div>
							
							<div class="form-group">
								<input type="submit" class="btn btn-info" value="保存"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
