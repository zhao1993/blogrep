<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人相册</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../include/css/media.css" rel="stylesheet"/>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
        <h1>扯你妈的蛋</h1>
    <h2>这世界唯一不变的就是变化...</h2>
    <div class="logo"><a href="../index/index"></a></div>
    <%@ include file="nav.jsp" %> 
  </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../album/album">相册</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
        <a href="#"  class="more"></a> </h3>
      <ul>
      <s:iterator value="albums">
        <li><a href="album_detail?id=<s:property value="id"/>" ><img src="<s:property value="image" />"/></a><span><s:property value="title" /></span></li>
      </s:iterator>
      </ul>
     <h3>
        <p><span>最新评论</span></p>
      </h3>
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
          <dt> </dt>
          <dd><s:property value="name"/>
            <time><s:property value="time"/></time>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
  </article>
  <aside>
    <div class="rnav">
      <%@ include file="rnav.jsp" %> 
    </div>
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
    </div> 
    <%@ include file="copyright.jsp" %> 
  </aside>
  <script type="text/javascript" src="../include/js/jquery.min.js"></script>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>
