 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>欢迎主界面</title>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/tz_page.css"/>
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
/*icon message area*/
.message-list .m-list-item{float:left;height:99px;margin-left:1%;margin-top:20px;width:24%;color:#fff;cursor:pointer;}
.message-list .m-list-item:hover{background:#636363;}
.m-list-item.bg-color4{width:23%;}
.bg-color1{background-color:#27A9E3}
.bg-color2{background-color:#28b779;}
.bg-color3{background-color:#ffb848;}
.bg-color4{background-color:#cc6a6a;}
.message-list .m-list-item .item_icon{margin:25px 10px 0px 20px;font-size:44px;}
.message-list .m-list-item .item_desc{margin-top:25px;}
.message-list .m-list-item .item_desc .m_count{font-size:22px;}
/*table area*/
.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";}
.main-table .r_table table thead tr{background-color:#EEE;}
/*--start 表头排序--*/
.r_table table th.p-hover:hover{cursor:pointer;}
.r_table table th.p-hover i.icon-hidden{visibility:hidden;padding-left:5px;}
.r_table table th.p-hover:hover i.icon-hidden{visibility:visible;}
/*--end 标头排序--*/
.clear{clear:both;}
</style>
	</head>
	<body style="background-color: #F3F4F5;">
	<% List<Integer> list = (List<Integer>)session.getAttribute("list"); %>
		<!--start the main message area-->
		<% if(list.size()>3){ %>
		<div class="message-list clearfix">
			<div class="m-list-item bg-color1">
				<div class="item_icon pull-left"><i class="glyphicon glyphicon-tasks"></i></div>
				<div class="item_desc">
					<span class="m_count"><%=list.get(1) %></span>
					<p>项目总数</p>
				</div>
			</div>
			<div class="m-list-item bg-color2">
				<div class="item_icon pull-left"><i class="glyphicon glyphicon-pencil"></i></div>
				<div class="item_desc">
					<span class="m_count"><%=list.get(2) %></span>
					<p>竞赛总数</p>
				</div>
			</div>
			<div class="m-list-item  bg-color3">
				<div class="item_icon pull-left"><i class="glyphicon glyphicon-briefcase"></i></div>
				<div class="item_desc">
					<span class="m_count"><%=list.get(3) %></span>
					<p>培训总数</p>
				</div>
			</div>
			<div class="m-list-item bg-color4">
				<div class="item_icon pull-left"><i class="glyphicon glyphicon-user"></i></div>
				<div class="item_desc">
					<span class="m_count"><%=list.get(0) %></span>
					<p>员工数量</p>
				</div>
			</div>
		<!--end the main message area-->
		</div>
		<%} %>
		<!--start the main table area-->
		<div class="main-table">
			<div class="r_title">
				<i class="glyphicon glyphicon-calendar icon-btton"></i>
				<span class="table-title">项目数据展示</span>
			</div>
			<!--start the search area-->
			<div class="r_process">
				<form class="form-inline" >
					<div class="form-group">
						<!-- <input type="text" name="keyword" class="form-control" placeholder="输入项目名称"/> -->
					</div>
					<div class="form-group"><!-- 
						<input type="button" class="btn btn-primary" value="GO"/> -->
						<input type="text" name="keyword" id="keyword" class="form-control" />
							<button type="button" class="btn btn-info" onclick="searchKeyword()">搜索</button>
					</div>
				</form>
			<!--end the search area-->
			</div>
			
			<!--start the table info area-->
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
						 <tr>
						 <td colspan="7" style="padding:100px;">
					  		<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
					  			<img src="<%=basePath%>/images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
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

		<!--start the page-footer area-->
		<div class="footer">
			<!-- 四川长虹网络科技有限责任公司 © 版权所有 -->
		<!--end the page-footer area-->
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
				//var pid = $("#province").val();
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
		function searchKeyword(){chUser.search();};
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
		
		function doDelete(obj){
			var $obj = $(obj);
			var url = $obj.data('target');
			var r= confirm('确认删除');
			if(r){
				window.location.href = url;
			}else return;
		};
		</script>
	</body>
	
</html>
