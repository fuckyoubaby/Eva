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
		<title>其他项主页</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		.clear{clear:both}
		/*start 表格区域*/
		.main-table{width:98%;margin-left:1%;background:#fff;border:1px solid #ccc}
		.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
		.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
		.icon-btton{display:inline-block;width:40px;height:38px;border-right:1px solid #ccc;line-height:38px;text-align:center;}
		.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
		.r_process .form-center{width:250px;margin:0 auto;}
		.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";}
		.main-table .r_table table thead tr{background-color:#EEE;}
		/*--start 表头排序--*/
		.r_table table th.p-hover:hover{cursor:pointer;}
		.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
		.r_table table th:hover i.icon-hidden{visibility: visible;}
		/*--end 表头排序--*/
		/*end 表格区域*/
		a{cursor:pointer;}

		</style>
	</head>
	<body>
		<div class="contianer">
			<div class="main-table">
			<div class="r_title">
				<i class="glyphicon glyphicon-calendar icon-btton"></i>
				<span class="table-title">考试数据展示</span>
			</div>
			<!--start the search area-->
			<div class="r_process">
				<form class="form-inline form-center" >
					<div class="form-group">
						<input type="text" name="keyword" id="keyword" class="form-control" placeholder="输入培训名称"/>
					</div>
					<div class="form-group">
						<input type="button" onclick="searchKeyword()" class="btn btn-primary" value="GO"/>
					</div>
				</form>
			<!--end the search area-->
			</div>
			
			<!--start the table info area-->
			<div class="r_table">
				<table class="table ">
					<thead><tr>
						<th class="p-hover" data-colname='exam.examId'>序号<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='exam.examName'>竞赛名称<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='exam.examTime'>时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='exam.organizer'>组织人员<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<!-- <th>级别</th> -->
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
				<div class="page-search">
					<div class="page"></div>
					<div class="clear"></div>
				</div>
			<!--end the table area-->
			</div>
		<!--end the main table area-->
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
				var params = {pageNo:pno,pageSize:psize,keyword:keyword};
				if(chUser.orders){$.extend(params,chUser.orders);}
				//第二种方式,load原理代码
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"examAction!getExamByPageAndEmployeeId.action",
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
		function searchKeyword(){chUser.search();};
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
				/* console.log(orderName+"---"+ordertype);
				return; */
				chUser.orderby(opts);
			});
		});
		document.onkeydown=function(){
				if(event.keyCode==13)
				{
					chUser.search();
					return false;
				}
		}; 
	</script>
	</body>
</html>
