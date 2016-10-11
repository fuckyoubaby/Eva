/*
	@author:moang
	@date:2015-08-12 14:12:12
	@description:验证插件1.0版本

	属性参数说明
	示例:
	jrequired:"jrequired";代表必填 
	jtip:提示信息
	//添加一定有值的时候才判断
	jmin/jmax:范围限制
	jvalidator:email/password/int/date
	jregex/jmessage:jregex是增则表达式;jmessage是提示的错误信息

	//调用
	xyForm.init({id:"vform",btnId:"submitbtn",showMsg:function(msg){
		alert(msg);
	}});	

	//参数说明:
	id:form表单的id
	bntId:代表是提交的buttonId
	callback:ajax请求或者form表单提交
*/

var xyForm = function(opts){
	return{
		formDom:null,
		ajaxResult:{result:true,inputDom:null,msg:""},
		dom:function(id){
			return document.getElementById(id);
		},
		init:function(opts){
			var thisDom = this;
			thisDom.formDom = thisDom.dom(opts.id);
			if(opts.showMsg){
				this.showMessage = opts.showMsg;
			}
			thisDom.dom(opts.btnId).onclick = function(){
				var elements = thisDom.formDom.elements;
				var i=0, length=elements.length;
				var mark = true;
				for(;i<length;i++){
					var edom = elements[i];
					var type=edom.type;
					var regx = new RegExp("submit|button|reset|hidden","ig");
					if(!regx.test(type)){
						if(!thisDom.validator(edom)){
							mark = false;
							break;
						} 
					}
				}
				mark = mark &&  thisDom.ajaxValidator(thisDom);
				if(mark){
					if(opts.callback) opts.callback.call(this,thisDom.formDom);
				}
			};
			
			
		},
		attr:function(dom,key){
			return dom.getAttribute(key);
		},
		regexpJson:{
				"email":[/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,"请输入正确的邮箱"],
				"date":[/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|([1-2][0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$/,"请输入正确的日期yyyy/MM/dd"],
				"simpledate":[/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|([1-2][0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$/,"请输入正确的日期yyyy/MM/dd hh:mm:ss"],
				"int":[/^[1-9]\d*$/,"请输入正确的数值!!!"],
				"int0":[/^(0|[1-9][0-9]*)$/,"请输入正确的数值!!!"],
				"float":[/^(([1-9]\d*\.\d*)|(0\.\d*[1-9])|([1-9]\d*))\d*$/,"请输入正确数值!"],
				"idcard":[/(^\d{15}$)|(^\d{17}([0-9]|X)$)/, "请输入15或18位身份证!"],
				"account":[/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/,"请输入5-16位以字母开头账号"],
				"phone":[/^((13[0-9])|(15[^4\D])|(18[0,5-9]))\d{8}$/,"请输入正确手机号码"],
				"typeId":[/^[a-zA-Z][a-zA-Z0-9\-\_]{4,15}$/,"请输入5-16位以字母开头型号"],
				"terminalId":[/^[a-zA-Z0-9][a-zA-Z0-9\-\_]{6,19}$/,"请输入7-20位以字母或数字开头型号"]
		},
		showMessage:function(edom, msg){
			var name = edom.name;
			var $spanDom = this.dom(name);
			if($spanDom) $spanDom.innerText = msg;
		},
		validator:function(edom){
		 var value = edom.value;
		 var len = value.length;
		 var required = edom.getAttribute("jrequired");
		 var type = edom.type;
		 var ajaxCheck = edom.getAttribute("jAjaxCheck");
		 /*console.log(edom.name+"---"+edom.type);*/
		 /*选择处理下拉列表*/
		 if(required&&(type=='select-one')){
			//console.log(value);
			if(isNotEmpty(value)&&(value=='0')){
				var jtip = this.attr(edom, "jtip");
				edom.focus();
				var msg = jtip || "请选择内容...";
				this.showMessage(msg);
				return false;
			}
		 }; 
		 /*空值验证*/
		 if(required && isEmpty(value)){
			var jtip = this.attr(edom, "jtip");
			jtip = jtip || "请输入"+edom.placeholder;
			edom.focus();
			var msg = jtip || "请输入内容...";
			/*//输出验证信息*/
			this.showMessage(msg);
			return false;
		 };
		 
		/* //长度验证*/
		 var jmin = this.attr(edom, "jmin");
		 var jmax = this.attr(edom, "jmax");
		 if(isNotEmpty(value) && jmin && jmax){
			if(jmin>len || len>jmax){
				edom.focus();
				this.showMessage("内容不小于"+jmin+"或不大于"+jmax);
				return false;
			}
		 };
		
		/*//确认密码验证*/

		/*/正则表达式验证*/
		 var jregex = this.attr(edom,"jregex");
		 if(isNotEmpty(value)&& jregex){
			var jmessage = this.attr(edom,"jmessage");
			var regex = eval("("+jregex+")");
			if(!eval(regex).test(value)){
				edom.focus();
				this.showMessage(jmessage);
				return false;
			}
		 }else{/*使用内置正则表达式验证*/
			 var jtype = this.attr(edom,"jvalidator");/*email date int*/
			 if(isNotEmpty(value) && jtype){
				var arr = this.regexpJson[jtype];
				var regexp = arr[0];
				var msg = arr[1];
				if(!regexp.test(value)){
					edom.focus();
					this.showMessage(msg);
					return false;
				}
			 }
		 };
		 if(ajaxCheck){
			 this.showMessage(this.ajaxResult.msg); 
		 }
		 return true;
		},
		ajaxValidator:function(thisDom){
			if(!thisDom.ajaxResult.result&& thisDom.ajaxResult.inputDom!=null){
				var dom = thisDom.ajaxResult.inputDom;
				dom.focus();
				thisDom.showMessage(thisDom.ajaxResult.msg);
				return false;
			};
			return true;
		}
	};
};


/**
* 判断是否为空
* @param val
* @return {Boolean}
*/

function isEmpty(val){
	/*console.log(val);*/
	val = val.trim();/*trim可以使用*/
	/*console.log(val);*/
	if(val == null)
		return true;
	if(val == undefined || val =='undefined')
		return true;
	if(val =="")
		return true;
	if(val.length == 0)
		return true;
	if(!/[^(^\s*)|(\s*$)]/.test(val))
		return true;
	return false;
};

function isNotEmpty(val){
	return !isEmpty(val);
}