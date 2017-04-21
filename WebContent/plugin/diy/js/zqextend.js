/** 依赖Jquery 测试使用jQuery v1.7 不兼容IE 2017-4-18 */
var DEBUG = true;// 开启打印信息
(function($) {
	$
			.extend({
				FilList : function() {
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
					/* 样式填充 */
					$(".zqlist").css({
						'width': '1000px',
						'list-style':'none'
					});
					/*文本div*/
					$('.zqfText').css({
						'border' : 'rgba(0,0,0,0) solid 1px',
						'background-color' : 'rgba(245,245,245,.6)',
						'box-shadow' : '0px 0px 1px #EEEEEE',
						'border-radius' : '5px',
						'border-top-right-radius' : '0px',
						'min-height' : '100px',
						'padding' : '1em 2em',
						'width' : '588px',
						'float' : 'left',
						'margin' : '20px 0px'
					});
					/*三角形div*/
					$('.zqfTriangle').css({
						'border-left' : '50px solid rgba(245,245,245,.6)',
						'border-bottom' : '60px solid transparent',
						'border-top' : '15px solid transparent',
						'margin' : '20px 0px',
						'float' : 'left',
						'margin' : '20px 0px'
					});
					/*圆圈div*/
					$('.zqfCircle').css({
						'width' : '30px',
						'height' : '30px',
						'border-radius' : '50%',
						'background-color' : 'rgba(245,245,245,.6)',
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
						'background-color' : 'rgba(245,245,245,.6)',
						'float' : 'left',
						'margin-top' : '20px',
						'margin-left' : '-30px',
						'border-radius' : '15px',
						'text-align':'center',
						'font-size':'0px',
						'padding-top':'2em'
							});
					/*事件样式*/
					$(".zqfText").hover(
						function(){
							$(this).css({'background-color':'rgba(162,162,162,.1)'});
							$(this).parent().find(".zqfTriangle").css({'border-left':'50px solid rgba(162,162,162,.1)'});
							$(this).parent().find(".zqfCircle").css({'font-size':'25px','transform':'rotate(1080deg)'});
							$(this).parent().find(".zqfHorizontal").animate({'width':'200px','height':'80px','font-size':'15px'},100);
						},
						function(){
							$(this).css({'background-color':'rgba(245,245,245,.6)'})
							$(this).parent().find(".zqfTriangle").css({'border-left':'50px solid rgba(245,245,245,.6)'});
							$(this).parent().find(".zqfCircle").css({'font-size':'0px','background-color':'rgba(245,245,245,.6)','box-shadow':'0px 0px 1px #EEEEEE','transform':'rotate(0deg)'});
							$(this).parent().find(".zqfHorizontal").animate({'width':'30px','height':'0px','font-size':'0px'},100);
						}
					);
				},
				Alert : function(param) {
					/* 初始化参数 */
					if (!param) {
						$.println("没有定义任何参数!提示框不能启动:可定义的参数:");
						$.println("title（String）:提示框标题文字");
						$.println("content（String）:提示框显示内容");
						$.println("inputb（boolean）:是否显示一个输入框");
						$.println("confirmbtn（function）:确定按钮执行的函数");
						$.println("canclebtn（function）:取消按钮执行的函数");
						$.println("canmove（boolean）:弹框是否可以被移动[测试功能]");
						$.println("可以通过 '$.inputval' 获取输入框的值 ")
						$
								.println("示例 $.Alert({'title':'提示','confirmbtn':function(){alert($.inputval)};})")
						return false;
					}
					this.title = "zqalert-提示:";
					this.content = 'zqalert-内容';
					this.inputb;
					this.confirmbtn;
					this.canclebtn;
					this.canmove;
					if (param) {
						if (param.title) {
							this.title = param.title;
						}
						if (param.content) {
							this.content = param.content;
						}
						if (param.inputb) {
							this.inputb = param.inputb;
						}
						if (param.canclebtn) {
							this.canclebtn = param.canclebtn;
						}
						if (param.confirmbtn) {
							this.confirmbtn = param.confirmbtn;
						}
						if (param.canmove) {
							this.canmove = param.canmove;
						}
					}
					this.show = function() {
						$.println("弹框正常显示!");
						$.println("\n标题:" + this.title + "\n内容:" + this.content
								+ "\n输入框使用:" + (this.inputb == true)
								+ "\n可移动(测试功能不建议开启):" + this.canmove + "\n左按钮:"
								+ typeof this.confirmbtn + "\n右按钮:"
								+ typeof this.canclebtn);
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
						header_title.text(this.title);
						// 添加右上角的关闭按钮
						times.appendTo(header);
						header.appendTo(bg);
						// 创建遮罩层
						var shadow = $("<div class='zqalert-shadow'></div>");
						bg.appendTo(shadow);
						// 完成布置
						shadow.appendTo(body);
						// 拖动事件
						if (this.canmove == true) {
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
						_body.text(this.content);
						if (this.inputb == true) {
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
						if (this.canclebtn) {
							footer_cancle.appendTo(footer);
							// 添加事件取消按钮
							footer_cancle.click(function() {
								destroy();
								if (typeof $.canclebtn == 'function') {
									$.canclebtn();
									$.println('执行自定义取消按钮事件');
								} else {
									$.println('取消按钮不是合法函数!');
								}
							});
						}
						if (this.confirmbtn) {
							footer_confirm.appendTo(footer);
							// 添加事件确定按钮
							footer_confirm.click(function() {
								destroy();
								if (typeof $.confirmbtn == 'function') {
									$.confirmbtn();
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
										: module == 2 ? "[来自Doc:]"
												: "[来自Unknow]";
						if (window.console) {
							console.info("%c" + time + "%c" + module + '提示:'
									+ msg, "color:blue", "color:red");
						}
					} catch (e) {
						alert(e);
					}
				},
				inputval : null,
			});
})(jQuery);