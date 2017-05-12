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
var width = 700;
$(document).ready(function(){
	$.post(
	'critique/critiqueTestJson?pageSize=100',
	function(critiques){
			console.info("critique's count："+critiques.length);
			//doRecursion
			doRecursionCritique(critiques,-1);
		}
	);
});

function doRecursionCritique(critiques,poids){
	for(var i=0;i<critiques.length;i+=1){
		var c = critiques[i];
		//document
		var critiqueElement = $('<dl></dl>');
		critiqueElement.append($('<dt><img src="'+(c.photo==null?"../include/images/s8.jpg":c.photo)+'"/></dt>'));
		critiqueElement.append($('<dd><a href="#">'+c.name+'</a><time>'+(c.critique!=null?"回复 <a href='#'>"+c.critique.name+"</a>":'')+'&nbsp'+c.time+'</time></dd><dd>'+c.content+'</dd>'));
		critiqueElement.attr({'class':'critique_class'+c.id,'aria-val':(c.critique!=null?c.critique.id:'null')});
		critiqueElement.css({'width':width+'px','border-top-style':'dotted','border-top-width':'1px','border-top-color':'black'});
		if(poids==-1){
			$('#critiqueList').append(critiqueElement);
		}else{
			$('.critique_class'+c.critique.id).after(critiqueElement);
		}
		$('dl[aria-val!="null"]').css({'margin-left':'50px','width':'650px'});
		console.info(critiqueElement.attr('aria-val'));
		if(null!=c.critiques && c.critiques.length>0){
			$.post(
					'critique/critiqueForChildJson?parentId='+c.id,
					function(_critiques){
						doRecursionCritique(_critiques,0);
				}
			);
		}
	}
}