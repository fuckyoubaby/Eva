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
		</style>
	</head>
	<body>
		<div class="container">
			<div id="crumbs" >
				<ul class="clearfix">
					<li class="actived"><a href="#">信息展示</a></li>
					<li ><a href="#">密码安全</a></li>
				</ul>	
			</div>
			<div class="main-content">
				<!--start userInfo-->
				<div class="main-content-userInfo">
					<h3>基本信息</h3>
					<div class="hr mg-b15"></div>
					<p class="bolder">郭xx(ID:1020xxxx)</p>
					<div class="row">
						<div class="col-md-4 mg-b10">
							<div class="mg-b10">性别<span class="value">男</span></div>
							<div >岗位<span class="value">软件工程师</span></div>
						</div>
						<div class="col-md-4">
							<div class="mg-b10">居住地<span class="value">绵阳</span></div>
						</div>
					</div>
					
					<div class="hr mg-b10"></div>
					
					<p class="bolder">联系方式</p>
					<div class="row">
						<div class="col-md-4 mg-b10">
							<div class="mg-b10">手机<span class="value">1519628000</span></div>
							<div >邮箱地址<span class="value">xxxxxxx.guo@</span></div>
						</div>
						<div class="col-md-4">
							<div class="mg-b10">V网<span class="value">xxxxxx</span></div>
						</div>
						<div class="col-md-4">
							<div class="mg-b10">座机<span class="value">2410754</span></div>
						</div>
					</div>
					
					<div class="hr mg-b10"></div>
					
					<div class="userInfo-process">
						<button type="button" class="btn btn-info">修改信息</button>
					</div>
				<!--end userinfo-->
				</div>
				
				<style type="text/css">
					.tab-content .tab-pane.active{border:1px solid #ccc;}
					div.tab-pane{padding:30px 20px 20px 30px;}
					div.tab-pane div.control-label{
						padding-top:7px;						
					}
				</style>
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
				<div class="col-md-8" style="padding-left:0;">
					<div class="tab-content">
						<div class="tab-pane active" id="commonInfo">
							<form action="#" id="form1">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">郭xx</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">性别
								</div>
								<div class="col-md-4">
									<select name="sex" class="form-control">
										<option value="男" selected="selected">男</option>
										<option value="女" >女</option>
									</select>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">居住地</div>
								<div class="col-md-4"><p class="form-control-static">绵阳(<a href="javascript:void(0);">修改</a>)</p></div>
							</div>
							<div class="row form-group">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="button" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div>
						<div class="tab-pane" id="contactWay">
							<form action="#" id="form2">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">郭xx</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">手机
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" name="phoneNum" id="phoneNum" />
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">V网短号
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" name="shortNum" id="shortNum" />
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2">邮箱地址</div>
								<div class="col-md-4"><p class="form-control-static">xxxxxxxx.guo@(<a href="javascript:void(0);">修改</a>)</p></div>
							</div>
							<div class="row mg-b15">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="button" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div>
						<div class="tab-pane" id="jobInfo">
							<form action="#" id="form3">
							<div class="form-group row">
								<div class="col-md-2 control-label">用户名</div>
								<div class="col-md-4 ">
									<div class="form-control-static">郭xx</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-2 control-label">工作岗位</div>
								<div class="col-md-4"><p class="form-control-static">软件研发工程师(<a href="javascript:void(0);">修改</a>)</p></div>
							</div>
							<div class="row form-group">
								<div class="col-md-2"></div>
								<div class="col-md-4"><button type="button" class="btn btn-info">保存</button></div>
							</div>
							</form>
						</div> <!--end tab-pane*-->
					</div><!--end tab-content*-->
					
				</div>
			</div>	
			
					
				<!--end userInfo change-->
				
				
				<script type="text/html">
					/*--start password change--*/
				<div class="main-content-passChange">
					<h3>重置密码</h3>
					<p class="title-addon mg-b10">您必须填写原密码才能进行修改</p>
					
					<div class="hr mg-b15"></div>
					
					<form action="#" class="form-horizontal">
						<div class="form-group">
							<label for="" class="col-md-1 control-label">旧密码</label>
							<div class="col-md-5 ">
								<input type="password" name="oldPass" id="oldPass" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-md-1 control-label">新密码</label>
							<div class="col-md-5 ">
								<input type="password" name="newPass" id="mewPass" class="form-control" />
							</div>
						</div>
						<div class="form-group mg-b15">
							<label for="" class="col-md-1 control-label">确认密码</label>
							<div class="col-md-5 ">
								<input type="password" name="confirmPass" id="confirmPass" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-md-1 control-label"></label>
							<div class="col-md-5 ">
								<input type="button" name="oldPass" id="oldPass" class="btn btn-info" value="保存"/>
							</div>
						</div>
					</form>
				</div>
				/*--end password change--*/
				</script>
				
			</div>
		</div>
	</body>
</html>
