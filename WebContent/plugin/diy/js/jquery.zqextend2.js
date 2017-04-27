
var DEBUG = true;// 开启打印信息
(function($) {
	$.extend({
			LableWaterFall:function(options){
				options = $.extend({
					"width":"200px",
					"margin":"10px"
				},options);
				var wfDiv = $(".waterfallview");
				wfDiv.width(options.width);
				var totalwidth = 0;
				for(var i = 0;i<wfDiv.length;i+=1){
					//得到所有的子元素
					links = $(wfDiv[i]).find("a");
					var j = 0;
					for(;j<links.length;){
						var doc = $(links[j]);
						//生成新的元素
						var a = $("<a class='waterfallviewlink "+doc.attr('class')+"' title='"+doc.attr('title')+"' href='"+doc.attr('href')+"'>"+doc.text()+"</a>");
						//元素追加到指定的Div
						var aDiv = $("<div></div>");
						aDiv.append(a);
						wfDiv.append(aDiv);
						$.println($(a).width()+1);
						j+=1;
					}
			}
				$(wfDiv).find("div").css({'margin-left':'1em','float':'left'});
				$(".waterfallviewlink").css({'color':'rgba(216,216,216,1)'});
				$(".waterfallviewlink").hover(function(){$(this).css('color','rgba(255,255,255,1)');},
						function(){$(this).css('color','rgba(216,216,216,1)');})
			},
				FilList : function() {
					var bgColor = 'rgba(195,195,195,.6)';
					var hoverBgColor = 'rgba(185,185,185,.9)';
					var min_H = "60"; 
					if ($(".zqlist").length == 0) {
						$.println("没有找到默认选择器:停止填充!", 1);
						return;
					}
					var lists = $(".zqlist > li");
					/* 对每个li元素进行填充 */
					for (var i = 0; i < lists.length; i+=1) {
						/* 得到li元素 */
						var li = lists[i];
						/* 得到time */
						var timed = $(".zqlist > li:eq(" + i + ") > time:eq(0)");
						var timer = $(timed).text();
						/* 移除time元素 */
						timed.remove();
						/* 得到文本内容 */
						var content = $(li).text();
						$(li).text("");
						/* 创建节点文本div */
						var fText = $("<div class='zqfText'>"+content+"</div>");
						/* 三角形div */
						var fTriangle = $("<div class='zqfTriangle'></div>");
						/* 圆圈 */
						var fCircle = $("<div class='zqfCircle'>.</div>");
						/* 横轴 */
						var fHorizontal = $("<div class='zqfHorizontal'>"+timer+"</div>");
						/* 添加元素 */
						fText.clone().appendTo(li);
						fTriangle.clone().appendTo(li);
						fCircle.clone().appendTo(li);
						fHorizontal.clone().appendTo(li);
					}
					/*增加可设参数前的调整*/
					 
					/* 样式填充 */
					$(".zqlist").css({
						'width': '730px',
						'list-style':'none'
					});
					/*文本div*/
					$('.zqfText').css({
						'border' : 'rgba(0,0,0,0) solid 1px',
						'background-color' : bgColor,
						'border-radius' : '5px',
						'border-top-right-radius' : '0px',
						'min-height' : min_H+'px',
						'padding' : '1em 2em',
						'width' : '388px',
						'float' : 'left',
						'margin' : '20px 0px'
					});
					/*三角形div*/
					$('.zqfTriangle').css({
						'border-left' : '50px solid '+bgColor,
						'border-bottom' : '40px solid transparent',
						'border-top' : '15px solid transparent',
						'margin' : '20px 0px',
						'float' : 'left'
					});
					/*圆圈div*/
					$('.zqfCircle').css({
						'width' : '30px',
						'height' : '30px',
						'border-radius' : '50%',
						'background-color' : bgColor,
						'float' : 'left',
						'margin' : '20px 0px',
						'font-size':'0px',
						'-moz-transition': 'all .5s',
						'-webkit-transition': 'all .5s', 
						'-o-transition': 'all .5s',
						'transition': 'all .5s'
					});
					/*横轴面板div*/
					$('.zqfHorizontal').css({
						'height' : '30px',
						'width' : '0px',
						'background-color' : bgColor,
						'float' : 'left',
						'margin-top' : '20px',
						'margin-left' : '-30px',
						'border-radius' : '15px',
						'text-align':'center',
						'font-size':'0px',
						'padding-top':'1em'
							});
					/*事件样式*/
					$(".zqfText").hover(
						function(){
							$(this).css({'background-color':hoverBgColor});
							$(this).parent().find(".zqfTriangle").css({'border-left':'50px solid '+hoverBgColor});
							$(this).parent().find(".zqfCircle").css({'font-size':'15px','transform':'rotate(1080deg)'});
							$(this).parent().find(".zqfHorizontal").animate({'width':'150px','height':min_H/2+'px','font-size':'15px'},100);
						},
						function(){
							$(this).css({'background-color':bgColor})
							$(this).parent().find(".zqfTriangle").css({'border-left':'50px solid '+bgColor});
							$(this).parent().find(".zqfCircle").css({'font-size':'0px','background-color':bgColor,'transform':'rotate(0deg)'});
							$(this).parent().find(".zqfHorizontal").animate({'width':'30px','height':'30px','font-size':'0px'},100);
						}
					);
				},
				Alert : function(params) {
					/* 初始化参数 */
					if (!params) {
						$.println("没有定义任何参数!提示框不能启动:可定义的参数:");
						$.println("title（String）:提示框标题文字");
						$.println("content（String）:提示框显示内容");
						$.println("inputb（boolean）:是否显示一个输入框");
						$.println("confirmbtn（function）:确定按钮执行的函数");
						$.println("canclebtn（function）:取消按钮执行的函数");
						$.println("canmove（boolean）:弹框是否可以被移动[测试功能]");
						$.println("可以通过 '$.inputval' 获取输入框的值 ")
						$.println("示例 $.Alert({'title':'提示','confirmbtn':function(){alert($.inputval)};})")
						return false;
					}
					params = $.extend({
						title :"zqalert-提示:",
						content : "zqalert-内容",
						inputb : false,
						confirmbtn : null,
						canclebtn : null,
						canmove : false
					},params);
					this.show = function() {
						$.println("弹框正常显示!");
						$.println("\n标题:" + params.title + "\n内容:" + params.content
								+ "\n输入框使用:" + (params.inputb == true)
								+ "\n可移动(测试功能不建议开启):" + params.canmove + "\n左按钮:"
								+ typeof params.confirmbtn + "\n右按钮:"
								+ typeof params.canclebtn);
						/** *************************创建获取文档节点**************************** */
						var body = $("body")[0];
						// 提示框背景
						var bg = $("<div class='zqdbyc zqalert-bgdiv'></div>");
						// 头部div
						var header = $("<div class='zqdbyc zqalert-bgdiv-header'></div>");
						// 头部div内的标题
						var header_title = $("<span class='zqdbyc zqalert-bgdiv-header-title'></span>");
						// 头部右方关闭按钮
						var times = $("<span class='zqdbyc zqalert-bgdiv-times'>×</span>");
						// 提示内容
						var _body = $("<div class='zqdbyc zqalert-bgdiv-body'></div>");
						// 提示输入框
						var inputs = $("<input class='zqdbyc zqalert-bgdiv-body-input'></input>");
						// 底部按钮div
						var footer = $("<div class='zqdbyc zqalert-bgdiv-footer'></div>");
						// 确定与取消按钮
						var footer_confirm = $("<div class='zqdbyc zqalert-footer_btn zqalert-footer_confirm'>确定</div>");
						var footer_cancle = $("<div class='zqdbyc zqalert-footer_btn zqalert-footer_cancle'>取消</div>");
						header_title.appendTo(header);
						header_title.text(params.title);
						// 添加右上角的关闭按钮
						times.appendTo(header);
						header.appendTo(bg);
						// 创建遮罩层
						var shadow = $("<div class='zqalert-shadow'></div>");
						bg.appendTo(shadow);
						// 完成布置
						shadow.appendTo(body);
						// 拖动事件
						if (params.canmove == true) {
							$.println('开启拖动提示框功能[测试階段]...');
							$(header)
									.bind(
											{
												'mousedown' : function(a) {
													var x = a.clientX;
													var y = a.clientY;
													var oldy = $(bg).offset().top;
													var oldx = $(bg).offset().left;
													$(document)
															.bind(
																	{
																		'mousemove' : function(
																				b) {
																			if (b.clientY <= 10
																					|| b.clientX <= (x - oldx)) {
																				return false;
																			}
																			$(
																					bg)
																					.offset(
																							{
																								'top' : oldy
																										+ (b.clientY - y),
																								'left' : oldx
																										+ (b.clientX - x)
																							});
																			$(
																					bg)
																					.offset(
																							{
																								'top' : $(
																										bg)
																										.offset().top <= 10 ? 10
																										: $(
																												bg)
																												.offset().top
																												+ $(bg).height >= $(document).height ? $(document).height
																												- $(bg).height
																												- 10
																												: $(
																														bg)
																														.offset().top,
																								'left' : $(
																										bg)
																										.offset().left <= 10 ? 10
																										: $(
																												bg)
																												.offset().left
																												+ $(bg).width >= $(document).width ? $(document).width
																												- $(bg).width
																												- 10
																												: $(
																														bg)
																														.offset().left
																							});
																		},
																		'mouseup' : function() {
																			$(
																					document)
																					.off(
																							'mousemove')
																		}
																	});
												},
												'mouseup' : function() {
													$(document)
															.off('mousemove')
												}
											});
						}
						// 添加事件（关闭窗口）
						times.click(function() {
							$(times).css('color', 'rgba(155,155,155,1)');
							destroy();
						});
						// 添加提示内容部分(展示内容不能与输入框同时存在，并且输入框优先)
						_body.appendTo(bg);
						_body.text(params.content);
						if (params.inputb == true) {
							_body.append(inputs);
							$(inputs).bind('keyup', function() {
								var text = $(inputs).val();
								if (text) {
									$.inputval = text;
								}
							});
						}
						// 添加底部按钮部分
						footer.appendTo(bg);
						if (params.canclebtn) {
							footer_cancle.appendTo(footer);
							// 添加事件取消按钮
							footer_cancle.click(function() {
								destroy();
								if (typeof params.canclebtn == 'function') {
									params.canclebtn();
									$.println('执行自定义取消按钮事件');
								} else {
									$.println('取消按钮不是合法函数!');
								}
							});
						}
						if (params.confirmbtn) {
							footer_confirm.appendTo(footer);
							// 添加事件确定按钮
							footer_confirm.click(function() {
								destroy();
								if (typeof params.confirmbtn == 'function') {
									params.confirmbtn();
									$.println('执行自定义确定按钮事件');
								} else {
									$.println('确定按钮不是合法函数!');
								}
							});
						}
						// 遮罩层无敌状态
						$(window).bind(
								'scroll resize',
								function() {
									shadow.css({
										'height' : $(document.body)
												.outerHeight(true),
										'width' : $(window).width()
												+ document.body.scrollLeft
									});
								})
						// 弹框无敌
						$(document)
								.keydown(
										function(event) {
											if (event.keyCode == 116
													|| ((event.altKey) && ((event.keyCode == 37) || (event.keyCode == 39)))) {
												return false;
											}
										});
						$(document).bind("contextmenu", function(e) {
							$.println("右键菜单已经被禁用");
							return false;
						});
						/** *************************样式文件合并************************************* */
						$(shadow).css({
							'padding' : '0px',
							'margin' : '0px',
							'position' : 'absolute',
							'left' : '0px',
							'top' : '0px',
							'width' : '100%',
							'height' : '100%',
							'background-color' : 'rgba(252,252,252,.3)'
						});
						$(_body).css({
							'background-color' : 'rgba(255,255,255,.8)',
							'padding' : '1em',
							'padding-bottom' : '1em'
						});
						$(bg).css({
							'font-size' : '17px',
							'z-index' : '99999',
							'width' : '360px',
							'background-color' : 'rgba(122,122,122,1)',
							'box-shadow' : '0px 0px 8px #033',
							'position' : 'absolute',
							'margin-left' : '-180px',
							'margin-top' : '-90px',
							'top' : '50%',
							'left' : '50%',
							'cursor' : 'default',
							'-moz-user-select' : 'none',
							'-webkit-user-select' : 'none',
							'-ms-user-select' : 'none',
							'-khtml-user-select' : 'none',
							'user-select' : 'none'
						});
						$(header).css({
							'height' : '26px',
							'font-size' : '15px',
							'line-height' : '15px'
						});
						$(header_title).css({
							'color' : 'rgba(235,235,235,1)',
							'font-weight' : 'bold',
							'position' : 'absolute',
							'top' : '5px',
							'left' : '1em'
						});
						$(times).css({
							'font-size' : '22px',
							'float' : 'right',
							'color' : 'rgba(235,235,235,1)',
							'line-height' : '22px'
						});
						$(inputs).css({
							'width' : '320px',
							'height' : '18px',
							'margin-top' : '1em'
						});
						$(footer).css({
							'background-color' : 'rgba(255,255,255,.8)',
							'height' : '30px'
						});
						$('.zqalert-footer_btn').css({
							'color' : 'rgba(255,255,255,0.8)',
							'float' : 'right',
							'margin-right' : '30px',
							'padding' : '2px 1em',
							'cursor' : 'pointer',
							'border-radius' : '3px'
						});
						$(footer_confirm).css('background-color',
								'rgba(186,106,196,1)');
						$(footer_cancle).css('background-color',
								'rgba(166,166,166,1)');
						$(inputs).hover(function() {
							$(inputs).css('box-shadow', '0px 0px 6px #033')
						}, function() {
							$(inputs).css('box-shadow', '0px 0px 0px #000')
						});
						$(times).hover(function() {
							$(times).css({
								'cursor' : 'pointer',
								'color' : 'rgba(255,255,255,1)'
							})
						}, function() {
							$(times).css('color', 'rgba(235,235,235,1)')
						});
						$(footer_confirm).hover(
								function() {
									$(footer_confirm).css('background-color',
											'rgba(186,106,196,.6)')
								},
								function() {
									$(footer_confirm).css('background-color',
											'rgba(186,106,196,1)')
								});
						$(footer_cancle).hover(
								function() {
									$(footer_cancle).css('background-color',
											'rgba(166,166,166,.6)')
								},
								function() {
									$(footer_cancle).css('background-color',
											'rgba(166,166,166,1)')
								});
					};
					function destroy() {
						$(".zqalert-bgdiv").remove();
						$(".zqalert-shadow").remove();
						$(document).off('keydown contextmenu');
						$.println("窗口被关闭!");
					}
					this.show();
				},
				println : function(msg, module) {
					if (!DEBUG)
						return;
					var date = new Date();
					var time = "[" + (date.getMonth() + 1) + "月"
							+ date.getDate() + "日  " + date.getHours() + ":"
							+ date.getMinutes() + ":" + date.getSeconds()
							+ "] ：";
					try {
						module = module == null ? "[来自Alert]"
								: module == 1 ? "[来自FilList]"
										: module == 2 ? "[来自AutoPager:]"
												: module == 3 ? "[来自LableWaterFall:]"
												: "[来自Unknow]";
						if (window.console) {
							console.info("%c" + time + "%c" + module + '提示:'
									+ msg, "color:blue", "color:red");
						}
					} catch (e) {
						alert(e);
					}
				},
				/**未考虑的BUG 如果例外的数字刚好是随机数的数字如随机产生1-10 而例外也是1-10 则会陷入死循环
				 * 参数类型不符合等
				 * 一个参数 返回0-min（不含min）之间的 整数
				 * 两个参数 返回min-max之间（包含max）的随机整数。
				 * 三个参数 返回min-max之间（包含max）的随机整数 但不包含excepts内(可以是数字和数字数组)的数字
				 * */
				Random : function(min,max,excepts){
					if(typeof max !='number'){
						return parseInt(Math.random()*min);
					}
					if(min>max){var omax = max;max = min;min = omax;}
					var val = parseInt(Math.random()*(max-min+1))+min;
					if(typeof excepts == 'number' && excepts==val){
						return $.Random(min,max,excepts);
					}
					if(null!=excepts && excepts.length>0){
						for(var i=0;i<excepts.length;i+=1){
							if(excepts[i]==val){
								return $.Random(min,max,excepts);
							}
						}
					}
					return val;
				},
				inputval : null,
			});
})(jQuery);