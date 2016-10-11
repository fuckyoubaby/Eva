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
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
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
	</head>
	<body>
		<div class="container">
			<h3 class="bolder mg-b20">经验分享修改</h3>
			<div class="hr mg-b20"></div>
			<div class="row">
			<form action="experienceAction!update.action" method="post" class="form-content">
				<div class="col-md-6">
					<div class="form-border">
						<div class="form-title">基本信息</div>
						
						<div class="form-group">
							<label class="control-label">分项名称</label>
							<input type="text" name="experienceName" class="form-control" value="${experience.experienceName }"/>
						</div>
						<!-- <div class="form-group">
							<label  class="control-abel">涉及项目</label>
							<div class="form-control-static"><a href="javascript:void(0);"></a></div>
						</div> -->
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
								<!-- 	<select name="area" class="form-control" style="display:none">
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
							<label  class="control-abel">分类</label>
							<!--三级分类-->
							<div class="row">
								<div class="col-md-4">
									<select name="experienceClassify" class="form-control">
										<option value="${experience.classify.classifyId }">${experience.classify.classifyName }</option>
										<c:forEach items="${classifies }" var="classify">
											<option value="${classify.classifyId }">${classify.classifyName }</option>
										</c:forEach>
						                <!-- <option value="Tuner/高频头">Tuner/高频头</option>
						                <option value="接口">接口</option>
						                <option value="主芯片">主芯片</option>
						                <option value="存储器" selected="selected">存储器</option>
						                <option value="在板电源">在板电源</option>
						                <option value="PCB">PCB</option>
						                <option value="分类器件">分类器件</option>
						                <option value="分板/模板">分板/模板</option>
						                <option value="测试/认证">测试/认证</option> -->
									</select>
								</div>
								<!-- <div class="col-md-4">
									<select name="classify-2"  class="form-control">
										<option value="">Memory</option>
										<option value="" selected="selected">Flash</option>
									</select>
								</div>
								<div class="col-md-4">
									<select name="classify-3"  class="form-control">
										<option value="" >Parallel Nor</option>
										<option value="" >Serial Nor</option>
										<option value="" >SLC Nand</option>
										<option value="" >Parallel Nor</option>
										<option value="" selected="selected">MLC Nand</option>
										<option value="" >Emmc</option>
									</select>
								</div> -->
							</div>
						</div>
						<!--<div class="form-group">
							<label  class="control-abel">主芯片</label>
							<div class="form-control-static">Amlogic S805</div>
						</div>-->
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
							<%-- <div class="form-group">
								<label class="control-label">文件路径</label>
								<div class="input-group">
									<input readonly="readonly"  type="text" class="form-control" value="${experience.expUrl }" />
									<div class="input-group-btn">
										<button type="button" class="btn btn-default">移除</button>
									</div>
								</div>
							</div> --%>
							<div class="form-group">
								<label class="control-label">已经上传的文件</label>
								<label class="control-label">${experience.exUrl }</label>
								<div class="form-control-static">
									<input name="fileurl" type="file" value="${experience.exUrl }"/>
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
