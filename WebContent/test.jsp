<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="plugin/diy/css/zqtimel.css" rel="stylesheet">
<title>JavaScript Test</title>
</head>
<body>
<button onclick="clicks()">警告框</button>
<div class="zqtimeline">
<!-- 	<ol class="zqlist">	
		<li><time>000000</time><div class="sanjiaox"></div>现在时间2017年4月18日20:22:29列表一</li>
		<li><time>000001</time><div class="sanjiaox"></div>now Time 2017年4月18日20:22:47 列表二</li>
		<li><time>000002</time><div class="sanjiaox"></div>2017年4月18日20:23:04</li>
		<li><time>000003</time><div class="sanjiaox"></div>2017-4-18 20:23:132017-4-18 20:23:13\n2017-4-18 20:23:13\n2017-4-18 20:23:13\n2017-4-18 20:23:13</li>
	</ol> -->
	<ol class="zqlist">	
		<li>
		<time>000000</time>
		<div class="text">现在时间2017年4月18日20:22:29列表一</div>
		<div class="sanjiaox"></div>
		<div class="yuanquan"></div> 
		 <div class="sjps"> 
		 <div class="hengzhou"></div>
		 <div class="hengzhousanjiao"></div>
		 <div class="sjp"></div>
		 </div>
		 </li>
	</ol>
</div>
</body>

<script type="text/javascript" src="include/js/jquery.min.js"></script>
<script type="text/javascript" src="plugin/diy/js/zqextend.js"></script>
<script type="text/javascript">
$.FilList();
function clicks(){
	$.Alert({
			'title':'提示',
			'inputb':true,
			'canmove':true,
			'confirmbtn':function(){
				alert($.inputval);
			},
			'canclebtn':function(){
			}
		}
	); 
} 
</script>
</html>