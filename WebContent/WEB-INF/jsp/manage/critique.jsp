<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>博客-管理留言板</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
		<script type="text/javascript" src="../include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
   <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="#">管理留言板</a></h2>
    <div class="template">
      
      <h3>
        <p><span>留言管理</span></p>
      </h3>
      <ul class="pl_n">
       <s:iterator value="critiques" >
        <dl>
          <dt><img src="../include/images/s8.jpg"/> </dt>
          <dt> </dt>
          <dd><s:property value="user.name"/>
            <s:property value="time"/>
            &nbsp;&nbsp;
            <span> 联系方式: <s:property value="notice"/></span>
            <a href="critique_delete?id=<s:property value="id" />" class="dellink">
            <span style="color:red;">删除</span></a>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
      
   <kkpager aria-page='${page}' aria-all='${totalPage}' aria-data='${size}'></kkpager>
		<div id="kkpager"></div>     
<%--   		<h3>
        <p><span>随便说说</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="../manage/critique_add" method="post" >
      		<table>
      			<tr>
      				<td><span>您的姓名:</span><input name="critique.name"/></td>
      			</tr>
      			<tr>
	    			<td><textarea name="critique.content" >留言内容</textarea></td>
	    			<ckeditor:replace  replace="critique.content" basePath="../ckeditor/" />
    			</tr>
      		</table>
      </form> --%>
    </div>
  </article>
  <aside>
    <%@ include file="../rnav.jsp" %> 
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
    <%@ include file="../copyright.jsp" %> 
    </div>
  </aside>
  <div class="clear"></div>
</div>
  <script src="../include/js/silder.js"></script>
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
		hrefFormer : 'critique',
		hrefLatter : '',
		getLink : function(n){
			return this.hrefFormer + this.hrefLatter + "?page="+n;
		}
	});
});
</script>
</body>
</html>
