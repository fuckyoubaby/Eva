<%@page import="com.changhong.entities.Project"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-项目信息修改</title>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/tz_page.css"/>
		<link href="${basePath}/css/loading.css" rel="stylesheet" type="text/css" />
		<link href="${basePath}/css/animate.css" rel="stylesheet" type="text/css" />
		<script src="${basePath}/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		ul{padding-left:0px;}
		ul li{list-style: none;}
		.clear{clear:both;}
		/*start left list area style*/
		.list-border{border:1px solid #ccc;border-radius:5px;width:30%;float:left;margin-top:20px;margin-left:15px;min-width:220px;}
		.list-title{width:100%;padding:10px 15px;font-size:16px;line-height: 1.1;background-color:#f5f5f5;border:1px solid transparent;border-bottom-color: #ddd;border-radius: 5px 5px 0 0;}
		.list-content{max-height:800px;overflow: auto;padding-bottom:28px;}
		.icon-padr{padding-right: 5px;}
		.icon-padl{padding-left:5px;}
		.list-content ul li {border-bottom:1px solid #ddd ;}
		.list-content ul li div{padding:10px 15px;}
		.list-content ul li:hover{background-color:#BCD68D}
		/*end left list area style*/
		
		/*start mian area table style*/
		.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px;border:1px solid #ccc}
		.main-table .r_title{background-color:#EEE;border-bottom:1px solid #ccc;margin-bottom:20px}
		.main-table .table-title{font-size:12px;font-family:"微软雅黑"}
		.icon-btton{display: inline-block;width: 40px;height:38px;border-right:1px solid #ccc;line-height: 38px;text-align: center;}
		.r_process{width:98%;margin-left:1%;margin-bottom:20px;}
		.main-table .r_table table{width:98%;margin-left:1%;border:1px solid #ccc;font-size:12px;font-family:"微软雅黑";text-align:center;}
		.main-table .r_table table thead tr{background-color:#EEE;}
		.main-table .r_table table thead tr th{text-align:center;}
		.main-table .page-search{padding:0 10px 5px 10px;font-size:12px;color:#AEAEAE}
		/*end main area table style*/
		/*--start 表头排序--*/
		.r_table table th.p-hover:hover{cursor:pointer;}
		.r_table table th.p-hover i.icon-hidden{visibility:hidden;padding-left:5px;}
		.r_table table th.p-hover:hover i.icon-hidden{visibility: visible;}
		/*--end 标头排序--*/
		</style>
		<script type="text/javascript" src="${basePath}/js/loading_upgrade.js"></script>
		<script type="text/javascript">
			this.myLoading=function(data){
				var load = new loading(data);
				load.init();
			};
			var empArry = new Array();
		</script>
	</head>
	<body >
		<div class="container">
			<div class="page-header"><h3><a href="${basePath}/projectAction!getProjectById.action?projectId=${project.projectId}">${project.projectName}</a></h3></div>
			<div class="row">
				   <div class="list-border">
					<div class="list-title">项目成员列表</div>
					<div class="list-content">
						<ul id="member-list">
						<c:forEach var="emp" items="${employees}">
							<li>
							<div data-empid="${emp.id}">
						  	  <c:choose>
						  		<c:when test="${project.employee.id==emp.id}">
						  		<span class="item-style"><i class="glyphicon glyphicon-star icon-padr"></i>${emp.name} (${emp.id})</span>
						  		</c:when>
						  		<c:otherwise>
						  		<span class="item-style"><i class="glyphicon glyphicon-user icon-padr"></i>${emp.name} (${emp.id})</span>
						  		<a href="javascript:void(0);" onclick="removeMember(this)"><i class="glyphicon  glyphicon-minus-sign icon-padl"></i></a>
						  		</c:otherwise>
						  	  </c:choose>
						  </div>	
						</li>
						</c:forEach>
					</ul>
					</div>
				  </div>
					
				<div class="col-md-8">
				<div class="main-table">
				<!--start table title-->
				<div class="r_title">
					<i class="glyphicon glyphicon-calendar icon-btton"></i>
					<span class="table-title">添加新的成员</span>
				<!--end table title-->
				</div>
				
				<!--start table process area-->
				<div class="r_process">
					<div class="form-inline row">
						<div class="col-md-6 form-group">
							<input type="text" name="keyword" id="keyword" class="form-control" />
							<button type="button" class="btn btn-info" onclick="searchKeyword()">搜索</button>
						</div>
					</div>
				<!--end the table process area-->
				</div>
				
				<!--start table area-->
				<div class="r_table">
					<table class="table">
						<thead>
							<tr>
								<th class="p-hover" data-colname='name'>姓名<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
								<th class="p-hover" data-colname='id'>员工工号<i class="glyphicon glyphicon-sort icon-hidden"></i></th>
								<th>岗位</th>
								<th>邮箱</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tbody">
						
						</tbody>
					</table>
				<!--end table area-->
				</div>
				<!--start table page area-->
					<div class="page-search">
						<div class="page"></div>
						<div class="clear"></div>
					</div>

			<!--end main table-->
			</div>
			</div>
			</div>
		</div>
		<script type="text/javascript">
			function removeMember(obj){
				var $parent = $(obj).parent();
				var info = $parent.find("span.item-style").text();
				var $li = $parent.parent();
				var empid = $parent.data('empid');
				var params={employeeId:empid};
				$.ajax({
					type : "post",
					data : params,
					//配置请求地址，返回结果是jsp模板页面
					url : "${basePath}/ajaxRequestAction!removeMember.action",///employeeAction!getEmployeesByPage.action
					dataType:"json",
					success : function(data) {
							var json;
							if(typeof data === 'string'){
								json=eval("("+data+")");
							}else json = data;
							if(json.result){
								var msg='删除< '+info+' >失败';
								if(json.result=='success'){
								  msg='删除< '+info+' >成功';
								  removeLi(obj);
								}
								if(json.msg){
									msg=json.msg;
								}
								myLoading({data:msg});
							}else myLoading({data:'请求失败!'});
					}
				});
			};
			function addMember(obj){
				var $parent = $(obj).parent();
				var id = $parent.siblings('.member').text();
				var name = $parent.siblings('.emp-name').text();
				//ajax请求，成功之后添加新的li
				if(checkExist(id)){
					myLoading({data:'该员工已是项目成员！'});
					return;
				}
				var params={employeeId:id};
				$.ajax({
					type : "post",
					data : params,
					//配置请求地址，返回结果是jsp模板页面
					url : "${basePath}/ajaxRequestAction!addMembers.action",///employeeAction!getEmployeesByPage.action
					dataType:"json",
					success : function(data) {
							var json;
							if(typeof data === 'string'){
								json=eval("("+data+")");
							}else json = data;
							if(json.result){
								var msg='添加< '+name+'('+id+')'+' >失败';
								if(json.result=='success'){
								  msg='添加< '+name+'('+id+')'+' >成功';
								  addNewLi(name,id);
								}
								myLoading({data:msg});
							}else myLoading({data:'请求失败！'});
					}
				});
			};
			function addNewLi(name,id){
				if(empArry){
					empArry.push(id);
				}
				var $ul = $("#member-list");
				var html ='<div data-empid="'+id+'">'
				+ '<span class="item-style">'
				+	'<i class="glyphicon glyphicon-user icon-padr"></i>'
				+	name+' ('+id+') </span>'
				+	'<a href="javascript:void(0);" onclick="removeMember(this)"><i class="glyphicon  glyphicon-minus-sign icon-padl"></i></a>'
				+'</div>'
				var $li = $("<li></li>");
				$li.html(html).appendTo($ul);
			};
			
			function removeLi(alink){
				var $parent = $(alink).parent();
				var $li = $parent.parent();
				var empid = $parent.data('empid');
				var number =-1;
				$.each(empArry,function(index, value){
					if(value==empid){
						number = index;
						return;
					}
				});
				if(number!=-1){
					empArry.splice(number,1);
				}
				$li.remove();
			};
			var chUser = {
					orderby:function(orders){
						chUser.orders = orders;
						chUser.load(0,5,function(itemcount){
							chUser.initPage(itemcount);
				    	});
				    },
					search : function() {
						chUser.load(0, 5, function(itemcount) {
							chUser.initPage(itemcount);
						});
					},
					//模板技术查询分页===减少页面的拼接
					load : function(pno, psize, callback) {
						var keyword = $("#keyword").val();
						$("input[type=radio]:checked").val();
						var params = {
							pageNo : pno,
							pageSize : psize,
							keyword : keyword
						};
						if(chUser.orders){$.extend(params,chUser.orders);}
						//第二种方式,load原理代码
						$.ajax({
									type : "post",
									data : params,
									//配置请求地址，返回结果是jsp模板页面
									url : "${basePath}/employeeAction!getMembersByPage.action",///employeeAction!getEmployeesByPage.action
									success : function(data) {
										$("#tbody").html(data);
										if (callback) {
											var itemcount = $("#tbody").find("tr:eq(0)").data("itemcount");
											callback(itemcount);
										}
									}
								});
					},
					initPage : function(itemcount) {
						$(".page").tzPage(itemcount, {
							num_edge_entries : 1, //边缘页数
							num_display_entries : 4, //主体页数
							num_edge_entries : 4,
							current_page : 0,
							items_per_page : 5, //每页显示X项
							prev_text : "前一页",
							next_text : "后一页",
							callback : function(pageNo, psize) {
								chUser.load(pageNo * psize, psize);
							}
						});
					}
				};

				//初始化的时候
				chUser.load(0, 5, function(itemcount) {
					chUser.initPage(itemcount);
				});
				function searchKeyword() {chUser.search();}
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
					
					$("#member-list").find("li> div").each(function(index,element){
						var empid = $(element).data('empid');
						empArry.push(empid);
					});
				
				});
				
				function checkExist(id){
					var b = false;
					$.each( empArry, function(i, n){
						 if(n==id){
							 b=true;
							 return;
						 }
						});
					return b;
				}
		</script>
	</body>
</html>
