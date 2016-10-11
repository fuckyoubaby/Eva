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
		<title>管理员-考试成绩批量录入</title>
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
				<h3 class="bolder">考试参与者及成绩批量录入</h3>
				<div class="hr mg-b15"></div>
				<div class="row mg-b20">
					<div class="col-md-6">
						<div class="form-border">
							<div class="form-title">考试信息</div>
							<div class="form-content">
								<div class="form-group">
									<label class="control-label">名称</label>
									<div class="form-control-static">关于XXXX工作流程的考试</div>
								</div>
								<div class="form-group">
									<label class="control-label">组织者</label>
									<div class="form-control-static">Xxx</div>
								</div>
								<div class="form-group">
									<label class="control-label">时间</label>
									<div class="form-control-static">2016年2月29日</div>
								</div>
							</div>
						</div>	
					</div>
					
					<div class="col-md-6">
						<div class="form-border">
							<div class="form-title">上传参与者信息</div>
							<form action="#" role="form" class="form-content">
								<form action="#" role="form" class="form-content">
							<div class="form-group">
								<label class="control-label">点击上传文件</label>
								<div class="form-control-static">
									<a href="javascript:void(0);"><img src="../../img/file-upload.png" width="40" height="40" class="img-responsive" onclick="openFileDialog()" ></a>
									<input type="file" id="file" name="file" style="display:none;" onchange="uploadFile()" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">文件名: </label>
								<div class="form-control-static" id="fileName">...</div>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存数据</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						文档数据展示
					</div>
				</div>
			</div>
			<script type="text/javascript">
			function openFileDialog(){
				var ie = navigator.appName == "Microsoft Internet Explorer"?true:false;
	  			if(ie){
	  				//如果是ie浏览器
	  				document.getElementById("file").click();
		  		}else{
		  			//自定义事件es5中的内容
		  			var a = document.createEvent("MouseEvents");
		  			/*自定义事件*/
		  			a.initEvent("click",true,true);
		  			/*触发时间*/
		  			document.getElementById("file").dispatchEvent(a);
		  		}
			};
			//input type=file 值改变时，就动态回传数据给服务器
			function uploadFile(){
				var pathDom = document.getElementById("fileName");
				var files = document.getElementById("file").files;
  				var file = files[0];
  				pathDom.innerText = file.name;
				//可以考虑 Ajax 动态回传给服务器，对进度进行监听和显示
			};
		</script>
	</body>
</html>
