<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link href="../plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="../include/css/base.css" rel="stylesheet" />
<link href="../include/css/index.css" rel="stylesheet" />
<link href="../include/css/style.css" rel="stylesheet" />
<link href="../include/css/media.css" rel="stylesheet" />
<link href="../plugin/cloud/css/cloud.css" rel="stylesheet" />
<style type="text/css">
</style>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
</head>
<body>
	<div class="ibody">
		<header>
		<h1>扯你妈的蛋</h1>
		<h2>这世界唯一不变的就是变化...</h2>
		<div class="logo">
		<button type="button" class="btn"> 
		编辑模式
		</button>
			<a href="#"></a>
		</div>
		<%@ include file="nav.jsp"%> </header>
		<article>
		<div class="banner">
		<ul class="texts">
				<li><p>预留文字显示行预留文字显示行预留文字显示行预留文字显示行</p></li>
				<li><p>预留文字显示行预留文字显示行预留文字显示行预留文字显示行</p></li>
				<li><p>预留文字显示行预留文字显示行预留文字显示行预留文字显示行</p></li>
			</ul> 
		</div>
		<div class="bloglist">
			<h2>
				<p>
					<span>推荐文章</span>
				</p>
			</h2>
			<s:iterator value="articles">
				<div class="blogs">
					<h3>
						<a href="../article/article_detail?id=<s:property value="id"/>"><s:property
								value="title" /></a>
					</h3>
					<figure>
					<img src="<s:property value='image'/>" /></figure>
					<ul>
						<li>
							<div class="content" style="height: 12em; clear: both;">
								<s:property value="content" escape="false" />
							</div> <a href="../article/article_detail?id=<s:property value='id'/>"
							target="_blank" class="readmore" style="color: white;">阅读全文&gt;&gt;</a>
						</li>
					</ul>
					<div class="autor">
						<span>作者：<a><s:property value="editer" /></a></span><span>分类：[<a
							href="/"><s:property value="type" /></a>]
						</span><span>浏览（<a href="/"><s:property value="count" /></a>）
						</span><span>评论（<a href="/"><s:property value="count1" /></a>）
						</span>
						<span>时间：<s:property value="time" /></span>
						<%-- <div class="dateview">
							<s:property value="time" />
						</div> --%>
					</div>
				</div>
			</s:iterator>
		</div>
		<div class="page">
			<s:if test="page==1">
				<a href="#">&lt;</a>
			</s:if>
			<s:else>
				<a href="index?page=<s:property value="page-1"/>">&lt;</a>
			</s:else>
			<s:iterator begin="1" end="totalPage" var="p">
				<s:if test="#p==page">
					<b><s:property /></b>
				</s:if>
				<s:else>
					<a href="index?page=<s:property/>"><s:property /></a>
				</s:else>
			</s:iterator>
			<s:if test="page==totalPage">
				<a href="#">&gt;</a>
			</s:if>
			<s:else>
				<a href="index?page=<s:property value="page+1"/>">&gt;</a>
			</s:else>
		</div>
		</article>
		<aside> 
		<%@ include file="info.jsp"%>
		<div class="tj_news">
			<h2>
				<p class="tj_t1">最新文章</p>
			</h2>
			<ul>
				<s:iterator value="newArticles">
					<li><a
						href="../article/article_detail?id=<s:property value="id"/>"><s:property
								value="title" /></a></li>
				</s:iterator>
			</ul>
			<h2>
				<p class="tj_t2">推荐文章</p>
			</h2>
			<ul>
				<s:iterator value="recommendArticles">
					<li><a
						href="../article/article_detail?id=<s:property value="id"/>"><s:property
								value="title" /></a></li>
				</s:iterator>
			</ul>
		</div>
		<div class="links">
			<h2>
				<p class="tj_t3">友情链接</p>
			</h2>
			<ul>
				<li><a href="http://blog_hao.jd-app.com/index/index">个人博客</a></li>
				<li><a href="http://user.qzone.qq.com/657682618">QQ空间</a></li>
			</ul>
		</div>
		<%@ include file="copyright.jsp"%> </aside>
		<div class="clear">
		</div>
		<!-- 进入开发编辑模式的模态弹框 -->
		<div class="modal fade" id="mymodal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<%-- <div class="modal-header">
						<button class="close" data-dismiss="modal" type="button">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 style="font-size:20px;font-stlye:bold;"><span class="glyphicon glyphicon-warning-sign"></span>进入编辑模式</h4>
					</div><!-- modal-header --> --%>
					<div class="modal-body">
					<div class="input-group">
					<input class="form-control login-command" type="password" placeholder="please input command"/>
					<span class="input-group-btn">
					<button class="btn btn-default btn-commit" type="button">→</button>
					</span>
					</div><!-- input-group -->
					</div><!-- modal-body -->
				</div><!-- modal-content -->
			</div><!-- modal-dialog modal-sm -->
		</div><!-- modal fade -->
		<script src="../include/js/jquery.min.js"></script>
		<script src="../include/js/silder.js"></script>
		<script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
		<script>
			/* $(this).mousemove(
					function(event) {
						var x = event.originalEvent.x
								|| event.originalEvent.layerX || 0;
						var y = event.originalEvent.y
								|| event.originalEvent.layerY || 0;
						// $(".clear").html("<p>"+x+"_:_"+y+"</p>")
					}) */
		    $(".btn").click(function(){
		      $("#mymodal").modal("toggle");
		    });
			$(".btn-commit").on("click",function(){
				var command = $( $(".login-command")[0]).val();
				/* console.info(command); */
				$.post("../manage/json_account", {
					'account':command
					},
					function(data){
				     	if(data=="true"){
				     		//console.info("command pass.....");
				     		window.location="../manage/article";
				     	};
				   });
			}
			)
		</script>
	</div>
</body>
</html>