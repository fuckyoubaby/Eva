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
		<title>管理员项目主页面</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.clear{clear:both;}
			/* start 表格区域*/
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.r_process{font-size:14px;font-family:"微软雅黑";}
			.r_process .form-inline .radio{padding:6px 0;}
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
			/*end 表格区域*/
			/*start main process area*/
			.main-process{padding:15px;}
			.main-process a.btn-title{text-decoration:none;color:#ccc;}
			.main-process a.btn-title:hover{color:#282828;}
			.main-process a.btn-info{margin-left:75px;font-size:14px;}
			.icon-padr{padding-right: 5px;}
			.icon-padr10{padding-right:12px}
			/*end main process area*/
		</style>
	</head>
	<body>
	
		<!--start the main table area-->
		<div class="main-table">
			<div class="r_title">
				<i class="glyphicon glyphicon-calendar icon-btton"></i>
				<span class="table-title">项目数据展示</span>
			</div>
			<!--start the search area-->
			<div class="r_process clearfix">
				<form class="form-inline clearfix" >
					<div class="pull-right">
						 <div class="form-group">
							<input type="text" name="keyword" id="keyword" class="form-control" />
							<button type="button" class="btn btn-info" onclick="searchKeyword()">搜索</button>
						</div>
					</div>
					<!-- <div class="radio pull-left">
						<span>所属范围&nbsp;:&nbsp;</span>
						<label><input type="radio" id="keyword" name="keyword"  value="国内" onclick="searchKeyword()" />国内</label>
						<label><input type="radio" id="keyword" name="keyword"  value="海外" onclick="searchKeyword()" />海外</label>
						<label><input type="radio" id="keyword" name="keyword"  value="" checked="checked" onclick="searchKeyword()" />全部</label>
					</div> -->
				</form>
			<!--end the search area-->
			</div>
			<div class="r_table">
				<table class="table ">
					<thead><tr>
						<th class="p-hover" data-colname='projectId'>项目编号<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='projectName'>项目名称<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='startTime'>立项时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th class="p-hover" data-colname='endTime'>结项时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th >状态</th>
						<th class="p-hover" data-colname='employee.id'>项目经理<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
						<th >操作</th>
					</tr></thead>
					<tbody id="tbody">
						 <tr><td colspan="7" style="padding:100px;">
					  	<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;"><img src="<%=basePath%>/images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....</div>
					  </td></tr>
					</tbody>
				</table>
				<div class="page-search">
					<div class="page"></div>
					<div class="clear"></div>
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
					url:"projectAction!getProjectsByPage.action",
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
		function searchKeyword()
		{
			chUser.search();
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
		
			<!--end the table area-->
			
		</div>
		<!--end the main table area-->
		</div>
		<!--start the main process area-->
		<div class="main-process">
			<div><a href="javascript:void(0);" class="btn-title">更多操作&gt;&gt;</a></div>
				<a href="projectAction!getAllEmployee.action" class="btn btn-info"><i class="glyphicon glyphicon-plus icon-padr"></i>新增项目</a>
				<a href="<%=basePath %>adminEnter/project/projectReview_batchImport.jsp"  class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-export icon-padr"></i>导入项目评审</a>
		<!--end the main process area-->
		</div>
		
		<!--start the page-footer area-->
		<!-- <div class="footer">
			四川长虹网络科技有限责任公司 © 版权所有
		end the page-footer area
		</div> -->
		<script type="text/javascript">
			function doDelete(obj){
				var $obj = $(obj);
				var url = $obj.data('target');
				//alert(url);
				var r= confirm('确认删除');
				if(r){
					console.log('删除: '+url);
					window.location.href = url;
				}else console.log('不删除');
			};
		</script>
		
	
	</body>
</html>
