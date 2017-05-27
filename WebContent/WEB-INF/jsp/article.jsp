<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文章</title>
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
   <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../index/index"></a></div>
     <%@ include file="nav.jsp" %> 
       </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../article/article">文章</a></h2>
    <div class="bloglist">
    <s:iterator value="articles">
      <div class="newblog">
        <ul>
        <!-- 添加li 2017年4月10日20:51:32 -->
        <li>
          <h3><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></h3>
          <div class="autor">
						<span>作者：<a><s:property value="editer" /></a></span>
						<span>分类：[<a href="../article/byType?size=<s:property value='id'/>"><s:property value="type" /></a>]
						</span><span>浏览（<a href="javascript:void(0)"><s:property value="count" /></a>）
						</span><span>评论（<a href="javascript:void(0)"><s:property value="count1" /></a>）
						</span>
						<span>时间：<s:property value="time" /></span>
					</div>
          <div class="content" style="width:100%"><s:property value="content" escape="false"/></div>
          <a href="../article/article_detail?id=<s:property value="id" />"  class="readmore" style="display:inline-block;">阅读全文&gt;&gt;</a>
        </li>
        </ul>
        <figure><img src="<s:property value="image"/>" width="200" height="100" /></figure>
        <%-- <div class="dateview">
        <s:property value="time" /></div> --%>
      </div>
     </s:iterator>
    </div>
		 <!-- 分页按钮参数 -->
		<kkpager aria-page='${page}' aria-all='${totalPage}' aria-data='${size}'></kkpager>
		<div id="kkpager"></div>   
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
      <h2>
        <p>最新评论</p>
      </h2>
      <ul class="pl_n">
      <s:iterator value="critiques" >
        <dl>
          		<!-- 小头像 -->  
        <dt>
         <s:if test="user.headpic != null">
          <img src="<s:property value="user.headpic"/>"/> 
          </s:if>
          <s:if test="user.headpic == null">
          <img src="../include/images/s8.jpg"/>
          </s:if>
          </dt>
          <dt> </dt>
          <dd><s:property value="user.name"/>
            <time><s:property value="time"/></time>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
    </div>
   <%@ include file="copyright.jsp" %> 
  </aside>
  <div class="clear"></div>
</div>
<script type="text/javascript" src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../plugin/kkpager/kkpager.min.js"></script>
<script type="text/javascript">
//init
$(document).ready(function(){
	//生成分页
	kkpager.generPageHtml({
		pno : $('kkpager').attr('aria-page'),
		//总页码
		total : $('kkpager').attr('aria-all'),
		//总数据条数
		totalRecords : $('kkpager').attr('aria-data'),
		//链接前部
		hrefFormer : 'article',
		hrefLatter : '',
		getLink : function(n){
			return this.hrefFormer + this.hrefLatter + "?page="+n+($('#hiddenSearch').val()!=null?"&search="+$('#hiddenSearch').val():"");
		}
	});
});
</script>
</body>
</html>
