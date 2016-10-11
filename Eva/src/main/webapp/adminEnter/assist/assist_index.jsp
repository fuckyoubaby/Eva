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
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
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
<script src="<%=basePath%>/js/chosen.jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	 .assist-index{width: 800px;height: 500px; margin: 10px 100px 100px 70px;} 
	 .table{margin: 10px auto; } 
	/*--start 表头排序--*/
			/* .r_table table th.p-hover:hover{cursor:pointer;}
			.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
			.r_table table th:hover i.icon-hidden{visibility: visible;} */
			/*--end 标头排序--*/
			/* tbody tr td.t_td{width:90px;}
			tbody tr td.t_td .t_action{width:74px;margin:0 auto;display:none;}
			tbody tr td.t_td:hover .t_action{display:block;}
			tbody tr td.t_td a{color:#fff;margin:-5px 0;padding:5px;text-decoration:none;}
			tbody tr td.t_td a:hover{background:#2f3437;} */
		a{cursor: pointer;}
		
		.r_table table th.p-hover:hover{cursor:pointer;}
		.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
		.r_table table th:hover i.icon-hidden{visibility: visible;}
</style>
</head>
<body onload="getLi()">
	<div class="content">
		<div class="assist-index">
			<ul class="nav nav-tabs" id="parent">
				
				<li class="active">
					<a href="#patent-form-tab" data-toggle="tab">专利</a>
				</li>
				<li >
					<a href="#order-form-tab" data-toggle="tab">订单</a>
				</li>
				<li >
					<a href="#other-form-tab" data-toggle="tab">其他</a>
				</li>
				
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="patent-form-tab">
					<div class="r_table">
						<table class="table table-bordered ">
							<thead>
								<tr>
									<th>专利编号</th>
									<th>专利名称</th>
									<th>专利类型</th>
									<th>专利作者</th>
									<th>时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_patent">
								<tr>
									<td colspan="6" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page_div">
							<div class="patent_page"></div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="order-form-tab">
					<div class="r_table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th class="p-hover" data-colname='orderId'>订单名称<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
									<th class="p-hover" data-colname='num'>订单数量<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
									<th class="p-hover" data-colname='employee.id'>负责人<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
									<th class="p-hover" data-colname='date'>时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_order">
								<tr>
									<td colspan="5" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page-search">
							<div class="order_page"></div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="other-form-tab">
					<div class="r_table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>加分类别</th>
									<th>分数</th>
									<th>员工</th>
									<th>时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_other">
								<tr>
									<td colspan="5" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="page-search">
							<div class="other_page"></div>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="main-process">
						<a href="assistAction!getAllEmployee.action" class="btn btn-info"><i class="glyphicon glyphicon-plus icon-padr"></i>新增加分项</a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		//
		var liValue = 0;
		function getLi()
		{ //alert("getli");
		
			//var resultType = ${resultType };
			//alert(resultType);
			var resultType = 0;
			
			
			//resultType = ${resultType };
			var ul = document.getElementById('parent');
			var lis = ul.getElementsByTagName('li');
			/* var ul = doucument.getElementById('parent');
			var lis = ul.getElementByTagName('li'); */
		// alert(lis);
			for(var i=0;i<lis.length;i++){
			 	lis[i].index = i;
				lis[i].onclick = function()
				{
					liValue = this.index;
					chUser.search();
				}
			}
		}
		
	
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
				var keyword = $("#keyword").val();
				$("input[type=radio]:checked").val();
				var params = {pageNo:pno,pageSize:psize,keyword:keyword};
				if(chUser.orders){$.extend(params,chUser.orders);}
				//第二种方式,load原理代码
				if(liValue==1)
				{
					$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"assistAction!getOrderByPage.action",
					success:function(data){
						$("#tbody_order").html(data);
						if(callback){
							var itemcount = $("#tbody_order").find("tr:eq(0)").data("itemcount");
							//var itemcount = $("#tbody_order").("tr:eq(0)").data("itemcount");
							callback(itemcount);
						}
					}
					});
				}else if(liValue==2)
				{
					$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"assistAction!getAssistByPage.action",
					success:function(data){
						$("#tbody_other").html(data);
						if(callback){
							var itemcount = $("#tbody_other").find("tr:eq(0)").data("itemcount");
							callback(itemcount);
						}
					}
					});
				}else{
					$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"assistAction!getPatentByPage.action",
					success:function(data){
						$("#tbody_patent").html(data);
						if(callback){
							var itemcount = $("#tbody_patent").find("tr:eq(0)").data("itemcount");
							callback(itemcount);
						}
					}
					});
				}
				
			},
			initPage:function(itemcount){
				if(liValue==1)
				{
					$(".order_page").tzPage(itemcount, {
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
				}else if(liValue==2)
				{
					$(".other_page").tzPage(itemcount, {
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
				}else 
				{ 
					$(".patent_page").tzPage(itemcount, {
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
				
			}
		};
		
		//初始化的时候
		chUser.load(0,5,function(itemcount){
			chUser.initPage(itemcount);
		});
		
		$(function(){
			$(".table th").find("i.icon-hidden").parent().on("click",function(){
				
				liValue = 1;
				
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
		
		function deletePatent(a)
		{
			liValue = 0;
			$.ajax({
					type:"post",
					//配置请求地址，返回结果是jsp模板页面
					url:"assistAction!deletePatent.action?patentId="+a,
					success:function(data){
						chUser.search();
					}
					});
		}
		
		function deleteOrder(a)
		{
			liValue = 1;
			$.ajax({
					type:"post",
					//配置请求地址，返回结果是jsp模板页面
					url:"assistAction!deleteOrder.action?orderId="+a,
					success:function(data){
						chUser.search();
					}
					});
		}
		function deleteOther(a)
		{
			liValue = 2;
			$.ajax({
					type:"post",
					//配置请求地址，返回结果是jsp模板页面
					url:"assistAction!deleteOther.action?assistId="+a,
					success:function(data){
						chUser.search();
					}
					});
		}
		</script>
</body>
</html>
