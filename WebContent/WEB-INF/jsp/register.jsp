<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主页</title>
<link href="../include/css/base.css" rel="stylesheet" />
<link href="../include/css/index.css" rel="stylesheet" />
<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
<link href="../include/css/style.css" rel="stylesheet" />
<link href="../plugin/accordion/style.css" rel="stylesheet" />
<link href="../plugin/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<!--[if IE 8]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
		<style>
		.registerDiv{
		font-size:16pt;
		width:700px;
		}
		</style>
</head>
<body>
	<div class="ibody">
		<header>
		<h1>&nbsp;</h1><h2>&nbsp;</h2>
		<div class="logo">
			<a href="#"></a>
		</div>
		
		<%@ include file="nav.jsp"%> </header>
		<article>
		<div class="registerDiv">
       <form action="../user/register" method="post" id="registerForm" >
      		<table style="margin:100px 20px;">
      		<tr>
      				<td>头&nbsp;&nbsp;像:</td>
      				<td class="pl_n"><dt><img name="headpic" src="../image_upload/001.jpg"/>
      				<input type="hidden" name="user.headpic" value="../image_upload/001.jpg"/> 
      				</dt></td>
      				<td><span></span><span></span></td>
      			</tr>
      			<tr>
      				<td  title="请输入用户名">用 户  名:</td>
      				<td ><input  name="user.name" class="loginInput" title="请输入用户名" aria-rule="^[\u4e00-\u9fa5A-Za-z0-9-_]{2,8}$" aria-err="用户名只能是2-8位中英文或数字或下划线"/></td>
      				<td><span></span><span></span></td>
      			</tr>
      			<tr>
      				<td>账&nbsp;&nbsp;号:</td>
      				<td ><input name="user.account" class="loginInput" aria-rule="^[a-zA-Z]\w{5,11}$" aria-err="账号以字母开头，长度在6-12位之间，只能包含字符、数字和下划线"/></td>
      				<td><span></span><span></span></td>
      			</tr>
      			<tr>
      				<td>密&nbsp;&nbsp;码:</td>
      				<td ><input name="user.password" class="loginInput" aria-rule="^[a-zA-Z]\w{5,9}$" aria-err="密码以字母开头，长度在6-10位之间，只能包含字符、数字和下划线"/></td>
      				<td><span></span><span></span></td>
      			</tr>
      			
      			<tr>
      				<td>联系途径:</td>
      				<td>
      				<select name="contactway" >
      				<option value="QQ">QQ</option>
      				<option value="EMAIL">邮箱</option>
      				<option value="PHONE">电话</option>
      				</select>
      				<input name="user.contact" class="contactInput" aria-rule="" aria-err=""/></td>
      				<td><span></span><span></span></td>
      				<td></td>
      			</tr>
      			<tr>
      				<td>验证码:</td>
                    <td style="width:70px"><input name="imageCode" type="text"  class="loginInput"  style="width:98px;"/><img src="/manage/imageCode.action" onclick="change(this)" alt="验证码" title="点击更换" style="float:right;"/></td>
      				<td><span><s:property value="errorMsg"/></span></td> 
      			</tr>
      			<tr>
      				<td colspan="2" style="text-align:center;"><input type="submit" value="创&nbsp;建" class="loignButton"/></td>
      			</tr>
      		</table>	
      </form>
      </div>
      <div class="container">
	  <dl>
		<dt>关于账号注册</dt>
		<dd>
		  <p>● 请仔细填写您的注册信息</p>
		  <p>● 您在本博客注册的信息将永久保留</p>
		  <p>● 请不要再网络上散播非法（包括但不限于色情、暴力、恐吓等）信息</p>
		</dd>
		<dt>为什么要注册?</dt>
		<dd>
		  <p>● 注册后可以让更多的网友认识你</p>
		  <p>● 网友也可以通过联系方式联系到你</p>
		</dd>
	  </dl>
</div>
		</article>
		<aside> 
		<%@ include file="info.jsp"%>
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
      </div>
		<%@ include file="copyright.jsp"%> 
		</aside>
		<div class="clear"></div>
		<script type="text/javascript" src="../include/js/silder.js"></script>
		<script type="text/javascript" src="../plugin/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="../include/js/register.js"></script>
		<script type="text/javascript">
			function change(img){img.src = "imageCode.action?date="+new Date().getTime();}
			(function(){
			 	$("register_form > input").tooltip(); 
			  	$('dd').filter(':nth-child(n+4)').addClass('hide');
				  $('dl').on('click', 'dt', function() {
		 		 $(this).next().slideToggle(300);
			});
	 })(); 
</script>
	</div>
</body>
</html>