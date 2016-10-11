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
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
			/*end 主区域*/
			
			/*start user info change*/
			.tab-content .tab-pane.active{border:1px solid #ccc;}
			div.tab-pane{padding:30px 20px 20px 30px;}
			div.tab-pane div.control-label{padding-top:7px;}
			/*end user info change*/
			
			li{cursor:pointer;}
		</style>
		
		<script type="text/javascript">
			
			 $(document).ready(function(e) {
		        $(".main-content-passChange").hide();
		        var passwordLi = document.getElementById("password");
				var userInfoLi = document.getElementById("userInfoShow");
				 passwordLi.setAttribute("class", "abc");
				 userInfoLi.setAttribute("class", "actived");
		    });  
		</script>
		<script type="text/javascript">
		//main-content-userInfo
			function userInfo(){
			//alert("userinfo");
				/* var passwordDiv = document.getElementById("main-content-passChange");
				var userInfoDiv = document.getElementById("main-content-userInfo"); */
				var passwordLi = document.getElementById("password");
				var userInfoLi = document.getElementById("userInfo");
				 $(".main-content-userInfo").show();
				 $(".main-content-passChange").hide();
				 
				  passwordLi.setAttribute("class", "abc");
				 userInfoLi.setAttribute("class", "actived"); 
				 
				 /* passwordLi.setAttribute("class", "actived");
				 userInfoLi.setAttribute("class", "abc"); */
				/*  passwordDiv.setAttribute("src","images/other/switch_normal.png");
				 userInfoDiv.setAttribute("src","images/other/switch_checked.png"); */
			}
			function passwordChange(){
			//alert("passwordChange");
				var passwordLi = document.getElementById("password");
				var userInfoLi = document.getElementById("userInfo"); 
				 $(".main-content-passChange").show();
				 $(".main-content-userInfo").hide();
				
				 passwordLi.setAttribute("class", "actived");
				 userInfoLi.setAttribute("class", "abc");
				 /* userInfoDiv.setAttribute("src","images/other/switch_normal.png");
				 passwordDiv.setAttribute("src","images/other/switch_checked.png"); */
				 
			}
		</script>
		<script type="text/javascript" language="javascript">
			function submitFrom(){
				var oldPassword = document.getElementById("oldPass").value;
				
				if(oldPassword==${employee.employeePassword })
				{
					$(".form-horizontal").submit();
				}else{
					document.getElementById("tishi").innerHTML += "原密码错误";
				}
				//$(".form-horizontal").submit();
			}
			
			function closeTishi(){
				document.getElementById("tishi").innerHTML = " ";
			}
		</script>
	</head>
	<body>
		<div class="container">
			<div id="crumbs" >
				<ul class="clearfix">
					<li id="userInfo" class="actived"><a onclick="userInfo();">信息展示</a></li>
					<li id="password"><a onclick="passwordChange();">密码安全</a></li>
				</ul>	
			</div>
			<div class="main-content">
				<!--start userInfo-->
				<div class="main-content-userInfo" id="main-content-userInfo">
					<h3>基本信息</h3>
					<div class="hr mg-b15"></div>
					<p class="bolder">${employee.employeeName }</p>
					<div class="row">
						<div class="col-md-4 mg-b10">
							<div class="mg-b10">性别<span class="value">${employee.sex }</span></div>
							<div >岗位<span class="value">${employee.jobPosition }</span></div>
						</div>
						<div class="col-md-4">
							<div class="mg-b10">居住地<span class="value">${employee.employeeLocation }</span></div>
						</div>
					</div>
					
					<div class="hr mg-b10"></div>
					
					<p class="bolder">联系方式</p>
					<div class="row">
						<div class="col-md-4 mg-b10">
							<div class="mg-b10">手机<span class="value">${employee.phoneNum }</span></div>
							<div >邮箱地址<span class="value">${employee.EMail }</span></div>
						</div>
						<div class="col-md-4">
							<div class="mg-b10">V网<span class="value">${employee.VNum }</span></div>
						</div>
						<div class="col-md-4">
							<div class="mg-b10">座机<span class="value">${employee.telNum }</span></div>
						</div>
					</div>
					
					<div class="hr mg-b10"></div>
					
					<div class="userInfo-process">
						<a href="<%=basePath %>/userEnter/setting/user_update.jsp" class="btn btn-info">修改信息</a>
					</div>
				<!--end userinfo-->
				</div>
				
				
				
				
				
					
				<div class="main-content-passChange" id="main-content-passChange">
					<h3>重置密码</h3>
					<p class="title-addon mg-b10">您必须填写原密码才能进行修改</p>
					
					<div class="hr mg-b15"></div>
					
					<form action="employeeAction!changePassword.action" class="form-horizontal">
						<div class="form-group">
							<label for="" class="col-md-1 control-label">旧密码</label>
							<div class="col-md-5 ">
								<input type="password" name="oldPass" id="oldPass" onfocus="closeTishi()" class="form-control" />
								<label id="tishi"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-md-1 control-label">新密码</label>
							<div class="col-md-5 ">
								<input type="password" name="newPassword" id="mewPass" class="form-control" />
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
								<input type="button" onclick="submitFrom()" name="oldPass" id="oldPass" class="btn btn-info" value="保存"/>
							</div>
						</div>
					</form>
				</div>
			
			
				
			</div>
		</div>
	</body>
</html>
