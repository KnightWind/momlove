<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/jsp/common/data.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/jquery-1.8.3.js"></SCRIPT>
	<script type="text/javascript">
		
		function openddd(){
				alert('aa');
				url = "http://www.baidu.com";
				window.open(url,"newss","",true)
		}
		
		$(document).ready(function(){
			if(bjsales){
				for(var i=0;i<bjsales.length;i++){
					var obj = bjsales[i];
					//$("#bjsalesdiv").append(obj['title']);
					$("#bjsalesdiv").append(obj.title+"     "+obj.createTime);
					$("#bjsalesdiv").append("<br/>");
				}
				
			}
		});
	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<a id="testa" target="_blank" href="<%=path%>/login/tologin">登录后台</a>
    This is my JSP page. <br>
    
    <input id="keyword"  type="text"  /><input type="button"  onclick="openddd();"  value="搜索">
  	<div id="bjsalesdiv"></div>
  </body>
</html>
