<%@page import="com.changhong.entities.Project"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:useBean id="now" class="java.util.Date" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-项目评审问题修改</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<link href="${basePath}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/css/loading.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/animate.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			a{text-decoration: none;outline: none;}
			a:hover{text-decoration: none;}
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
			.form-content{padding:15px;}
		</style>
		<script type="text/javascript" src="${basePath}/js/loading_upgrade.js"></script>
		<script type="text/javascript">
			this.myLoading=function(data){
				var load = new loading(data);
				load.init();
			};
		</script>
	</head>
	<body>
	<% Project project = (Project)session.getAttribute("project"); %>
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
			<h3 class="bolder"><a id="jumpHref" href="${basePath}/problemAction!getReviewByPhaseId.action?phaseId=${projectReview.phase.phaseId}&indexNo=${projectReview.phase.phaseId * 2}">${projectReview.project.projectName}项目评审问题更新</a></h3>
			<div class="hr mg-b15"></div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">评审内容</div>
						<form action="projectReviewAction!saveChanges.action" class="form-content" method="post" name="prUpdate" id="prUpdate">
							<div class="form-group">
								<label class="control-label">责任人</label>
									<select name="employeeId" id="employeeId" class="form-control" jrequired="required" placeholder="责任人">
										<c:forEach items="${employees}" var="item">
											<option value="${item.id }" ${item.id==projectReview.employee.id?'selected':''} >${item.name }</option>
										</c:forEach>
									</select>
							</div>
							<div class="form-group">
								<label class="control-label">评审日期</label>
								<div class="input-group">
									<input type="text" class="form-control" id="prdate" name="prdate" readonly="readonly" 
										placeholder="选取日期" style="cursor:not-allowed" jrequired="required"
										 value='<fmt:formatDate value="${projectReview.prdate}" pattern="yyyy-MM-dd"/>' />
									<span class="input-group-addon" onclick="WdatePicker({el:'prdate',dateFmt:'yyyy-MM-dd',realDateFmt:'yyyy-MM-dd',minDate:'${minDate}',maxDate:'${maxDate}'})">
										<i class="glyphicon glyphicon-time"></i>
									</span>
								</div>

							</div>
							<div class="form-group">
								<label class="control-label">评审阶段</label>
									<select name="phaseId" id="phaseId" class="form-control" jrequired="required" placeholder="评审阶段">
										<c:forEach items="${phases}" var="phase">
											<option value="${phase.phaseId }" ${phase.phaseId==projectReview.phase.phaseId?'selected':'' }>${phase.phaseName }</option>
										</c:forEach>
									</select>
							</div>
							<div class="form-group">
								<label class="control-label">设计规定</label>
								<input type="text" value="${projectReview.designReg}" name="designReg" id="designReg" class="form-control" placeholder="设计规定" jrequired="required" jvalidator="int0"  />
							</div>
							<div class="form-group">
								<label class="control-label">流程规定</label>
								<input type="text" value="${projectReview.flowsheetReg}" name="flowsheetReg" id="flowsheetReg" class="form-control"  placeholder="流程规定" jrequired="required" jvalidator="int0" />
							</div>
							<div class="form-group">
								<label class="control-label">工作计划性差</label>
								<input type="text" value="${projectReview.workplan}" name="workplan" id="workplan" class="form-control" placeholder="工作计划性差" jrequired="required" jvalidator="int0" />
							</div>
							<div class="form-group">
								<label class="control-label">沟通低效</label>
								<input type="text" value="${projectReview.communication}" name="communication" id="communication" class="form-control" placeholder="沟通低效" jrequired="required" jvalidator="int0" />
							</div>
							<div class="form-group">
								<label class="control-label">工作积极性</label>
								<input type="text" value="${projectReview.workEnt}" name="workEnt" id="workEnt" class="form-control"  placeholder="工作积极性" jrequired="required" jvalidator="int0" />
							</div>
							<div class="form-group">
								<label class="control-label">扣分说明</label>
								<textarea name="prexplain" id="prexplain" rows="3" class="form-control"  jrequired="required" >${projectReview.prexplain}</textarea>
							</div>				
							<div class="form-group">
								<button type="button" class="btn btn-info"  id="submitBtn" >保存</button>
								<input name="projectReviewId" id="projectReviewId" type="hidden" value="${projectReview.projectReviewId}"/>
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
								<div class="form-control-static"><%=project.getProjectId() %></div>
							</div>
							<c:if test="${not empty project.projectState}">
								<div class="form-group">
									<label class="control-label">状态</label>
									<div class="form-control-static">${project.projectState}</div>
								</div>
							</c:if>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
		<script type="text/javascript" src="${basePath}/js/validator2.0.js" ></script>
		<script>
		window.onload = function(){
			var tf1 =new xyForm();
			tf1.init({
				id:'prUpdate',
				btnId:'submitBtn',
				callback:function(formDom){
					var $form = $(formDom);
					var url = $form.attr("action");
					var data = $form.serialize();
					$.ajax({
		                type: "POST",
		                url:url,
		                data:data,// 你的formid
		                error: function(request) {
		                	myLoading({data:"Connection error"});
		                },
		                success: function(data) {
		                	var json = !data.result ? eval('('+data+')') : data;
		                	if(json.result=="success"){
		                		var phaseId = $("#phaseId").val();
	                			var hrefurl = '${basePath}/problemAction!getReviewByPhaseId.action?phaseId=';
	                			hrefurl+=phaseId+'&indexNo='+(phaseId*2)+'&message='+json.msg;
	                			window.location.href=hrefurl;
		                	}else if(json.result=="fail"){
		                		myLoading({data:json.msg,time:3000});
		                		if(data.iteName){
			                		var itemDom = $("#"+data.itemName);
			                		if(itemDom) itemDom.focus();
		                		}
		                	}else{
		                		myLoading({data:json.msg});
		                	}
		                }
		            });
				},
				showMsg:function(msg){
					myLoading({data:msg});
				}
			});
		};
		</script>
	</body>
</html>
