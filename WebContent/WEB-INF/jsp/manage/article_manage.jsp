<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>管理-文章管理</title>
		<link rel="SHORTCUT ICON" href="../include/images/s8.jpg"/>
		<link href="../include/css/base.css" rel="stylesheet"/> 
		<link href="../include/css/style.css" rel="stylesheet"/>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
     <h1>扯你妈的蛋</h1>
    <h2>这世界唯一不变的就是变化...</h2>
    <div class="logo"><a href="../manage/article"></a></div>
   <%@ include file="../manage_nav.jsp" %>
     </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="#">博客管理</a><a style="float:right" href="../manage/to_article_add"><strong>发表文章</strong></a></h2>
    <div class="bloglist">
    <s:iterator value="articles">
      <div class="newblog">
        <ul>
        <li>
          <h3><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title" /></a></h3>
          <div class="autor"><span>作者：<s:property value="editer"/></span><span>分类：[<a href="#"><s:property value="type"/></a>]</span><span>浏览（<a href="#"><s:property value="count"/></a>）</span><span>评论（<a href="#"><s:property value="count1"/></a>）</span>
			&nbsp;<a class ="editem" title="编辑文章" href="../manage/to_article_update?id=<s:property value="id"/>">编辑</a> 
			<s:if test="notice!=null">
			&nbsp;<a class ="editem" title="取消推荐" href="../manage/article_unrecommend?id=<s:property value="id"/>">取消推荐</a> 
			</s:if>
			<s:if test="notice==null">
			&nbsp;<a class ="editem" title="推荐文章" href="../manage/article_recommend?id=<s:property value="id"/>">推荐文章</a> 
			</s:if>
			&nbsp;<a class ="editem" title="删除文章" onclick="return confirm('确定删除文章?')==true" href="../manage/article_delete?id=<s:property value="id"/>">删除</a>
          </div>
          <div class="content" ><s:property value="content" escape="false"/></div><a href="../article/article_detail?id=<s:property value="id" />"  class="readmore" style="display:inline-block;">阅读全文>></a>
        </li>
        </ul>
        <!-- <span>时间：<s:property value="time" /></span> -->
        <figure><img src="<s:property value="image"/>"/></figure>
        <div class="dateview"><s:property value="time"/></div>
      </div>
     </s:iterator>
    </div>
    <div class="page">
      	<s:if test="page==1">
      		<a href="#">&lt;</a>
      	</s:if>
      	<s:else>
      		<a href="article?page=<s:property value="page-1"/>">&lt;</a>
      	</s:else>
          <s:iterator begin="1" end="totalPage" var="p">
          	<s:if test="#p==page">
          		<b><s:property/></b>
          	<input type="hidden" value="<s:property value="totalPage"/>"/>
          	</s:if>
          	<s:else>
          		<a href="article?page=<s:property/>"><s:property/></a>
          	</s:else>
          </s:iterator>
          <s:if test="page==totalPage">
          	<a href="#">&gt;</a>
          </s:if>
          <s:else>
          	<a href="article?page=<s:property value="page+1"/>">&gt;</a>
          </s:else>
      </div>           
  </article>
  <aside>
    <%@ include file="../rnav.jsp" %> 
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      <ul class="ph_n">
      <s:iterator value="hotArticles" status="index">
      	<s:if test="#index.index<3">
       		<li><span class="num1"><s:property value="#index.index+1"/></span><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
       	</s:if>
       	<s:else>
       		<li><span><s:property value="#index.index+1"/></span><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
       	</s:else>
       </s:iterator>
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul>
      <s:iterator value="recommendArticles" >
        <li><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
      </s:iterator>
      </ul>
      <h2>
        <p>最新评论</p>
      </h2>
      <ul class="pl_n">
      <s:iterator value="critiques" >
        <dl>
          <dt><img src="../include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd><s:property value="name"/>
            <time><s:property value="time"/></time>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
    </div>
    		
   <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="../include/js/jquery.min.js"></script>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>
