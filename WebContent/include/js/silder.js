var obj=null;
var As=document.getElementById('topnav').getElementsByTagName('a');
obj = As[0];
for(i=1;i<As.length;i++){
	if(window.location.href.indexOf(As[i].href)>=0)
obj=As[i];
	}
obj.id='topnav_current'
$(function(){
	$(".rnav ul > li:even").css("background","#e41637");
	$(".rnav ul > li:odd").css("background","#46ce14");
	//获取主副标题 
	$(document).ready(function(){
		$.post(
				'../base/select',
				function(base){
					$(".ibody > header > h1").fadeOut('fast',function(){
						$(this).text(base.title);
						$(this).fadeIn(2000);
					});
					$(".ibody > header > h2").fadeOut('fast',function(){
						$(this).text(base.stitle);
						$(this).fadeIn(2000);
					});
				}
			)
	})
})
function editMode(){
			$.Alert({
				'title':'进入编辑模式',
				'content':'请输入进入模式的指令:',
				'inputb':true,
				'confirmbtn':function(){
					$.post("../manage/json_account", {
						'account':$.inputval
						},
						function(data){
					     	if(data=="true"){
					     		window.location="../manage/article";
					     	};
					 });
				},
				'canclebtn':function(){
				}
			});
		}