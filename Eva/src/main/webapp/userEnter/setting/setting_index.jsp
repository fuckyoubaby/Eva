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
		<title>管理员-设置页面</title>
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
			.pad-r5{padding-right:5px;}
			/*end common style*/

		</style>
		<script type="text/javascript">
	function ajaxcheck(){
		var oldPasswordval = document.getElementById("oldPass").value;
		//alert(2222);
		$.ajax({
				type : 'POST',
				url : "employeeAction!checkOldPassword.action",
				data : {
					"oldPassword" : oldPasswordval,
				},
				dataType : 'json',
				success : function(data) {
				//alert(333+"data = "+data.index);
				if(data.index!= null&&data.index!= "ok"){
					//alert("!ok");
					document.getElementById("span_setting").innerHTML = data.index;
				    document.getElementById("oldPass").focus();
				    var button = document.getElementById("submit");
					button.setAttribute("type","button");
				}
				else{
				    document.getElementById("span_setting").innerHTML = "";
				    //document.getElementById("submit").type = submit;
				}
			 }
			});
	}
	
	function check(){
		var oldPasswordval = document.getElementById("oldPass").value;
		if(oldPasswordval=="")
		{
			document.getElementById("span_setting").innerHTML = "请填写原密码";
		    document.getElementById("oldPass").focus();
		}
		
		var newPassValue = document.getElementById("newPass").value;
		var confirmPass  = document.getElementById("confirmPass").value;
		if(newPassValue==confirmPass){
		 var button = document.getElementById("submit");
			button.setAttribute("type","submit");
		  
		}else{
			var button = document.getElementById("submit");
			button.setAttribute("type","button");
		   document.getElementById("conf_result").innerHTML = "两次密码不一致";
		}
	}
	
		</script>
	</head>
	<body>
		<div class="container">
			<div class="main-content-passChange">
					<h3>重置密码</h3>
					<p class="title-addon mg-b10">您必须填写原密码才能进行修改</p>
					<div class="hr mg-b15"></div>
					<form action="employeeAction!updatePassword.action" class="form-horizontal" method="post">
						<div class="form-group">
							<label for="" class="col-md-2 control-label">旧密码</label>
							<div class="col-md-5 ">
								<input type="password" name="oldPassword" id="oldPass" class="form-control" onblur="ajaxcheck();"/>
						</div>
						<font color="red"><span class="col-md-2 control-label" id="span_setting" >&nbsp;</span></font>
						</div>
						<div class="form-group">
							<label for="" class="col-md-2 control-label">新密码</label>
							<div class="col-md-5 ">
								<input type="password" name="newPassword" id="newPass" class="form-control" />
							</div>
						</div>	
						<div class="form-group mg-b15">
							<label for="" class="col-md-2 control-label">确认密码</label>
							<div class="col-md-5 ">
								<input type="password" name="confirmPass" id="confirmPass" class="form-control" onblur="check();" />
							</div>
							<font color="red"><span class="col-md-2 control-label" id="conf_result" >&nbsp;</span></font>
						</div>
						<div class="form-group">
							<label for="" class="col-md-2 control-label"></label>
							<div class="col-md-5 ">
								<button name="button" id="submit" class="btn btn-info" type="button	" onclick="check();"><i class="glyphicon glyphicon-saved pad-r5"></i>保存</button>
							</div>
						</div>
					</form>
				</div>
		</div>
	</body>
</html>
