<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>管理-个人信息</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/about.css" rel="stylesheet"/>
		
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		
	</head><%@ include file="../openjs.jsp" %>
<body id="MAIN_BODY" style="visibility:hidden">
<div class="ibody" >
  <header>
    <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
  </header>
  <article>
    <h3 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="#">个人信息</a></h3>
    <div class="about">
      <h2>About Me</h2>
      <ul>
      <form action="../manage/about_update" method="post" theme="xhtml" enctype="multipart/form-data">
      <textarea name="me.content" >
      <s:property value="me.content"/>
      </textarea>
	  <ckeditor:replace  replace="me.content" basePath="../ckeditor/" />
	  </form>
       </ul>
     <!--  <h2>About my blog</h2>
      <ul class="blog_a">
        <p>域  名：www.zhaohao.tk 创建于2011年01月12日 
        <p>服务器：京东云
        <p>程  序：原创博客</p>
        <p>微信公众号：zhaohao_1</p>
      </ul> -->
    </div>
  </article>
  <aside>
   <%@ include file="../info.jsp" %>
  </aside>
  <script src="../include/js/jquery.min.js"></script>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>
