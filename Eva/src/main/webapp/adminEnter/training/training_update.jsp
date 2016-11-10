<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-培训修改</title>
		<link rel="stylesheet" href="<%=basePath %>/css/jquery-ui.css" />
		<link rel="stylesheet" href="<%=basePath %>/css/jquery.multiselect.css" />
		<link rel="stylesheet" href="<%=basePath %>/css/prettify.css" />
		<link rel="stylesheet" href="<%=basePath %>/css/style.css" />
		<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="../../css/jquery.multiselect.filter.css" />
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/jquery.multiselect.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="../../js/jquery.multiselect.filter.js"></script>
		<script src="<%=basePath %>/js/prettify.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrapValidator.min.js"></script>
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
				<script type="text/javascript">
$(function(){

	$("#employeeList").multiselect({
		noneSelectedText: "--请选择--",
        checkAllText: "全选",
        uncheckAllText: "全不选",
		selectedList: 4
	});
	
});
</script>

<script type="text/javascript">
		$(function(){
		
			$("#oriList").multiselect({
				noneSelectedText: "--重新选择--",
		        checkAllText: "全选",
		        uncheckAllText: "全不选",
				selectedList: 4
			});
			
		});
	</script>
	<script type="text/javascript">
			/* function showDiv()
			{
				//var type = document.getElementById("teacherType").value;
				if(type==0)
				{
					var inTeacher = document.getElementById("inTeacher");
					var outTeacher = document.getElementById("outTeacher");
					inTeacher.style.display="";
					outTeacher.style.display="none";
				}else
				{
					var inTeacher = document.getElementById("inTeacher");
					var outTeacher = document.getElementById("outTeacher");
					inTeacher.style.display="none";
					outTeacher.style.display="";
				}
			} */
		</script>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b15">修改培训</h3>
			<form action="trainAction!update.action" id="studyUpdate" class="form-content">
			<div class="hr mg-b20"></div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-border">
						
						<div class="form-title">基本信息</div>
						<div class="form-content">
						<div class="form-group">
							<label class="control-label">培训名称</label>
							<input type="text" name="trainName" class="form-control" value="${train.trainName }" />
						</div>
						<%-- <div class="form-group">
								<label class="control-label">培训讲师所属</label>
								<select id="teacherType" name="teacherType" onchange="showDiv();" class="form-control">
									<c:if test="${train.teacher!=null&& fn:length(train.teacher)>0}">
										<option value="1">外部讲师</option>
									</c:if>
									<option value="0">内部讲师</option>
									<option value="1">外部讲师</option>
								</select>
						</div>
						<div class="form-group" id="outTeacher" style="display: none">
								<label  class="contorl-label">培训讲师</label>
								<input type="text" name="teacher" value="${train.teacher }" class="form-control" />
						</div>
						<div class="form-group" id="inTeacher">
								<label  class="contorl-label">培训讲师</label>
									<select name="employeeId" id="chosen-select" class="form-control" style="height: 40;">
										<option value="${train.employee.id }">${train.employee.name }</option>
										<c:forEach items="${employees }" var="employee" varStatus="status">
											<option value="${employee.id }">${employee.name }</option>
										</c:forEach>
									</select>
								 <script type="text/javascript"> 
			     					  $("#chosen-select").chosen({no_results_text: "Oops, nothing found!"});
			    				</script>
								
						</div> --%>
							<div class="form-group">
								<label  class="control-label">组织人员  
									<c:forEach items="${trainorgs }" var="trainorg">
										${trainorg.employee.name }、
									</c:forEach>
								</label>
								<!-- <div class="form-control-static">点击添加(<a href="javascript:void(0);">添加</a>)</div> -->
								<select name="oriList" id="oriList" multiple="multiple" class="form-control">
									<%-- <c:forEach items="${employees }" var="employee" varStatus="status">
										<option value="${employee.id }">${employee.name }</option>
									</c:forEach> --%>
									<c:forEach items="${employeeMap }" var="map">
									
										<optgroup label="${map.key }">
											<c:forEach items="${map.value }" var="employee">
												<option value="${employee.id }">${employee.name }</option>
											</c:forEach>
										</optgroup>
									</c:forEach>
								</select>
							</div>
						<div class="form-group">
							<label  class="control-abel">培训内容</label>
							<textarea rows="5" name="trainContent" class="form-control">${train.trainContent }</textarea>
						</div>

						<div class="form-group">
							<label  class="control-abel">培训通知</label>
							<textarea rows="5" name="information" class="form-control">${train.information }</textarea>
						</div>
					</div>
				</div>
				</div>
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">其他信息</div>
						<div class="form-content">	
							<div class="form-group">
								<label class="control-label">培训时间</label>
								<div class="input-group">
									<input type="date" name="trainData" id="trainData" class="form-control" value="${train.trainTime }" readonly="readonly" style="cursor:not-allowed"/>
									<span class="input-group-addon" onclick="WdatePicker({el:'trainData',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc,oncleared:pickedFunc})"><i class="glyphicon glyphicon-time"></i></span>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label">培训地点</label>
								<input type="text" name="trainArea" class="form-control" value="${train.trainLocation }" />
							</div>
							<div class="form-group">
								<label class="control-label">培训级别</label>
								<select name="trainLeval" class="form-control">
									<option value="${train.trainLevel }" selected="selected">${train.trainLevel }</option>
									<option value="A" >A</option>
									<option value="B" >B</option>
									<option value="C">C</option>
								</select>
							</div>
							<div class="form-group">
								<label  class="control-abel">参训人员</label>
								<div class="form-control-static">${train.joinNum }人<!-- (<a href="javascript:void(0);">修改</a>) --></div>
								<p>
									<select name="employeeList" id="employeeList" multiple="multiple" size="5" class="form-control">
										<c:forEach items="${list }" var="eer" varStatus="status">
											<option value="${eer.employee.id }" selected="selected">${eer.employee.name }</option>
										</c:forEach>
										<c:forEach items="${employeesUnChecked }" var="employee" varStatus="status">
											<option value="${employee.id }">${employee.name }</option>
										</c:forEach>
									</select>
								</p>
							</div>
				
							<div class="form-group">
								<input type="submit" onclick="clickSubmit();" value="保存" class="btn btn-info"/>
						</div>	
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
		<script type="text/javascript">
			$("#employeeList").multiselect().multiselectfilter();
		</script>
		<script type="text/javascript">
			function pickedFunc()
			{
				$('#studyUpdate').data('bootstrapValidator')  
		                    .updateStatus('trainData', 'NOT_VALIDATED',null)  
		                    .validateField('trainData'); 
		         clickSubmit();
			}
			function clickSubmit()
			{
				 //var teacherType = document.getElementById("teacherType").value;
			    /**
			     * 下面是进行插件初始化
			     * 你只需传入相应的键值对
			     * */
			     
			     	$('#studyUpdate').bootstrapValidator({
			            message: 'This value is not valid',
			            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
			                valid: 'glyphicon glyphicon-ok',
			                invalid: 'glyphicon glyphicon-remove',
			                validating: 'glyphicon glyphicon-refresh'
			            },
			            fields: {/*验证*/
			                trainName: {/*键名username和input name值对应*/
			                    message: 'The trainName is not valid',
			                    validators: {
			                        notEmpty: {/*非空提示*/
			                            message: '培训名不能为空'
			                        }
			                    }
			                },
			                employeeId: {
			                    message:'讲师姓名无效',
			                    validators: {
			                        notEmpty: {
			                            message: '讲师不能为空'
			                        }
			                    }
			                },
			                teacher: {
			                    message:'讲师姓名无效',
			                    validators: {
			                        notEmpty: {
			                            message: '讲师姓名不能为空'
			                        }
			                    }
			                },
			                trainLeval: {
			                    validators: {
			                        notEmpty: {
			                            message: '培训等级不能为空'
			                        }
			                    }
			                },
			                trainData: {
			                    validators: {
			                        notEmpty: {
			                            message: '培训时间不能为空'
			                        }
			                    }
			                }
			            }
			        });
			}
		</script>
	</body>
</html>
