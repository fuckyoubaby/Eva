<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员经验库主页</title>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/tz_page.css"/>
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			/*start common style*/
			.sub-title{color:#AEAEAE;font-size:12px;text-indent: 5em;}
			.mg-b10{margin-bottom:10px}
			.mg-b15{margin-bottom:15px}
			.mg-b20{margin-bottom:20px}
			.mg-b30{margin-bottom:30px}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.bolder{font-weight: 700;}
			*{box-sizing: content-box;}
			.clear{clear:both;}
			/*end common style*/
			
			/*start messsage table style*/
			table.t_table{*border-collapse:collapse;border-collapse:separate;width:98%;}
			.t_table{text-align:center;border:1px solid #ddd;margin:0 1%;-moz-border-radius:6px;-webkit-border-radius:6px;border-radius:6px;}
			.t_table td,.t_table th{border-left:1px solid #ddd;border-top:1px solid #ddd;}
			.t_table th{border-top:none;}
			.t_table td:first-child,.t_table th:first-child{border-left:none;}
			.t_table tr th:first-child{-moz-border-radius:6px 0 0 0;-webkit-border-radius:6px 0 0 0;border-radius:6px 0 0 0;}
			.t_table tr th:last-child{-moz-border-radius:0 6px 0 0;-webkit-border-radius:0 6px 0 0;border-radius:0 6px 0 0;}
			.t_table tr th:only-child{-moz-border-radius:6px 6px 0 0;-webkit-border-radius:6px 6px 0 0;border-radius:6px 6px 0 0;}
			table.t_table tr th{line-height:40px;background-color:#eee;text-align:center;}
			table.t_table tr td{line-height:40px;}
			/*end message table style*/
			
			/*start mian area table style*/
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
			.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
			.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
			.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
			.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
			.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";text-align:center;}
			.main-table .r_table table thead tr{background-color:#EEE;}
			.main-table .r_table table thead tr th{text-align:center;}
			/*--start 表头排序--*/
			.r_table table th.p-hover:hover{cursor:pointer;}
			.r_table table th i.icon-hidden{visibility:hidden;padding-left:5px;}
			.r_table table th:hover i.icon-hidden{visibility: visible;}
			/*--end 标头排序--*/
			.main-table .page-search{padding:0 10px 5px 10px;font-size:12px;color:#AEAEAE}
			/*end main area table style*/
			/*start table button list*/
			.main-table .r_process ul{padding-left:0;}
			.main-table .r_process ul li{list-style:none;float:left;background:#999;margin:0 10px 0 0;box-sizing:content-box;}
			.main-table .r_process ul li a{font-size:12px;display:block;padding:8px 20px;color:#fff;}
			.main-table .r_process ul li a:hover{background:#28b779;}
			.main-table .r_process ul li.actived a{background:#28b779;}
			/*end table button list*/
			/*start main table footer*/
			.main-table .r_footer{width:98%;margin-left:1%;margin-bottom:15px;}
			.main-table .r_footer a{font-size:12px;}
			/*end main table footer*/
			a{cursor: pointer;}
		</style>
		<script type="text/javascript">
			function experienceDelete(){
				obj = document.getElementsByName("chkName");
				chkName = [];
				for(k in obj){
					if(obj[k].checked)
						chkName.push(obj[k].value);
						
				}
				var formDom = document.getElementById("dele_pro");
						console.log(typeof formDom);
						formDom.submit();
			}
		</script>
		<script type="text/javascript">
			function getDataByNId()
			{
				var dataDirtPId = document.getElementById("dataDirtPId").value;
				$.ajax({
					type:"post",
					url:"experienceAction!getDataDirtByPId.action",
					dataType:"json",
					data:"dataDirtPId="+dataDirtPId,
					cache:false,
					success:createReview,
					error:errorReview
				});
			}
			function createReview(list){
				$('#dataDirtNId').empty();
				$('#dataDirtNId').append("<option value='-1'>"+"请选择二级分类"+"</option>");
				$.each(list,function(n,value){
  					$('#dataDirtNId').append("<option value='"+value.nId+"'>"+value.name+"</option>");
  				});
			}
			function errorReview(err)
			{
			}
		</script>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3 bolder">经验分享汇总</div>
			<div class="row mg-b20">
				<div class="col-md-4">
					<table class="t_table">
						<thead>
							<tr>
								<td>已收录</td>
								<td>已处理</td>
								<td>未处理</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${all }</td>
								<td>${finished }</td>
								<td>${hasnot }</td>
							</tr>
						</tbody>				
					</table>
				</div>
				<div class="col-md-7">
				
				</div>
			</div>
			<div class="hr mg-b15"></div>
			<!--start main table area-->
			<div class="main-table">
				<!--start table title-->
				<div class="r_title">
					<i class="glyphicon glyphicon-calendar icon-btton"></i>
					<span class="table-title">评分数据展示</span>
				<!--end table title-->
				</div>
				
				<!--start table process area-->
				<div class="r_process clearfix" style="margin-bottom:0px;">
					<!-- <ul class="clearfix">
						<li id="daichuli"><a onclick="getByState('not')"><i class="glyphicon glyphicon-flag"></i><span>
							待处理
						</span></a></li>
						<li id="yichuli"><a onclick="getByState('finished')"><i class="glyphicon glyphicon-tag"></i><span>
							已处理
						</span></a></li>
						<li  class="actived" id="quanbu"><a onclick="getByState('all')"><i class="glyphicon glyphicon-tags"></i><span>
							全部
						</span></a></li>
						
							<form class="form-inline clearfix" onsubmit="return false;">
								<div class="pull-right">
								 	<div class="form-group">
										<input type="text" name="keyword" id="keyword" class="form-control" style="height: 20px" " />
										<button type="button" class="btn btn-info" onclick="searchKeyword();">搜索</button>
									</div>
								</div>
							</form>
						
						<li><a href="#"><i class="glyphicon glyphicon-screenshot"></i><span>
							精确查找
						</span></a></li>
					</ul> -->
					
					<ul class="clearfix pull-left" style="width:400px">
						<li id="daichuli"><a onclick="getByState('not')"><i class="glyphicon glyphicon-flag"></i><span>
							待处理
						</span></a></li>
						<li id="yichuli"><a onclick="getByState('finished')"><i class="glyphicon glyphicon-tag"></i><span>
							已处理
						</span></a></li>
						<li  class="actived" id="quanbu"><a onclick="getByState('all')"><i class="glyphicon glyphicon-tags"></i><span>
							全部
						</span></a></li>
					</ul>
					<div style="float:right;width:270px;">
							<div style="float:left;">
								<input type="text" name="keyword" id="keyword" class="form-control" style="box-sizing:border-box" />
					 		</div>
							<div style="float:right;width:70px;">
								<button type="button" class="btn btn-info" style="maring-left:10px" onclick="searchKeyword();">搜索</button>
							</div>
					 		
					 		
					</div>
				</div>
				
				
				<div class="r_process clearfix">
				<form class="form-inline clearfix" >
					<div class="pull-left">
						 <div class="form-group">
							<select name="dataDirtPId" id="dataDirtPId" onchange="getDataByNId();" style="height: 30px">
							<option value="-1">请选择主要分类</option>
								<c:forEach items="${dataDirts }" var="dataDirt">
									<option value="${dataDirt.nId }">${dataDirt.name }</option>
								</c:forEach>
							</select>
							<select name="dataDirtNId" id="dataDirtNId" style="height: 30px">
								<option value="-1">请选择二级分类</option>
							</select>
							<button type="button" class="btn btn-info" onclick="searchByPId()">确定</button>
						</div>
					</div>
				</form>
			<!--end the search area-->
			</div>
				
				<!--start table area-->
				<form id="dele_pro" action="experienceAction!muldelete.action" method="post">
				<div class="r_table">
					<table class="table">
						<thead>
							<tr>
								<th>选中</th>
								<th class="p-hover"  data-colname='experienceName'>名称<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
								<th class="p-hover"  data-colname='employee.id'>作者<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
								<th class="p-hover"  data-colname='exTime'>录入时间<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
								<th >状态</th>
								<th>操作</th>
							</tr>
						</thead>
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
				<!--end table area-->
				</div>
				</form>
				<div class="page-search">
					<div class="page"></div>
					<div class="clear"></div>
				</div>
				
				<!--start table footer area-->
				<div class="r_footer row">
					<div class="col-md-6">
						<div class="r_delete pull-left">
							<a onclick="experienceDelete();" class="btn btn-info">删除所选</a>
						</div>
						<div class="clear"></div>
					</div>
					
					
				<!--end table footer area-->
				</div>
			<!--end main table-->
			</div>
			
		</div>
		<script type="text/javascript">
		var state="";
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
				var dataDirtPId = $("#dataDirtPId").val();
				var dataDirtNId = $("#dataDirtNId").val();
				var params = {pageNo:pno,pageSize:psize,keyword:keyword,state:state,dataDirtPId:dataDirtPId,dataDirtNId:dataDirtNId};
				if(chUser.orders){$.extend(params,chUser.orders);}
				//第二种方式,load原理代码
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"experienceAction!getExperiencesByPage.action",
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
		function searchKeyword(){
			chUser.search();
		}
		function getByState(a)
		{
				var daichuli = document.getElementById("daichuli");
				var yichuli = document.getElementById("yichuli");
				var quanbu = document.getElementById("quanbu");
				 
			if(a=="not")
			{
				quanbu.setAttribute("class", "abc");
				yichuli.setAttribute("class","abc");
				daichuli.setAttribute("class", "actived"); 
			}else if(a=="finished")
			{
				quanbu.setAttribute("class", "abc");
				daichuli.setAttribute("class","abc");
				yichuli.setAttribute("class", "actived"); 
			}
			else
			{
				daichuli.setAttribute("class", "abc");
				yichuli.setAttribute("class","abc");
				quanbu.setAttribute("class", "actived"); 
			}
			state = a;
			chUser.search();
		}
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
				chUser.orderby(opts);
			});
		});
		
		function searchByPId()
		{ chUser.search();};
		</script>
	</body>
</html>
