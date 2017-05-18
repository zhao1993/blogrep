//JS利用AJAX获取后台的评论内容并且生成可操作的文档内容
//依赖critique。jsp文件和样式表
//*当前页的标签属性 -->$('kkpager').attr('aria-page')可以使用其他元素代替
//load critiques by Ajax
var onMsg = '展开更多回复>>';
var offMsg = '收起更多回复<<';
var width = 700;
var hideSize = 2;
$(document).ready(function(){
	$.post(
	'critique/critiqueTestJson?pageSize=5&page='+$('kkpager').attr('aria-page'),
	function(critiques){
			console.info("critique's count："+critiques.length);
			//doRecursion
			doRecursionCritique(critiques,-1);
		}
	);
});
function openMore(clas){
	$('dl[aria-pclass='+clas+']').toggle();
	$('dl[class='+clas+']').find('open-more:first').find('a:first').text($('dl[aria-pclass='+clas+']').is(':visible')?offMsg:onMsg);
}
//通过锚点跳转到回复框位置
function gotoAnchor(name,id){
	//检测登录状态
	//checkLoginUp();
	document.getElementById("critique_reply").scrollIntoView();
	var action = $('#critique_reply').attr('action');
	$('#critique_reply').attr('action',action+"?parentId="+id);
}
function critiqueAlert(name,id){
	//检测登录状态
	//checkLoginUp();
	$.Alert({
		title:'call: '+name,
		custom:$('<div><textarea class="critiquecontent" cols="36" rows="10"></textarea></div>'),
		confirmbtn:function(){
			$.post('../critique/critique_add',
					{'critique.name':'TEST',
					'critique.notice':'moni',
					'parentId':id,
					'ispublic':'',
					'critique.content':$('.critiquecontent').val()
					},function(){
						alert($('.critiquecontent').val());
			});
		},
		canclebtn:function(){
			
		}
	});
}
function doRecursionCritique(critiques,poids){
	for(var i=0;i<critiques.length;i+=1){
		var c = critiques[i];
		//document
		var critiqueElement = $('<dl></dl>');
		critiqueElement.append($('<dt><img src="'+(c.photo==null?"../include/images/s8.jpg":c.photo)+'"/></dt>'));
		critiqueElement.append($('<dd><a href="#">'+c.name+'</a><time>'+(c.critique!=null?"回复 <a href='#'>"+c.critique.name+"</a>":'')+'&nbsp'+c.time+'</time></dd><dd>'+c.content+'</dd>'));
		critiqueElement.append($('<open-more></open-more><a href="javascript:;" onclick=gotoAnchor("'+c.name+'",'+c.id+') style="float:right">回复</a>'));
		critiqueElement.attr({'class':'critique_class'+c.id,'aria-val':(c.critique!=null?c.critique.id:'null')});
		critiqueElement.css({'width':width+'px','border-top-style':'dotted','border-top-width':'2px','border-top-color':'black'});
		if(poids==-1){
			$('#critiqueList').append(critiqueElement);
		}else if(poids==0){
			$('.critique_class'+c.critique.id).append(critiqueElement);
		}else{
			$('.critique_class'+c.critique.id).after(critiqueElement);
		}
		$('dl[aria-val!="null"]').css({'margin-left':'50px','width':'650px','border-top-style':'dotted','border-top-width':'1px'});
		$('dl[aria-val="null"]').each(
				function(){
					var child_dls  = $(this).find('dl:gt('+(hideSize-1)+')');
					$(child_dls).attr('aria-pclass',$(this).attr('class'));
					
					
					
					if(child_dls.length > hideSize){
						$(this).find('open-more:first').html('<a href="javascript:;" onclick=openMore("'+$(this).attr('class')+'") >'+onMsg+'</a>');
					}
					
					
					
					$('dl[aria-pclass='+$(this).attr('class')+']').hide();
				}
			);
		if(null!=c.critiques && c.critiques.length>0){
			$.post(
					'critique/critiqueForChildJson?parentId='+c.id,
					function(_critiques){
						doRecursionCritique(_critiques,poids+1);
				}
			);
		}
	}
}
$('input[name="critique.name"],textarea[name="critique.content"]')
.bind({
	blur : function() {
		if (!$(this).val()) {
			$(this).next().text("×请输入内容！").css("color", "red");
		}
	},
	focus : function() {
		$(this).next().text("");
	}
});
$('input[name="critique.notice"]').next().fadeOut("fast");
$('input[name="critique.notice"]').on("keyup",function(){
if (!$(this).val()) {
$(this).next().fadeOut();
}else{
$(this).next().fadeIn();
}
});
function critiqueValidate() {
var name = $('input[name="critique.name"]').val();
var content = $('textarea[name="critique.content"]').val();
if (name && content) {
var contact = $('input[name="critique.notice"]'); 
if(contact.val()){
contact.val(contact.val()+$("select[name='ispublic']").val());
}
return true;
} else {
$.Alert({title:"提示",content:"存在不能为空的选项",confirmbtn:function(){}});
return false;
}
}