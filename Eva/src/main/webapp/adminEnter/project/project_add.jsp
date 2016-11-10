<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新项目录入</title>
		<link rel="stylesheet" href="<%=basePath %>/css/jquery-ui.css" />
		<link rel="stylesheet" href="<%=basePath %>/css/jquery.multiselect.css" />
		<link rel="stylesheet" href="<%=basePath %>/css/prettify.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/jquery.multiselect.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/prettify.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrapValidator.min.js" type="text/javascript" charset="utf-8"></script>
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
			.ui-multiselect{height:32px;}
			.has-feedback .form-control-feedback{top:25px!important ;right:-30px}
			.btn-focus{border-color: #3c763d !important;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#employeeList").multiselect({
					noneSelectedText: "--请选择--",
			        checkAllText: "全选",
			        uncheckAllText: "全不选",
					selectedList: 4,
					create:function(event , ui){
						$('#employeeList_ms').parent().addClass('has-feedback')
						.append('<i class="form-control-feedback glyphicon"  style="display:none"></i>')
						.append('<small class="help-block" style="display: none;">请选择项目组成员！</small>');
					},
					close: function(event,ui){
						var value = $('#employeeList').val();
						if(value){
							eLIconOK();
						}else{
							$('#employeeList_ms').addClass('btn-focus');
							eLIconRemove();
						}
					}
				});
			});
	</script>
	</head>
	<body>
		<div class="container">
			<!--head-->
			<h3 class="bolder mg-b15">
				新项目录入
			</h3>
			<div class="hr mg-b15"></div>
			<!--body-->
			<form id="project_add" action="<%=basePath %>/projectAction!save.action" role="form">
				<div class="form-group">
					<label class="control-label">项目名称</label>
					<input type="text" name="projectName" id="projectName" class="form-control"  />
				</div>
				<div class="form-group">
					<label class="control-label">项目编号</label>
					<input type="text" name="projectId" id="projectId" class="form-control" />
				</div>
				<div class="form-group">
					<label class="control-label">项目简介</label>
					<textarea name="projectDescribe" rows="4" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<label class="control-label">项目经理</label>
					<select name="projectManager" class="form-control">
						<option value="">请选择项目经理</option>
						<c:forEach items="${employees }" var="employee" varStatus="status">
							<option value="${employee.id }">${employee.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">项目成员</label>
					<!-- <div name="projectName" id="projectName" class="form-control-static"><a href="javascript:void(0);">点击选择成员</a></div> -->
					<!--弹出员工选择窗口，进行选择，将选中的数据封装成json数组，放在此div的data-parts缓存里，在提交时进行处理 -->
					<select name="employeeList" id="employeeList" multiple="multiple" size="5" class="form-control">
						<%-- <c:forEach items="${employees }" var="employee" varStatus="status">
							<option value="${employee.id }">${employee.name }</option>
						</c:forEach> --%>
						<c:forEach items="${employeeMap }" var="map">
							<optgroup label="${map.key }">
								<c:forEach items="${map.value }" var="employee">
									<option value="${employee.id}">${employee.name }</option>
								</c:forEach>
							</optgroup>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label class="control-label">启动时间</label>
					<div class="input-group">
						<input type="date" name="startTime" id="startTime" class="form-control" readonly="readonly" style="cursor:not-allowed"/>
						<span class="input-group-addon" onclick="WdatePicker({el:'startTime',dateFmt:'yyyy-MM-dd'})"><i class="glyphicon glyphicon-time"></i></span>
					</div>
				</div>
				<div class="process-area">
					<button type="submit" name="submit-btn" class="btn btn-info"class="glyphicon glyphicon-saved icon-padr"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</button>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#project_add')
				.bootstrapValidator({
					feedbackIcons: {
						valid:'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating:'glyohicon glyohicon-refresh'
					},
					fields:{
						projectName : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目名称不能为空！'
								},
								remote:{
									message:'该名称已存在，请修改',
									url:'<%=basePath%>ajaxRequestAction!checkProjectName.action'
								}
							}
						},
						projectId : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目编号不能为空'
								},
								//等待remote或者callback
								callback:{
									message:'编号仅能含有数字、字母、短线、下划线!',
									callback: function(value, validator){
										var regex = /[^0-9a-zA-Z_-]/g;
										return !regex.test(value);
									}
								},
								remote:{
									message:'该编号已存在，请修改！',
									url:'<%=basePath%>ajaxRequestAction!checkProjectId.action'
								}
							}
						},
						projectDescribe:{
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目描述不能为空'
								},
							}
						},
						projectManager : {
							trigger:'blur',
							validators:{
								notEmpty:{
									message:'项目经理不能为空'
								},
							}
						},
						startTime:{
							trigger:'blur',
							  validators: {
								  notEmpty:{
										message:'项目启动时间不能为空'
									},
				                  date: {
				                        format: 'YYYY-MM-DD',
				                        message: '项目启动时间格式错误'
				                    },
				                }
						}
					}
				}).on('success.form.bv',function(e){
					e.preventDefault();
					var employeeListsVal = $('#employeeList').val();
					if(!employeeListsVal){
						eLIconRemove();
						$('#employeeList_ms').addClass('btn-focus');
						$('#project_add').data('bootstrapValidator').disableSubmitButtons(false);
					}else{ 
						eLIconOK();
						e.target.submit();
					}
				}).on('error.form.bv', function(e){
					multiselectCheck();
				});
			});
			
			function multiselectCheck(){
				var employeeListsVal = $('#employeeList').val();
				if(!employeeListsVal){
					eLIconRemove();
					$('#employeeList_ms').addClass('btn-focus');
				}else eLIconOK;
			};
			function eLIconOK(){
				var $parent = $('#employeeList_ms').parent();
				$parent.removeClass('has-error').addClass('has-success').
				find('.glyphicon').show().removeClass('glyphicon-remove').addClass('glyphicon-ok')
				.end().find('.help-block').hide();
			};
			function eLIconRemove(){
				var $parent = $('#employeeList_ms').parent();
				$parent.removeClass('has-success').addClass('has-error').
				find('.glyphicon').show().removeClass('glyphicon-ok').addClass('glyphicon-remove')
				.end().find('.help-block').show();
			};
		</script>
	</body>
</html>
