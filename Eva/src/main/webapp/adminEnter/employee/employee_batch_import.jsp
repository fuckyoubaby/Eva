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
		<title>管理员-员工批量录入</title>
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
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b20">员工批量录入</h3>
			<div class="hr mg-b15"></div>
			<div class="mg-b15">
				<a href="javascript:void(0);"><img src="../../img/file-upload.png" width="40px" height="40px" alt="点击上传文件" class="img-responsive" onclick="openFileDialog()"/></a>
				 <input type="file" id="file" name="file" style="display:none;" onchange="uploadFile()" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" />
				<div class="help-text">点击上传文件</div>
			</div>
			<div class="form-group">
				文件名: <span class="form-control-static" id="fileName">111</span>
			</div>
			<div class="form-group">
				<a href="javascript:void(0);" class="btn btn-info"><i class="glyphicon glyphicon-export icon-padr"></i>上传</a>
			</div>
			<div class="hr mg-b15"></div>
			<div class="table-show">
				<p class="help-text">文档数据展示区域</p>
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
