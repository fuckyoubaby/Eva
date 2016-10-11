<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link rel="stylesheet" type="text/css" href="skins/default/style.css" />
	<style>
		html{overflow-x:hidden;}
		a:hover{text-decoration:none}
		.aswitch1{background:url('images/switch.png') no-repeat;width:8px; height:50px; margin-left:1px; display:block;text-decoration:none}
		.aswitch2{background:url('images/switch.png') no-repeat;width:8px; height:50px; margin-left:1px; display:block; background-position:right;text-decoration:none}
	</style>
	<script src="js/util.js"></script>
	<script>
	
		function switchbar(){
			var mainframe = parent.document.getElementById("mainframe");
			var aswitcher = document.getElementById("aswitcher");
			var cols = "" + mainframe.cols;
			if("230,10,*" == cols){
				mainframe.cols = "0,10,*";
				aswitcher.className = "aswitch2";
			}else{
				mainframe.cols = "230,10,*";
				aswitcher.className = "aswitch1";
			}
		}
		
	</script>
</head>
<body class="menubody">

	<table border="0" cellpadding="0" cellspacing="0" height="100%">
		<tr>
			<td valign="middle">
				<a href="javascript:" onclick="switchbar()" id="aswitcher" class="aswitch1" title="切换">&nbsp;</a>
			</td>
		</tr>
	</table>
	
	

</body>
</html>


