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
//异步加载评论内容列表
$(document).ready(function(){
	$.post(
	'../critique/critiqueTestJson?pageSize=100',
	function(critiques){
			console.info("获取对象基本评论的个数："+critiques.length);
			//递归处理
			doRecursionCritique(critiques,-1);
		}
	);
});
function doRecursionCritique(critiques,poids){
	for(var i=0;i<critiques.length;i+=1){
		var c = critiques[i];
		//console.info("循环第"+i+"次，内容ID:"+c.id+"留言者:"+c.name+"留言对象："+(c.critique!=null?c.critique.id:'null'));  
		//文档处理
		var critiqueElement = $('<p>'+"循环第"+i+"次，内容ID:"+c.id+"留言者:"+c.name+"留言对象："+(c.critique!=null?c.critique.id:'null')+'</p>');
		critiqueElement.attr('class','critique_class'+c.id);
		if(poids==-1){
			$("body").append(critiqueElement);
			}else{
			$('.critique_class'+c.critique.id).append(critiqueElement);
		}
		if(null!=c.critiques && c.critiques.length>0){
			$.post(
					'../critique/critiqueForChildJson?parentId='+c.id,
					function(_critiques){
						doRecursionCritique(_critiques,0);
				}
			);
		}
	}
}