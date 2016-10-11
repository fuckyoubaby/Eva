<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>经验分享修改</title>
		<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css" />
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
			function getDataByNId()
			{
				var dataDirtPId = document.getElementById("dataDirtPId").value;
				$.ajax({
					type:"post",
					url:"experienceAction!getDataDirtByPId.action",
					dataType:"json",
					data:"dataDirtPId="+dataDirtPId,
					cache:false,
					success:createReview,
					error:errorReview
				});
			}
			function createReview(list){
				$('#dataDirtNId').empty();
				$('#dataDirtNId').append("<option value='0'>"+"请选择二级分类"+"</option>");
				$.each(list,function(n,value){
  					$('#dataDirtNId').append("<option value='"+value.nId+"'>"+value.name+"</option>");
  				});
			}
			function errorReview(err)
			{
				alert("err");
			}
			
			$(document).ready(function() {
			    /**
			     * 下面是进行插件初始化
			     * 你只需传入相应的键值对
			     * */
			    $('#exUpdateForm').bootstrapValidator({
			            message: 'This value is not valid',
			            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
			                valid: 'glyphicon glyphicon-ok',
			                invalid: 'glyphicon glyphicon-remove',
			                validating: 'glyphicon glyphicon-refresh'
			            },
			            fields: {/*验证*/
			                experienceName: {/*键名username和input name值对应*/
			                    message: 'The experienceName is not valid',
			                    validators: {
			                        notEmpty: {/*非空提示*/
			                            message: '经验名字不能为空'
			                        }
			                    }
			                },
			                country: {
			                    message:'地区无效',
			                    validators: {
			                        notEmpty: {
			                            message: '地区不能为空'
			                        }
			                    }
			                }
			            }
			        });
			});
			
		</script>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b20">经验分享修改</h3>
			<div class="hr mg-b20"></div>
			<div class="row">
			<form action="experienceAction!updateExperience.action" id="exUpdateForm" method="post" class="form-content" enctype="multipart/form-data" theme="simple">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						
						<div class="form-group">
							<label class="control-label">分项名称</label>
							<input type="text" name="experienceName" class="form-control" value="${experience.experienceName }"/>
						</div>
						<div class="form-group">
							<label  class="control-abel">地区</label>
							<div class="row">
								<div class="col-md-6">
									<select name="country" class="form-control">
										<option value="${experience.county }"  selected="selected">${experience.county }</option>
										<option value="海外">海外</option>
										<option value="国内">国内</option>
									</select>
								</div>
								<div class="col-md-6">
								<input type="text" name="area" class="form-control" value="${experience.area }">
								</div> 
							</div>
							
						</div>
						<div class="form-group">
							<label  class="control-abel">分类</label>
							<!--三级分类-->
							<div class="row">
								<div class="col-md-4">
									<select name="dataDirtPId" id="dataDirtPId" onchange="getDataByNId();" class="form-control">
										<option value="${dataDirt.nId }">${dataDirt.name }</option>
										<c:forEach items="${dataDirts }" var="data">
											<c:choose>
												<c:when test="${data.nId==dataDirt.nId }">
												</c:when>
												<c:otherwise>
													<option value="${data.nId }">${data.name }</option>
												</c:otherwise>
											</c:choose>
										
											
										</c:forEach>
									</select>
								</div>
								<div class="col-md-4">
									<select name="dataDirtNId" id="dataDirtNId" style="height: 30px">
										<option value="${experience.dataDirt.nId }">${experience.dataDirt.name }</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-abel">关键词</label>
							<div class="form-control-static"><input name="main_word" value="${experience.keyword }" /></div>
						</div>
						<div class="form-group">
							<label  class="control-abel">摘要</label>
							<textarea rows="5" name="expAbstruct" class="form-control">${experience.abstract_ }</textarea>
						</div>
					</div>
				
				</div>
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">上传文件</div>
							<div class="form-group">
								<label class="control-label">已经上传的文件</label>
								<label class="control-label">${experience.exUrl }</label>
								<div class="form-control-static">
									<input type="file" name="file"/>
								</div>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存此条分享数据</button>
							</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</body>
</html>
