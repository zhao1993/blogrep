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
<button onclick="clicks()">警告框</button>
<div class="zqtimeline">
	<ol class="zqlist">	
		<li><time>2017年4月21日</time>现在时间2017年4月18日20:22:29列表一</li>
		<li><time>2017年4月22日</time>现在时间2017年4月18日20:22:29列表一</li>
		<li><time>2017年4月23日</time>现在时间2017年4月18日20:22:29列表一</li>
		<li><time>2017年4月24日</time>现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一现在时间2017年4月18日20:22:29列表一</li>
	</ol>
	<!-- <ol class="zqlist">	
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
	</ol> -->
</div>
</body>

<script type="text/javascript" src="include/js/jquery.min.js"></script>
<script type="text/javascript" src="plugin/diy/js/jquery.zqextend.js"></script>
<script type="text/javascript">
//列表填充（类似于时间轴）
//$.FilList(); 默认使用 class为 zqlist 的列表
$.AutoPager();
$.FilList();
function clicks(){
	//弹框使用，使用空的参数 控制台会打印可用的参数
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