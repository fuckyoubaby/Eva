<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<jsp:useBean id="now" class="java.util.Date" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>项目-流程-评审问题批量录入</title>
		<link rel="stylesheet" href="${basePath}/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/webuploader.css"/>
		<script src="${basePath}/js/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/webuploader.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<link href="${basePath}/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/css/loading.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/animate.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			.mg-b15{margin-bottom:15px}
			.mg-b20{margin-bottom:20px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc;width:70%;min-width:820px;}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.icon-padr{padding-right: 5px;}
			.icon-padl{padding-left:5px;}
			.bolder{font-weight:700}
			.clear{clear:both;}
			
			.table{width:70%;min-width:800px;}
			.td-file-name{text-overflow: ellipsis;}
			tr td:first-child{width:60px;}
			div.del{cursor:pointer;color:#337ab7}
			div.del:hover{font-weight:700;text-decoration:underline}
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
			<h3 class="bolder mg-b20">${project.projectName}评审问题批量录入</h3>
			<div class="hr mg-b15"></div>
			<div class="mg-b15">要导入的评审：${param.phaseName} / ${param.reviewName}
			</div>
			<div class="hr mg-b15"></div>	
			<div class="wu-example mg-b15" id="uploader">
				<p class="help-text">点击按钮选择文件，进行上传</p>
				<!--用于存放文件信息-->
				<div id="thelist" class="uploader-list"></div>
				<div class="btns">
					<div id="picker">选择文件</div>
					<button id="ctlBtn" class="btn btn-default"><i class="glyphicon glyphicon-export icon-padr"></i>开始上传</button>
				</div>
			</div>
			<div class="hr mg-b15"></div>
			<div class="table-show">
				<p class="help-text">已保存的上传文件展示</p>
				<div>
					<table class="table">
						<thead>
							<tr>
								<th>选中</th>
								<th>文件名</th>
								<th>大小</th>
								<th>创建日期</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="data-body"  >
							<tr>
								<td ><input type="radio" name="fileSeledctd" id="fileSeledctd" value="" /></td>
								<td class="td-file-name"><img src="${basePath}/images/excel-icon2.png" width="21" height="21">通讯录.xls</td>
								<td>12KB</td>
								<td>2016-8-12</td>
								<td>
									<div class="t_action">
										<a href="#" class="a_see glyphicon glyphicon-save" title="下载" ></a>
										<a href="#" class="a_delete glyphicon glyphicon-trash" title="删除"></a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="hr mg-b15"></div>
					<div class="form-inline mg-b15"> 
						<label for="modifyDate">评审时间</label>
						<div class="input-group">
							<input type="text" class="form-control" id="modifyDate" name="modifyDate" readonly="readonly" 
							placeholder="选取日期" style="cursor:not-allowed"/>
							<span class="input-group-addon" onclick="WdatePicker({el:'modifyDate',dateFmt:'yyyy-MM-dd',realDateFmt:'yyyy-MM-dd',minDate:'${minDate}',maxDate:'${maxDate}'})">
								<i class="glyphicon glyphicon-time"></i>
							</span>
						</div>
					</div>
					<div class="menu-lists">
						<button type="button" id="import-btn" class="btn btn-info" onclick="importFile()">批量添加</button>
					</div>
				</div>
			</div>	
		</div>
		<script type="text/javascript">
			    var $ = jQuery,
		        $list = $('#thelist'),
		        $btn = $('#ctlBtn'),
		        state = 'pending',
		        phaseId='${param.phaseId}',
		        reviewId='${param.reviewId}',
		        uploader;
			 //   var examId=${param.examId};
		
			var uploader = WebUploader.create({
				//swf文件路径
				swf:'${baePath}/js_webuploader/Uploader.swf',
				//文件接收服务端
				server: '${basePath}/fileUploadAction!uploadFile.action',
				
				//选择文件的按钮，可选。
				//内部根据当前运行时创建，可能是input元素，也可能是flash
				pick:{
					id:'#picker',
					multiple:false
				},
				
				//不压缩image,默认如果是jpeg，文件上传前会压缩一把再上传
				resize:false,
				
				//只允许接收EXCEL文件
			 	accept:{
					title:'excel',
					extensions:'xls,xlsx',
					mimeTypes:'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel'
				},
				formData:{
					itemName:'problem\\project'
				}
			});
			//当有文件被添加进入队列的时候
			uploader.on('fileQueued',function(file){
				$list.append('<div id="'+file.id+'" class="item">'+
				'<h4 class="info">' + file.name + '</h4>' +
				'<p class="state">等待上传...</p>'+
				'<div class="del">移除</div>'+
				'</div>');
			});
			//文件上传进度事件处理
			uploader.on('uploadProgress',function(file, percentage){
				var $li = $('#'+file.id),
					$percent = $li.find('.progress .progress-bar');
					if(!$percent.length){
						$percent = $('<div class="progress progress-striped active">'+
							'<div class="progress-bar" role="progressbar" style="width:0%">'+
							'</div>'+
							'</div>').appendTo($li).find('.progress-bar');
					}
					$li.find('p.state').text('上传中'+percentage+'%');
					$percent.css('width',percentage*100+'%');
			});
			//文件上传事件
			uploader.on('uploadSuccess',function(file){
				$('#'+file.id).find('div.del').hide();
				$('#'+file.id).find('p.state').text('已上传');
			});
			uploader.on('uploadAccept',function(object, ret){
				printJSON(ret._raw);
			});
			
			//文件上传失败事件
			uploader.on('uploadError',function(file){
				$('#'+file.id).find('p.state').text('上传出错');
			});
			//文件上传完成
			uploader.on('uploadComplete',function(file){
				$('#'+file.id).find('.progress').fadeOut("slow");
				loadData('${basePath}/fileUploadAction!listSavedFiles.action');
			});
			//状态监视
			 uploader.on( 'all', function( type ) {
			        if ( type === 'startUpload' ) {
			            state = 'uploading';
			        } else if ( type === 'stopUpload' ) {
			            state = 'paused';
			        } else if ( type === 'uploadFinished' ) {
			            state = 'done';
			        }

			        if ( state === 'uploading' ) {
			            $btn.text('暂停上传');
			        } else {
			            $btn.text('开始上传');
			        }
			    });

			    $btn.on( 'click', function() {
			        if ( state === 'uploading' ) {
			            uploader.stop();
			        } else {
			            uploader.upload();
			        }
			    });
			    $list.on("click", ".del", function () {
		            var $ele = $(this);
		            var id = $ele.parent().attr("id");
		            $.each(uploader.getFiles(), function (index, item) {
		                if (item && item.id === id) {
		                	uploader.removeFile(uploader.getFile(id));//不要遗漏
		                    return;
		                }
		            });
		            $ele.parent().remove();
		        });
			    
			    
			    function printJSON(json){
					 if(json){
						if(typeof json === 'string'){
							console.log(json);
						}else if(json instanceof Array){
			    			for(var i=0; i<json.length;i++){
			    				printJSON(json[i]);
			    			}
			    		}else{
			    			for(var k in json){
			    				printJSON(json[k]);
				    		}
			    		}
			    	}  
			    };
			    var listFileUrl='${basePath}/fileUploadAction!listSavedFiles.action';
			    var deleteFileUrl='${basePath}/fileUploadAction!deleteFile.action';
			    var importFileUrl='${basePath}/fileUploadAction!projectProblemImport.action';
			    function loadData(url,datas,callback){
			    	var $tbody = $("#data-body");
			    	var params = {itemName:'problem\\project'};
			    	if(datas){$.extend(params, datas);}
			    	$.ajax({
			    		type:"post",
			    		data:params,
			    		url:url,
			    		success: function(data){
			    			if(!callback){
			    				$tbody.html(data);
			    			}else{
			    				callback(data);
			    			}
			    		}
			    	});
			    };
			    
			    loadData(listFileUrl);
			    function deleteFile(obj){
			    	var filename = $(obj).parent().data("filename");
			    	console.log(filename);
			    	var datas ={deleFileName:filename};
			    	loadData(deleteFileUrl,datas,function(data){
			    		var json;
			    		if(!data.result){
			    			json = eval('('+data+')');
			    		}else json = data;
			    		printJSON(json);
			    		if(json.result=='success'){
			    			loadData(listFileUrl);
			    			alert(json.msg);
			    		}else alert(json.msg);
			    	});
			    };
			    function importFile(){
			    	var importFileName = $("input[name=chooseName]:checked").val();
			    	var modifyDate = $("#modifyDate").val();
			    	if(!importFileName ){ 
			    		$("input[name=chooseName]").focus();
			    			return;
			    	}
			    	if(!modifyDate){
			    		$("#modifyDate").focus();
			    		return;
			    	}
			    	var datas ={importFileName:importFileName,modifyDate:modifyDate};
			    	$("#import-btn").attr("disabled","disabled").text("处理中..."); 
			    	loadData(importFileUrl,datas,function(data){
			    		var json;
			    		if(!data.result){
			    			json = eval('('+data+')');
			    		}else json = data;
			    		printJSON(json);
			    		myLoading({data:json.msg});
			    		$("#import-btn").removeAttr("disabled").text("批量添加");
			    	});
			    };
			 
		</script>
	</body>
</html>
