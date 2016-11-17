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
<title>管理员-经验分享信息</title>
<link rel="stylesheet" href="../../css/bootstrap.css" />
<script src="../../js/jquery-1.11.0.js" type="text/javascript"
	charset="utf-8"></script>
<script src="../../js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery-1.9.1.min.js"></script>  
<script type="text/javascript" src="<%=basePath %>/js/jquery.media.js"></script>
<style type="text/css">
.mg-b10 {
	margin-bottom: 10px
}

.mg-b15 {
	margin-bottom: 15px
}

.mg-b30 {
	margin-bottom: 30px
}

.mg-r5 {
	margin-right: 5px
}

.hr {
	height: 1px;
	border-bottom: 1px dashed #ccc
}

.help-text {
	color: #AEAEAE;
	display: block;
	font-size: 12px;
}

.help-text a {
	color: #AEAEAE;
	text-decoration: none;
	outline: none;
}

.help-text a:hover {
	color: #007CB8
}

.icon-padr {
	padding-right: 5px;
}

.bolder {
	font-weight: 700
}

.clear {
	clear: both;
}

.exp-score {
	padding-left: 15px;
	color: #ccc;
}
</style>
<style type="text/css">
.star_bg {
	width: 120px;
	height: 20px;
	background: url(star.png) repeat-x;
	position: relative;
	overflow: hidden;
}

.star {
	height: 100%;
	width: 24px;
	line-height: 6em;
	position: absolute;
	z-index: 3;
}

.star:hover {
	background: url(star.png) repeat-x 0 -20px !important;
	left: 0;
	z-index: 2;
}

.star_1 {
	left: 0;
}

.star_2 {
	left: 24px;
}

.star_3 {
	left: 48px;
}

.star_4 {
	left: 72px;
}

.star_5 {
	left: 96px;
}

.star_1:hover {
	width: 24px;
}

.star_2:hover {
	width: 48px;
}

.star_3:hover {
	width: 72px;
}

.star_4:hover {
	width: 96px;
}

.star_5:hover {
	width: 120px;
}

label {
	display: block;
	_display: inline;
	height: 100%;
	width: 100%;
	cursor: pointer;
}

/* 幕后的英雄，单选按钮 */
.score {
	position: absolute;
	clip: rect(0, 0, 0, 0);
}

.score:checked+.star {
	background: url(star.png) repeat-x 0 -20px;
	left: 0;
	z-index: 1;
}

.score_1:checked ~ .star_1 {
	width: 24px;
}

.score_2:checked ~ .star_2 {
	width: 48px;
}

.score_3:checked ~ .star_3 {
	width: 72px;
}

.score_4:checked ~ .star_4 {
	width: 96px;
}

.score_5:checked ~ .star_5 {
	width: 120px;
}

.star_bg:hover .star {
	background-image: none;
}

/* for IE6-IE8 JS 交互 */
.star_checked {
	background: url(star.png) repeat-x 0 -20px;
	left: 0;
	z-index: 1;
}
#newDiv{
            width:2000px;
            height: 70px;
        background-color: red;
        }
</style>
<script type="text/javascript">

  
	function preview() {
	      console.log(1111); 
          $('a.media').media(
          {width:800, height:600, autoplay:false,silverlight:{ isWindowless: 'false'}}); 
	}
	function cantedit()
	{
		//document.getElementById("plugin").contentWindow.document.body.contentEditable= "false";
		alert("11111");
		 var plugin = document.getElementById("plugin");
         //var div = document.createElement("div");
        // div.setAttribute("id", "newDiv");
         alert("22222"+plugin);
        // plugin.appendChild(div);
		//alert("div="+div);
	}
	


        // 禁用右键功能
        function stop(){
            return false;
        }
        document.oncontextmenu=stop;

        //禁止F8按钮
        function keypressed() {
            if(event.keyCode == 119) {
                event.keyCode = 0;
                return false;
            }
        }
        
        
</script>

</head>
<body>
<% String employeeId = (String)session.getAttribute("employeeId");
			String experience_employeeId = (String)session.getAttribute("experience_employeeId");
		 %>
	<div class="container">
		<h4 class="bolder">
			${experience.experienceName }<br />
		</h4>
		<div class="small text-left mg-b10">${experience.employee.name }<span
				class="exp-score">得分：${experience.score }</span>
		</div>
		<div class="row hr mg-b30"></div>
		<div class="row mg-b15">
			<div class="col-md-2">地区</div>
			<div class="col-md-4">${experience.area }</div>
		</div>
		<div class="row mg-b15">
			<div class="col-md-2">分类</div>
			<div class="col-md-4">${experience.dataDirt.name }</div>
		</div>
		<%-- <div class="row mg-b30">
			<div class="col-md-2">主芯片</div>
			<div class="col-md-4">${experience.mainChip }</div>
		</div> --%>

		<div class="row hr mg-b30"></div>

		<div class="row mg-b15">
			<div class="col-md-2">关键词</div>
			<div class="col-md-7">${experience.keyword }</div>
		</div>
		<div class="row mg-b30">
			<div class="col-md-2">摘要</div>
			<div class="col-md-7">${experience.abstract_ }</div>
		</div>
		<div class="row mg-b30">
			<div class="col-md-2"></div>
			<div class="col-md-7">
				
			</div>
		</div>

		<div class="row hr mg-b15"></div>
		<div class="row mg-b30" style="padding-left:85px;">
				<div class="col-md-7">
					<!-- <button class="btn btn-primary"> -->
						<%-- <a class="media" href="<%=path %>/upload/test.pdf"><i class="glyphicon mg-r5"></i>预览</a> --%>
						<%-- <a class="media btn btn-info" href="<%=path %>/upload/experience/${fileFileName}" onclick="preview();"><i class="glyphicon icon-padr"></i>预览</a> --%>
						<a class="media btn btn-info" href="experienceAction!getFileNameForUser.action" target="_blank" ><i class="glyphicon icon-padr"></i>预览</a>
					<!-- </button> -->
				</div>
		</div>
			
	</div>
</body>
</html>
