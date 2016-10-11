<%@page import="com.changhong.entities.Employee"%>
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
		<title>用户设置页面</title>
		<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"/>
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
		</style>
	</head>
	<body>
	<%
		Employee employee = (Employee)session.getAttribute("employee");
	 %>
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
				<div class="col-md-8" style="padding-left:10; margin-top: 10px">
					<div class="tab-content">
						<div class="tab-pane active" id="commonInfo">
							<form action="employeeAction!updateEmployeeSexAndArea.action" id="form1">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">用户名字</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">性别
								</div>
								<div class="col-md-4">
									<select name="sex" class="form-control">
										<%-- <% if(employee.getSex().equals("男")){ %>
										<option value="男" selected="selected">男</option>
										<option value="女" >女</option>
										<% }else if(employee.getSex().equals("女")){ %>
										<option value="女" selected="selected">女</option>
										<option value="男" >男</option>
										<%} else{ %>
										<option value="男" selected="selected">男</option>
										<option value="女" >女</option>
										<%} %> --%>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">居住地</div>
								<div class="col-md-4"><input type="text" name="area" value=""></div>
							</div>
							<div class="row form-group">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="submit" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div>
						<div class="tab-pane" id="contactWay">
							<form action="employeeAction!updateEmployeeTelAndMail.action" id="form2">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">Name</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">手机
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" name="tel" id="tel" value="PhoneNum" />
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">V网短号
								</div>
								<div class="col-md-4">
									<input type="text" name="vtel" class="form-control" value="getVNum">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2">邮箱地址</div>
								<div class="col-md-4"><input type="text" name="email" class="form-control" value="getEMail"></div>
							</div>
							<div class="row mg-b15">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="submit" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div>
						<div class="tab-pane" id="jobInfo">
							<form action="employeeAction!updateEmployeeJob.action" id="form3">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">EmployeeName</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">工作岗位</div>
								<div class="col-md-4"><input class="form-control" type="text" name="job" value="getJobPosition"></div>
							</div>
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
	</body>
</html>
