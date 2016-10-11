/**
	creator:郭潇阳
	copy-right:长虹网络公司
	date:2016/1/19
	description:处理结果显示或load显示
	example:
	var laod = new loading({
	data:'xxx',//显示内容
	time:5000,//消失时间(可选),单位为ms
	});
	load.init();
*/
function loading(opts){

	/*浏览器窗口变动处理事件*/
	function handler(event){
		var $this = event.data.$this;
		var b_width = $(window).width();
		var b_height = $(window).height();
		var $load = $this.divDom;
		var i_width = $load.width();
		var i_height = $load.height();
		if(b_width>i_width){
			$load.css('left', (b_width-i_width)/2+'px');
		}else $load.css('left','0px');
		if(b_height>i_height){
			$load.css('top', (b_height-i_height)/2+'px');
		}else $load.css('top', '0px');
	};

	function getRandomAnimateIn(){
		var array=[];
		array.push("animated flipInX");
		array.push("animated flipInY");
		array.push("animated fadeIn");
		array.push("animated fadeInUp");
		array.push("animated fadeInDown");
		array.push("animated fadeInLeft");
		array.push("animated fadeInRight");
		array.push("animated fadeInUpBig");
		array.push("animated fadeInDownBig");
		array.push("animated fadeInLeftBig");
		array.push("animated fadeInRightBig");
		array.push("animated bounceIn");
		array.push("animated bounceInUp");
		array.push("animated bounceInDown");
		array.push("animated bounceInLeft");
		array.push("animated bounceInRight");
		array.push("animated rotateIn");
		array.push("animated rotateInUpLeft");
		array.push("animated rotateInDownLeft");
		array.push("animated rotateInUpRight");
		array.push("animated rotateInDownRight");
		array.push("animated rollIn");
		var ran = Math.floor(Math.random()*22);
		return array[ran];
	};

	function getAnimateOut(animateIn){
		return animateIn.replace("In","Out");
	};

	/*返回值为json对象*/
	return {
		'initHtml':"<img src='images/loading.gif' width='16px' height='16px' style='margin-right:10px'/>",
		'data':'郭先生，要努力哈^_^!',
		animateIn:"",
		support:true,
		init:function(){
			//初始化DOM对象
			this.initDom();

			var $this = this;
			var $divDom = $this.divDom;
			if(!$this.support){
			  $divDom.css("display","none");
			}
			$("body").append($divDom);
			if(!$this.support){
				$divDom.slideDown("middle");
			}else{
				$divDom.addClass($this.animateIn);
			}
			//窗体居中
			$this.beCenter();
			$(window).bind('resize', {'$this':$this},handler);
			var time =5000;
			if(opts){
				time = opts.time?opts.time : time;
			}
			$this.close($this, time);
		},
		initDom:function(){
			var html ="";
			if(opts){
				this.data = opts.data?opts.data: this.data;
				if(opts.support&&opts.support=='0'){
			    this.support=false;
			   }
			}
			html = this.initHtml+this.data;
			var $divDom = $("#ch_loading");
			if($divDom) $divDom.remove();
			$div = $("<div class='loading'></div");
			$div.attr("id","ch_loading");
			if(this.support){
				this.animateIn = getRandomAnimateIn();
			}
			$div.html(html);
			this.divDom = $div;
		},
		beCenter:function(){
			var b_width = $(window).width();
			var b_height = $(window).height();
			var $load = this.divDom;
			var i_width = $load.width();
			var i_height = $load.height();
			if(b_width>i_width){
				$load.css('left', (b_width-i_width)/2+'px');
			}else $load.css('left','0px');

			if(b_height>i_height){
				$load.css('top', (b_height-i_height)/2+'px');
			}else $load.css('top', '0px');
		},
		close:function($this,time){
			setTimeout(function(){
				//console.log("$this.support---"+$this.support);
				if(!$this.support){
				  $this.divDom.slideUp("middle");
				}else{
					$this.divDom.addClass(getAnimateOut($this.animateIn));
				}
				$(window).unbind('resize', {'$this':$this},handler);
			}, time);
		}
	};
};
/*判断浏览器是否支持 CSS3 animated属性*/
function getAniSuppResult(){
	var bro=$.browser;
	var binfo="";
	if(bro.msie) {binfo="ie_"+bro.version;}
	if(bro.mozilla) {binfo="mozilla_"+bro.version;}
	if(bro.safari) {binfo="safari_"+bro.version;}
	if(bro.opera) {binfo="opera_"+bro.version;}
	console.log(binfo);
	var array= binfo.split("\_");
	if(array[0]=="ie"){
	  if(array[1]<10) return false;
	}
	if(array[0]=='mozilla') return false;
	if(array[0]=='opera') return false;
	return true;
};
