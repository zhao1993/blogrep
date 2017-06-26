<%@page import="com.blog.email.SendEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.gearCircle span{position:relative;width:175px;height:20px;background-color: #999;display: block;}
.gearCircle span:nth-child(1){transform:rotate(0deg);left: -13px; top: 67px;}
.gearCircle span:nth-child(2){transform:rotate(30deg);left: -13px; top: 50px;}
.gearCircle span:nth-child(3){transform:rotate(60deg);left: -15px; top: 28px;}
.gearCircle span:nth-child(4){transform:rotate(90deg);left: -15px; top: 6px;}
.gearCircle span:nth-child(5){transform:rotate(120deg);left: -15px; top: -15px;}
.gearCircle span:nth-child(6){transform:rotate(150deg);left: -14px; top: -39px;}
.gearCircle {width:150px; height:150px; position:absolute;border-radius:50%; background:#999;opacity:0.5; }
.gearCircle:nth-child(1){  top:120px; left:100px; -moz-animation:circles 10s linear 0s infinite;-webkit-animation:circles 10s linear 0s infinite;-o-animation:circles 10s linear 0s infinite; }
.gearCircle:nth-child(2){  top:60px; left:253px;  -moz-animation:circlesversa 10s linear 0s infinite;-webkit-animation:circlesversa 10s linear 0s infinite;-o-animation:circlesversa 10s linear 0s infinite; }
.gearCircle:nth-child(3){  top:285px; left:80px;  -moz-animation:circlesversa 10s linear 0s infinite;-webkit-animation:circlesversa 10s linear 0s infinite;-o-animation:circlesversa 10s linear 0s infinite; }
@-webkit-keyframes circles{ 0%{-webkit-transform:rotate(0deg);} 100%{-webkit-transform:rotate(360deg);} }
@-o-keyframes circles{ 0%{-o-transform:rotate(0deg);} 100%{-o-transform:rotate(360deg);} }
@-moz-keyframes circles{ 0%{-moz-transform:rotate(0deg);} 100%{-moz-transform:rotate(360deg);} }
@-webkit-keyframes circlesversa{ 0%{-webkit-transform:rotate(360deg);} 100%{-webkit-transform:rotate(0deg);} }
@-o-keyframes circlesversa{ 0%{-o-transform:rotate(360deg);} 100%{-o-transform:rotate(0deg);} }
@-moz-keyframes circlesversa{ 0%{-moz-transform:rotate(360deg);} 100%{-moz-transform:rotate(0deg);} }
</style>
<body>


<span><input type='text' style='width:200px'/></span>
<!-- 
<div class='gearCircle'>
<span></span>
<span></span>
<span></span>
<span></span>
<span></span>
<span></span>
</div>
<div class='gearCircle'>
<span></span>
<span></span>
<span></span>
<span></span>
<span></span>
<span></span>
</div>
<div class='gearCircle'>
<span></span>
<span></span>
<span></span>
<span></span>
<span></span>
<span></span>
</div> -->
</body>
</html>