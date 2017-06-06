/**
 * Created by fuck-Sky on 2017/6/5.
 * 导入jquery1.1以上的版本
 * 导入jquery.miniToast.js文件
 * function--> 短暂的消息提示
 *    调用方法 $.Toast({
 *               showMsg ;'必填参数要显示的信息'
 *              fontSize :'选填信息字体大小默认20px'
 *              displayTime ：‘选填信息展示时间默认 自动auto 单位毫秒’
 *              bgColor：‘显示框的背景色 默认 灰色? grey’
 *              fColor:'显示信息的文字颜色 默认白色 white'
 *          });
 *          例如：
 *          $.Toast({
 *          showMsg:'登录失败!',
 *          displayTime:1000
 *          })
 */
(function($){
    $.extend({
        Toast:function(option){
            var options = $.extend({
                fontSize:'20px',
                showMsg:'toast!',
                displayTime:'auto',
                hoverPause:true,
                bgColor:'grey',
                fColor:'white'
            },option);
            var toastBG = $('<div></div>');
            toastBG.html(options.showMsg);
            if(options.showMsg==null || options.showMsg==''){
                console.warn('miniToast已经尝试启动，但由于接受到无效的显示内容，所以没有显示成功！');
                return false;
            }
            toastBG.css({
                'user-select': 'none',
                '-moz-user-select': 'none',
                'z-index':9999,
                'font-size':options.fontSize,
                'text-align':'center',
                color:options.fColor,
                background: options.bgColor,
                'box-shadow':'1px 1px 3px '+options.bgColor,
                width: '10em',
                height: 'auto',
                position: 'absolute',
                top: '100px',
                left: '100px',
                opacity:'0.9',
                'border-radius':'5px',
                padding: '1em'
            }).fadeIn(136);
            if(options.displayTime == 'auto'){
                options.displayTime = parseInt(options.showMsg.length*toastBG.fontSize()/ toastBG.width() *1000);
            }
            setTimeout(function(){
                toastBG.fadeOut(212,function(){
                    $(this).remove();
                });
            },options.displayTime);
            $('body').append(toastBG);
            toastBG.center();
            $(window).scroll(function(){toastBG.center()});
            $(window).resize(function(){toastBG.center()});
        }
    });
    $.fn.extend({
        center:function(parent){
            $(this).css('position',parent==null?'absolute':'relative');
            $(this).css("top", ($(window).height()- $(this).height())/2+$(window).scrollTop());
            $(this).css("left", ($(window).width()- $(this).width())/2+$(window).scrollLeft());
        },
        fontSize:function(){ return parseInt($(this).css('font-size')); }
    })
})(jQuery);