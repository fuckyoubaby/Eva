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
		<title>经验库主页面</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/tz_page.css"/>
		<script src="<%=basePath %>/js/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=basePath %>/js/tz_page.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		.mg-b15{margin-bottom:15px}
		.mg-b30{margin-bottom:30px}
		.hr{height: 1px;border-bottom:1px dashed #ccc}
		.clear{clear:both}
		div.row ul{padding-left: 0;}
		div.row ul li{list-style: none;margin-top:20px;box-sizing: content-box;}
		div.row ul li h3.exp-title{line-height: 1.54;}
		div.row ul li span.exp-outhor{display:block;color:#666;line-height: 1.54;margin-bottom:5px;}
		div.row ul li  .short-cut{color:cadetblue;font-weight:800;padding-right:10px;}
		div.row ul li div.exp-desc{width:538px;font-size:13px;color:#333;line-height:1.54;word-wrap:break-word;padding:5px 0 0 5px;position:relative;margin-left:25px;margin-top:10px;}
		div.row ul li div.exp-desc:before{content:"“";box-sizing:border-box;display:block;height:25px;width:25px;border-radius:13px;padding-top:8px;font-size:25pt;text-align:center;line-height:25px;color:#fff;background:#ddd;position:absolute;top:0px;left:-25px;transition:all 350ms;-o-transition:all 350ms;-moz-transition:all 350ms;-webkit-transition:all 350ms;}
		div.row ul li div.exp-desc:after{content:"”";display:block;box-sizing:border-box;height:25px;width:25px;padding-top:8px;border-radius:25px;font-size:25pt;text-align:center;color:#fff;background:#ddd;line-height:25px;position:absolute;top:0;right:-25px;transition:all 350ms;-o-transition:all 350ms;-moz-transition:all 350ms;-webkit-transition:all 350ms;}
		div.row ul li div.exp-desc:hover:before,div.row ul li div.exp-desc:hover:after{background:#282828;transition:all 350ms;-o-transition:all 350ms;-moz-transition:all 350ms;-webkit-transition:all 350ms;}
		</style>
	</head>
	<body>
		<div class="container">
			<br />
			<div class="row">
				<div class="col-md-6">
					<form class="form-inline" >
						<div class="form-group">
							<input type="text" name="keyword" id="keyword" placeholder=""  class="form-control"/>
							<button class="btn btn-default" onclick="searchKeyword()">GO</button>	
						</div>
					</form>
				</div>
			</div>
			<!--start 精确查找-->
			<div class="row"><a href="experienceAction!forAddExp.action" style="margin-left:15px;">添加经验</a></div>
			<div class="row">
			<form class="col-md-6 form-horizontal">
				<!-- <div class="form-group">
					<label class="col-md-3 control-label">机型</label>
					<div class="col-md-3">
						<select name="mechine-type" class="form-control">
							<option value="" selected="selected">不限</option>
							<option value="">机顶盒</option>
							<option value="">IPTV/OTT</option>
							<option value="">CM</option>
							<option value="">EOC</option>
							<option value="">PON</option>
							<option value="">其他</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">地区</label>
					<div class="col-md-3">
						<select name="area-country" class="form-control">
							<option value="">不限</option>
							<option value="">国内</option>
							<option value="">海外</option>
						</select>
					</div>
					<div class="col-md-3">
						<select name="area" class="form-control">
							<option value="">不限</option>
							<option value="">印度/东南亚</option>
							<option value="">俄罗斯</option>
							<option value="">欧洲</option>
							<option value="">北美</option>
							<option value="">南美</option>
							<option value="">非洲</option>
							<option value="">其他</option>
						</select>
					</div>
				</div>
				<div class=" form-group">
					<label class="col-md-3 control-label">分类</label>
					<div class="col-md-3">
						<select name="parts-1" class="form-control">
							<option selected value="不限">不限</option>
			                <option value="Tuner/高频头">Tuner/高频头</option>
			                <option value="接口">接口</option>
			                <option value="主芯片">主芯片</option>
			                <option value="存储器">存储器</option>
			                <option value="在板电源">在板电源</option>
			                <option value="PCB">PCB</option>
			                <option value="分类器件">分类器件</option>
			                <option value="分板/模板">分板/模板</option>
			                <option value="测试/认证">测试/认证</option>
						</select>
					</div>
					<div class="col-md-3">
						<select name="parts2" class="form-control">
							<option value="">不限</option>
						</select>
					</div>
					<div class="col-md-3">
						<select name="parts3" class="form-control">
							<option value="">不限</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-3"></div>
					<div class="col-md-3"> 
						<button class="btn btn-info">查找</button> 
					</div>
				</div>
			</form>
			end 精确查找
			</div> -->
			<!--start 结果列表-->
			<div class="row mg-b30">
				<ul id="tbody">
					<li>
						<h4 class="exp-title"><a href="">湖北电信IHO-2000不开机故障问题分析</a></h4>
						<span class="exp-outhor"><em class="short-cut">[录入]</em>樊卫华  2015年4月3日</span>
						<div><em class="short-cut">[评分]</em>4星</div>
						<div><em class="short-cut">[摘要]</em>
							<div class="exp-desc">由于FLASH软件驱动兼容性带来的概率性不开机，另设计时需要关注不同FLASH之间pin脚定义的不同，如东芝FLASH的pin38，pin39需要供电，美光不需要。</div>
						</div>
					</li>
					<li>
						<h4 class="exp-title"><a href="">湖北电信IHO-2000不开机故障问题分析</a></h4>
						<span class="exp-outhor"><em class="short-cut">[录入]</em>樊卫华  2015年4月3日</span>
						<div><em class="short-cut">[评分]</em>4星</div>
						<div><em class="short-cut">[摘要]</em>
							<div class="exp-desc">由于FLASH软件驱动兼容性带来的概率性不开机，另设计时需要关注不同FLASH之间pin脚定义的不同，如东芝FLASH的pin38，pin39需要供电，美光不需要。</div>
						</div>
					</li>
					<li>
						<h4 class="exp-title"><a href="">湖北电信IHO-2000不开机故障问题分析</a></h4>
						<span class="exp-outhor"><em class="short-cut">[录入]</em>樊卫华  2015年4月3日</span>
						<div><em class="short-cut">[评分]</em>4星</div>
						<div><em class="short-cut">[摘要]</em>
							<div class="exp-desc">由于FLASH软件驱动兼容性带来的概率性不开机，另设计时需要关注不同FLASH之间pin脚定义的不同，如东芝FLASH的pin38，pin39需要供电，美光不需要。</div>
						</div>
					</li>
				</ul>	
				<!--end 结果列表-->
			</div>
			<div class="row">
				<div class="col-md-6">
						<div class="page"></div>
						<div class="clear"></div>
				</div>
			</div>
			
		</div>
		
	<script type="text/javascript">
		var chUser = {
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
				//第二种方式,load原理代码
				$.ajax({
					type:"post",
					data:params,
					//配置请求地址，返回结果是jsp模板页面
					url:"experienceAction!employeeGetByPage.action",
					success:function(data){
						$("#tbody").html(data);
						if(callback){
							var itemcount = $("#tbody").find("li:eq(0)").data("itemcount");
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
		</script>
	</body>
</html>
