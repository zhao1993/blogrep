<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>文章管理—修改文章</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<style type="text/css">
			/*为段落定义样式*/
			input {border:0;}
			span {color:#099;}
		</style>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head><%@ include file="../openjs.jsp" %>
<body id="MAIN_BODY" style="visibility:hidden">
<div class="ibody" >
  <header>
   <h1>&nbsp;</h1><h2>&nbsp;</h2>
    <div class="logo"><a href="../manage/article"></a></div>
   <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/article">首页</a>><a href="#">修改文章</a></h2>
    <div class="index_about">
    <form action="../manage/article_update" method="post" theme="xhtml" enctype="multipart/form-data">
    	<table>
    		<tr>
	    		<td><input name="article.title" value="<s:property value="article.title"/>" style="width:100%;font-size:12pt;text-align:center;"/></td>
    		</tr>
    		<tr>
	    		<td><span>文章配图:</span><input type="file" name="some"/><div style="display:none"><input name="article.image" value="<s:property value="article.image"/>"/></div></td>
    		</tr>
    		<tr>
    			<td><textarea name="article.content" ><s:property value="article.content"/></textarea></td>
    			<ckeditor:replace  replace="article.content" basePath="../ckeditor/" />
    		</tr>
    		<tr>
    			<td>
    				<span>发表时间:</span><input  name="article.time" value="<s:property value="article.time"/>" style="width:90px"/>
    				<span>作者:</span><input name="article.editer" value="<s:property value="article.editer"/>" style="width:90px"/>
    				<span>浏览:</span><input name="article.count" value="<s:property value="article.count"/>"/>
    				<span>评论:</span><input name="article.count1" value="<s:property value="article.count1"/>"/>
    			</td>
    		</tr>
    		<tr>
	    		<td>
	    			<span>关键词:</span><input name="article.keywords" value="<s:property value="article.keywords"/>"style="width:90px"/>
	    			
	    			<span>分类:</span>
	    			<select name="article.type"  style="width:90px" id="atype">
	    				<s:iterator value="types" var="type">
	    				<s:if test="article.type==#type">
	    				<option value="${type}" selected="selected">${type}</option>
	    				</s:if>
	    				<s:else>
	    				<option value="<s:property/>"><s:property/></option>
	    				</s:else>
	    				</s:iterator>
	    				</select>
	    				<span>自定义分类:</span><input name="undefined"  style="width:90px" id="btype"/>
	    			<span>设为推荐:</span>
	    			<s:if test="#article.notice=='recommendArticles'">
		    			<input name="article.notice" type="radio" value="1" checked/>是
		 				<input name="article.notice" type="radio" value="2" />否
	    			</s:if>
	    			<s:else>
	    				<input name="article.notice" type="radio" value="1" />是
		 				<input name="article.notice" type="radio" value="2" checked/>否
	    			</s:else>
	    			<input name="article.id" value="<s:property value="article.id"/>" style="display:none;"/>
	    		</td>
    		</tr>
    	</table>
    </form>
    </div>
  </article>
  <aside>
  <%@ include file="../rnav.jsp" %> 
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
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
        <p>栏目推荐</p>
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
          <dt>
        <s:if test="user.headpic != null">
          <img src="<s:property value="user.headpic"/>"/> 
          </s:if>
          <s:if test="user.headpic == null">
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
      
    </div>
    <%@ include file="../copyright.jsp" %> 
  </aside>
    <script src="../include/js/jquery.min.js"></script>
  <script src="../include/js/silder.js"></script>
  <script type="text/javascript">
  $('#btype').blur(function(){
		 if( $(this).val()!="") {
			 $(this).attr('name','article.type');
			 $('#atype').attr('name','undefined');
		 }else{
			 $(this).attr('name','undefined');
			 $('#atype').attr('name','article.type');
		 }
	  });
  </script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
