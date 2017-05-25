<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文章阅读</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
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
    </div>
     <div class="template">
      <h3>
        <p><span>最新评论</span></p>
      </h3>
      <!-- 回复内容容器 -->
      <ul class="pl_n" id="critiqueList">
      </ul>
        <!-- 分页按钮参数 -->
		<kkpager aria-page='${page}' aria-all='' aria-data=''></kkpager>
		<div id="kkpager"></div>
  		<h3>
        <p><span>发表评论</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="" method="post" id="critique_reply">
      	<input type="hidden" name= 'critique.type' value="ARITCLE"/>
      	<input type="hidden" name= 'critique.articleId' value="<s:property value="article.id"/>"/>
       <s:token/>
      		<table>
      			<c:if test="${empty loginUser}">
      			<tr><span>请先<a onclick="loginAtag_u()" href="javascript:;">登录</a>或<a href="../index/register">注册</a></span></tr>
      			</c:if>
      			<c:if test="${not empty loginUser}">
      			<input type="hidden" name='critique.id' value="${loginUser.id}"/>
      			<tr>
	    			<td><div style="width:70px;padding-bottom: 189px;">
	    			<span>留言内容:</span></div></td>
	    			<td><textarea name="critique.content" style ="height:200px; width:530px;" ></textarea>
	    			<span></span></td>
    			</tr>
    			<tr>
	    			<td></td>
	    			<td><button  type="button" onclick="critiqueValidate()" >提交</button>
	    			</td>
    			</tr>
    			</c:if>
      		</table>
      </form>
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
    </div>
   <%@ include file="copyright.jsp" %> 
  </aside>
  <script type="text/javascript" src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../plugin/kkpager/kkpager.min.js"></script>
  <script type="text/javascript" src="../include/js/critique.js"></script>
<script type="text/javascript">
//init
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
				hrefFormer : 'article_detail',
				hrefLatter : '',
				getLink : function(n){
					return this.hrefFormer + this.hrefLatter + "?page="+n+"&id="+$('input[name="critique.articleId"]').val();
				}
			});
		}
	},10);
});
</script>
  <div class="clear"></div>
</div>
</body>
</html>
