<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>关于我</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/about.css" rel="stylesheet"/>
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
    <h3 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../about/about">关于我</a></h3>
    <div class="about">
      <h2>About Me</h2>
      <ul>
       <s:property value="me.content" escape="false"/>
       </ul>
      <!-- <h2>About my blog</h2>
      <ul class="blog_a">
      <li> <p>域  名：www.zhao.com</p> </li>
      <li> <p>服务器：京东云</p> </li>
      <li> <p>程  序：原创程序</p> </li>
      <li> <p>微信公众号：zhaohao_1</p> </li>
      </ul> -->
    </div>
  </article>
  <aside>
   <%@ include file="info.jsp" %>
  </aside>
  <script type="text/javascript" src="../include/js/silder.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>
