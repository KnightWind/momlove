<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.selectTdClass {
		    background-color: #EDF5FA !important;
		}
		table.noBorderTable td, table.noBorderTable th, table.noBorderTable caption {
		    border: 1px dashed #DDDDDD !important;
		}
		table {
		    border-collapse: collapse;
		    display: table;
		    margin-bottom: 10px;
		}
		td, th {
		    border: 1px solid #DDDDDD;
		    padding: 5px 10px;
		}
		caption {
		    -moz-border-bottom-colors: none;
		    -moz-border-left-colors: none;
		    -moz-border-right-colors: none;
		    -moz-border-top-colors: none;
		    border-color: #DDDDDD #DDDDDD -moz-use-text-color;
		    border-image: none;
		    border-style: dashed dashed none;
		    border-width: 1px 1px 0;
		    padding: 3px;
		    text-align: center;
		}
		th {
		    background-color: #F7F7F7;
		    border-top: 1px solid #BBBBBB;
		}
		table tr.firstRow th {
		    border-top-width: 2px;
		}
		.ue-table-interlace-color-single {
		    background-color: #FCFCFC;
		}
		.ue-table-interlace-color-double {
		    background-color: #F7FAFF;
		}
		td p {
		    margin: 0;
		    padding: 0;
		}
	</style>
  </head>
  <body style="height: 720px;">
     	<div style="height: 720px;">
	     	 <div align="center">
	     	 	<h5>${info.title }</h5>
	     	 </div>
	     	 <hr/>
	     	 <div id="content">
	     	 	 ${info.content} 
	     	 	 ${info.photodesc}
	     	 </div>
     	</div>
  </body>
</html>
