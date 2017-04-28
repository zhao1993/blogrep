<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="plugin/diy/css/zqtimel.css" rel="stylesheet">
 --><title>JavaScript Test</title>
</head>
<body>
<button onclick="test()">按钮</button>
</body>

<script type="text/javascript" src="include/js/jquery.min.js"></script>
<script type="text/javascript" src="plugin/diy/js/jquery.zqextend.js"></script>
<script type="text/javascript">
$.LableWaterFall({'width':'300px'});
function test(){
	$.Alert({
		'title':'提示',
		'custom':'<a href="....">定制超链接？</a><span>奇葩内容</span><input type="text" /><button>按钮</button>',
		'confirmbtn':function(){
			alert($.inputval);  
			}
		}
	)
}
</script>
</html>