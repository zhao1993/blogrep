function teste(id){
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
					$('.dynamicform').attr('action','../con/update');
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
					window.location = '../con/delete?connect.id='+$.inputval;
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
				contextmenu : false,
				custom : $('.linkform')
			});
			$('.dynamicform').attr('action','../con/add');
		}