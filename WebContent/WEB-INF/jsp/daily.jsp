<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的日志</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/index.css" rel="stylesheet" />
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		
	</head><%@ include file="openjs.jsp" %>
<body id="MAIN_BODY" style="visibility:hidden">
<div class="ibody" >
  <header>
    <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../index/index"></a></div>
  <%@ include file="nav.jsp" %> 
   </header>
  <article>
    <h3 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../daily/daily">我的日志</a></h3>
    <div class="dailylist" style="margin-left:50px">
    <ol class="zqlist">
    	<s:iterator value="dailys">
    	<li><time><s:property value="time"/></time><s:property value="content"/></li>
    	</s:iterator>
    </ol>
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
		<%@ include file="copyright.jsp"%> </aside>
  <div class="clear"></div>
</div>
<script type="text/javascript" src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../plugin/kkpager/kkpager.min.js"></script>
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
		hrefFormer : 'daily',
		hrefLatter : '',
		getLink : function(n){
			return this.hrefFormer + this.hrefLatter + "?page="+n;
		}
	});
});
</script>
<script>
$(document).ready(function(e){
	$.FilList();
});
</script>
</body>
</html>
