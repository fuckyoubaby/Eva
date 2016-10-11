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
		<title>管理员-项目信息修改</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
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
		</style>
	</head>
	<body>
		<div class="container">
			<!--head-->
			<h3 class="bolder mg-b15">
				项目信息修改
			</h3>
			<div class="hr mg-b15"></div>
			<!--body-->
			<form id="projectUpdate" action="projectAction!updateForEmployee.action" role="form">
				<div class="form-group">
					<label class="control-label">项目名称</label>
					<input type="text" name="projectName" id="projectName" class="form-control" value="${project.projectName }" />
				</div>
				<div class="form-group">
					<label class="control-label">项目编号</label>
					<input type="text" readonly="readonly" name="projectNo" id="projectNo" class="form-control" value="${project.PId }"/>
				</div>
				<div class="form-group">
					<label class="control-label">项目简介</label>
					<textarea name="introduction" rows="4" class="form-control">${project.introduction }</textarea>
				</div>
				<div class="form-group">
					<label class="control-label">项目成员</label>
					<!-- <div name="projectName" id="projectName" class="form-control-static">张三（项目经理）、李四、王五、赵六、郭xx <a href="javascript:void(0);">(修改)</a></div> -->
					<!--弹出员工选择窗口，进行选择，将选中的数据封装成json数组，放在此div的data-parts缓存里，在提交时进行处理 -->
				</div>
				<div class="form-group">
					<label class="control-label">启动时间</label>
					<div class="input-group">
						<input type="date" name="startData" id="startData" class="form-control" value="${project.beginTime }" readonly="readonly" style="cursor:not-allowed"/>
						<span class="input-group-addon" onclick="WdatePicker({el:'startData',dateFmt:'yyyy-MM-dd'})"><i class="glyphicon glyphicon-time"></i></span>
					</div>
					<div class="process-area">
					<input type="submit" value="保存"/>
						<!-- <a onclick="projectUpdate()" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</a> -->
					</div>
				</div>
			</form>
			
			
		</div>
		
	</body>
</html>
