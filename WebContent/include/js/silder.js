var obj=null;
var As=document.getElementById('topnav').getElementsByTagName('a');
obj = As[0];
for(i=1;i<As.length;i++){
	if(window.location.href.indexOf(As[i].href)>=0)
obj=As[i];
	}
obj.id='topnav_current'
window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
$(function(){
	$(".rnav ul > li:even").css("background","#e41637")
	$(".rnav ul > li:odd").css("background","#46ce14")
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