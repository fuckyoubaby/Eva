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
<title>各维度展示页面</title>
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
					<a href="#hegui-form-tab" data-toggle="tab">合规扣分</a>
				</li>
				<li >
					<a href="#zhuanye-form-tab" data-toggle="tab">专业技能</a>
				</li>
				<li >
					<a href="#ziwochengzhang-form-tab" data-toggle="tab">自我成长</a>
				</li>
				<li >
					<a href="#gongxian-form-tab" data-toggle="tab">对公司贡献</a>
				</li>
				<li >
					<a href="#goutong-form-tab" data-toggle="tab">沟通管理</a>
				</li>
				
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="hegui-form-tab">
					<div class="r_table">
						<table class="table table-bordered ">
							<thead>
								<tr>
									<th>排名</th>
									<th>员工姓名</th>
									<th>员工编号</th>
									<th>评审次数</th>
									<th>设计规定</th>
									<th>流程规定</th>
									<th>合规总分</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_hegui">
								<tr>
									<td colspan="8" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="zhuanye-form-tab">
					<div class="r_table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>排名</th>
									<th>员工姓名</th>
									<th>员工编号</th>
									<th>评审次数</th>
									<th>一般设计缺陷</th>
									<th>低级错误</th>
									<th>专业技能总分</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_sheji">
								<tr>
									<td colspan="8" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane" id="ziwochengzhang-form-tab">
					<div class="r_table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>排名</th>
									<th>员工姓名</th>
									<th>员工编号</th>
									<th>学习积极性</th>
									<th>考试</th>
									<th>自我成长总分</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_ziwo">
								<tr>
									<td colspan="7" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="tab-pane" id="gongxian-form-tab">
					<div class="r_table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>排名</th>
									<th>员工姓名</th>
									<th>员工编号</th>
									<th>专利</th>
									<th>经验库</th>
									<th>标准化</th>
									<th>重要信息收集</th>
									<th>项目文档</th>
									<th>其他</th>
									<th>培训</th>
									<th>对公司贡献总分</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_gongxian">
								<tr>
									<td colspan="12" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				
				<div class="tab-pane" id="goutong-form-tab">
					<div class="r_table">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>排名</th>
									<th>员工姓名</th>
									<th>员工编号</th>
									<th>工作积极性</th>
									<th>沟通能力</th>
									<th>工作计划性</th>
									<th>沟通管理总分</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_goutong">
								<tr>
									<td colspan="8" style="padding:100px;">
										<div class="empty" style="text-align: center;font-size: 18px;line-height: 25px;">
											<img src="<%=basePath%>images/loading.gif" width="25" height="25" style="vertical-align: text-top;margin-right: 5px;" />正在加载数据....
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<script type="text/javascript">
	
		//
		var liValue = 0;
		function getLi()
		{ 
			
			
			getResult();
			var ul = document.getElementById('parent');
			var lis = ul.getElementsByTagName('li');
			
			for(var i=0;i<lis.length;i++){
			 	lis[i].index = i;
				lis[i].onclick = function()
				{
					liValue = this.index;
					getResult();
					
				}
				
			}
			
		}
		
		function getResult()
		{
			var orderName="compliance";
			var ob = $("#tbody_hegui");
			if(liValue == 0 )
			{
				orderName="compliance";
				 ob = $("#tbody_hegui");
			}else if(liValue == 1)
			{
				orderName="designAbility";
				 ob = $("#tbody_sheji");
			}else if(liValue == 2)
			{
				orderName="learningAbility";
				 ob = $("#tbody_ziwo");
			}
			else if(liValue == 3)
			{
				orderName="work";
				 ob = $("#tbody_gongxian");
			}else if(liValue == 4)
			{
				orderName="communication";
				 ob = $("#tbody_goutong");
			}
			$.ajax({
					type:"post",
					url:"../../scoreAction!getResultByModeId.action?orderName="+orderName,
					success:function(data){
					
						ob.html(data);
						}
				});
		}
		</script>
</body>
</html>
