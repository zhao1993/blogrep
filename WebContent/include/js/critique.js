//JS利用AJAX获取后台的评论内容并且生成可操作的文档内容
//依赖critique。jsp文件和样式表
//*当前页的标签属性 -->$('kkpager').attr('aria-page')可以使用其他元素代替
//load critiques by Ajax
var onMsg = '展开更多回复>>';
var offMsg = '收起更多回复<<';
var width = 700;
var hideSize = 2;
var pageSize = 5;
var parentId = null;
$(document).ready(function(){
	$.post(
	'../critique/critiqueTestJson',
	{
		'pageSize':pageSize,
		'page':$('kkpager').attr('aria-page'),
		'critique.type':$('input[name="critique.type"]').val(),
		'critique.articleId':$('input[name="critique.articleId"]').val()
	},
	function(data){
		$('kkpager').attr({
			'aria-page':data.page,
				'aria-all':data.totalPage,
					'aria-data':data.size
		});
			if(data.critiques.length>pageSize){
				console.info('获取评论列表失败！');
				return false;
			}
			//doRecursion
			doRecursionCritique(data.critiques,-1);
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
	parentId = id;
}
//删除留言
function deleteCritique(id){
	$.Alert({
		attr:{width:'240px'},
		title:'警告',
		content:'评论留言删除后无法恢复是否继续?',
		confirmmsg:'删除',
		confirmbtn:function(){
			$.post('../manage/critique_delete?id='+id,function(){
				window.location.reload();
			});
		},
		canclemsg:'取消',
		canclebtn:true
	});
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
		critiqueElement.append($('<dt><img src="'+(c.user.headpic==null?"../include/images/s8.jpg":c.user.headpic)+'"/></dt>'));
		critiqueElement.append($('<dd><a href="#">'+c.user.name+'</a><time>'+(c.critique!=null?"回复 <a href='#'>"+c.critique.user.name+"</a>":'')+'&nbsp'+c.time+'</time></dd><dd>'+replace_em(c.content)+'</dd>'));
		if($('input[name="blog_manager"]').val()){
			critiqueElement.append($('<open-more></open-more><a href="javascript:;" onclick=deleteCritique('+c.id+') style="float:right">删除</a>'));
		}else{
			critiqueElement.append($('<open-more></open-more><a href="javascript:;" onclick=gotoAnchor("'+c.user.name+'",'+c.id+') style="float:right">回复</a>'));
		}
		
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
					if(child_dls.length > 0){
						$(this).find('open-more:first').html('<a href="javascript:;" onclick=openMore("'+$(this).attr('class')+'") >'+onMsg+'</a>');
					}
					$('dl[aria-pclass='+$(this).attr('class')+']').hide();
				}
			);
		if(null!=c.critiques && c.critiques.length>0){
			$.post(
					'../critique/critiqueForChildJson?parentId='+c.id,
					function(_critiques){
						doRecursionCritique(_critiques,poids+1);
				}
			);
		}
	}
}
function critiqueValidate() {
	if($('textarea[name="critique.content"]').val()){
		$.post("../critique/critique_add",
			{
			'critique.content':$('textarea[name="critique.content"]').val(),
			'critique.id':$('input[name="critique.id"]').val(),
			'critique.type':$('input[name="critique.type"]').val(),
			'critique.articleId':$('input[name="critique.articleId"]').val(),
			'parentId':parentId
			},
			function(){
				$('textarea[name="critique.content"]').val("");
				window.location.reload();
			});
	} else {
		$.Alert({title:"提示",content:"回复内容不能是空或者低于15字",confirmbtn:function(){}});
		return false;
	}
}
function replace_em(str){
	str = str.replace(/\</g,'&lt;');
	str = str.replace(/\>/g,'&gt;');
	str = str.replace(/\n/g,'<br/>');
	str = str.replace(/\[em_([0-9]*)\]/g,'<img style="display:inline;" src="../plugin/reply/arclist/$1.gif" border="0" />');
	return str;
}