<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="../include/js/jquery.min.js"></script>
<script type="text/javascript" src="../plugin/diy/js/jquery.zqextend.js"></script>
<span style="font-size:18px ;float:right;border-top-left-radius: 2em;background-color: #7A7A7A;position: relative;top: -2em;padding: 1em;">
	<c:if test="${empty loginUser}"><a id="loginAtag" href="javascript:;">登录</a>&nbsp;&nbsp;<a href="../index/register">注册</a></c:if>
 <c:if test="${not empty loginUser}"><span>用户：</span><a onclick="userAtag(${loginUser.id})" href="javascript:;" >${loginUser.name}</a></c:if>
 </span>
<nav id="topnav">
	<a href="../index/index">首页</a>
	<a href="../article/article">文章</a>
	<a href="../album/album">相册</a>
	<a href="../daily/daily">日志</a>
	<a href="../critique/critique">留言板</a>
	<a href="../about/about">关于</a>
	<!-- <a href="../index/register">注册测试</a> -->
 	<input name="search_box"  placeholder="搜索文章" title="回车搜索" style="height:25px;margin:5px;"/>
</nav>
<script type="text/javascript">
		$('#loginAtag').click(function(){
			$.Alert({
				attr:{width:'220px'},
				title:'用户登录',
				custom:$('<div>账号:<input name="u_act" type="text"  /><br/>密码:<input name="u_pwd" type="password"  /></div>'),
				confirmbtn:function(){
					$.post('../user/login?user.account='+$('input[name="u_act"]').val()+'&user.password='+$('input[name="u_pwd"]').val(),
					function(){
						window.location.reload();
					});
				},
				confirmmsg:'登录',
				canclebtn:true
			});
		});
			function userAtag(id){
				$.post('../user/userMsg?user.id='+id,
				function(user){
					if(null==user){
						alert('获取用户数据出错!');
						return ;
					}
					$.Alert({
						attr:{width:'260px'},
						title:'用户登录信息',
						custom:$('<div><span>用户名：</span>'+user.name+'<span><br/>账&nbsp;号：</span>'+user.account+'</div>'),
						confirmbtn:true,
						canclemsg:'退出登录',
						canclebtn:function(){
							$.post('../user/loginOut',
							function(){
								window.location.reload();
							});
						}
					});
				});
			}
</script>