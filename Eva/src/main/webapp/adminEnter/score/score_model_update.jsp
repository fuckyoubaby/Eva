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
		<title>管理员-新增评分模型</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrapValidator.min.js"></script>	
		<style type="text/css">
			.mg-b10{margin-bottom:10px}
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
			
			/*start main process area*/
			.main-process{padding:15px;}
			.main-process a.btn-title{text-decoration:none;color:#ccc;}
			.main-process a.btn-title:hover{color:#282828;}
			.main-process a.btn-info{margin-left:75px;font-size:12px;}
			.icon-padr{padding-right: 5px;}
			.icon-padr10{padding-right:12px}
			/*end main process area*/
		</style>
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b20">更新模型</h3>
			<div class="hr mg-b20"></div>
			<form action="modeAction!updateMode.action" id="scoreModelUpdate" method="post">
			<!-- <div class="row"> -->
				<div class="col-md-6">
					<div class="form-border mg-b20">
						<div class="form-title bolder">
							基本信息
						</div>
							<div class="form-group">
								<label class="control-label">模型名称</label>
								<input type="text" name="modelName" value="${mode.modeName }" class="form-control" />
							</div>
					</div>
					
					<div class="form-border mg-b10">
						<div class="form-title bolder">专业技术 </div>
							<p class="bolder mg-b15">设计缺陷</p>
							
							<div class="form-group">
								<label class="control-label">一般设计缺陷（扣分）</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='一般设计缺陷' }">
								<div class="row ">
									<div class="col-md-4 ">
										<div class="input-group">
											<span class="input-group-addon">A</span>
											<input type="text" name="designFalutsA" value="${sw.a }" id="cDesignFalutsA"  class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">B</span>
											<input type="text" name="designFalutsB" value="${sw.b }" id="cDesignFalutsB"  class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">C</span>
											<input type="text" name="designFalutsC" value="${sw.c }" id="cDesignFalutsC"  class="form-control"/>
										</div>
									</div>
								</div>
								<div class="row " style="margin-top: 10px;">	
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="designFalutsWeight" value="${sw.weightly*100 }" id="cDesignFalutsWeight" placeholder="0-100" class="form-control"/>
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
							<div class="form-group">
								<label class="control-label">低级错误（扣分）</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='低级错误' }">
								<div class="row ">
									<div class="col-md-4 ">
										<div class="input-group">
											<span class="input-group-addon">A</span>
											<input type="text" name="sillyMiskakeA" value="${sw.a }" id="sillyMiskakeA" class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">B</span>
											<input type="text" name="sillyMiskakeB" value="${sw.b }" id="sillyMiskakeB"  class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">C</span>
											<input type="text" name="sillyMiskakeC" value="${sw.c }" id="sillyMiskakeC"  class="form-control"/>
										</div>
									</div>
								</div>
								<div class="row " style="margin-top: 10px;">
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="sillyMiskakeWeight" value="${sw.weightly*100 }" id="sillyMiskakeWeight" placeholder="0-100" class="form-control"/>
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
							<div class="hr mg-b20"></div>
							<p class="bolder mg-b15">合规</p>
							
							<div class="form-group">
								<label class="control-label">设计规定（扣分）</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='设计规定' }">
								<div class="row ">
									<div class="col-md-4 ">
										<div class="input-group">
											<span class="input-group-addon">A</span>
											<input type="text" name="designA" value="${sw.a }" id="designA" class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">B</span>
											<input type="text" name="designB" value="${sw.b }" id="designB"  class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">C</span>
											<input type="text" name="designC" value="${sw.c }" id="designC"  class="form-control"/>
										</div>
									</div>
								</div>
								<div class="row " style="margin-top: 10px;">
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="designWeight" value="${sw.weightly*100 }" id="designWeight" placeholder="0-100" class="form-control"/>
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
							<div class="hr mg-b20"></div>
							<p class="bolder mg-b15">学习积极性</p>
							<div class="form-group">
								<label class="control-label">参与培训（加分）</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='学习积极性' }">
								<div class="row ">
									<div class="col-md-4 ">
										<div class="input-group">
											<span class="input-group-addon">分数</span>
											<input type="text" name="studyA" value="${sw.a }" id="studyA" class="form-control"/>
										</div>
									</div>
									<%-- <div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">B</span>
											<input type="text" name="studyB" value="${sw.b }" id="studyB"  class="form-control"/>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">C</span>
											<input type="text" name="studyC" value="${sw.c }" id="studyC"  class="form-control"/>
										</div>
									</div> --%>
								</div>
								<div class="row " style="margin-top: 10px;">
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="studyWeight" value="${sw.weightly*100 }" id="studyWeight" placeholder="0-100" class="form-control"/>
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
						
					 </div>	
				</div>
				<div class="col-md-6">
					<div class="form-border mg-b20">
						<div class="form-title bolder">对公司贡献</div>
							
							<div class="form-group">
								<label class="control-label">专利加分</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='专利' }">
								<div class="row">
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">发明</span>
											<input type="text" name="patentA" value="${sw.a }" class="form-control"/>
										</div>
									</div>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">使用新型</span>
											<input type="text" name="patentB" value="${sw.b }" class="form-control" />
										</div>
									</div>
									
								</div>
								<div class="row " style="margin-top: 10px;">
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">外观</span>
											<input type="text" name="patentC" value="${sw.c }" class="form-control" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="patentWeight" value="${sw.weightly*100 }" placeholder="1-100" class="form-control" />
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
							
							<div class="form-group">
								<label class="control-label">培训主讲人/参与者</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='培训' }">
								<div class="row">
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">分数</span>
											<input type="text" name="teacherA"  value="${sw.a }" class="form-control"/>
										</div>
									</div>
									<%-- <div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">B</span>
											<input type="text" name="teacherB"  value="${sw.b }" class="form-control" />
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">C</span>
											<input type="text" name="teacherC"  value="${sw.c }" class="form-control" />
										</div>
									</div> --%>
								</div>
								<div class="row " style="margin-top: 10px;">
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="teacherWeight"  value="${sw.weightly*100 }" placeholder="1-100" class="form-control" />
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
							
							<div class="form-group">
								<label class="control-label">经验分享加分</label>
								<c:forEach items="${secondweights }" var="sw">
								<c:choose>
								<c:when test="${sw.secondLevel=='经验库' }">
								<div class="row">
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">每颗星加分</span>
											<input type="text" name="experienceScore" value="${sw.a }" class="form-control"/>
										</div>
									</div>
									
									
									<div class="col-md-4">
										<div class="input-group">
											<span class="input-group-addon">权重</span>
											<input type="text" name="experienceWeight" value="${sw.weightly*100 }" placeholder="1-100" class="form-control" />
										</div>
									</div>
								</div>
								</c:when>
								</c:choose>
								</c:forEach>
							</div>
							
							
							<div class="form-group">
								<label class="control-label">其他权重分配</label>
								
								
								<div class="row">
									<div class="col-md-6">
										<div class="input-group">
										<c:forEach items="${secondweights }" var="sw">
										<c:choose>
										<c:when test="${sw.secondLevel=='标准化' }">
											<span class="input-group-addon">标准化权重</span>
											<input type="text" name="standardWeight" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
										</c:when>
										</c:choose>
										</c:forEach>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="input-group">
											<c:forEach items="${secondweights }" var="sw">
											<c:choose>
											<c:when test="${sw.secondLevel=='其他' }">
											<span class="input-group-addon">其他加分权重</span>
											<input type="text" name="otherWeight" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
											</c:when>
											</c:choose>
											</c:forEach>
										</div>
									</div>
									
								</div>
								
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<div class="input-group">
										<c:forEach items="${secondweights }" var="sw">
											<c:choose>
											<c:when test="${sw.secondLevel=='项目文档' }">
											<span class="input-group-addon">项目文档权重</span>
											<input type="text" name="projectWeight" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
											</c:when>
											</c:choose>
											</c:forEach>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="input-group">
										<c:forEach items="${secondweights }" var="sw">
											<c:choose>
											<c:when test="${sw.secondLevel=='重要信息收集' }">
											<span class="input-group-addon">信息收集权重</span>
											<input type="text" name="importentWeight" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
											</c:when>
											</c:choose>
											</c:forEach>
										</div>
									</div>
									
								</div>
							</div>
							
						<div class="form-border mg-b20">
						<div class="form-title bolder">
							沟通管理（以下部分权重之和为100）
						</div>
							<div class="form-group">
								<label class="control-label">&nbsp;</label>
								<div class="col-md-6">
										<div class="input-group">
										<c:forEach items="${secondweights }" var="sw">
											<c:choose>
											<c:when test="${sw.secondLevel=='工作积极性' }">
											<span class="input-group-addon">工作积极性权重</span>
											<input type="text" name="workExWeight" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
											</c:when>
											</c:choose>
											</c:forEach>
										</div>
									</div>
							</div>
							<div class="form-group">
								<label class="control-label"></label>
								<div class="col-md-6">
										<div class="input-group">
										<c:forEach items="${secondweights }" var="sw">
											<c:choose>
											<c:when test="${sw.secondLevel=='沟通能力' }">
											<span class="input-group-addon">沟通的能力权重</span>
											<input type="text" name="comprehensiveWeitht" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
											</c:when>
											</c:choose>
											</c:forEach>
										</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label"></label>
								<div class="col-md-6">
										<div class="input-group">
										<c:forEach items="${secondweights }" var="sw">
											<c:choose>
											<c:when test="${sw.secondLevel=='工作计划性' }">
											<span class="input-group-addon">工作计划性权重</span>
											<input type="text" name="workPlanWeight" value="${sw.weightly*100 }" placeholder="0-100" class="form-control"/>
											</c:when>
											</c:choose>
											</c:forEach>
										</div>
								</div>
							</div>
						
					</div>
				
				</div>
			</div>
			<div class="main-process mg-b30">
					<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-saved icon-padr"></i>保存</button>
			<!--end the main process area-->
			</div>
			</form>
			<!--start the main process area-->
			</div>
		<script type="text/javascript">
		$(document).ready(function() {
			    /**
			     * 下面是进行插件初始化
			     * 你只需传入相应的键值对
			     * */
			    $('#scoreModelUpdate').bootstrapValidator({
			            message: 'This value is not valid',
			            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
			                valid: 'glyphicon glyphicon-ok',
			                invalid: 'glyphicon glyphicon-remove',
			                validating: 'glyphicon glyphicon-refresh'
			            },
			            fields: {/*验证*/
			               modelName: {   /*键名username和input name值对应*/
			                    message: '模型名称无效',
			                    validators: {
			                        notEmpty: {/*非空提示*/
			                            message: '模型名称不为空'
			                        }
			                    }
			                },
			                designFalutsA: {
			                    message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'A不为空'
			                        }
			                    }
			                },
			                designFalutsB: {
			                    message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'B不为空'
			                        }
			                    }
			                },
			                designFalutsC: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'C不为空'
			                        }
			                    }
			                },
			                designFalutsWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                sillyMiskakeA: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'A不为空'
			                        }
			                    }
			                },
			                sillyMiskakeB: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'B不为空'
			                        }
			                    }
			                },
			                sillyMiskakeC: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'C不为空'
			                        }
			                    }
			                },
			                sillyMiskakeWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                designA: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'A不为空'
			                        }
			                    }
			                },
			                designB: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'B不为空'
			                        }
			                    }
			                },
			                designC: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'C不为空'
			                        }
			                    }
			                },
			                designWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                studyA: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'A不为空'
			                        }
			                    }
			                },
			                /* studyB: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'B不为空'
			                        }
			                    }
			                },
			                studyC: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'C不为空'
			                        }
			                    }
			                }, */
			                studyWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                patentA: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'A不为空'
			                        }
			                    }
			                },
			                patentB: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'B不为空'
			                        }
			                    }
			                },
			                patentC: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'C不为空'
			                        }
			                    }
			                },
			                patentWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                 teacherA: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'A不为空'
			                        }
			                    }
			                },
			               /*  teacherB: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'B不为空'
			                        }
			                    }
			                },
			                teacherC: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: 'C不为空'
			                        }
			                    }
			                }, */
			                teacherWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                experienceScore: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '经验加分不为空'
			                        }
			                    }
			                },
			                experienceWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '权重不为空'
			                        }
			                    }
			                },
			                standardWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '标准化权重不为空'
			                        }
			                    }
			                },
			                otherWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '其他加分权重不为空'
			                        }
			                    }
			                },
			                projectWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '项目文档权重不为空'
			                        }
			                    }
			                },
			                importentWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '重要信息收集权重不为空'
			                        }
			                    }
			                },
			                workExWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '工作积极性权重不为空'
			                        }
			                    }
			                },
			                 comprehensiveWeitht: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '沟通能力权重不为空'
			                        }
			                    }
			                },
			                 workPlanWeight: {
			                	message:'',
			                    validators: {
			                        notEmpty: {
			                            message: '工作计划性权重不为空'
			                        }
			                    }
			                }
			             }   
			        });
			});
		</script>
	</body>
</html>
