<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link href="../include/css/base.css" rel="stylesheet" />
<link href="../include/css/index.css" rel="stylesheet" />
<link href="../include/css/style.css" rel="stylesheet" />
<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
		<script language="JavaScript" type="text/javascript">

		var NV = {};  
		var UA = navigator.userAgent.toLowerCase();  
		try  
		{  
		    NV.name=!-[1,]?'ie':  
		    (UA.indexOf("firefox")>0)?'firefox':  
		    (UA.indexOf("chrome")>0)?'chrome':  
		    window.opera?'opera':  
		    window.openDatabase?'safari':  
		    'unkonw';  
		}catch(e){};  
		try  
		{  
		    NV.version=(NV.name=='ie')?UA.match(/msie ([\d.]+)/)[1]:  
		    (NV.name=='firefox')?UA.match(/firefox\/([\d.]+)/)[1]:  
		    (NV.name=='chrome')?UA.match(/chrome\/([\d.]+)/)[1]:  
		    (NV.name=='opera')?UA.match(/opera.([\d.]+)/)[1]:  
		    (NV.name=='safari')?UA.match(/version\/([\d.]+)/)[1]:  
		    '0';  
		}catch(e){};  
		try  
		{  
		    NV.shell=(UA.indexOf('360ee')>-1)?'360极速浏览器':  
		    (UA.indexOf('360se')>-1)?'360安全浏览器':  
		    (UA.indexOf('se')>-1)?'搜狗浏览器':  
		    (UA.indexOf('aoyou')>-1)?'遨游浏览器':  
		    (UA.indexOf('theworld')>-1)?'世界之窗浏览器':  
		    (UA.indexOf('worldchrome')>-1)?'世界之窗极速浏览器':  
		    (UA.indexOf('greenbrowser')>-1)?'绿色浏览器':  
		    (UA.indexOf('qqbrowser')>-1)?'QQ浏览器':  
		    (UA.indexOf('baidu')>-1)?'百度浏览器':  
		    '未知或无壳';  
		}catch(e){}  
		alert('浏览器UA='+UA+  
		'\n\n浏览器名称='+NV.name+  
		'\n\n浏览器版本='+parseInt(NV.version)+  
		'\n\n浏览器外壳='+NV.shell);  
	  
		   
</script>
		
</head><%@ include file="openjs.jsp" %>
<body id="MAIN_BODY" style="visibility:hidden">
	<div class="ibody" >
		<header>
		<h1>&nbsp;</h1><h2>&nbsp;</h2>
		<div class="logo">
		<button type="button" class="btn" onclick="editMode()"> 进入管理员模式  </button>
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
						<span>作者：<a><s:property value="editer" /></a></span>
						<span>分类：[<a href="../article/byType?size=<s:property value='id'/>"><s:property value="type" /></a>]
						</span><span>浏览（<a href="javascript:void(0)"><s:property value="count" /></a>）
						</span><span>评论（<a href="javascript:void(0)"><s:property value="count1" /></a>）
						</span>
						<span>时间：<s:property value="time" /></span>
					</div>
				</div>
			</s:iterator>
		</div>
		<!-- 分页按钮参数 -->
		<kkpager aria-page='${page}' aria-all='${totalPage}' aria-data='${size}'></kkpager>
		<div id="kkpager"></div>
		
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
			<div>
			<ul>
				<s:iterator value="connects">
					<li><a target="_blank" href="<s:property value="target"/>" title="<s:property value="title" />" > <s:property value="name"/></a></li>	
					</s:iterator>
			</ul>
			</div>
		</div>
		<%@ include file="copyright.jsp"%> </aside>
		<div class="clear"></div>
		<script type="text/javascript" src="../include/js/silder.js"></script>
		<script type="text/javascript" src="../plugin/kkpager/kkpager.min.js"></script>
		<script type="text/javascript" src="../plugin/diy/js/jquery.teff.js"></script>
		<script type="text/javascript">
//init
$(document).ready(function(){
	//生成分页
	kkpager.generPageHtml({
		pno : $('kkpager').attr('aria-page'),
		//总页码
		total : $('kkpager').attr('aria-all'),
		//总数据条数
		totalRecords : $('kkpager').attr('aria-data'),
		//链接前部
		hrefFormer : 'index',
		hrefLatter : '',
		getLink : function(n){
			return this.hrefFormer + this.hrefLatter + "?page="+n;
		}
	});
});
//为每一个p标签执行文本显示效果
$('.texts > li > p').each(function(){
	$(this).dropWord({min:1,max:1,mode:parseInt(Math.random()*5)});	
});
</script>
		<s:debug/>
	</div>
</body>
</html>