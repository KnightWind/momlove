<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>Mom Love</title>
		<link type="image/x-icon" rel="shortcut icon" href="/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.index.css" />
	</head>
	<body>
		<div class="top-bar">
			<div class="outer-link clearfix">
	    		<ul>
	    			<li><a href="#" >帮助</a></li>
	    			<li><a href="#">  |  </a></li>
	    			<li><a href="#" id="toggleLinks">常用链接</a></li>
	    		</ul>
	    	</div>		
		</div>
	    <div id="header">
	    	<div class="search-contaner clearfix">
	    		<div class="logo fl">
<%--	    			<img class="fl" src="/images/bg/logo.png" alt="" />--%>
	    			<img class="fl" src="/images/bg/momlove.jpg" width="123px;" alt="" />
	    			<label class="logo-caption">母爱时光官方网站</label>
	    		</div>
	    		<div class="help fr">
		    		<input id="keyword" class="search-input" type="text" placeholder="输入您要找的内容"/>
		    		<input onclick="openToSearch();" class="input-button button-search" type="button" value="搜 索" />
	    		</div>
	    	</div>
	    </div>
	    <div class="nav mb20 pb10">
	    	<div class="nav-menu">
	    		<ul>
	    			<li>
	    				<div class="split-line3-first"></div>
	    			</li>
	    			<li class="active"><a href="/goto/0" target="mainFrame">首页</a></li>
	    			<li>
	    				<div class="split-line3"></div>
	    			</li>
<%--	    			<li><a id="gopublicpad" href="/goto/2" target="mainFrame">公司动态</a></li>--%>
	    			<li><a id="gopublicpad" href="/goto/2" target="mainFrame">公司动态</a></li>
	    			<li>
	    				<div class="split-line3"></div>
	    			</li>
<%--	    			<li><a  href="/goto/35" target="mainFrame">产品中心</a></li>--%>
	    			<li><a  id="products" href="/goto/31" target="mainFrame">产品中心</a></li>
	    			<li>
	    				<div class="split-line3"></div>
	    			</li>
<%--	    			<li><a id="downloadcenter" href="/goto/5" target="mainFrame">联系我们</a></li>--%>
	    			<li><a id="downloadcenter" href="/goto/5" target="mainFrame">联系我们</a></li>
	    			<li>
	    				<div class="split-line3"></div>
	    			</li>
<%--	    			<li><a href="#" target="mainFrame">员工社区</a></li>--%>
<%--	    			<li>--%>
<%--	    				<div class="split-line3"></div>--%>
<%--	    			</li>--%>
	    		</ul>
	    	</div>
	    </div>
	    <div class="main-container">
	    	<iframe  allowtransparency='true' frameborder="0" id="mainFrame" name="mainFrame" scrolling="no" src="/goto/0"></iframe>	    
	    </div>
		<div class="scroll-top">
			<div class="scroll-back-container">
				<a href="javascript:;" id="backButton"><i class="icon icon-back mr5"></i>回顶部</a>
			</div>
<%--			<div class="scroll-share-container">--%>
<%--				<a href="javascript:;"><i class="icon icon-share mr5"></i>分享</a>--%>
<%--			</div>--%>
		</div>
		<div class="footer mt20">
			Copyright © 2003-2016 洞口县母爱时光商贸公司保留一切权利  湘ICP备 11034277号-5
		</div>
		<script type="text/javascript" src="/static/js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			jQuery(function($) {
        		$(document).ready( function() {
    			    $('#toggleLink').toggle(function() {
				    	$(".inner-link").slideDown();
				    }, function() {
				    	$(".inner-link").slideUp();
				    });
				    
    			    $('.nav-menu a').on("click", function(event){
				    	var tab = jQuery(this),
				    	tabParent = tab.parent();
						tabParent.addClass('active').siblings().removeClass('active');
					});
    			    
				    $("#backButton").click(function() {
				    	$('html, body').animate({scrollTop: '0px'}, 300);
				    });
				    
				    
				    $("#keyword").keyup(function(event){
						if(event.keyCode=='13'){
							openToSearch();
						}
					});

				    $(window).scroll(function(){
				    	fixedScrollTop();
				    });

        		});
			});
			
			function fixedScrollTop() {
				var detail = $("#mainFrame").contents().find(".detail-container");
				var scrollDiv = $(".scroll-top");
				if (detail && detail.length>0) {
					var scrollRight = ($(window).width()-960)/2-70;
					if ($(window).scrollTop()>148){
						scrollDiv.show();	
					} else {
						scrollDiv.hide();
					}
				} else {
					scrollDiv.hide();
				}
			}
			
			function openToSearch(){
				var keyword = $(".search-input").val();
				if(keyword){
					var url = "/infoSearch";
					url += "?keyword=";
					url += encodeURIComponent(encodeURIComponent(keyword));
					//window.open(url,"newss","",true)
					$("#mainFrame").attr("src",url);
				}
			}
			
			function openModule(mId){
				if(mId==2){
					$("#gopublicpad").trigger("click");
					$("#mainFrame").attr("src",$("#gopublicpad").attr("href"));
				}else if(mId==5 || mId==6 || mId==7){
					var url = "/goto/"+mId;
					$("#downloadcenter").trigger("click");
					$("#mainFrame").attr("src",url);
				}else if(mId){
					var url = "/goto/"+mId;
					$("#products").trigger("click");
					$("#mainFrame").attr("src",url);
				}
			}
		</script>
	</body>
</html>
