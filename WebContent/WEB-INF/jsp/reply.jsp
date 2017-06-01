<%@page pageEncoding="UTF-8"%>
<link href="../include/css/reply.css" rel="stylesheet"/>
<c:if test="${empty loginUser}">
<span>发表评论前请先[<a onclick="loginAtag_u()" href="javascript:;">登录</a>]或[<a href="../index/register">注册</a>]</span>
</c:if>
<c:if test="${not empty loginUser}">
<input type="hidden" name='critique.id' value="${loginUser.id}"/>
		<div class="comment">
			<div class="head-face">
				<img src="${loginUser.headpic}" /><span style="color:yellowgreen">${loginUser.name}</span>
			</div>
			<div class="content">
				<div class="cont-box">
					<textarea class="text" name="critique.content"  id="saytext" placeholder="请输入..."></textarea>
				</div>
				<div class="tools-box">
					<div class="operator-box-btn"><span class="face-icon emotion" >☺</span></div>
					<div class="submit-btn"><input type="button" onClick="critiqueValidate()" value="提交评论" /></div>
				</div>
			</div>
		</div>
		</c:if>
<script type="text/javascript" src="../plugin/reply/js/jquery.qqFace.js"></script>
<script type="text/javascript">
$(function(){
	$('.emotion').qqFace({
		id : 'facebox', 
		assign:'saytext', 
		path:'../plugin/reply/arclist/'	//表情存放的路径
	});
});
</script>

