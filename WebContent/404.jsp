<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>您访问的页面不存在！</title>
<style type="text/css">
#bg{width: 666px; height: 346px; padding:10px;box-shadow: 0px 0px 4px #A22; position: relative; left: 25%; top: 66px; }
#bg img{float: left;}
ol{ list-style:none;position: relative; top: 76px; left: 26px;} 
li{margin-top:10px}
li:first-child {font-size:x-large;}
li:nth-child(1)+li ~ li{position: relative; left: 100px;}
</style>
</head>
<body>
<div id='bg'>
<img src="${pageContext.request.contextPath}/include/images/errImg.jpg" alt='404'/>
<ol>
<li>很抱歉，您想访问的页面不存在！</li>
<li>温馨提示：</li>
<li>1.请检查您访问的网址是否正确</li>
<li>2.您还可以直接返回<a href='index/index'>网站首页</a></li>
<li>3.其他相关问题可以<a href='about/contact'>联系作者</a></li>
</ol>

</div>
</body>
</html>