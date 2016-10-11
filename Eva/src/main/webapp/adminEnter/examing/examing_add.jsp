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
		<title>管理员-新增考试</title>
		<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css" />
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>	
		<script src="<%=basePath%>/js/jquery.validate.min.js"></script>
		<script src="<%=basePath%>/js/jquery.metadata.js"></script>
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
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b20">新增竞赛</h3>
			<div class="row mg-b20">
				<div class="col-md-8">
				<div class="hr mg-b20"></div>
					<form action="examAction!add.action" id="addExamForm" role="form">
						<div class="form-group">
							<label class="control-label">名称</label>
							<input type="text" name="examName" id="examName" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label">组织者</label>
							<input type="text" name="organizer" id="organizer" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label">竞赛地点</label>
							<input type="text" name="examLocation" id="examLocation" class="form-control" />
						</div>
						<div class="form-group">
							<label class="control-label">竞赛级别</label>
							<select name="examLevel" id="level" class="form-control">
								<option value="">请选择竞赛等级</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">竞赛内容</label>
							<textarea name="examContent" rows="3" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label class="control-label">竞赛时间</label>
							<div class="input-group">
								<input type="date" name="examData" id="examTime" class="form-control" readonly="readonly" style="cursor:not-allowed" />
								<span class="input-group-addon" onclick="WdatePicker({el:'examTime',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc,oncleared:pickedFunc})"><i class="glyphicon glyphicon-time"></i></span>
							</div>
						</div>
						<div class="help-text">请添加参与者</div>
						<div class="form-group">
							<button type="submit" id="addExam" onclick="clickButton();" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</button>
						</div>
						
					</form>
				</div>
			</div>
			
			
		</div>
		<script type="text/javascript">
		
		function pickedFunc()
		{
			$('#addExamForm').data('bootstrapValidator')  
	                    .updateStatus('examData', 'NOT_VALIDATED',null)  
	                    .validateField('examData'); 
	         clickButton();
		}
			function clickButton() {
			    /**
			     * 下面是进行插件初始化
			     * 你只需传入相应的键值对
			     * */
			    $('#addExamForm').bootstrapValidator({
			            message: 'This value is not valid',
			            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
			                valid: 'glyphicon glyphicon-ok',
			                invalid: 'glyphicon glyphicon-remove',
			                validating: 'glyphicon glyphicon-refresh'
			            },
			            fields: {/*验证*/
			                examName: {/*键名username和input name值对应*/
			                    message: 'The examName is not valid',
			                    validators: {
			                        notEmpty: {/*非空提示*/
			                            message: '竞赛名字不能为空'
			                        }
			                        /*长度提示*/
			                        /* stringLength: {
			                            min: 6,
			                            max: 30,
			                            message: '用户名长度必须在6到30之间'
			                        } *//*最后一个没有逗号*/
			                    }
			                },
			                organizer: {
			                    message:'组织者无效',
			                    validators: {
			                        notEmpty: {
			                            message: '组织者不能为空'
			                        }
			                    }
			                },
			                examData: {
			                    message:'日期无效',
			                    validators: {
			                        notEmpty: {
			                            message: '日期不能为空'
			                        }
			                    }
			                },
			                examLevel: {
			                    validators: {
			                        notEmpty: {
			                            message: '竞赛等级不能为空'
			                        }/* ,
			                        emailAddress: {
			                            message: 'The input is not a valid email address'
			                        } */
			                    }
			                }
			            }
			        });
			}
		</script>
	</body>
</html>