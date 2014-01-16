<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<base href="<%=basePath%>">
<META http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<TITLE>后台首页</TITLE>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/reset.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/jquery.uniform/themes/default/css/uniform.custom.css">
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/style.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/zTreeStyle/zTreeStyle.css"/>
<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/jquery-1.8.3.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/jquery.ztree.all-3.5.min.js"></SCRIPT>
<script type="text/javascript">
var zTree;
var demoIframe;

var setting = {
	view: {
		dblClickExpand: false,
		showLine: true,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		 
	}
};

var zNodes =[
	{id:1, pId:0, name:"信息模块", open:true},
	{ id:2, pId:1, name:"公司动态", url:"manage/infolist/2", target:"mainFrame"},
	{ id:3, pId:1, name:"产品列表", open:true},
	{ id:31, pId:3, name:"系列1", url:"/manage/infolist/31", target:"mainFrame"},
	{ id:32, pId:3, name:"系列2", url:"/manage/infolist/32", target:"mainFrame"},
	{ id:33, pId:3, name:"系列3", url:"/manage/infolist/33", target:"mainFrame"},
	{ id:34, pId:3, name:"系列4", url:"/manage/infolist/34", target:"mainFrame"},
	{ id:35, pId:3, name:"系列5", url:"/manage/infolist/35", target:"mainFrame"},
	{ id:5, pId:4, name:"联系我们", url:"/manage/infolist/5", target:"mainFrame"},
	{ id:85, pId:8, name:"产品展示", url:"/manage/photolist/85", target:"mainFrame"}
	//{ id:8, pId:1, name:"Nothing...", url:"", target:"_blank", click:"alert('我是不会跳转的...');"}
	 
];

$(document).ready(function(){
	var t = $("#tree");
	t = $.fn.zTree.init(t, setting, zNodes);
	demoIframe = $("#mainFrame");
	demoIframe.bind("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.selectNode(zTree.getNodeByParam("id", 115));

});

function loadReady() {
	var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
	htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
	maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
	h = demoIframe.height() >= maxH ? minH:maxH ;
	if (h < 530) h = 530;
	demoIframe.height(h);
	$(".main_left").height(h);
}

</script>
</HEAD>

<body style="min-width:1002px;">
<jsp:include page="header.jsp" />
<div class="main_left" style="height: 720px;" >
  	<ul id="tree" class="ztree" style="width:260px; overflow:auto;"></ul>
</div> 
<div class="main_right" style="margin-left: 225px;">
	<iframe frameborder="0" width="100%" height="620px;" id="mainFrame" name="mainFrame" scrolling="no" src="/login/welcome"></iframe>
</div>
 <div id="copy">
<span class="copy_text" >Copyright © 2003-2012 Shanghai Shrine Telecom Co., Ltd. 2012. All rights reserved.Version:eMeeting V5.0</span>
</div>
</body>
</HTML>


