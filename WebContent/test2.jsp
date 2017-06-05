<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JavaScript Test</title>
<script type="text/javascript" src="include/js/jquery.min.js"></script>
</head>
<body>
<div id="container"></div>
<script type="text/javascript">
//指定元素数量 ()
var quantity = 100;
//鼠标感应范围(px)
var range = 100;
//鼠标位置
var mp = {x:8,y:8};
//获取随机颜色
var getColor = function(){
	//IE内核不支持8位颜色码。。。
	return '#'+function(color){
		return color.length==6?color:arguments.callee(color+='0123456789ABCDEF'[Math.floor(Math.random()*16)]);
	}('');
}
//为元素产生随机坐标和移动间隔时间
var position = function(elm){
	//如果元素没有被捕捉则执行系统随机坐标
	if($(elm).attr('aria-catch')==null || $(elm).attr('aria-catch')=='0'){
	return {
		x:Math.random()*document.documentElement.clientWidth-10,
		y:Math.random()*document.documentElement.clientHeight-10,
		d:parseInt(Math.random()*26000+34000)
	}}else{
		mx = parseInt(Math.random()*((mp.x+range)-(mp.x-range))+(mp.x-range));
		my = parseInt(Math.random()*((mp.y+range)-(mp.y-range))+(mp.y-range));
		md = parseInt(Math.sqrt((Math.abs(mp.x - mx)*2 + Math.abs(mp.y - my)*2)))*60;
	//如果元素被捕捉则执行鼠标范围内的坐标
		return {x:mx,y:my, d:md }; }
}

//产生元素
for(var i=0;i<quantity;i++){
	var block = $('<div></div>');
	block
	.html(i)
	.attr({'id':i,
		'class':'blockDiv',
		'aria-catch':'0'})
	.css({'border-radius':'50%',
		'width':'10px',
		'height':'10px',
		'position':'absolute',
		'background':getColor(),
		'top':position($(this)).y+'px',
		'left':position($(this)).x+'px'
		});
	$('body').append(block);
}
//元素随机移动
var event = setInterval(function(){
	$('.blockDiv').each(function(){
		var p = position($(this));
			$(this).animate({
				left: p.x+'px',
				top: p.y+'px'},
				p.d
			);			//--animate
		} 
	);					//--each
},200);					//--Inerval
//测试用鼠标检测范围div
var mouse = $('<div></div>');
mouse
.html('<p>元素捕捉-->小子哪里跑<p><p>捕捉到的元素编号:</p><div></div>')
.css({'width':range*2+'px','height':range*2+'px','background':'rgb(251,142,213)','opacity':'.4','position':'absolute','left':'-1000px','top':'-1000px'})
.attr('id','mouseDiv');
$('body').append(mouse);
//鼠标移动事件
$('html').mousemove(function(event){
	//位捕捉器设置位置，方便调试
	$('#mouseDiv').offset({left:event.clientX-range,top:event.clientY-range});
	//标记鼠标位置
	mp = {x:event.clientX,y:event.clientY};
	//检测
	checkRange();
});
//给定一个坐标检查坐标周围的元素
function checkRange(){
	//存储元素编号
	var code = '';
	//对页面 上的元素进行遍历
	$('.blockDiv').each(function(){
		var left = parseInt($(this).offset().left) ;
		var top = parseInt($(this).offset().top) ;
		//元素在鼠标的检测范围内
		if(top<(mp.y+range) && top>(mp.y-range) && left>(mp.x-range) && left < (mp.x+range)){
			code += $(this).attr('id')+' ';
			//停止自动移动的路线
			$(this).stop();
			//添加被捕捉的标记()
			$(this).attr('aria-catch','1');
			//联动 被检测到的元素也会变成一个临时的检测器 
		}
	});
	//将捕捉到的元素编号显示在面板上面
	$('#mouseDiv > div').text(code);
}
</script>
</body>