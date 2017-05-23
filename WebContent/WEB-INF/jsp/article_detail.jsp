<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文章阅读</title>
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
  <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../index/index"></a></div>
	 <%@ include file="nav.jsp" %> 
   </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../article/article">文章</a>><a href="#">详细内容</a></h2>
    <div class="index_about">
      <h2 class="c_titile"><s:property value="article.title"/></h2>
      <p class="box_c"><span class="d_time">发布时间：<s:property value="article.time"/></span><span>编辑：<s:property value="article.autor"/></span><span>浏览（<s:property value="article.count"/>）</span><span>评论（<s:property value="article.count1"/>）</span></p>
      <ul class="infos">
        <s:property value="article.content" escape="false"/>
      </ul>
      <div class="keybq">
        <p><span>关键字词</span>：<s:property value="article.keywords"/></p>
      </div>
      <div class="nextinfo">
      <s:if test="articleBefore!=null">
        <p>上一篇：<a href="../article/article_detail?id=<s:property value="id-1"/>"><s:property value="articleBefore.title"/></a></p>
      </s:if>
      <s:if test="articleAfter!=null">
        <p>下一篇：<a href="../article/article_detail?id=<s:property value="id+1"/>"><s:property value="articleAfter.title"/></a></p>
      </s:if>
      </div>
      <!-- pinglunq -->
      <div></div>
    </div>
  </article>
  <aside>
    	 <%@ include file="rnav.jsp" %> 
    <div class="ph_news">
      <h2>
        <p>最热文章</p>
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
        <p>推荐阅读</p>
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
          		<!-- 小头像 -->  
        <dt>
         <s:if test="photo != null">
          <img src="<s:property value="photo"/>"/> 
          </s:if>
          <s:if test="photo == null">
          <img src="../include/images/s8.jpg"/>
          </s:if>
          </dt>
          <dt>
          <dt> </dt>
          <dd><s:property value="name"/>
            <time><s:property value="time"/></time>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
    </div>
   <%@ include file="copyright.jsp" %> 
  </aside>
  <script type="text/javascript" src="../include/js/silder.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>
