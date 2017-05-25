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
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
		<style type="text/css">
			*{margin:0;padding:0;list-style-type:none;}
			a,img{border:0;}
			/* index_pic */
			#index_pic{overflow:hidden;width:600px;position:relative;height:300px;overflow:hidden;margin:0 auto 20px auto;}
			#index_pic ul{z-index:999;right:3px;bottom:0px;position:absolute;text-align:left}
			#index_pic ul li{display:block;font-weight:900;font-size:12px;float:left;width:70px;color:#aaa;position:relative;height:50px;}
			#index_pic li div{margin-top:5px;display:none;padding-left:10px;margin-left:70px}
			#index_pic li img{border-right:#fff 1px solid;border-top:#fff 1px solid;filter:alpha(opacity=60);left:10px;float:left;border-left:#fff 1px solid;width:52px;cursor:pointer;margin-right:4px;border-bottom:#fff 1px solid;position:absolute;top:5px;height:35px;moz-opacity:0.6}
			#back{width:990px;height:300px;overflow:hidden;}
			#back .gray{filter:Gray();}
</style>
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
	<div id="index_pic" class="index_pic">
	<ul>
	<s:iterator value="photos" >
	<li><img class="small_pic_unique" src="<s:property value="image" />" text="http://sc.chinaz.com/|_self"/></li>
	</s:iterator>
 	</ul>
		<div id="back"><img width="580px" height="300px" src="" /></div>
	</div><!--index_pic end-->         
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
   </div>
  </aside>
  <script src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../include/js/zzsc.js"></script>
  <div class="clear"></div>
</div>
</body>
</html>