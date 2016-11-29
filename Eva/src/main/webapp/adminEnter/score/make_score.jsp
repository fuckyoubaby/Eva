<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>管理员-评分操作页面</title>
		<link rel="stylesheet" href="../../css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="../../css/tz_page.css"/>
		<script src="../../js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<script src="../../My97DatePicker/WdatePicker.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath%>/js/bootstrapValidator.min.js"></script>
		
		<style type="text/css">
			/* start common style*/
			.mg-b15{margin-bottom:15px}
			.mg-b30{margin-bottom:30px}
			.pad-r5{padding-right: 5px;}
			.hr{height: 1px;border-bottom:1px dashed #ccc}
			.bolder{font-weight:700;}	
			.clear{clear:both;}
			/* end common style*/
			
			.main-table{width:98%;margin-left:1%;background:#fff;margin-top:20px}
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
			
			label.control-label{font-weight:normal;}
			.SpanColor{color:#a94442;}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="page-header h3">进行评分</div>
			<div class="mg-b15 bolder">选择评分时间</div>
			<!-- scoreAction!saveOverall.action -->
			<form action="scoreAction!saveOverall.action" id="makeScoreForm" name="makeScoreForm" method="post" role="form">
			<div class="row mg-b15">
				<div class="col-md-6 form-inline">
					<div class="form-group">
						<label class="control-label" >开始时间</label>
						<div class="input-group">
							<input type="date" name="start_time" id="start_time" class="form-control" placeholder="点击图标加入时间" readonly="readonly" style="cursor:not-allowed"/>
							<span class="input-group-addon" onclick="WdatePicker({el:'start_time',dateFmt:'yyyy-MM-dd',onpicked:pickedCaseStart,oncleared:pickedCaseStart})"><i class="glyphicon glyphicon-time"></i></span>
						    <!--  <input type="text" id=start_time name="start_time" class="form-control"/>
						     <span class="add-on"><i class="icon-calendar"></i></span> -->
						</div>
					</div>
				</div>
				
				<div class="col-md-6 form-inline">
					<div class="form-group">
						<label for="" class="control-label">结束时间</label>
						<div class="input-group">
							<input type="date" name="end_time" id="end_time" class="form-control" placeholder="点击图标加入时间" readonly="readonly" style="cursor:not-allowed"/>
							<span class="input-group-addon" onclick="WdatePicker({el:'end_time',dateFmt:'yyyy-MM-dd',onpicked:pickedCaseEnd,oncleared:pickedCaseEnd})"><i class="glyphicon glyphicon-time"></i></span>
							<!-- <input type="text" id=end_time name="end_time" class="form-control"/>
						    <span class="add-on"><i class="icon-calendar"></i></span> -->
						</div>
					</div>
				</div>
			</div>
			<div class="mg-b15 bolder">填写评分名称</div>
			<div class="row mg-b15">
				<div class="col-md-6 form-inline">
					<div class="form-group">
						<label for="socreName" class="control-label">评分名字</label>
						<input type="text" name="socreName" class="form-control"/>
					</div>
				</div>
				<div class="col-md-6 form-inline">
					<div class="form-group">
						<label for="socreName" class="control-label">参评人员</label>
						<select id="employeeType" name="employeeType" class="form-control">
							<option value="">请选择评审员工</option>
							<c:forEach items="${jobs }" var="job">
								<option value="${job.jobId}">${job.jobName}</option>
							</c:forEach>
							
						</select>
					</div>
				</div>
			</div>
			
			<!-- <div class="row mg-b15">
				<div class="col-md-6 form-inline">
					<div class="form-group">
						<label for="socreName" class="control-label">评分名字</label>
						<input type="radio" name="chooseItem1" value="hhh"/>
						<input type="radio" name="chooseItem1" value="123"/>
						<input type="radio" name="chooseItem1" value="111"/>
					</div>
				</div>
			</div> -->
			<span id="spanInfo" class="SpanColor"><font color="#">&nbsp;</font></span>
			<div class="mg-b15 bolder">选择评分模型</div>
			<div class="main-table">
				<div class="r_table">
					<table class="table ">
						<thead><tr>
							<th >选中</th>
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
					<div class="r_footer mg-b15">
						<div class="page-search">
							<div class="page"></div>
						<div class="clear"></div>
						</div>
					<!--end table footer area-->
					</div>
				<!--end the table area-->
				</div>
			<!--end the main table area-->
			</div>
			
			<div class="hr mg-b15"></div>
			<div class="row">
				<div class="col-md-2">
					<input class="btn btn-info form-control" name="makeSubmit" id="makeSubmit" onclick="clickButton();" type="submit" value="进行评分"/>
				</div>				
			</div>
			</form>
		</div>
		 <script type="text/javascript">
		var k = 0;
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
					url:"modeAction!getModesByPageForScore.action",
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
				if(ordertype){ ordertype=(ordertype=='asc')?'desc':'asc';}
				else{ordertype='desc';}
				$(this).data("ordertype",ordertype);
				if(!orderName) return;
				if(orderName){opts.orderName=orderName;}
				if(ordertype){opts.orderType=ordertype;}
				/* console.log(orderName+"--"+ordertype);
				return; */
				chUser.orderby(opts);
			});
		});

         function clickButton(){
				 $('#makeScoreForm').bootstrapValidator({
						message : 'This value is not valid',
						feedbackIcons : {/*输入框不同状态，显示图片的样式*/
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						fields : {/*验证*/
							start_time : {/*键名username和input name值对应*/
								message : '开始时间无效',
								validators : {
									notEmpty : {/*非空提示*/
										message : '开始时间不能为空'
									}
								}
							},
							end_time : {
								message : '结束时间无效',
								validators : {
									notEmpty : {
										message : '结束时间不能为空'
									}
								}
							},employeeType: {
								message : '评审对象不能为空',
								validators : {
									notEmpty : {
										message : '评审对象不能为空'
									}
								}
							},
							socreName : {
								message : '评分名字无效',
								validators : {
									notEmpty : {
										message : '评分名字不能为空'
									},
								}
							}
					  }  //field
					}).on('success.form.bv',function(e){
					    e.preventDefault();
					    var chooseArray = document.getElementsByName("chooseItem");
					    if(chooseArray[k].checked==true){
					     e.target.submit();
					    }else{
					     document.getElementById("makeSubmit").disabled = true;
					     chooseArray[0].focus();
					    }
					    }).on('error.form.bv',function(e){
							var chooseArray = document.getElementsByName("chooseItem");
								for (var i = 0; i < chooseArray.length; i++) {
									if (chooseArray[i].checked == true) {
										//什么都不做，否则聚焦
									} else {
									    document.getElementById("makeSubmit").disabled = true;
										chooseArray[0].focus();
									}
								} //for
							});	
				}

				function radioCase() {
					var chooseArray = document.getElementsByName("chooseItem");
					for (var i = 0; i < chooseArray.length; i++) {
						if (chooseArray[i].checked == true) {
							k = i;
						}
					}
					document.getElementById("makeSubmit").disabled = false;
				};

				function pickedCaseStart() {
					$('#makeScoreForm').data('bootstrapValidator')
							.updateStatus('start_time', 'NOT_VALIDATED', null)
							.validateField('start_time'); //没有执行
				};

				function pickedCaseEnd() {
					$('#makeScoreForm').data('bootstrapValidator')
							.updateStatus('end_time', 'NOT_VALIDATED', null)
							.validateField('end_time');
				};
			</script>
	</body>
</html>
