<%@page import="com.changhong.entities.Project"%>
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
		<title>管理员项目-过程详情</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
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
		</style>
	</head>
	<body>
	<%-- <% Project project = (Project)session.getAttribute("project"); %> --%>
		<div class="container">
			<div class="page-header h3 mg-b30">${project.projectName }</div>
			<div class="row mg-b15">
				<div class="col-md-2">编号</div>
				<%-- <div class="col-md-4"><%=project.getProjectId() %></div> --%>
				<div class="col-md-4">${project.projectId }</div>
			</div>
			<div class="row mg-b30">
				<div class="col-md-2">阶段</div>
				<%-- <div class="col-md-4"><%=project.getReview().getPhase().getPhaseName() %>--<%=project.getReview().getReviewName() %></div> --%>
				<div class="col-md-4">${project.review.phase.phaseName }--${project.review.reviewName}</div>
			</div>
			<div class="row hr mg-b30"></div>
			<div class="h4 ">项目评审展示</div>
			<span class="help-text mg-b30">点击查看评审阶段问题</span>
			<div id="crumbs" class="row mg-b15" data-indexno='${indexNo}'>
				<ul>
					<c:forEach items="${reviews}" var="review" varStatus="status">
						<li data-review="${review.reviewId}" ${(review.reviewId==indexNo)?'class="actived"':''}>
							<a onclick="reviewToggle(this)" >${review.reviewName }</a>
						</li>
					</c:forEach>
				</ul>
				<div class="clear"></div>
				
			</div>
			<div class="main-table">
				<div class="r_title">
					<i class="glyphicon glyphicon-calendar icon-btton"></i>
					<span class="table-title">电路评审数据展示</span>
				</div>
				
				<!--start the table info area-->
				<div class="r_table">
					<table class="table">
						<thead><tr>
							<th>问题名称</th>
							<th>问题级别</th>
							<th>问题状态</th>
							<th>问题类型</th>
							<th>所属</th>
							<th>责任人</th>
							<th>操作</th>
						</tr></thead>
						<tbody id="tbody">
							<!-- 内容 -->
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
			</div>
		
		</div>
	<script type="text/javascript">
	    var index = $("#crumbs").data("indexno")*1;
	    var reviewId;
		var chUser = {
			search:function(){
				  chUser.load(0,5,function(itemcount){
					 chUser.initPage(itemcount);
				 });
				},
			//模板技术查询分页===减少页面的拼接
			load:function(pno,psize,callback){     
			    //var keyword = $("#keyword").val();
				$("input[type=radio]:checked").val();
				var params = {pageNo:pno,pageSize:psize,reviewId:reviewId};   //刚开始的时候reviewId并没有传递下去，所以projectId也传不下去
				//第二种方式,load原理代码
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"problemAction!getProblemsByReviewForUser.action",
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
			reviewId = $li.data("review");     //data_review是为了取得这个值
			var targetIndex = reviewId*1;
			var url = '<%=basePath %>/problemAction!getReviewByPhaseIdForUser.action?phaseId=${phaseId}&&projectId=${project.projectId}&&indexNo=';
			if(index==0){
				if(targetIndex==1) return;
				window.location.href=url+targetIndex;
				return;
			}else{
				if(targetIndex!=index){
					window.location.href=url+targetIndex;
					return;
				}					
			}
		};
		
		//使用form的这这种方式可以，message的这种方式可以
		$(document).ready(function(){
		    var arr_li_html = [];
		    var projectName = '${project.projectName}';
			var indexNo = '${indexNo}';
			var phaseId = '${phaseId}';    //${phase.phaseId}取不到值
			var reviewId = '${reviewId}';
			var reviewByIdName = '${reviewById.reviewName}';     //取不到值,不是只在form下才能取到，projectName能取到
			//alert("phaseId="+phaseId);
			//alert("indexNo="+indexNo);
			//alert("reviewId="+reviewId);
			//alert("reviewByIdName="+reviewByIdName);
			//alert("projectName="+projectName);
			 $("#crumbs").each(function(){
                  arr_li_html.push($(this).html());
             });
             //alert(arr_li_html.toString());
             //alert("phaseId="+phaseId);
		});
	</script>
	
	</body>
</html>
