<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>相册列表</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<script type="text/javascript" src="../include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
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
    <h2 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../album/album">个人相册</a>><a href="#">照片</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
      </h3>
      <ul>
       <div class="container" >
			<!-- Codrops top bar -->
			<section id="dg-container" class="dg-container">
				<div class="dg-wrapper">
				<s:iterator value="photos" >
					<a href="#"><img src="<s:property value="image" />"  width="480px" height="260"/><div><s:property value="note" escape="false"/></div></a>
				</s:iterator>
				</div>
				<nav >	
					<span class="dg-prev">&lt;</span>
					<span class="dg-next">&gt;</span>
				</nav>
			</section>
        </div>
       
		<script type="text/javascript">
			$(function() {
				$('#dg-container').gallery();
			});
		</script>
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
      
    <div class="page">
           	<s:if test="page==1">
           		<a href="#">&lt;</a>
           	</s:if>
           	<s:else>
           		<a href="album_detail?page=<s:property value="page-1"/>&id=<s:property value="id"/>">&lt;</a>
           	</s:else>
               <s:iterator begin="1" end="totalPage" var="p">
               	<s:if test="#p==page">
               		<b><s:property/></b>
               	</s:if>
               	<s:else>
               		<a href="album_detail?page=<s:property/>&id=<s:property value="id"/>"><s:property/></a>
               	</s:else>
               </s:iterator>
               <s:if test="page==totalPage">
               	<a href="#">&gt;</a>
               </s:if>
               <s:else>
               	<a href="album_detail?page=<s:property value="page+1"/>&id=<s:property value="id"/>">&gt;</a>
               </s:else>
           </div>           
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
   <%@ include file="copyright.jsp" %> 
  </aside>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>
