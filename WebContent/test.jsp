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
<!-- UY BEGIN -->
<input type="text" name="picname"/>
<script type="text/javascript" src="include/js/jquery.min.js"></script>
<!-- UY END -->
<script type="text/javascript">
$(function(){
	$('input[name="picname"]').change(function(){
		$.post('include/headpic/'+$(this).val()+'.jpg',function(data,ts,xhr){
			if(data){
				alert('存在'+ts+'..'+xhr);
			}else{
				alert('不存在'+ts+'..'+xhr);
			}
		});
	});
});

</script>
</body>