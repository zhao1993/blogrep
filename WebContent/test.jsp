<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JavaScript Test</title>
<script type="text/javascript" src="include/js/jquery.min.js"></script>
<script type="text/javascript" src="plugin/diy/js/jquery.miniToast.js"></script>
1.<!doctype html>2.<html lang="en">3.<head>4.  <meta charset="utf-8">5.  <title>jQuery UI 日期选择器（Datepicker） - 格式化日期</title>6.  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">7.  <script src="//code.jquery.com/jquery-1.9.1.js"></script>8.  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>9.  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">10.  <script>11.  $(function() {12.    $( "#datepicker" ).datepicker();13.    $( "#format" ).change(function() {14.      $( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );15.    });16.  });17.  </script>18.</head>19.<body>20. 21.<p>日期：<input type="text" id="datepicker" size="30"></p>22. 23.<p>格式选项：<br>24.  <select id="format">25.    <option value="mm/dd/yy">Default - mm/dd/yy</option>26.    <option value="yy-mm-dd">ISO 8601 - yy-mm-dd</option>27.    <option value="d M, y">Short - d M, y</option>28.    <option value="d MM, y">Medium - d MM, y</option>29.    <option value="DD, d MM, yy">Full - DD, d MM, yy</option>30.    <option value="&apos;day&apos; d &apos;of&apos; MM &apos;in the year&apos; yy">With text - 'day' d 'of' MM 'in the year' yy</option>31.  </select>32.</p>33. 34. 35.</body>36.</html>
<script type="text/javascript">
	$.Toast({showMsg:'测试居中显示'}); 
</script>
</body>