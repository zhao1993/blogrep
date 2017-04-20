<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JavaScript Test</title>
<link href="plugin/diyAlert/css/zqtimel.css" rel="stylesheet"/>
</head>
<body>
<button onclick="clicks()">警告框</button>
<div class="zqtimeline">
	<div class="zqline"></div>
	<ol class="zqlist">	
		<li>现在时间2017年4月18日20:22:29列表一</li>
		<li>now Time 2017年4月18日20:22:47 列表二</li>
		<li>列表三 2017年4月18日20:22:58</li>
		<li>2017年4月18日20:23:04</li>
		<li>2017-4-18 20:23:132017-4-18 20:23:13\n2017-4-18 20:23:13\n2017-4-18 20:23:13\n2017-4-18 20:23:13</li>
	</ol>
</div>

</body>
<script type="text/javascript" src="include/js/jquery.min.js"></script>
<script type="text/javascript" src="plugin/diyAlert/js/zqalert.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	var toph = $(".zqtimeline ol li:first-child").height()/2;
	var heighth = $(".zqtimeline ol li:last-child").height()/2;
	$(".zqline").css("top",toph);
	$(".zqline").height($(".zqtimeline").height()-heighth-toph);
});
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