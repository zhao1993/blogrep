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
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
   <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../index/index"></a></div>
  <%@ include file="../manage_nav.jsp" %> 
   </header>
  <article>
    <h3 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="../daily/daily">日志管理</a>><a class ="editem" style="float:right" href="../manage/toDailyAdd"><strong>发表日志</strong></a></h3>
    <div class="dailylist" style="margin-left:50px">
    <ol class="zqlist">
    	<s:iterator value="dailys">
    	<li><time><s:property value="time"/></time><s:property value="content"/></li>
    	</s:iterator>
    </ol>
    </div>
     <div class="page">
      	<s:if test="page==1">
      		<a href="#">&lt;</a>
      	</s:if>
      	<s:else>
      		<a href="daily?page=<s:property value="page-1"/>">&lt;</a>
      	</s:else>
          <s:iterator begin="1" end="totalPage" var="p">
          	<s:if test="#p==page">
          		<b><s:property/></b>
          	</s:if>
          	<s:else>
          		<a href="daily?page=<s:property/>"><s:property/></a>
          	</s:else>
          </s:iterator>
          <s:if test="page==totalPage">
          	<a href="#">&gt;</a>
          </s:if>
          <s:else>
          	<a href="daily?page=<s:property value="page+1"/>">&gt;</a>
          </s:else>
      </div>
  </article>
      		<aside> 
		<%@ include file="../info.jsp"%>
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
		
		<%@ include file="../copyright.jsp"%> </aside>
  	<script src="../include/js/jquery.min.js"></script>
  <script src="../include/js/silder.js"></script>
  <script src="../plugin/diy/js/jquery.zqextend.js"></script>
  <div class="clear"></div>
</div>
<script>
$(document).ready(function(e){
	$.FilList();
})
</script>
</body>
</html>