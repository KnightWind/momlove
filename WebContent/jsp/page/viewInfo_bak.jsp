<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>${info.title }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
	<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body style="height: 720px;">
     	<div style="height: 720px;">
     		<div style="height: 50px;"></div>
     		<c:choose>
     			<c:when test="${empty info.avatarUrl }">
     				<div align="center">
			     	 	<h5>${info.title }</h5>
			     	 </div>
			     	 <hr/>
			     	 <div id="content">
			     	 	 ${info.content}
			     	 </div>
     			</c:when>
     			<c:otherwise>
     				<div align="center">
     					<img alt="${info.title }" src="${info.avatarUrl }">
			     	 	<p>${info.title }</p>
			     	 	<p>${info.content}</p>
			     	 </div>
     			</c:otherwise>
     		</c:choose>
     	</div>
  </body>
</html>
