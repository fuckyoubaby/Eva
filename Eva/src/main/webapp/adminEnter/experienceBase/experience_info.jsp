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
<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css" />
<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
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
</style>

<script type="text/javascript">
	function preview() {
	      console.log(1111); 
          $('a.media').media(
          {width:800, height:600, autoplay:false,silverlight:{ isWindowless: 'false'}});  
	}
</script>
</head>
<body>
	<div class="container">
		<h4 class="bolder">
			${experience.experienceName }<br />
		</h4>
		<div class="small text-left mg-b10">${experience.employee.name }<span
				class="exp-score">${experience.score } 分</span>
		</div>
		<div class="row hr mg-b30"></div>
		<div class="row mg-b15">
			<div class="col-md-2">地区</div>
			<div class="col-md-4">${experience.county }</div>
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
				<table >
				<tr>
				<th style="width:10px"><a class="btn btn-info" href="<%=path%>/download/download!execute.action?experienceId=${experience.experienceId }"><i class="glyphicon glyphicon-download-alt mg-r5"></i>下载</a></th>
				<th>&nbsp;&nbsp;</th>
				<th style="width:10px"><a class="media btn btn-info" href="<%=path %>/upload/experience/${fileFileName}" onclick="preview();"><i class="glyphicon icon-padr"></i>预览</a></th>
				</tr>
				</table>
			</div>
		</div>

		<div class="row hr mg-b15"></div>
		<div class="row mg-b30" style="padding-left:85px;">
				<a href="experienceAction!getExperienceByIdForUpdate.action?experienceId=${experience.experienceId }" class="btn btn-info" ><i class="glyphicon glyphicon-edit icon-padr"></i>修改</a>
				<a href="experienceAction!getExperienceForEvaluate.action?experienceId=${experience.experienceId }" class="btn btn-info" ><i class="glyphicon glyphicon-edit icon-padr"></i>评价此条</a>
				<a href="experienceAction!delete.action?experienceId=${experience.experienceId }" class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-trash icon-padr"></i>删除此条</a>
		</div>
			
	</div>
</body>
</html>
