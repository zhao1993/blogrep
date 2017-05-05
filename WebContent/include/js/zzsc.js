var num = 0;

$("li img").load(function(){
	num++;
	if(num==5){
		$("#index_pic").show();
	}
}).click(function(){

//如果已经处于active状态，return
if (this.className.indexOf("active")!=-1) 
return;

//active状态的图片恢复原样
$("li img.active").fadeTo(200,0.6).removeClass("active").animate({top:5,width:52,left:10},300);

//获取数据
var i = $(this).attr("pic");
var t = $(this).attr("text").split("|");

//当前
$(this).animate({top:-5,width:52,height:35},100).addClass("active").fadeTo(200,1);
$("#back").children().addClass("gray").end().fadeTo(500,0.1,
	function(){
		$(this).children("img").attr("src",$('.small_pic_unique.active').attr('src')).removeClass("gray");//更改图片
		$(this).attr("href",t[0]);
		$(this).attr("target",t[1]);
		$(this).fadeTo(500,1,function(){
			$("#frontText").html(t[0]).fadeIn(200);	
			$("#frontTextBack").html(t[0]).fadeIn(200);	
			$("#frontTextSub").html(t[1]).fadeIn(200)
		});
	})
});

//初始第一张图片
var i =0;

show();

function show(){
	if (i==$("li img").size()) 
	i = 0
	$("li img").eq(i).click();
	i++;
	setTimeout("show()",10000);
}

if (self.location.search!=""){
	var V = self.location.search;
	V = V.substr(1,V.length);
	eval(V);
	if (option.animate == 0){
		$("#index_pic ul").hide();
	}
	$("#back img").width($("#index_pic").width());
	$("#back img").height($("#index_pic").height());
}