<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>主页</title>
		<link type="image/x-icon" rel="shortcut icon" href="/assets/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
	</head>
	<body>
		<div class="acc-content">
			<ul>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud帐号申请流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud正式站点申请流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 电话会议帐号申请流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 差旅费报销流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 加班餐费报销流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 招待费用报销流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 礼品报销流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 病假流程</a></li>--%>
<%--				<li><a href="#"><i class="icon icon-arrow"></i> 事假流程</a></li>--%>
				<c:forEach var="info" items="${items}" varStatus="status">
					<li><a href="/view/${info.id }" target="_blank"><i class="icon icon-arrow"></i> ${info.title }</a></li>
				</c:forEach>
			</ul>
		</div>
	</body>
	<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.js"></script>
	<script type="text/javascript" src="/js/biz.ajax.js"></script>
	<script type="text/javascript" src="/js/biz.base.js"></script>
	<script type="text/javascript">
	jQuery(function($) {
        $(document).ready( function() {
				
		});
	});
	</script>
</html>
