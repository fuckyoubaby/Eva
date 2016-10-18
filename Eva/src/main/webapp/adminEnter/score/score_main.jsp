<%@page import="com.changhong.entities.Employee"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评分主页</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/bootstrap.css" />
<script src="<%=basePath%>/js/jquery-1.11.0.js" type="text/javascript"
	charset="utf-8"></script>
<script src="<%=basePath%>/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<%-- <script type="text/javascript" src="<%=basePath%>/js/Chart.min.js"></script> --%>
<script type="text/javascript" src="<%=basePath%>/js/echarts.min.js"></script>
<style type="text/css">
.main-charts {
	margin-top: 20px;
	width: 98%;
	margin-left: 1%;
}
/*table area*/
.main-table {
	width: 98%;
	margin-left: 1%;
	background: #fff;
	margin-top: 20px;
	border: 1px solid #ccc
}

.main-table .r_title {
	background-color: #EEE;
	border-bottom: 1px solid #ccc;
	margin-bottom: 20px
}

.main-table .table-title {
	font-size: 12px;
	font-family: "微软雅黑"
}

.icon-btton {
	display: inline-block;
	width: 40px;
	height: 38px;
	border-right: 1px solid #ccc;
	line-height: 38px;
	text-align: center;
}

.r_process {
	width: 98%;
	margin-left: 1%;
	margin-bottom: 20px;
}

.main-table .r_table table {
	width: 98%;
	margin-left: 1%;
	border: 1px solid #ccc;
	font-size: 12px;
	font-family: "微软雅黑";
	text-align: center;
}

.main-table .r_table table thead tr {
	background-color: #EEE;
}

.main-table .r_table table thead tr th {
	text-align: center;
}

.main-table .page-search {
	padding: 0 10px 5px 10px;
	font-size: 12px;
	color: #AEAEAE
}
/*end the table area*/
.clear {
	clear: both
}
</style>
<script>

	 var option = { //可以去官网上根据每个案例不同的option去写各种图形
            title: {   //标题
                text: '用户雷达图'
            },
            tooltip: {   //提示框，鼠标悬浮交互时的信息提示
               
            },
            legend: {    //图例，每个图表最多仅有一个图例
                data: ['a', 'b']
            },
            radar: {    //极坐标 
                indicator: [{text: '专业技能',max: ${designAbility_max}}, 
                            {text: '合规',max: ${compliance_max}},
                            {text: '沟通管理',max: ${communication_max}},
                            {text: '自我成长',max: ${learningAbility_max}},
                            {text: '对公司贡献',max: ${work_max}}
                           ]
            },
           
         series: [{
        name: '平均 vs 用户',
        type: 'radar',
        // areaStyle: {normal: {}},
        data : [
            {
                value : [${designAbility_avg}, ${compliance_avg}, ${communication_avg}, ${learningAbility_avg}, ${work_avg}],
                name : '平均'
            },
             {
                value : [${result.designAbility}, ${result.compliance}, ${result.communication}, ${result.learningAbility}, ${result.work}],
                name : '用户'
            }
        ]
    }]
    };
	
	$(function() {
           /*  option.series[0].data[0].value=[12,32,34,53,53,65];  // 加载数据到data中
            option.series[0].data[0].name ='ESOP系统'; */
            var myChart = echarts.init(document.getElementById('main'));  
            myChart.setOption(option, true);   //为echarts对象加载数据
        });
</script>

<script type="text/javascript">
var d = [];
<c:forEach items="${secondlevelscores}" var="item">
	d.push(${item.score});
</c:forEach>
option2 = {
    title : {
        text: '员工的各项分数和总平均值',
        subtext: ''
    },
    tooltip : {
        trigger: 'axis'
    },
     legend: {
        data:['总体平均值','个人值']
    }, 
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['一般设计缺陷','低级错误','设计规定','流程规定','工作积极性','沟通能力','工作计划性','学习积极性','考试','专利','经验库','标准化','重要信息收集','项目文档','其他','培训']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'平均值',
            type:'bar',
            data:[${yibanshejiquexian_avg}, ${dijicuowu_avg}, ${shejihegui_avg}, ${liuchenghegui_avg}, ${gongzuojijixing_avg}, ${gongtongnengli_avg}, ${gongzuojihuaxing_avg}, ${xuexijijixing_avg}, ${kaoshi_avg}, ${zhuanli_avg}, ${jingyanku_avg}, ${biaozhunhua_avg},${zhongyaoxinxishouji_avg},${xiangmuwendang_avg},${qita_avg},${peixun_avg}],
            /* markPoint : {
                data : [
                    {type : 'max', name: '最大值'},
                    {type : 'min', name: '最小值'}
                ]
            }, */
            /* markLine : {
                data : [
                    {type : 'average', name: '平均值'}
                ]
            } */
        },
        {
            name:'员工值',
            type:'bar',
             /* data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3,3,2],  */
             data:d, 
            
            /* markPoint : {
                data : [
                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                ]
            },
            markLine : {
                data : [
                    {type : 'average', name : '平均值'}
                ]
            } */
        }
    ]
};
$(function() {
           /*  option.series[0].data[0].value=[12,32,34,53,53,65];  // 加载数据到data中
            option.series[0].data[0].name ='ESOP系统'; */
            var myChart = echarts.init(document.getElementById('zhuzhungtu'));  
            myChart.setOption(option2, true);   //为echarts对象加载数据
        });
zhuanyejishu = {
    title : {
        text: '员工专业技术分数和总平均值',
        subtext: ''
    },
    tooltip : {
        trigger: 'axis'
    },
     legend: {
        data:['总体平均值','个人值']
    }, 
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['一般设计缺陷','低级错误']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'平均值',
            type:'bar',
            data:[${yibanshejiquexian_avg}, ${dijicuowu_avg}],
        },
        {
            name:'员工值',
            type:'bar',
             /* data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3,3,2],  */
             data:d.slice(0, 2),            
        }
    ]
};
$(function() {
            var zhuanyeChart = echarts.init(document.getElementById('zhuanyejishu'));  
            zhuanyeChart.setOption(zhuanyejishu, true);   //为echarts对象加载数据
        });
        
        
hegui = {
    title : {
        text: '员工合规分数和总平均值',
        subtext: ''
    },
    tooltip : {
        trigger: 'axis'
    },
     legend: {
        data:['总体平均值','个人值']
    }, 
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['设计规定','流程规定']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'平均值',
            type:'bar',
            data:[ ${shejihegui_avg}, ${liuchenghegui_avg}],
        },
        {
            name:'员工值',
            type:'bar',
             data:d.slice(2, 4),            
        }
    ]
};
$(function() {
           /*  option.series[0].data[0].value=[12,32,34,53,53,65];  // 加载数据到data中
            option.series[0].data[0].name ='ESOP系统'; */
            var zhuanyeChart = echarts.init(document.getElementById('hegui'));  
            zhuanyeChart.setOption(hegui, true);   //为echarts对象加载数据
        });

goutongguanli = {
    title : {
        text: '员工沟通管理分数和总平均值',
        subtext: ''
    },
    tooltip : {
        trigger: 'axis'
    },
     legend: {
        data:['总体平均值','个人值']
    }, 
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['工作积极性','沟通能力','工作计划性']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'平均值',
            type:'bar',
            data:[ ${gongzuojijixing_avg}, ${gongtongnengli_avg}, ${gongzuojihuaxing_avg}],
        },
        {
            name:'员工值',
            type:'bar',
             data:d.slice(4, 7),            
        }
    ]
};
$(function() {
           /*  option.series[0].data[0].value=[12,32,34,53,53,65];  // 加载数据到data中
            option.series[0].data[0].name ='ESOP系统'; */
            var zhuanyeChart = echarts.init(document.getElementById('goutongguanli'));  
            zhuanyeChart.setOption(goutongguanli, true);   //为echarts对象加载数据
        });


ziwochengzhang = {
    title : {
        text: '员工自我成长分数和总平均值',
        subtext: ''
    },
    tooltip : {
        trigger: 'axis'
    },
     legend: {
        data:['总体平均值','个人值']
    }, 
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['学习积极性','考试']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'平均值',
            type:'bar',
            data:[  ${xuexijijixing_avg}, ${kaoshi_avg}],
        },
        {
            name:'员工值',
            type:'bar',
             /* data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3,3,2],  */
             data:d.slice(7, 9),            
        }
    ]
};
$(function() {
           /*  option.series[0].data[0].value=[12,32,34,53,53,65];  // 加载数据到data中
            option.series[0].data[0].name ='ESOP系统'; */
            var ziwochengzhangChart = echarts.init(document.getElementById('ziwochengzhang'));  
            ziwochengzhangChart.setOption(ziwochengzhang, true);   //为echarts对象加载数据
        });
        
        
 duigongsigongxian = {
    title : {
        text: '员工对公司贡献分数和总平均值',
        subtext: ''
    },
    tooltip : {
        trigger: 'axis'
    },
     legend: {
        data:['总体平均值','个人值']
    }, 
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['专利','经验库','标准化','重要信息收集','项目文档','其他','培训']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'平均值',
            type:'bar',
            data:[ ${zhuanli_avg}, ${jingyanku_avg}, ${biaozhunhua_avg},${zhongyaoxinxishouji_avg},${xiangmuwendang_avg},${qita_avg},${peixun_avg}],
        },
        {
            name:'员工值',
            type:'bar',
             /* data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3,3,2],  */
             data:d.slice(9, 16),            
        }
    ]
};
$(function() {
           /*  option.series[0].data[0].value=[12,32,34,53,53,65];  // 加载数据到data中
            option.series[0].data[0].name ='ESOP系统'; */
            var zhuanyeChart = echarts.init(document.getElementById('duigongsigongxian'));  
            zhuanyeChart.setOption(duigongsigongxian, true);   //为echarts对象加载数据
        });
 

</script>
</head>
<body>
	<div class="container">
		<style type="text/css">
.main-charts {
	margin-top: 20px;
	width: 98%;
	margin-left: 1%;
}

.first-row {
	padding-left: 15px;
	padding-right: 15px;
}

.main-header {
	width: 100%;
	height: 60px;
	border: 1px solid #ccc;
	margin-top: 20px;
	background: #eee;
}

.main-header-name {
	font-size: 20px;
	font-weight: 800;
	height: 60px;
	line-height: 60px;
	margin-left: 2em;
}

.main-header-message {
	height: 60px;
	padding-top: 12px;
	margin-right: 16%
}

.main-header-message ul li {
	float: left;
	list-style: none;
	margin-right: 30px;
}

.main-header-message ul li div {
	font-size: 12px;
	color: #777
}

.main-header-message ul li div em {
	font-size: 14px;
	color: #282828;
	display: block;
	font-style: normal;
	font-weight: 800;
	text-align: center;
}
</style>
		<div class="row first-row">
			<div class="main-header clearfix">
				<span class="main-header-name pull-left">${result.employee.name }</span>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div class="main-charts">
				 	<div id="main" style="width:300px; height:300px;margin: 50px auto;"></div>
					<!-- <canvas id="myChart"></canvas> -->
				</div>
			</div>
			<div class="col-md-6">
				<div class="main-table">
					<div class="r_title">
						<i class="glyphicon glyphicon-calendar icon-btton"></i> <span
							class="table-title">评分数据展示</span>
					</div>
					<div class="r_table">
						<table class="table ">
							<thead>
								<tr>
									<th></th>
									<th>专业技能</th>
									<th>合规</th>
									<th>沟通管理</th>
									<th>自我成长</th>
									<th>对公司贡献</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>本人</td>
									<td>${result.designAbility}</td>
									<td>${result.compliance}</td>    
									<td>${result.communication}</td>
									<td>${result.learningAbility}</td>
									<td> ${result.work}</td>
								</tr>
								<tr>   
									<td>平均水平</td>
									<td>${designAbility_avg}</td>
									<td>${compliance_avg}</td>
									<td>${communication_avg}</td>
									<td>${learningAbility_avg}</td>
									<td>${work_avg}</td>
								</tr>
								<tr>
									<td>最高水平</td>
									<td>${designAbility_max}</td>
									<td>${compliance_max}</td>
									<td>${communication_max}</td>
									<td>${learningAbility_max}</td>
									<td>${work_max}</td>
								</tr>

							</tbody>
						</table>
						<div class="page-search">
						</div>
						<!--end the table area-->
					</div>
					<!--end table column-->
					
				</div>
				
			</div>
			<!--end table row-->
		</div>
<div id="zhuzhungtu" style="width:1000px; height:400px;margin: 50px auto;"></div>
<div style="width:1000px; height:400px;margin: 50px auto;">
	<div id="zhuanyejishu" style="width: 400px; height: 400px; float: left; margin: 50px auto;"></div>
	<div id="hegui" style="width: 400px; height: 400px; float: right; margin: 50px auto;"></div>
</div>
<div style="width:1000px; height:600px;margin: 50px auto;">
	<div id="goutongguanli" style="width: 400px; height: 400px; float: left; margin: 50px auto;"></div>
	<div id="ziwochengzhang" style="width: 400px; height: 400px; float: right; margin: 50px auto;"></div>
</div>
<div id="duigongsigongxian" style="width:1000px; height:400px;margin: 50px auto;"></div>
</div>
</body>
</html>
