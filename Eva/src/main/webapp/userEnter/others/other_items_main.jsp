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
		<title>其他项主页</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.clear{clear:both}
		
			/*start 面包屑按钮*/
			#crumbs{overflow: hidden;}
			#crumbs ul{width:98%;margin-left:1%;padding-left:0;}
			#crumbs ul li{box-sizing: content-box; list-style: none;}
			#crumbs ul li a{
				display:block;float:left;height:32px;
				/*background:#3498db;*/
				background:#6DC6F2;
				text-align:center;padding:0 20px 0 40px;line-height: 32px;
				position:relative;margin:0 6px 0 0; font-size: 16px;text-decoration: none;
				color:#fff; 
			}
			#crumbs ul li a:after{
				content:"";
				position: absolute;
				/*border-color:transparent transparent transparent #3498db;*/
				border-color:transparent transparent transparent #6DC6F2;
				border-width:16px 0 16px 16px;
				border-style: dashed dashed dashed solid;
				right:-16px;
				top:0;
				z-index:1   
			}
			#crumbs ul li a:before{
				content:"";
				position: absolute;
				border-color:transparent transparent transparent #fff;
				border-width:16px 0 16px 16px;
				border-style: dashed dashed dashed solid;
				left:0;
				top:0;   
			}
			#crumbs ul li:first-child a{
				  border-radius: 5px 0 0 5px;
				  padding-left:30px;
			}
			#crumbs ul li:first-child a:before{
				  display: none;
			}
			#crumbs ul li:last-child a{
				  border-radius: 0 5px 5px 0 ;
			}
			#crumbs ul li:last-child a:after{
				  display: none;
			}
			#crumbs ul li:hover a{
				background:#007CB8;
			}
			#crumbs ul li:hover a:after{
				border-left-color:#007CB8;
			}
			#crumbs ul li.actived a{
				background:#007CB8;
			}
			#crumbs ul li.actived a:after{
				border-left-color:#007CB8;
			}
			/*end 面包屑导航*/
			/*start 表格区域*/
			.main-table{width:98%;margin-left:1%;background:#fff;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{
				width:98%;
				margin-left: 1%;
				margin-bottom:20px;
			}
			.r_process .form-center{
				width:250px;
				margin:0 auto;
			}
			.main-table .r_table table {
				width:98%;
				margin-left:1%;
				border:1px solid #ccc;
				font-size:12px;font-family:"微软雅黑";
			}
			.main-table .r_table table thead tr{
				background-color:#EEE;
			}
			/*end 表格区域*/
		</style>
		<script type="text/javascript">
			function train(){
				var train = document.getElementById("train");
				var exam = document.getElementById("exam");
				 exam.setAttribute("class", "abc");
				 train.setAttribute("class", "actived"); 
				
			}
			function exam(){
				var train = document.getElementById("train");
				var exam = document.getElementById("exam");
				 train.setAttribute("class", "abc");
				 exam.setAttribute("class", "actived"); 
				
			}
		</script>
	</head>
	<body>
		<div class="contianer">
			<div id="crumbs" >
				<ul class="clearfix">
					<li id="train" class="actived"><a href="<%=basePath %>/userEnter/others/training_list.jsp" onclick="train();" target="rightmain">培训预览</a></li>
					<li id="exam" ><a href="<%=basePath %>/userEnter/others/exam_list.jsp" onclick="exam();" target="rightmain">考试预览</a></li>
				</ul>	
			</div>
			
		</div>
	</body>
</html>
