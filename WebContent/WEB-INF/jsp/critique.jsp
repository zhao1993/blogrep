<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>留言板</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
	
	</head><%@ include file="openjs.jsp" %>
<body id="MAIN_BODY" style="visibility:hidden">
<div class="ibody" >
  <header>
 <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../index/index"></a></div>
    <%@ include file="nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../critique/critique">留言板</a></h2>
    <div class="template">
      <h3>
        <p><span>最新留言</span></p>
      </h3>
      <!-- 回复内容容器 -->
      <ul class="pl_n" id="critiqueList">
      </ul>
        <!-- 分页按钮参数 -->
		<kkpager aria-page='${page}' aria-all='' aria-data=''></kkpager>
		<div id="kkpager"></div>
  		<h3>
        <p><span>到此一游</span></p>
      </h3>
       <form action="" method="post" id="critique_reply">
      	<input type="hidden" name= 'critique.type' value="LAM"/>
       <s:token/>
         <%@ include file="reply.jsp" %> 
      </form>
     </div>
  </article>
  <aside>
    <div class="rnav">
    <%@ include file="rnav.jsp" %> 
    </div>
    <div class="ph_news"/>
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
  <div class="clear"></div>
	</div>
<script type="text/javascript" src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../plugin/kkpager/kkpager.min.js"></script>
  <script type="text/javascript" src="../include/js/critique.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var ready = setInterval(function(){
		if($.isNumeric($('kkpager').attr('aria-all'))){
			clearInterval(ready);
			//生成分页
			kkpager.generPageHtml({
				pno : $('kkpager').attr('aria-page'),
				//总页码
				total : $('kkpager').attr('aria-all'),
				//总数据条数
				totalRecords : $('kkpager').attr('aria-data'),
				//链接前部
				hrefFormer : 'critique',
				hrefLatter : '',
				getLink : function(n){
					return this.hrefFormer + this.hrefLatter + "?page="+n;
				}
			});
		}
	},10);
});
</script>
</body>
</html>
