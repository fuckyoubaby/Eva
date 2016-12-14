<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:useBean id="now" class="java.util.Date" scope="page"></jsp:useBean>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="UTF-8">
	<title>管理员-项目结构评审问题添加</title>
   	
   	<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
	<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
	<script src="${basePath}/js/bootstrapValidator.min.js" type="text/javascript" charset="utf-8" ></script>
	<script src="${basePath}/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
	<link href="${basePath}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
			<style type="text/css">
			.mg-b15{margin-bottom:15px}
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
			.form-content{padding:15px 35px;}
			.form-control-feedback {top:25px !important; right:-30px}
		</style>
  </head>
  
  <body>
  <fmt:formatDate value="${empty project.endTime ? now:project.endTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="maxDate"/>
	<c:choose>
		<c:when test="${empty project.startTime}">
			<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="minDate"/>
		</c:when>
		<c:otherwise>
			<fmt:formatDate value="${project.startTime}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="minDate"/>
		</c:otherwise>
	</c:choose>
   		<div class="container">
			<h3 class="bolder">新的结构评审问题录入</h3>
			<div class="hr mg-b15"></div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">输入问题信息</div>
						<form id="squestion_add" action="${basePath}/structureProblemAction!saveNew.action" role="form" class="form-content" method="post">
							<div class="form-group">
								<label class="control-label">问题名称</label>
								<input type="text" name="questionName" class="form-control"/>
							</div>
							<div class="form-group">
								<label class="control-label">责任人</label>
								<select name="questionBelong" class="form-control">
									<option value="">请选择责任人</option>
									<c:forEach items="${employees }" var="employee">
										<option value="${employee.id }">${employee.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">问题类型</label>
								<select class="form-control" name="questionType">
								<option value="1">一般设计缺陷</option>
								<option value="2">低级错误</option>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label">扣分</label>
								<input type="text" name="questionScore" class="form-control" placeholder="填写0-50的正数"/>
							</div>
							<div class="form-group">
								<label class="control-label">问题描述</label>
								<textarea rows="2"  placeholder="不超过80字" class="form-control" name="questionDesc"></textarea>
							</div>
							
							<div class="form-group">
								<label class="control-label">日期</label>
								<div class="input-group">
									<input type="date" class="form-control" id="createDate" name="createDate" readonly="readonly"
									placeholder="评审日期" style="cursor:not-allowed" />
									<div class="input-group-addon" onclick="WdatePicker({el:'createDate',dateFmt:'yyyy-MM-dd',realDateFmt:'yyyy-MM-dd',minDate:'${minDate}',maxDate:'${maxDate}'})">
									<i class="glyphicon glyphicon-calendar"></i> 
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</button>
								<button type="button" class="btn btn-info" onclick="javascript:window.history.back();"><i class="glyphicon glyphicon-arrow-left icon-padr"></i>取消</button>
							</div>
						</form>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						<div class="form-content">
							<div class="form-group">
								<label class="control-label">项目编号</label>
								<div class="form-control-static">${project.projectId}</div>
							</div>
							<div class="form-group">
								<label class="control-label">项目名称</label>
								<div class="form-control-static">${project.projectName}</div>
							</div>
							<div class="form-group">
								<label class="control-label">阶段</label>
								<div class="form-control-static">${phase.phaseName}</div>
							</div>
							<div class="form-group">
								<label class="control-label">评审</label>
								<div class="form-control-static">结构评审</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#squestion_add').bootstrapValidator({
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields:{
						questionName : {
							trigger :'blur',
							validators : {
								notEmpty : { message: '问题名称不能为空！'},
								stringLength : {
									max:20,
									min:2,
									message:'名字限定在2-20位'
								}
							}
						},
						questionBelong : {
							trigger : 'blur',
							validators : {
								notEmpty: {message:'请选择责任人！'}
							}
						},
						questionType:{
							trigger : 'blur',
							validators : {
								notEmpty: {message:'请选择问题类型！'}
							}
						},
						questionScore:{
							trigger : 'blur',
							validators : {
								notEmpty: {message:'请填写扣分！'},
								callback:{
									message:'填写0-50的数字',
									callback:function(value,validator){
										if(isNaN(value)){
											return false;
										}else{
											var num = value*1;
											return (num>=0 && num<=50);
										}
									}
								}
							}
						},
						questionDesc:{
							trigger : 'blur',
							validators : {
								callback:{
									message:'描述限定在85字内！',
									callback:function(value,validator){
										if(!value) return true;
										else return value.length<=85;
									}
								}
							}
						},
						createDate:{
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'日期不能为空'
								},
								date:{
									format:'YYYY-MM-DD',
									message:'日期格式错误yyyy-MM-dd'
								}
							}	
						}
						
					}
				});
			});
		</script>
  </body>
</html>
