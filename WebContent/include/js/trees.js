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
		var critiqueElement = $('<li>'+"loop"+i+"count，contentID:"+c.id+"critiqueArthor:"+c.name+"ctitiqueTo"+(c.critique!=null?c.critique.id:'null')+'</li>');
		critiqueElement.attr('class','critique_class'+c.id);
		critiqueElement.css({'margin-left':'30px'});
		if(poids==-1){
			$("body").append(critiqueElement);
			}else{
			$('.critique_class'+c.critique.id).append(critiqueElement);
		}
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