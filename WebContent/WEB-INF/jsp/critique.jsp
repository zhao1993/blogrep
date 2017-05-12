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
		<script type="text/javascript" src="../include/js/jquery.min.js"></script>
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
    <div class="logo"><a href="../index/index"></a></div>
    <%@ include file="nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../index/index">首页</a>><a href="../critique/critique">留言板</a></h2>
    <div class="template">
      <h3>
        <p><span>最新留言</span></p>
      </h3>
      <ul class="pl_n" id="critiqueList">
     
      </ul>
       <%-- <ul class="pl_n">
       <s:iterator value="critiques" var="critique">
       <s:if test="#critique.critique == null">
        <dl style="border-top-style:double;border-bottom-style: dotted;border-width: 2px;">
        <dt>
         <s:if test= "photo != null">
          <img src="<s:property value="#critique.photo"/>"/> 
          </s:if>
          <s:if test="photo == null">
          <img src="../include/images/s8.jpg"/>
          </s:if>
          </dt>
          <dt> </dt>
          <dd><s:property value="#critique.name"/>
            <time><s:property value="#critique.time"/></time>&nbsp;&nbsp;&nbsp;<span>联系方式:<span id="contact"><s:property value="#critique.notice"/></span></span>
          </dd>
          <dd><s:property value="#critique.content" escape="false"/>
          <ul>
 <s:iterator value="#critique.critiques" >
        <dl style="background-color: red ;width:90% ;float:right;margin-right:5em" >
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
            <time><s:property value="time"/></time>&nbsp;&nbsp;&nbsp;<span>联系方式:<span id="contact"><s:property value="notice"/></span></span>
          </dd>
          <dd><s:property value="content" escape="false"/></dd>
        </dl>
        </s:iterator>          
          
          </ul>
          </dd>
        </dl>
     
        </s:if>
        </s:iterator>
        <s:debug/>
      </ul>  --%>
     <%--  <!-- 测试 -->
       <s:iterator value="critiques" >
       <div class="critiuqeDiv pl_n">
       			<div>
      				 <s:if test="photo != null">
         			 <img src="<s:property value="photo"/>"/> 
         		 </s:if>
        		  <s:if test="photo == null">
         				 <img src="../include/images/s8.jpg"/>
       		 		  </s:if>
      			 	</div>
       <div><s:property value="name"/></div>
       <div><time><s:property value="time"/></time></div>
       <div><s:property value="content" escape="false"/></div>
       </div>
       </s:iterator> --%>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    <div class="page">
      	<s:if test="page==1">
      		<a href="#">&lt;</a>
      	</s:if>
      	<s:else>
      		<a href="critique?page=<s:property value="page-1"/>">&lt;</a>
      	</s:else>
          <s:iterator begin="1" end="totalPage" var="p">
          	<s:if test="#p==page">
          		<b><s:property/></b>
          	</s:if>
          	<s:else>
          		<a href="critique?page=<s:property/>"><s:property/></a>
          	</s:else>
          </s:iterator>
          <s:if test="page==totalPage">
          	<a href="#">&gt;</a>
          </s:if>
          <s:else>
          	<a href="critique?page=<s:property value="page+1"/>">&gt;</a>
          </s:else>
      </div> 
  		<h3>
        <p><span>到此一游</span></p>
        <a href="#" target="_blank" class="more"></a>
      </h3>
       <form action="../critique/critique_add" method="post" >
      		<table>
      			<tr>
      				<td><span>您的姓名:</span></td><td>
      				<input name="critique.name"/><span></span></td>
      			</tr>
      			<tr>
      				<td><span>您的联系方式:</span></td>
      				<td>
      				<input name="critique.notice"  title='需要得到反馈时请留下联系方式'/> 
      				<span > 是否公开： <select name='ispublic'  title='公开即所有人可见反之仅作者可见'>
      				<option value='N'>否</option>
      				<option value='Y'>是</option>
      				</select>
      				</span></td>
      			</tr>
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
      		</table>
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
  <script src="../include/js/silder.js"></script>
  <script type="text/javascript" src="../plugin/diy/js/jquery.zqextend.js"></script>
  <script type="text/javascript" src="../include/js/critique.js"></script>
  <div class="clear"></div>
	</div>
	<script>
		$('input[name="critique.name"],textarea[name="critique.content"]')
				.bind({
					blur : function() {
						if (!$(this).val()) {
							$(this).next().text("×请输入内容！").css("color", "red");
						}
					},
					focus : function() {
						$(this).next().text("");
					}
				});
		$('input[name="critique.notice"]').next().fadeOut("fast");
		$('input[name="critique.notice"]').on("keyup",function(){
			if (!$(this).val()) {
				$(this).next().fadeOut();
			}else{
				$(this).next().fadeIn();
			}
		});
		function critiqueValidate() {
			var name = $('input[name="critique.name"]').val();
			var content = $('textarea[name="critique.content"]').val();
			if (name && content) {
			var contact = $('input[name="critique.notice"]'); 
			if(contact.val()){
				contact.val(contact.val()+$("select[name='ispublic']").val());
			}
				return true;
			} else {
				$.Alert({title:"提示",content:"存在不能为空的选项",confirmbtn:function(){}})
				return false;
			}
		}
	</script>
</body>
</html>
