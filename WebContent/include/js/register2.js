(function($){
		$.extend({
			doRule:function(doc,rule,em,fn){
				console.log('doRule is running...');
				var span = $(doc).parent().next().find("span");
				if(rule){
					$(span[1]).text("");
					$(span[0]).attr('class','ui-icon ui-icon-circle-check');
					$(span[1]).css({'font-size':'13px','margin-top':'-13px'});
				}else{
					$(span[1]).text(em);
					$(span[0]).attr('class','ui-icon ui-icon-circle-close');
					$(span[1]).css({'font-size':'13px','line-height':'13px'});
				}
			}
		});
	})(jQuery)
/**注册界面的JS验证*/
var usernameRule = /^[\u4e00-\u9fa5A-Za-z0-9-_]{2,8}$/  //只能中英文,数字,下划线,减号
var accountRule = /^[a-zA-Z]\w{5,11}$/ //以字母开头，长度在6-12位之间，只能包含字符、数字和下划线。 
var passwordRule = /^[a-zA-Z]\w{5,9}$/ //以字母开头，长度在6-10位之间，只能包含字符、数字和下划线。 
var emailRule = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;//来源jqueryAPI
var phoneRule = /^0?(13[0-9]|15[0-9]|18[0-9]|14[57])[0-9]{8}$/  //电话
var qqnumberRule = /^[1-9]\d{4,10}$/ //1-9开头 5-11位数字组合
	$(function(){
		$.getScript('../plugin/jquery-validate/jquery.validate.min.js',null);
		var form = $('#registerForm');
		$(form).find('input').bind('keyup blur',function(){
			var name = $(this).attr('name');
			$.doRule(
					$(this),
					usernameRule.test($(this).val()),
					name=='name'?'用户名只能是2-8位中英文或数字或下划线':
					name=='account'?'账号以字母开头，长度在6-12位之间，只能包含字符、数字和下划线':
					name=='password'?'密码以字母开头，长度在6-10位之间，只能包含字符、数字和下划线':'错误的信息',
					null);
			$(form).find("input[type='submit']").attr('disabled',true);
		});
	})
