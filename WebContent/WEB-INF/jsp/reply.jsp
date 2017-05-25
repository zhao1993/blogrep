<%@page pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../plugin/kkpager/kkpager_blue.css" rel="stylesheet" />
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
	</head>
<body>
 <kkpager aria-page='${page}' aria-all='${totalPage}' aria-data='${size}'></kkpager>
		<div id="kkpager"></div>
  		<h3>
        <p><span>到此一游</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="../critique/critique_add" method="post" id="critique_reply">
      	<input type="hidden" name= 'critique.type' value="LAM"/>
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
	    			<td><button  type="submit" onclick="return critiqueValidate()" >提交</button>
	    			</td>
    			</tr>
    			</c:if>
      		</table>
      </form>
<script type="text/javascript" src="../include/js/jquery.min.js"></script>
<script type="text/javascript" src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../plugin/kkpager/kkpager.min.js"></script>
  <script type="text/javascript" src="../include/js/critique.js"></script>
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