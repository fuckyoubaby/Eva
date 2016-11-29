
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
		<title>管理员-竞赛成绩列表</title>
		<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
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
			
			/*start mian area table style*/
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";text-align:center;}
			.main-table .r_table table thead tr{background-color:#EEE;}
			.main-table .r_table table thead tr th{text-align:center;}
			
			.r_table table th.p-hover:hover{cursor:pointer;}
			.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
			.r_table table th:hover i.icon-hidden{visibility: visible;}
			
			.r_table tbody tr td.t_td{width:90px;}
			.r_table tbody tr td.t_td .t_action{width:74px;margin:0 auto;display:none;}
			.r_table tbody tr td.t_td:hover .t_action{display:block;}
			.r_table tbody tr td.t_td a{color:#fff;margin:-5px 0;padding:5px;text-decoration:none;}
			.r_table tbody tr td.t_td a:hover{background:#2f3437;}
			.a_see{ background-color:#6297bc;}
			.a_edit{background-color:#28b779}
			.a_delete{background-color:#ff912f}
			.main-table .page-search{padding:0 10px 5px 10px;font-size:12px;color:#AEAEAE}
			/*end main area table style*/
			
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
			function scoreListDelete(){
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
			<h3 class="bolder mg-b20">${exam.examName }</h3>
			<div class="hr mg-b20"></div>
			<div class="main-table">
					<!--start table title-->
					<div class="r_title">
						<i class="glyphicon glyphicon-calendar icon-btton"></i>
						<span class="table-title">竞赛成绩展示</span>
					<!--end table title-->
					</div>
					
					<!--start table process area-->
					<div class="r_process">
						<div class="form-inline row">
							<div class="col-md-6 form-group">
								<input type="text" name="keyword" id="keyword" class="form-control" />
								<button type="button" onclick="searchKeyword()" class="btn btn-info">搜索</button>
							</div>
						</div>
					<!--end the table process area-->
					</div>
					
					<!--start table area-->
					<form id="dele_pro" action="examAction!muldeletescorelist.action" method="post">
					<div class="r_table">
						<table class="table">
							<thead>
								<tr>
									<th>选择</th>
									<th>姓名</th>
									<th>工号</th>
									<th  class="p-hover" data-colname='score'>成绩<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
									<th>操作</th>
								</tr>
							</thead>
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
					<!--end table area-->
					</div>
					</form>
					<!--start table footer area-->
					<div class="r_footer row">
					<div class="col-md-6">
						<div class="r_delete pull-left">
							<a onclick="scoreListDelete()" class="btn btn-info">删除所选</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="col-md-6">
						<div class="page"></div>
						<div class="clear"></div>
					</div>
				<!--end table footer area-->
				</div>
				<!--end main table-->
				</div>
			
			<div class="main-process mg-b20">
				<a href="examAction!getEmployeeList.action" class="btn btn-info"><i class="glyphicon glyphicon-plus icon-padr"></i>新增参与</a>
				<a href="examing_score_b_add.jsp?examName=${exam.examName}&examId=${exam.examId}" class="btn btn-info" style="margin-left:30px;"><i class="glyphicon glyphicon-export icon-padr"></i>批量录入</a>
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
				//var pid = $("#province").val();
				var keyword = $("#keyword").val();
				var params = {pageNo:pno,pageSize:psize,keyword:keyword};
				
				if(chUser.orders){$.extend(params,chUser.orders);}
				//第二种方式,load原理代码
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"<%=basePath%>/examAction!getEmployeeListByExamId.action",
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
		}
		document.onkeydown=function(){
				if(event.keyCode==13)
				{
					chUser.search();
					return false;
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
