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
		<title>管理员-竞赛信息修改</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrapValidator.min.js"></script>
		<script src="<%=basePath %>/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>	
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
			<h3 class="bolder mg-b20">修改竞赛信息</h3>
			<div class="row mg-b20">
				<div class="col-md-8">
				<div class="hr mg-b20"></div>
					<form action="examAction!update.action" id="examUpdate">
						<div class="form-group">
							<label class="control-label">名称</label>
							<input type="text" name="examName" id="name" class="form-control" value="${exam.examName }" />
						</div>
						<div class="form-group">
							<label class="control-label">组织者</label>
							<input type="text" name="organizer" id="organizer" class="form-control"  value="${exam.organizer }"/>
						</div>
						<div class="form-group">
							<label class="control-label">竞赛地点</label>
							<input type="text" name="examLocation" id="examLocation" class="form-control"  value="${exam.examLocation }"/>
						</div>
						<div class="form-group">
							<label class="control-label">竞赛级别</label>
							<select name="examLevel" id="level" class="form-control">
								<option value="${exam.examLevel }" selected="selected">${exam.examLevel }</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">竞赛内容</label>
							<textarea name="examContent" rows="3" class="form-control">${exam.examContent }</textarea>
						</div>
						<div class="form-group">
							<label class="control-label">竞赛时间</label>
							<%-- <div class="input-group">
								<input type="date" name="examData" class="form-control" value="${exam.examTime }"/>
							</div> --%>
							<div class="input-group">
								<input type="date" name="examData" id="examTime" class="form-control" value="${exam.examTime }" readonly="readonly" style="cursor:not-allowed" />
								<span class="input-group-addon" onclick="WdatePicker({el:'examTime',dateFmt:'yyyy-MM-dd',onpicked:pickedFunc,oncleared:pickedFunc})"><i class="glyphicon glyphicon-time"></i></span>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" onclick="clickButton();" class="btn btn-info" value="保存"/>
						</div>
						
					</form>
				</div>
			</div>
			
			
		</div>
		<script type="text/javascript">
			function pickedFunc()
		{
			$('#examUpdate').data('bootstrapValidator')  
	                    .updateStatus('examData', 'NOT_VALIDATED',null)  
	                    .validateField('examData'); 
	         clickButton();
		}
			function clickButton() {
			    /**
			     * 下面是进行插件初始化
			     * 你只需传入相应的键值对
			     * */
			    $('#examUpdate').bootstrapValidator({
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