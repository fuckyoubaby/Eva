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
		<title>管理员-评分模型页面</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="../../css/tz_page.css"/>
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.clear{clear: both;}
			
			/* start main table */
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			/*end main table*/
			/*start main atble process area*/
			.main-table .r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.main-table .r_process ul{padding-left:0;}
			.main-table .r_process ul li{list-style:none;float:left;background:#999;margin:0 10px 0 0;box-sizing:content-box;}
			.main-table .r_process ul li a{font-size:12px;display:block;padding:8px 20px;color:#fff;}
			.main-table .r_process ul li a:hover{background:#28b779;}
			.main-table .r_process ul li.actived a{background:#28b779;}
			/*end main table process area*/
			/*start main table table area*/
			.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";}
			.main-table .r_table table thead tr{background-color:#EEE;}
			/*--start 表头排序--*/
			.r_table table th.p-hover:hover{cursor:pointer;}
			.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
			.r_table table th:hover i.icon-hidden{visibility: visible;}
			/*--end 标头排序--*/
			tbody tr td.t_td{width:90px;}
			tbody tr td.t_td .t_action{width:74px;margin:0 auto;display:none;}
			tbody tr td.t_td:hover .t_action{display:block;}
			tbody tr td.t_td a{color:#fff;margin:-5px 0;padding:5px;text-decoration:none;}
			tbody tr td.t_td a:hover{background:#2f3437;}
			.a_see{ background-color:#6297bc;}
			.a_edit{background-color:#28b779}
			.a_delete{background-color:#ff912f}
			/*end main table table area*/
			
			/*start main table footer*/
			.main-table .r_footer{width:98%;margin-left:1%;margin-bottom:15px;}
			.main-table .r_footer a{font-size:12px;}
			/*end main table footer*/
			
			/*start main process area*/
			.main-process{padding:15px;}
			.main-process a.btn-title{text-decoration:none;color:#ccc;}
			.main-process a.btn-title:hover{color:#282828;}
			.main-process a.btn-info{margin-left:75px;font-size:12px;}
			.icon-padr{padding-right: 5px;}
			.icon-padr10{padding-right:12px}
			/*end main process area*/
		</style>
		<script type="text/javascript">
			function modedelete(){
				obj = document.getElementsByName("chkName");
				chkName = [];
				for(k in obj){
					if(obj[k].checked)
					chkName.push(obj[k].value);
				
				}
				var formDom = document.getElementById("dele_pro");
				formDom.submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			
		<div class="page-header h3">评分模型</div>
		<!--start the main table area-->
		<div class="main-table">
			<div class="r_title">
				<i class="glyphicon glyphicon-calendar icon-btton"></i>
				<span class="table-title">评分模型展示</span>
			</div>
			<!--start table process area-->
				<div class="r_process">
					<!-- <ul class="clearfix">
						<li class="actived"><a href="#"><i class="glyphicon glyphicon-flag"></i><span>
							早期的
						</span></a></li>
						<li><a href="#"><i class="glyphicon glyphicon-tag"></i><span>
							近期的
						</span></a></li>
					</ul> -->
				<!--end the table process area-->
				</div>
			<div class="r_table">
			<form id="dele_pro" action="modeAction!mulDelete.action" method="post">
				<table class="table ">
					<thead><tr>
						<th>选中</th>
						<th class="p-hover" data-colname='modeName'>名称<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='createTime'>时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='employee.id'>创建人<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th>操作</th>
					</tr></thead>
					<tbody id="tbody">
								<tr>
									<td colspan="5" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
					</tbody>
				</table>
				<!--start table footer area-->
					<div class="r_footer row">
					<div class="col-md-6">
						<div class="r_delete pull-left">
							<a onclick="modedelete()" class="btn btn-info">删除所选</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="col-md-6">
						<div class="page"></div>
						<div class="clear"></div>
					</div>
				<!--end table footer area-->
				</div>
				</form>
			<!--end the table area-->
			</div>
		<!--end the main table area-->
		</div>
		
		<!--start the main process area-->
		<div class="main-process">
			<div><a href="javascript:void(0);" class="btn-title">更多操作&gt;&gt;</a></div>
				<!-- <a href="score_model_add_mode.jsp" class="btn btn-info"><i class="glyphicon glyphicon-plus icon-padr"></i>新增模型</a> -->
				<a href="score_model_add.jsp" class="btn btn-info"><i class="glyphicon glyphicon-plus icon-padr"></i>新增模型</a>
		<!--end the main process area-->
		</div>
		
	  </div>
	  <script type="text/javascript">
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
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"modeAction!getModesByPage.action",
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
		
		//初始化的时候
		chUser.load(0,5,function(itemcount){
			chUser.initPage(itemcount);
		});
		function searchKeyword(){chUser.search();}
		$(function(){
			$(".table th.p-hover").on("click",function(){
				var orderName = $(this).data("colname"),
				ordertype = $(this).data("ordertype"),
				opts={};
				if(ordertype){ordertype=(ordertype=='asc')?'desc':'asc';}
				else{ordertype='desc';}
				$(this).data("ordertype",ordertype);
				if(!orderName) return;
				if(orderName){opts.orderName=orderName;}
				if(ordertype){opts.orderType=ordertype;}
				/* console.log(orderName+"--"+ordertype);
				return;  */
				chUser.orderby(opts);
			});
		});
	</script>
	</body>
</html>
