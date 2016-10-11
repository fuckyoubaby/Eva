<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="../taglib.jsp" %>
<!DOCTYPE>
<html>
<head>
<base href="${basePath}/"/>
<link rel="stylesheet"  type="text/css" href="<%=basePath%>/css/demo.css" />
<link rel="stylesheet"  type="text/css" href="<%=basePath%>/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" charset="utf-8" src="<%=basePath%>/js/jquery-1.4.4.min.js" ></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>/js/jquery.ztree.core.js" ></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>/js/jquery.ztree.excheck.js" ></script>
<script type="text/javascript" charset="utf-8" src="<%=basePath%>/js/jquery.ztree.exedit.js" ></script>

<link href="<%=basePath%>/css/loading.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/css/animate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/js/loading_upgrade.js"></script>
<script type="text/javascript">
this.myLoading=function(data){
	var support = getAniSuppResult()?1:0;
	data.support = support;
	var load = new loading(data);
	load.init();
};
</script>
<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
body{background-color: #F3F4F5;}
</style>
</head>
<body>
 
<script type="text/javascript">
	console.log('${jsonInit}');
	var zNode = eval('${jsonInit}');
	console.log(zNode);

	var zTreeObj;
	//zTree 的参数配置
	var setting = {
			view: {
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				selectedMulti: false
			},
			edit: {
				enable:true,
				removeTitle:"移除词条",
				renameTitle:"词条重命名",
				editNameSelectAll:true,
				showRemoveBtn: showRemoveBtn,
				showRenameBtn: showRenameBtn
			},
			data:{
				simpleData:{
					enable:true,
					idKey:"nId",
					pIdKey:"pId",
					rootPId:null
				}
			},
			callback: {
				beforeDrag:beforeDrag,
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename
			}
	};
	
	function filter(treeId,parentNode,childNodes){
		if(!childNodes) return null;
		for(var i=0,l=childNodes.length;i<l;i++){
			childNodes[i].name=childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	};
	
	var className="dark";
	function beforeDrag(treeId, treeNodes){
		/* 禁止拖拽 */
		return false;
	};
	/* 出现输入框之前调用的方法 */
	function beforeEditName(treeId, treeNode){
		console.log("beforeEditName:--log:treeId=="+treeId+", treeNode.id=="+treeNode.tId);
		var nodeId = treeNode.tId;
		nodeId = nodeId.replace(treeId+'_', '');
		console.log(nodeId);
		className = (className ==="dark" ? "":"dark");
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		zTree.selectNode(treeNode);
		//return confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
		return true;
	};
	
	/* 删除节点之前调用 */
	function beforeRemove(treeId, treeNode){
		className = (className ==="dark" ? "":"dark");
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		zTree.selectNode(treeNode);
		
		var mesg = treeNode.isParent?"确认删除 节点 -- " + treeNode.name + " 吗？\n删除后会清空它的子节点":"确认删除 节点 -- " + treeNode.name + " 吗？";
		var  b =  confirm(mesg);
		if(b){
			//默认删除失败，后台操作完成后移除节点
			var parentNodeArray=[];
			if(!treeNode.isParent){
				parentNodeArray.push(treeNode.nId);
			}else{
				var nodeArr =  zTree.transformToArray(treeNode);
				for(var ni=0,nlen=nodeArr.length;ni<nlen;ni++){
						parentNodeArray.push(nodeArr[ni].nId);
				}
			}
			parentNodeArray.sort(function(x,y){return parseInt(y)-parseInt(x);});
			$.ajax({
				type:'post',
				url:'${basePath}/dataDirt/dataNodeDelete.action',
				data:{nodeArray:parentNodeArray},
				dataType:"json",
				success:function(data){
					var json;
/* 					console.log(data instanceof Object);
					console.log('object' instanceof Object); */
					if(!data instanceof Object){
						json = eval('('+data+')');
					}else json = data;
					if(json.result=='fail'){
						myLoading({data:'删除失败',time:5000});
					}else{
						var zTree = $.fn.zTree.getZTreeObj(treeId);
						zTree.removeNode(treeNode, false);
						var pNode = treeNode.getParentNode();
						initFromNode(treeId,pNode);
						myLoading({data:'删除成功',time:3000});
					}
				}
			});
			}
		return false;
	};
	
	/* 删除节点之后调用的事件 */
	function onRemove(e, treeId, treeNode){
		/* 
		1、获取该节点的数据，如果有子节点，一并向后台请求删除
		2、重新加载tree的数据
		*/
	};
	
	/* 在input输入内容之后，节点未修改数据之前调用 */
	function beforeRename(treeId, treeNode, newName, isCancel){
		className = (className === "dark" ? "":"dark");
		var oldName = treeNode.name;
		var nodeId = treeNode.nId;
		console.log("现在的name:"+treeNode.name+"---输入的name："+newName+",ID ="+nodeId);
		if (newName.length == 0) {
			myLoading({data:'节点名称不能为空!',time:5000});
			var zTree = $.fn.zTree.getZTreeObj(treeId);
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}
	   if(oldName==newName){
			//不用AJAX提交
			return true;
		}else{
			//提交AJAX请求
			$.ajax({
				type:'post',
				url:'${basePath}/dataDirt/dataDirtUpdate.action',
				data:{nId:nodeId,newName:newName},
				dataType:"json",
				success:function(data){
					var json;
					if(!data instanceof Object){
						json = eval('('+data+')');
					}else json = data;
					if(json.result=='fail'){
						myLoading({data:'修改失败',time:5000});
						treeNode.name=oldName;
						var zTree = $.fn.zTree.getZTreeObj(treeId);
						zTree.updateNode(treeNode,false);
					}else{
						myLoading({data:'修改成功',time:3000});
					}
				}
			});
		}
		return true;
	};
	
	/* 节点重命名完成之后调用的方法 */
	function onRename(e, treeId, treeNode, isCancel){
		/* 插件重命名节点之后调用 
		1、获取节点ID和新的name值，AJAX提交后台更新节点信息
		2、刷新tree数据
		*/
		//console.log("现在的name:"+treeNode.name+"---,ID ="+treeId);
		
	};
	
	/* 当前节点为第一个节点时不显示移除按钮 */
	function showRemoveBtn(treeId,treeNode){
		if(!treeNode.parentTId) return false;
		return true;
	};
	/* 当前节点是最后一个节点时不显示重命名插件 */
	function showRenameBtn(treeId,treeNode){
		return true;
	}
	
	/* 新增按钮的操作 */
	var newCount =1;
	function addHoverDom(treeId,treeNode){
		var sObj = $("#"+treeNode.tId+"_span");
		if(treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
		var addStr = "<span class='button add' id='addBtn_"+treeNode.tId+
		"' title='添加新词条' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $("#addBtn_"+treeNode.tId);
		if(btn) btn.bind("click",function(){
			var nId = treeNode.nId;
			$.ajax({
				type:'post',
				url:'${basePath}/dataDirt/addOne.action',
				data:{pId:nId},
				dataType:"json",
				success:function(data){
					var json;
					if(!data instanceof Object){
						json = eval('('+data+')');
					}else json = data;
					if(json.result=='fail'){
						myLoading({data:'新增失败,稍后重试',time:5000});
					}else{
						var zTree = $.fn.zTree.getZTreeObj(treeId);
						/* 现在后台添加，而后加入此节点的数据*/
						zTree.addNodes(treeNode,{nId:json.nId,pId:json.pId,name:json.name});
						//return false;
						initFromNode(treeId, treeNode);
						myLoading({data:'新增成功',time:3000});
					}
				}
			});
		});
	};
	
	function removeHoverDom(treeId,treeNode){
		$("#addBtn_"+treeNode.tId).unbind().remove();
	}
	
	$(document).ready(function(){
		var zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNode);
		initNodes('treeDemo'); 
	});
	
	/*初始化节点：展开节点，更换图标*/
	function initNodes(treeId){
		var zTreeObj = $.fn.zTree.getZTreeObj(treeId);
		zTreeObj.expandAll(true);
		var root = zTreeObj.getNodes();
		var iconRootOpen='${basePath}/css/zTreeStyle/img/diy/1_open.png';
		var iconRootClose='${basePath}/css/zTreeStyle/img/diy/1_close.png';
		var iconChild='${basePath}/css/zTreeStyle/img/diy/9.png';
		
		root[0].iconOpen = iconRootOpen;
		root[0].iconClose= iconRootClose;
		zTreeObj.updateNode(root[0]);
		
		var nodes = zTreeObj.transformToArray(zTreeObj.getNodes());
		for(var i=0,len=nodes.length;i<len;i++){
			if(!nodes[i].isParent){ nodes[i].icon=iconChild;
				zTreeObj.updateNode(nodes[i]);
			}
		}
	};
	function initFromNode(treeId,treeNode){
		var zTreeObj = $.fn.zTree.getZTreeObj(treeId);
		zTreeObj.expandAll(true);
		var iconRootOpen='${basePath}/css/zTreeStyle/img/diy/1_open.png';
		var iconRootClose='${basePath}/css/zTreeStyle/img/diy/1_close.png';
		var iconChild='${basePath}/css/zTreeStyle/img/diy/9.png';
		if(treeNode.level>0){
			if(treeNode.isParent){
				treeNode.icon="";
				var nodes = zTreeObj.transformToArray(treeNode);
				console.log(treeNode.name);
				for(var i=0,len=nodes.length;i<len;i++){
					if(!nodes[i].isParent){ 
						nodes[i].icon=iconChild;
						zTreeObj.updateNode(nodes[i]);
					}
				}
			}else{
				treeNode.icon=iconChild;
			}
		}
		zTreeObj.updateNode(treeNode);
	}
</script>
	<div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</body>
</html>