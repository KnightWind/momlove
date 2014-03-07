<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/style.css"/>
<%--<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/jquery.uniform/themes/default/css/uniform.custom.css">--%>
<%--<link rel="stylesheet" type="text/css" href="/static/js/tipsy-master/src/stylesheets/tipsy.css" />--%>
<SCRIPT type="text/javascript" src="/static/js/jquery-1.8.3.js"></SCRIPT>
<script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.config.js?VAR=15"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	
</script>
<title>编辑信息</title>
</head>
<body>
<div class="emile">
 <div class="emile_03">
 	<form id="infoFrom" action="/manage/saveBridgeNum" method="post">
     		<div class="emile_03_top" style="border: 1px solid #B5D7E6;font-size: 12px;"><span>编辑信息内容</span></div>
       		<input type="hidden" name="moduleId" value="${moduleId}" />
       		<c:choose>
       			<c:when test="${empty info}">
       				<input type="hidden" name="showIndex" value="0" />
       			</c:when>
       			<c:otherwise>
       				<input type="hidden" name="showIndex" value="${info.showIndex}" />
       			</c:otherwise>
       		</c:choose>
       		<input type="hidden" name="id" value="${info.id}" />
       		<input type="hidden"  id="uecontent" name="content" value="" />
       		<div style="margin-top: 8px;margin-bottom: 5px;height: 30px;">
       			 标题：<input name="title" id="title" value="${info.title}" style="width: 240px;" />
	        </div>
       		<div>
       			内容：
	        </div>
	        <div> 
	        	<script id="editor" type="text/plain" style="width:750px;height:500px;">${info.content}</script>
	        </div>
	        <div align="left" style="margin-top: 5px;" class="emile_03_bottom">
	       		<input name="emile_button" id="emile_button"  type="button" onclick="saveInfo();" value="保存"  style="margin-left: 420px;"/>&nbsp;
	        </div>
 	</form> 
</div>         
 <div class="emile_02" userName="t1"></div>
 <div class="emile_03" userName="t2"></div>
</div>
<script type="text/javascript" >
	$(document).ready(function(){
<%--		var content = '${info.content}';--%>
		var ue = UE.getEditor('editor');
		ue.addListener("ready", function () {
	        // editor准备好之后才可以使用
	        ue.setHeight(500);
	        //ue.setContent("<p>aaaa</p>");
		});
	});
	 
	 
	 function saveInfo(){
		 var ue = UE.getEditor('editor');
		  var con = ue.getContent();
		  $("#uecontent").val(con);
		  $("#infoFrom").submit();
		  $("#emile_button").attr("disabled","disabled");
	 }
</script>
</body>
</html>
