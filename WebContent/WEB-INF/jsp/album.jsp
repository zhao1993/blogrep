<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人相册</title>
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
				<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="js/modernizr.js"></script>
		<![endif]-->
	</head><%@ include file="openjs.jsp" %>
<body id="MAIN_BODY" style="visibility:hidden">
<div class="ibody" >
  <header>
  <h1>&nbsp;</h1><h2>&nbsp;</h2>
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
      
     <div class="template">
      <h3>
        <p><span>相册评论</span></p>
      </h3>
      <!-- 回复内容容器 -->
      <ul class="pl_n" id="critiqueList">
      </ul>
        <!-- 分页按钮参数 -->
		<kkpager aria-page='${page}' aria-all='' aria-data=''></kkpager>
		<div id="kkpager"></div>
  		<h3>
        <p><span>我来评价</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="" method="post" id="critique_reply">
      	<input type="hidden" name= 'critique.type' value="ALBUM"/>
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
    </div> 
    <%@ include file="copyright.jsp" %> 
  </aside>
  <div class="clear"></div>
</div>
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
				hrefFormer : 'album',
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
