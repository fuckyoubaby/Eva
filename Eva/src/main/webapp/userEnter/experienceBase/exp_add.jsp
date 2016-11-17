<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新增经验库</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
			                },
			                dataDirtPId :{
			                    message:'分类无效',
			                    validators: {
			                        notEmpty: {
			                            message: '一级分类不能为空'
			                        }
			                    }
			                },
			                dataDirtNId :{
			                    message:'分类无效',
			                    validators: {
			                        notEmpty: {
			                            message: '二级分类不能为空'
			                        }
			                    }
			                },
			                main_word :{
			                    message:'关键词无效',
			                    validators: {
			                        notEmpty: {
			                            message: '关键词不能为空'
			                        }
			                    }
			                },
			                
			                abstruct :{
			                    message:'摘要无效',
			                    validators: {
			                        notEmpty: {
			                            message: '摘要不能为空'
			                        }
			                    }
			                },
			                 file :{
			                    message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '文件不能为空'
			                        }
			                    }
			                },
			               /*  dataDirtPId: {
			                    validators: {
			                        notEmpty: {
			                            message: '竞赛等级不能为空'
			                        }
			                    }
			                } */
			            }
			        });
			});
	</script>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder">新增经验分享</h3>
			<div class="hr mg-b30"></div>
			<div class="row">
			<form action="experienceAction!save.action" id="exUpdateForm" method="post" enctype="multipart/form-data" class="form-content">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						<div class="form-content">
						<div class="form-group">
							<label class="control-label">分项名称</label>
							<input type="text" name="experienceName" class="form-control" />
						</div>
						<!-- <div class="form-group">
							<label  class="control-abel">涉及项目</label>
							<div class="form-control-static">点击添加涉及项目<a href="javascript:void(0);">(添加)</a></div>
						</div> -->
						<div class="form-group">
							<label  class="control-label">地区</label>
							<div class="row">
								<div class="col-md-6">
									<select name="country" class="form-control">
										<option value="">请选择</option>
										<option value="海外">海外</option>
										<option value="国内">国内</option>
									</select>
								</div>
								<div class="col-md-6">
									<input type="text" name="area" class="form-control" placeholder="请输入所在的国家和省份">
									<!-- <select name="area" class="form-control">
										<option value="">请选择2级地区</option>
										<option value="">印度/东南亚</option>
										<option value="">俄罗斯</option>
										<option value="">欧洲</option>
										<option value="">北美</option>
										<option value="">南美</option>
										<option value="">非洲</option>
										<option value="">其他</option>
									</select> -->
								</div> 
							</div>
							
						</div>
						<div class="form-group">
							<label  class="control-label">分类</label>
							<!--三级分类-->
							<div class="row">
								<div class="col-md-6">
								<select name="dataDirtPId" id="dataDirtPId" onchange="getDataByNId();" class="form-control">
										<option value="">请选择一级分类</option>
										<c:forEach items="${dataDirts }" var="data">
											
											<option value="${data.nId }">${data.name }</option>
												
										 </c:forEach>
									</select>
								<%-- <select name="experienceClassify" class="form-control">
										<option value="请选择">请选择</option>
										<c:forEach items="${classifies }" var="classify">
											<option value="${classify.classifyId }">${classify.classifyName }</option>
										</c:forEach>
								</select> --%>
									<!-- <select name="classify-1" class="form-control">
										<option value="请选择">请选择</option>
						                <option value="Tuner/高频头">Tuner/高频头</option>
						                <option value="接口">接口</option>
						                <option value="主芯片">主芯片</option>
						                <option value="存储器">存储器</option>
						                <option value="在板电源">在板电源</option>
						                <option value="PCB">PCB</option>
						                <option value="分类器件">分类器件</option>
						                <option value="分板/模板">分板/模板</option>
						                <option value="测试/认证">测试/认证</option>
									</select> -->
								</div>
								
								<div class="col-md-4">
									<select name="dataDirtNId" id="dataDirtNId" style="height: 30px">
										<option value="">请选择二级分类</option>
									</select>
								</div>
								<!-- <div class="col-md-4">
									<select name="classify-2"  class="form-control">
										<option value="">js动态选择</option>
									</select>
								</div>
								<div class="col-md-4">
									<select name="classify-3"  class="form-control">
										<option value="">js动态选择</option>
									</select>
								</div> -->
							</div>
						</div>
						<!--<div class="form-group">
							<label  class="control-abel">主芯片</label>
							<div class="form-control-static">Amlogic S805</div>
						</div>-->
						<div class="form-group">
							<label  class="control-label">主芯片</label>
							<div class="form-control-static"><input name="mainChip"  class="form-control"/></div>
						</div>
						<div class="form-group">
							<label  class="control-label">关键词</label>
							<div class="form-control-static"><input name="main_word"  class="form-control"/></div>
						</div>
						<div class="form-group">
							<label  class="control-label">摘要</label>
							<textarea name="expAbstruct" rows="3" class="form-control"></textarea>
						</div>
						</div>
					</div>
				
				</div>
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">上传文件</div>
						<div class="form-content">
							<div class="form-group">
								<div class="form-control-static">
									<input type="file" name="file"/>
								</div>
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存此条分享数据</button>
							</div>
					</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</body>
</html>
