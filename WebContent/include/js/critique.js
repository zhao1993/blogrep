/*Integer id;
 Critique critique;
 Integer articleId;
 String content;
 String name;
 String time;
 String photo;
 String type;
 String notice;
 Set critiques = new HashSet(0);*/
//load critiques by Ajax
var onMsg = '展开更多回复>>';
var offMsg = '收起更多回复<<';
var width = 700;
var hideSize = 3;
$(document).ready(function(){
	$.post(
	'critique/critiqueTestJson?pageSize=20',
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
function doRecursionCritique(critiques,poids){
	for(var i=0;i<critiques.length;i+=1){
		var c = critiques[i];
		//document
		var critiqueElement = $('<dl></dl>');
		critiqueElement.append($('<dt><img src="'+(c.photo==null?"../include/images/s8.jpg":c.photo)+'"/></dt>'));
		critiqueElement.append($('<dd><a href="#">'+c.name+'</a><time>'+(c.critique!=null?"回复 <a href='#'>"+c.critique.name+"</a>":'')+'&nbsp'+c.time+'</time></dd><dd>'+c.content+'</dd>'));
		critiqueElement.append($('<open-more></open-more><a href="#" style="float:right">回复</a>'));
		critiqueElement.attr({'class':'critique_class'+c.id,'aria-val':(c.critique!=null?c.critique.id:'null')});
		critiqueElement.css({'width':width+'px','border-top-style':'dotted','border-top-width':'2px','border-top-color':'black'});
		if(poids==-1){
			//主循环
			$('#critiqueList').append(critiqueElement);
		}else if(poids==0){
			//次循环添加到子元素
			$('.critique_class'+c.critique.id).append(critiqueElement);
		}else{
			//子元素的兄弟元素
			$('.critique_class'+c.critique.id).after(critiqueElement);
		}
		$('dl[aria-val!="null"]').css({'margin-left':'50px','width':'650px','border-top-style':'dotted','border-top-width':'1px'});
		//子元素下的兄弟元素超过指定隐藏设定就隐藏
		$('dl[aria-val="null"]').each(
				function(){
					var child_dls  = $(this).find('dl:gt('+(hideSize-1)+')');
					$(child_dls).attr('aria-pclass',$(this).attr('class'));
					$('dl[aria-pclass='+$(this).attr('class')+']').hide();
					if(child_dls.length > hideSize){
						$(this).find('open-more:first').html('<a href="javascript:;" onclick=openMore("'+$(this).attr('class')+'") >'+onMsg+'</a>');
					}
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