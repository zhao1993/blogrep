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
//元素数量
var quantity = 1;
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
		'position':'relative',
		'background':getColor(),
		'top':position($(this)).y+'px',
		'left':position($(this)).x+'px',
		'margin':'5px'
		});
	$('body').append(block);
}
$('body').append($('<div id="sm">0</div>').css({'width':'20px','height':'20px','background':'red'}));
$('#sm').offset({top:0,left:0});
/* //记忆
$(window).mousemove(function(event){
	$(".blockDiv").animate({
		top:event.clientY+'px',
		left:event.clientX+'px'
	},10);
}); */
$(window).mousemove(function(event){
	$(".blockDiv").animate({
		top:event.clientY+'px',
		left:event.clientX+'px'
	},Math.sqrt((Math.abs(event.clientX - $(this).offset().left)*2 + Math.abs(mp.y - my)*2)));
});
</script>
</body>