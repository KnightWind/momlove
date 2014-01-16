/*=======================================*/
/*  Alan Liu                             */
/*  email:mingliu@bizconf.cn             */
/*  2013-07-23                           */
/*=======================================*/
    var Toolkit = this.Toolkit = {
    resizeIframe: function() {
        var frame = jQuery(window.parent.document).find('iframe[name=' + window.name + ']');
        var frameBody = frame.contents().find(".content-wrapper");
        var frameHeight = frameBody.height();
        var winHeight = $(top.window).height()-228;
        if(frameHeight<winHeight)frameHeight = winHeight;
        frame.height(frameHeight);
    }
    };

    //IFRAME 自动展开高度
    (function() {
        if (window !== top) {
            window.onload = Toolkit.resizeIframe;

            // 防止页面加载缓慢 默认执行一次
            Toolkit.resizeIframe();
        }
    })();