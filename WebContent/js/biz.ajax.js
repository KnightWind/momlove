/*=======================================*/
/*  Alan Liu                             */
/*  email:mingliu@bizconf.cn             */
/*  2013-07-23                           */
/*=======================================*/
var LOGDEBUG = false;
var EVENT_CREATE = "eventCreate";
var EVENT_UPDATE = "eventUpdate";
var EVENT_DELETE  = "eventDelete";
var EVENT_ERROR  = "eventError";
var EVENT_SEND_EMAIL  = "sendEmail";

var ACTION = {
    view: "view",
    create: "create",
    update: "update",
    del: "delete",
    join: "join"
};

/* Debug Utility */
function logDebug(message) {
    if (window.console && window.console.debug) {
        window.console.log(message);
    }
}

function getUrlParams(){
  var params = [], hash;
  var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
  for(var i = 0; i < hashes.length; i++)
  {
    hash = hashes[i].split('=');
    params.push(hash[0]);
    var value = hash[1];
    if (value && value.indexOf('#')>=0) {
        value = value.substring(0, value.indexOf('#'));
    }
    params[hash[0]] = decodeURIComponent(value);
  }
  return params;
}
function getUrlParam(name){
  return getUrlParams()[name];
}
function addUrlParam(url, paramName, paramValue, encode) {
    if (paramName && paramValue && url.indexOf(paramName+"=")<0) {
        url += url.indexOf("?")>=0?"&":"?";
        if(encode){
            url += paramName + "=" + encodeURIComponent(encodeURIComponent(paramValue));    
        } else {
            url += paramName + "=" + paramValue;
        }
    }
    return url;
}

function addT(url, time) {
    if (url && time!=-1) {
        var t = time;
        if (!t) {
            t = new Date().getTime();
        }
        url = addUrlParam(url, "t", t);
    }
    return url;
}
/* Ajax Methods */
function ajaxGet(url, data, sucessCallback, failureCallback, options) {
    ajaxLoad("get", url, data, sucessCallback, failureCallback, options);
}
function ajaxPost(url, data, sucessCallback, failureCallback, options) {
    ajaxLoad("post", url, data, sucessCallback, failureCallback, options);
}
function ajaxLoad(type, url, data, sucessCallback, failureCallback, options) {
    var postloading = null;
    var pageLoading = "true";
    if(options && options.pageLoading && options.pageLoading == "false") {
        pageLoading = "false";
    }
    var dataType = "text";
    if (options && options.dataType == "json") {
    	dataType = "json";
    }
    $.ajax({
        type: type,
        url: url,
        data: data,
        dataType: dataType,
        beforeSend: function(XMLHttpRequest) {
            if (pageLoading=="true" && options && options.message) {
                postloading = showPostLoading(options.message, options.ui);
            }
        },
        success: function(data, textStatus, XmlHttpRequest) {
            if (pageLoading=="true" && postloading) {
                hidePostLoading(postloading);
            }
            if (sucessCallback) {
                if(dataType=="text"){
                    try {
                        data = JSON.parse(data);    
                    } catch (e) {
                        
                    }
                }   
                sucessCallback(data);
            }
        },
        error: function(XmlHttpRequest, textStatus, errorThrown) {
            if (pageLoading=="true") {
                hidePostLoading(postloading);
            }
        }
    });
}

/*获取最上层document*/
function getTopDoc() {
  if (window.top!=window.self){
    return window.top.document;
  } else {
    return window.document;
  }
}
/*获取最上层窗口可见宽度和高度*/
function getTopScrSize() {
  return {
    width: getTopDoc().documentElement.clientWidth,
    height: getTopDoc().documentElement.clientHeight
  };
}
/*获取最上层文档的宽度和高度*/
function getTopDocSize() {
  return {
    width : getTopDoc().body.clientWidth,
    height: getTopDoc().body.clientHeight
  };
}
/*获取滚动条的高度*/
function getScrollTop()
{
    var scrollTop=0;
    if(getTopDoc().documentElement && getTopDoc().documentElement.scrollTop)
    {
        scrollTop=getTopDoc().documentElement.scrollTop;
    }
    else if(getTopDoc().body)
    {
        scrollTop=getTopDoc().body.scrollTop;
    }
    return scrollTop;
}
/*显示加载数据提示*/
function showPostLoading(message, ui) {
    var doc = ui.document;
    var containerId = "load-container";
    var container = doc.getElementById(containerId);
    if (!container) {
        container = doc.createElement("div");
        container.id = containerId;
        var docWdith = getTopDocSize().width;
        var docHeight = getTopDocSize().height;
        var screenHeight = getTopScrSize().height;
        var scrollTop = getScrollTop();
//        alert("docHeight="+docHeight+ " screenHeight="+screenHeight + " scrollTop="+scrollTop);
        //遮罩
        var overLay = doc.createElement("div");
        overLay.style.position = "absolute";
        overLay.style.zIndex = "2000";
        overLay.style.width =  docWdith + "px";
        overLay.style.height =  docHeight + "px";
        overLay.style.top = "0px";
        overLay.style.left = "0px";
        overLay.style.background = "#000000";
        overLay.style.filter = "alpha(opacity=50)";
        overLay.style.opacity = "0.5";
        container.appendChild(overLay);
        //内容
        var content = doc.createElement("div");
        content.style.position = "absolute";
        content.style.zIndex = "2002";
        content.style.left =  docWdith/2 + "px";
        content.style.top = scrollTop + screenHeight/2 + "px";
        var loadingDiv = doc.createElement("div");
        loadingDiv.style.width = "32px";
        loadingDiv.style.height = "32px";
        loadingDiv.style.background = "#FFFFFF";
        loadingDiv.style.cssFloat = "left";//styleFloat for ie
        var loadingImg = doc.createElement("img");
        loadingImg.src = "/assets/images/animate/loading.gif";
        var contentText = doc.createElement("div");
        contentText.id = "loadMsg";
        contentText.innerHTML = message;
        contentText.style.height = "32px";
        contentText.style.lineHeight = "32px";
        contentText.style.cssFloat = "left";//styleFloat for ie
        contentText.style.marginLeft = "15px";
        loadingDiv.appendChild(loadingImg);
        content.appendChild(loadingDiv);
        content.appendChild(contentText);
        container.appendChild(content);
        ui.document.body.appendChild(container);
    } else {
        var loadMsg = doc.getElementById("loadMsg");
        loadMsg.innerHTML = message;
    }
    container.style.display = "block";
    return container;
}
/*隐藏加载数据提示*/
function hidePostLoading(loading) {
    if (loading!=null) {
//      loading.style.display = "none";
        loading.parentNode.removeChild(loading);
    }
}
var app = {
    loadNotices: function(callback, options) {
        var url = "/resources/demo/data/company.json";
        ajaxGet(url, null,
                function(result) {
                    if(callback) {
                        callback(result);
                    }
                }, null, {"dataType": "json"}); 
    },
    loadDepartInfo: function(type, callback, options) {
        var url = "/resources/demo/data/depart.json";
        ajaxGet(url, null,
                function(result) {
                    if(callback) {
                        callback(result);
                    }
                }, null,  {"dataType": "json"});
    }
};