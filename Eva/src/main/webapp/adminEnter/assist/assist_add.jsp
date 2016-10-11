<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>辅助项录入</title>
<link rel="stylesheet" href="../../css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>/css/jquery-ui.css" />
<link rel="stylesheet" href="<%=basePath%>/css/jquery.multiselect.css" />
<link rel="stylesheet" href="<%=basePath%>/css/prettify.css" />
<link rel="stylesheet" href="<%=basePath%>/css/chosen.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.css" />
<script src="<%=basePath%>/js/jquery-1.11.0.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath%>/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery-ui.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath%>/js/jquery.multiselect.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/js/prettify.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath%>/My97DatePicker/WdatePicker.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/js/chosen.jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/js/bootstrapValidator.min.js"></script>
<style type="text/css">
.mg-b15 {
	margin-bottom: 15px
}

.mg-b30 {
	margin-bottom: 30px
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

.icon-padl {
	padding-left: 5px;
}

.bolder {
	font-weight: 700
}

.clear {
	clear: both;
}

.ui-multiselect {
	height: 32px;
}
</style>

</head>
<body>

<!-- assistAction!getAllEmployee.action -->
	<div class="container">
		<!--head-->
		<h3 class="bolder mg-b15">辅助项录入</h3>
		<div class="hr mg-b15"></div>
		<!--body-->
		<form action="assistAction!save.action" id="assistForm">
			<!--  assistAction!save.action-->
			<div class="form-group">
				<label class="control-label">分类</label> <select name="assistType"
					id="assistType" class="form-control" onchange="showDiv();">
					<option value="">请选择类别</option>
					<option value="1">专利</option>
					<option value="2">订单</option>
					<option value="3">其他</option>
				</select>
			</div>
			<div id="patentIdDiv" style="display: none" class="form-group">
				<label class="control-label">专利编号</label> <input type="text"
					name="patentId" id="patentId" class="form-control" />
			</div>
			<div id="nameDiv" class="form-group">
				<label class="control-label">名称</label> <input type="text"
					name="assistName" id="assistName" class="form-control" />
			</div>
			<div id="otherNameDiv" style="display: none" class="form-group">
				<label class="control-label">名称</label> <select name="assistName"
					class="form-control">
					<option value="">---请选择类别---</option>
					<option value="标准化">标准化</option>
					<option value="重要信息收集">重要信息收集</option>
					<option value="项目文档">项目文档</option>
					<option value="其他">其他</option>
				</select>
			</div>
			<div id="typeDiv" style="display: none" class="form-group">
				<label class="control-label">专利类型</label> <select name="patentType"
					id="patentType" class="form-control">
					<option value="">请选择专利类型</option>
					<option value="发明专利">发明专利</option>
					<option value="实用新型">实用新型</option>
					<option value="外观设计">外观设计</option>
				</select>
			</div>
			<div id="numDiv" style="display: none" class="form-group">
				<label class="control-label">数量/分数</label> <input type="text"
					name="num" id="num" class="form-control" />
			</div>
			<div class="form-group">
				<label class="control-label">员工</label> <select name="employeeId"
					id="chosen-select" class="form-control" style="height: 40;">
					<option value="">请选择员工</option>
					<c:forEach items="${employees }" var="employee" varStatus="status">
						<option value="${employee.id }">${employee.name }</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					$("#chosen-select").chosen({
						no_results_text : "Oops, nothing found!"
					});
				</script>
			</div>
			<div class="form-group">
				<label class="control-label">时间</label>
				<div class="input-group">
					<input type="date" name="startTime" id="startTime"
						class="form-control" readonly="readonly"
						style="cursor:not-allowed" /> <span class="input-group-addon" id="wdate"
						onclick="WdatePicker({el:'startTime',dateFmt:'yyyy-MM-dd', onpicked:pickedFunc,oncleared:pickedFunc})"><i
						class="glyphicon glyphicon-time"></i></span>
				</div>
			</div>
			<div class="process-area">
				<button type="submit" onclick="clickButton();" class="btn btn-info"
					class="glyphicon glyphicon-saved icon-padr">
					<i class="glyphicon glyphicon-saved icon-padr"></i>保存
				</button>
			</div>
		</form>
		<script type="text/javascript">
			function showDiv() {
				var type = document.getElementById("assistType").value;
				if (type == 1) {
					var div = document.getElementById("typeDiv");
					var numDiv = document.getElementById("numDiv");//patentIdDiv
					var patentIdDiv = document.getElementById("patentIdDiv");
					patentIdDiv.style.display = "";
					div.style.display = "";
					numDiv.style.display = "none";

					var nameDiv = document.getElementById("nameDiv");
					var otherNameDiv = document.getElementById("otherNameDiv");
					nameDiv.style.display = "";
					otherNameDiv.style.display = "none";
				} else if (type == 3) {
					var nameDiv = document.getElementById("nameDiv");
					var otherNameDiv = document.getElementById("otherNameDiv");
					nameDiv.style.display = "none";
					otherNameDiv.style.display = "";

					var div = document.getElementById("typeDiv");
					var numDiv = document.getElementById("numDiv");
					var patentIdDiv = document.getElementById("patentIdDiv");
					patentIdDiv.style.display = "none";
					div.style.display = "none";
					numDiv.style.display = "";
				} else {
					var div = document.getElementById("typeDiv");
					var numDiv = document.getElementById("numDiv");
					var patentIdDiv = document.getElementById("patentIdDiv");
					patentIdDiv.style.display = "none";
					div.style.display = "none";
					numDiv.style.display = "";

					var nameDiv = document.getElementById("nameDiv");
					var otherNameDiv = document.getElementById("otherNameDiv");
					nameDiv.style.display = "";
					otherNameDiv.style.display = "none";
				}
			}
		</script>



	</div>
	<script type="text/javascript">
	
	function pickedFunc()
	{
		$('#assistForm').data('bootstrapValidator')  
                    .updateStatus('startTime', 'NOT_VALIDATED',null)  
                    .validateField('startTime'); 
         clickButton();
	}
	
		function clickButton() {
			
			/**
			 * 下面是进行插件初始化
			 * 你只需传入相应的键值对
			 * */
			$('#assistForm').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {/*输入框不同状态，显示图片的样式*/
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {/*验证*/
					assistType : {/*键名username和input name值对应*/
						message : 'The assistType is not valid',
						validators : {
							notEmpty : {/*非空提示*/
								message : '请选择分类'
							}
						/*长度提示*/
						/* stringLength: {
						    min: 6,
						    max: 30,
						    message: '用户名长度必须在6到30之间'
						} *//*最后一个没有逗号*/
						}
					},
					assistName : {
						message : '名字无效',
						validators : {
							notEmpty : {
								message : '名字不能为空'
							}
						/* ,
									                        stringLength: {
									                            min: 6,
									                            max: 30,
									                            message: '用户名长度必须在6到30之间'
									                        } */
						}
					},
					patentType : {
						validators : {
							notEmpty : {
								message : '专利类型不能为空'
							}
						/* ,
									                        emailAddress: {
									                            message: 'The input is not a valid email address'
									                        } */
						}
					},
					num : {
						validators : {
							notEmpty : {
								message : '分数不能为空'
							}
						/* ,
									                        emailAddress: {
									                            message: 'The input is not a valid email address'
									                        } */
						}
					},
					startTime: {
						validators : {
							notEmpty : {
								message : '请选择时间'
							}
						}

					},
					employeeId : {
						validators : {
							notEmpty : {
								message : '员工不能为空'
							}
						/* ,
									                        emailAddress: {
									                            message: 'The input is not a valid email address'
									                        } */
						}

					},
					patentId : {
						validators : {
							notEmpty : {
								message : '分数不能为空'
							},
							remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                         	url: 'assistAction!isExit.action',//验证地址
                         	message: '用户已存在',//提示消息
                         	delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                         	type: 'POST'//请求方式
                         /**自定义提交数据，默认值提交当前input value
                          *  data: function(validator) {
                               return {
                                   password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                   whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                               };
                            }
                          */
                     },
						
						}
					}
				}
			});
		}
	</script>
</body>
</html>
