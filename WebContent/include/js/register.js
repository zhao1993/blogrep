(function($){
		$.extend({
			//函数fn暂时无效
			doRule:function(doc,rule,em,fn){
				var span = $(doc).parent().next().find("span");
				if(rule){
					$(span[1]).text("");
					$(span[0]).attr('class','ui-icon ui-icon-circle-check');
					$(span[1]).css({'font-size':'13px','margin-top':'-13px'});
					return true;
				}else{
					$(span[1]).text(em);
					$(span[0]).attr('class','ui-icon ui-icon-circle-close');
					$(span[1]).css({'font-size':'13px','line-height':'13px'});
					return false;
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
		var form = $('#registerForm');
		//表单事件绑定（编辑时触发验证）
		$(form).find('input').bind('keyup blur',function(){
			formCheck($(this));
		});
		//事件抽取 （对验证事件进行提取）
		function formCheck(doc){
			var name = $(doc).attr('name');
			var contactway = $("select[name='contactway']").val();
			if('QQ'==contactway){
				$('input[name="contact"]').attr({
					'aria-rule':'^[1-9]\\d{4,10}$',
					'aria-err':'请输入一个有效的QQ号码!'
				});
			}else if('EMAIL'==contactway){
				$('input[name="contact"]').attr({
					'aria-rule':'^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$',
					'aria-err':'请输入一个正确的电子邮箱!'
				});
			}else if('PHONE'==contactway){
				$('input[name="contact"]').attr({
					'aria-rule':'^(13[0-9]|15[0-9]|18[0-9]|14[57])[0-9]{8}$',
					'aria-err':'请输入正确的电话号码!'
				});
			}
			return $.doRule($(doc),new RegExp($(doc).attr('aria-rule')).test($(doc).val()),$(doc).attr('aria-err'),null);
		}
		
		$('select[name="contactway"]').change(function(){
			formCheck($('input[name="contact"]'));
		});
		//表单提交事件（点击提交按钮触发所有验证事件）
		$(form).submit(function(){
			var flag = 0;
			$(this).find('input').filter('.contactInput , :lt(3)').each(function(){
				if(!formCheck($(this))){
					flag += 1;
				};
				console.info(formCheck($(this))+"-->"+Math.random()+'-->'+$(this).attr('name'));
			});
			if(flag==0){
				return $.Alert({
					title:'注册信息',
					content:'您的注册信息如下请确认:',
					custom:$("<div><span>账号："+$('input[name="account"]').val()+
							"</span></br><span>密码："+$('input[name="password"]').val()+
							"</span></br><span>用户组名："+$('input[name="name"]').val()+
							"</span></br><span>联系方式："+$('select[name="contactway"]').val()+"-->"+$('input[name="contact"]').val()+"</div>"),
					confirmbtn:function(){
						return true;
					},
					canclebtn:true
				});
			}
			return false;
		});
	})
	