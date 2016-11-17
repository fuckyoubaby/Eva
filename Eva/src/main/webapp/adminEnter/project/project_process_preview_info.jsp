<%@page import="com.changhong.entities.Project"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员项目-过程详情/项目评审</title>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/tz_page.css"/>
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<link href="<%=basePath%>/css/loading.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/animate.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			a{text-decoration: none;outline: none;}
			a:hover{text-decoration: none;}
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.help-text{color:#AEAEAE;display: block;font-size:12px;}
			.help-text a{color:#AEAEAE;text-decoration: none;outline: none;}
			.help-text a:hover{color:#007CB8}
			.clear{clear:both;}
			/*begin 面包屑导航部分*/
			#crumbs ul li{box-sizing:content-box;list-style:none;float:left}
			#crumbs ul li a{display:block;height:32px;/*background:#3498db;*/
				background:#6DC6F2;text-align:center;padding:0 20px 0 40px;line-height:32px;position:relative;margin:0 6px 0 0;font-size:16px;text-decoration:none;color:#fff;}
			#crumbs ul li a:after{content:"";position:absolute;/*border-color:transparent transparent transparent #3498db;*/
			border-color:transparent transparent transparent #6DC6F2;border-width:16px 0 16px 16px;border-style:dashed dashed dashed solid;right:-16px;top:0;z-index:1}
			#crumbs ul li a:before{content:"";
			position:absolute;border-color:transparent transparent transparent #fff;border-width:16px 0 16px 16px;border-style:dashed dashed dashed solid;left:0;top:0;}
			#crumbs ul li:first-child a{border-radius:5px 0 0 5px;padding-left:30px;}
			#crumbs ul li:first-child a:before{display:none;}
			#crumbs ul li:last-child a{border-radius:0 5px 5px 0;}
			#crumbs ul li:last-child a:after{display:none;}
			#crumbs ul li:hover a{background:#007CB8;}
			#crumbs ul li:hover a:after{border-left-color:#007CB8;}
			#crumbs ul li.actived a{background:#007CB8;}
			#crumbs ul li.actived a:after{border-left-color:#007CB8;}
			#crumbs .r_cofig_process{padding-right:15px;}
			#crumbs .r_cofig_process a{font-size:12px;float:right;margin-right:1%;}
			/*end 面包屑导航*/
			
			/* begin main table*/
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";}
			.main-table .r_table table thead tr{background-color:#EEE;}
			.main-table .r_table table tbody tr td:first-child{text-overflow:ellipsis;white-space:nowrap;max-width:110px;overflow:hidden;}
			.word-press{text-overflow:ellipsis;white-space:nowrap;max-width:110px;overflow:hidden;}
			.r_table tbody tr td.t_td{width:90px;}
			.r_table tbody tr td.t_td .t_action{width:74px;margin:0 auto;display:none;}
			.r_table tbody tr td.t_td:hover .t_action{display:block;}
			.r_table tbody tr td.t_td a{color:#fff;margin:-5px 0;padding:5px;text-decoration:none;}
			.r_table tbody tr td.t_td a:hover{background:#2f3437;}
			.a_see{ background-color:#6297bc;}
			.a_edit{background-color:#28b779}
			.a_delete{background-color:#ff912f}
			
			/*end main table*/
			
			/*start more process*/
			.main-more-process{width:98%;margin-left: 1%;margin-top:20px;}
			.icon-padr{padding-right: 5px;}
			/*end more process*/
			a{cursor:pointer;}
			
			#crumbs ul li.completed a{background:#663F90;}
			#crumbs ul li.completed a:after{border-left-color:#663F90;}
			#crumbs ul li.doing a{background:#007CB8;}
			#crumbs ul li.doing a:after{border-left-color:#007CB8;}
			#crumbs ul li.todo:hover a{background:#007CB8;}
			#crumbs ul li.todo:hover a:after{border-left-color:#007CB8;}
			
			.r_table table th.p-hover:hover{cursor:pointer;}
			.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
			.r_table table th:hover i.icon-hidden{visibility: visible;}
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
	<% Project project = (Project)session.getAttribute("project"); %>
		<div class="container">
			<div class="page-header h3 mg-b30"><a href="${basePath}/projectAction!getProjectById.action?projectId=${project.projectId}"><%=project.getProjectName() %></a></div>
			<div class="row mg-b15">
				<div class="col-md-2">编号</div>
				<div class="col-md-4"><%=project.getProjectId() %></div>
			</div>
			<div class="row mg-b30">
				<div class="col-md-2">阶段</div>
				<div class="col-md-4">${phase.phaseName }</div>
			</div>
			<div class="row hr mg-b30"></div>
			<div class="h4 ">项目评审展示</div>
			<span class="help-text mg-b30">点击查看评审阶段问题</span>
		<div id="crumbs" class="row mg-b15" data-indexno='${indexNo}'>
				<ul>
					<c:forEach items="${reviews }" var="review" varStatus="status">
						<li data-review="${review.reviewId}" ${(review.reviewId==indexNo)?'class="actived"':''}>
							<a onclick="reviewToggle(this)" >${review.reviewName }</a>
						</li>
						<%-- <c:choose>
   							<c:when test="${review.priority<project.review.priority}">  
               					<li class="todo"><a onclick="getByPhase(${review.reviewId});">${review.reviewName }</a></li>
						   </c:when>
						   <c:when test="${review.priority==project.review.priority}">  
               					<li class="doing"><a onclick="getByPhase(${review.reviewId});">${review.reviewName }</a></li>
						   </c:when>
						   <c:otherwise> 
						  	 <li class="todo"><a href="javascript:volid(0);">${phase.phaseName }</a></li>
   						   </c:otherwise>
						</c:choose> --%>
					</c:forEach>
				</ul>
				<div class="clear"></div>
				<!-- <div class="r_cofig_process"><a href="project_evaluation_config.html">配置项目评审</a></div> -->
			</div>
			<div class="main-table">
				<div class="r_title">
					<i class="glyphicon glyphicon-calendar icon-btton"></i>
					<span class="table-title">项目评审数据展示</span>
				</div>
				<!--start the table info area-->
				<div class="r_table">
					<table class="table">
						<thead><tr>
							<th>设计规定</th>
							<th>流程规定</th>
							<th>工作计划差</th>
							<th>沟通低效</th>
							<th>工作积极性</th>
							<th>扣分说明</th>
							<th class="p-hover" data-colname='createTime'>创建时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
							<th>责任人</th>
							<th>操作</th>
						</tr></thead>
						<tbody id="tbody">
								<tr>
									<td colspan="9" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>/images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
						</tbody>
					</table>
					<div class="page"></div>
					<div class="clear"></div>
				<!--end the table area-->
				</div>
			<!--end the main table area-->
			</div>
			<!--start more process-->
			<div class="main-more-process">
				<span class="help-text mg-b15"><a href="javasc:void(0);">更多操作>></a></span>
				<div class="row mg-b30" style="padding-left:85px;">
					<a href="projectReviewAction!addProblem.action?phaseId=${phase.phaseId}" class="btn btn-info" ><i class="glyphicon glyphicon-plus icon-padr"></i>添加新问题</a>
					<a href="javascript:void(0);" onclick="importProblem();" class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-export icon-padr"></i>批量导入问题</a>
				</div>
			<!--end more process-->
			</div>
		
		</div>
	<script type="text/javascript">
		var index =   $("#crumbs").data("indexno")*1;
		var reviewId;
		var phaseId = '${phaseId}'*1;
		var chUser = {
		 orderby:function(orders){
				chUser.orders = orders;
				chUser.load(0,5,function(itemcount){
					chUser.initPage(itemcount);
		    	});
		    },
			search:function(){
				  chUser.load(0,5,function(itemcount){
					 chUser.initPage(itemcount);
				 });
				},
			//模板技术查询分页===减少页面的拼接
			load:function(pno,psize,callback){
				//var pid = $("#province").val();
				var params = {pageNo:pno,pageSize:psize,phaseId:phaseId};
				if(chUser.orders){$.extend(params,chUser.orders);}
				//第二种方式,load原理代码
				$.ajax({
					type:'post',
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:'${basePath}/projectReviewAction!getPRItemsByPhaseId.action',
					success:function(data){
						$("#tbody").html(data);
						if(callback){
							var itemcount = $("#tbody").find("tr:eq(0)").data("itemcount");
							callback(itemcount);
						}
					}
				});
			},
			initPage:function(itemcount){
				$(".page").tzPage(itemcount, {
					num_edge_entries : 1, //边缘页数
					num_display_entries :4, //主体页数
					num_edge_entries:4,
					current_page:0,
					items_per_page : 5, //每页显示X项
					prev_text : "前一页",
					next_text : "后一页",
					callback : function(pageNo,psize){
						chUser.load(pageNo *psize,psize);
					}
				});
			}
		};
		function initLoading(){
			var $crumb = $("#crumbs");
			var $li_first = $crumb.find("ul li:first");
			console.log("indexNo--"+index);
			if(index==0){
				$li_first.addClass("actived");
			}
			reviewId=$li_first.data("review");
		};
		//初始化的时候
		initLoading();
		chUser.load(0,5,function(itemcount){
			chUser.initPage(itemcount);
		});
		
		function reviewToggle(obj){
			var $link = $(obj);
			var $li= $link.parent();
			$li.addClass("actived").siblings().removeClass("actived");
			reviewId = $li.data("review");
			var targetIndex = reviewId*1;
			var url = '${basePath}/problemAction!getReviewByPhaseId.action?phaseId=${phaseId}&indexNo=';
			if(index==0){
				if(targetIndex==1) return;
				window.location.href=url+targetIndex;
				return;
			}else{
				if(targetIndex!=index){
					window.location.href=url+targetIndex;
				}					
			}
		};
		
		function importProblem(){
			var reviewName = $("li.actived").find("a").text();
			var phaseId="${phase.phaseId}";
			var phaseName="${phase.phaseName}";
			var paramValue="phaseId="+phaseId+"&phaseName="+phaseName+"&reviewId="+reviewId+"&reviewName="+reviewName;
			var uri = "${basePath}/adminEnter/project/projectReview_mistake_batchImport.jsp?"+paramValue;
			window.location.href=uri;
		};
		
		function deleteProRew(obj){
			var hrefUrl = $(obj).data("purl");
			console.log(hrefUrl);
			var r = confirm("确认删除此记录？");
			if(r){
				window.location.href=hrefUrl;
			}
		};
		
		$(function(){
			$(".table th").find("i.icon-hidden").parent().on("click",function(){
				var orderName = $(this).data("colname"),
				ordertype = $(this).data("ordertype"),
				opts={};
				if(ordertype){ordertype=(ordertype=='asc')?'desc':'asc';}
				else{ordertype='desc';}
				$(this).data("ordertype",ordertype);
				if(!orderName) return;
				if(orderName){opts.orderName=orderName;}
				if(ordertype){opts.orderType=ordertype;}
				chUser.orderby(opts);
			});
		});
	</script>
	
	</body>
</html>