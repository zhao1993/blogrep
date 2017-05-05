function dolinks(id){
			$.inputval = id;
			$.Alert({
				title:'请选择操作',
				custom:$('.linkoption')
			});
		}
		//编辑
		function linkedit(){
			$.post(
				'../con/updateBefore',
				{'connect.id':$.inputval},
				function(connect){
					$.Alert({title:'编辑友链',contextmenu:false,custom:$('.linkform')});
					$('.linkform > form:first-child').attr('action','../con/update');
					$('.linkName').val(connect.name);
					$('.linkAddress').val(connect.target);
					$('.linkDescription').val(connect.title);
					$('.linkId').val(connect.id);
				}
			)
		};
		// 删除
		function linkdelete() {
			$.Alert({
				title : '注意',
				content : '确定删除这条信息？',
				confirmbtn : function() {
					$.post('../con/delete', {
						'connect.id' : $.inputval
					},function(flag){
						if(flag){
							window.location = '../manage/article';
						}
					});
				},
				canclebtn : function() {
				}
			})
		}
		// 跳转
		function linkgoto() {
			$.post('../con/updateBefore', {
				'connect.id' : $.inputval
			}, function(connect) {
				window.location = connect.target;
			});
		}
		// 新增
		function linkadd() {
			$.Alert({
				title : '添加新的链接',
				content : '请录入带协议的网址如 <font color="red">https://</font>www.baidu.com',
				custom : $('.linkform')
			});
			$('.dynamicform').attr('action','../con/add');
		}
		function deleteArticle(title,id){
		 	 $.Alert({'title':'提示','content':'是否删除文章:'+title+'?','confirmbtn':function(){
		 		 window.location='../manage/article_delete?id='+id;
		 	 },'canclebtn':function(){return false}});
		  }
$(function(){
	$(".ibody > header > h1,.ibody > header > h2").click(function(){
		$.post(
				'../base/select',
				function(base){
					$.Alert({title:'编辑标题',custom:$('.titleform'),confirmbtn:function(){$('.titleform > form:first-child').submit();}});
					$('.baseTitle').val(base.title);
					$('.baseSTitle').val(base.stitle);
				}
			)
		});
})
		
		
		
		