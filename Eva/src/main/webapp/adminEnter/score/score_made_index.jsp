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
		<title>管理员-已评分结果展示</title>
		<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="../../css/tz_page.css"/>
		<script src="../../js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/tz_page.js" type="text/javascript" charset="utf-8"></script>
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
			
			/* start main table area*/
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.r_process{font-size:14px;font-family:"微软雅黑";}
			.r_process .form-inline .radio{padding:6px 0;}
			.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";}
			.main-table .r_table table thead tr{background-color:#EEE;}
			.main-table .r_table table th {text-align:center;}
			.main-table .r_table table tr td{text-align:center;}
			tbody tr td.t_td{width:90px;}
			tbody tr td.t_td .t_action{width:74px;margin:0 auto;display:none;}
			tbody tr td.t_td:hover .t_action{display:block;}
			tbody tr td.t_td a{color:#fff;margin:-5px 0;padding:5px;text-decoration:none;}
			tbody tr td.t_td a:hover{background:#2f3437;}
			.a_see{background-color:#6297bc;}
			.a_edit{background-color:#28b779}
			.a_delete{background-color:#ff912f}
			/*end main table area*/
			
			/*start main table process area*/
			.main-table .r_process .form-group .form-control{font-size:12px;height:32px;}
			.main-table .r_process .form-group .btn{font-size:12px;}
			/*end main table process area*/
			
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
			<h3 class="bolder mg-b20">评分结果展示</h3>
			<div class="hr mg-b20"></div>
			<div class="main-table">
			<div class="r_title">
				<i class="glyphicon glyphicon-calendar icon-btton"></i>
				<span class="table-title">评分数据展示</span>
			</div>

				<!--start the table area-->
				<div class="r_table">
				<table class="table ">
					<thead><tr>
						<th>评分名称</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>采用模型</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr></thead>
					<tbody id="tbody">
						<tr>
									<td colspan="6" style="padding:100px;">
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
		var chProject = {
			search:function(){
				  chProject.load(0,5,function(itemcount){
					 chProject.initPage(itemcount);
				 });
				},
			//模板技术查询分页===减少页面的拼接
			load:function(pno,psize,callback){
				//关键词--复合查询
				var keyword = $("#keyword").val();
				var params = {pageNo:pno,pageSize:psize,keyword:keyword};
				//第二种方式,load原理代码
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"scoreAction!getAllOverallScore.action",
					success:function(data){
						$("#tbody").html(data);
						if(callback){
							//需要在模板jsp的tr第一行加data-itemcount--为记录总数
							var itemcount = $("#tbody").find("tr:eq(0)").data("itemcount");
							callback(itemcount);
						}
					}
				});
			},
			//初始化分页
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
						chProject.load(pageNo *psize,psize);
					}
				});
			}
		};
		
		//初始化的时候
		chProject.load(0,5,function(itemcount){
			chProject.initPage(itemcount);
		});
	</script>
	</body>
</html>
