/**
 * Created by Administrator on 2017/6/8.
 * 导入jquery1.1以上的版本
 * 导入jquery.teff.js文件
 *   使用方法：
 *      $（'文本容器控件必须制定ID不能是Class'）.dropWord({
 *      min:文字最小个数
 *      max:文字最大个数
 *      mode:效果编号 0-4
 *   })
 */
(function($){
    $.fn.extend({
        dropWord:function(args){
            //定义参数默认值
            var options = $.extend({
                min:2,
                max:5,
                mode:0
            },args);
            var contrainer = $(this);
            //获取容器的文本内容并且拆分
            var arr = $(this).mSplit(options.min,options.max);
            //根据基数和偏移量返回一个随机数
            var cRand = function(base,ofset){return parseInt(Math.random()*ofset)+base};
            //功能同上但这个随机数可能是负数
            var mRand = function(base,ofset){
                var result = parseInt(Math.random()*ofset)+base;
                return Math.random()>0.49?-result:result};
            //删除内容
            $(this).html('').css({'opacity':1});
            //普通追加
            $(arr).each(function(index,span){
            	contrainer.append(span);
                span.css({'opacity':0,'position':'relative'});
            });
            $(arr).each(function(index,span){
                switch (options.mode){
                    //打字顺序显示效果0
                    case 0:span.animate({top:0},index*66,function(){span.css('opacity',1);});break;
                    //零碎凹凸显示效果1
                    case 1:span.animate({top:0},cRand(500,2000),function(){span.css('opacity',1);});break;
                    //条纹掉落效果2
                    case 2:span.css({top: '-'+cRand(1566,56)+'px'}).animate({opacity:1,top:0},index*56); break;
                    //雨水坠落效果3
                    case 3:span.css({top:'-'+cRand(1566,56)+'px'}).animate({opacity:1,top:0},cRand(1200,1800)+index*26); break;
                    //文字飞入效果4
                    case 4:span.css({top: mRand(106,186)+'px',left:mRand(186,56)+'px'}).animate({opacity:1,top:0,left:0},cRand(1000,1500));break;
                    //默认0
                    default :span.animate({top:0},index*66,function(){span.css('opacity',1);});
                }
            });
        },
        mSplit:function(min,max){
            /*将被选择的容器内容中的文本 按照最小min个字 最大max个字进行拆分非正则拆分
             返回一个数组 数组为span元素*/
            //定义截取下标获取文本内容
            var sIndex = 0,
                eIndex = 0,
                cxt = $(this).text(),
                arr = new Array();
            //传参约束
            min = min<1?1:min;
            max = max>cxt.length?cxt.length:max<min?min:max;
            //截取
            while(true){
                //产生min-max之间的随机数字（代表本次循环截取字符的长度）
                var len = min+parseInt(Math.random()*(max-min+1));
                //设置截取的截点下标
                eIndex +=len;
                //截点下标约束
                eIndex = eIndex>cxt.length?cxt.length:eIndex;
                //截取子串
                var sub = cxt.substring(sIndex,eIndex);
                //将截取内容处理并保存
                arr.push($('<span>'+sub+'</span>'));
                //增加截取的起点下标
                sIndex += len;
                //截取完成则退出循环
                if(eIndex>=cxt.length){
                    break;
                }
            }
            return arr;
        }
    });
})(jQuery);