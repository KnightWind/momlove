<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/reset.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.css"/>
<%--<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/tipsy-master/src/stylesheets/tipsy.css" />--%>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/login.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/style.css"/>
<style type="text/css">
*html input {
	border: expression((this.type=="text" || this.type=="password")?"0px":"");
	padding: 0px;
}
</style>
<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/jquery-1.8.3.js"></SCRIPT>
<script type="text/javascript">
	var errorinfo = '${errorinfo}';
	if(errorinfo){
		alert("账号或密码错误！");
	}
</script>
<title>母爱时光</title>
</head>

<body>
<form name="sysLoginForm" id="sysLoginForm" action="/login/checklogin" method="post">
	<div class="login_main" align="center">
    	<div class="main_top">
        <span class="logo-label" style="width: 400px;text-align: center;overflow: hidden;white-space:nowrap; ">母爱时光信息管理平台</span>
        </div>        
    	<div class="main_bottom">
       	    <div class="m_left">
	          		<img class="ico02" src="${baseUrlStatic}/images/logo.png" height="48" width="100"/>
       	    </div>
        	<div class="m_right">
            	<div class="m_right01"><span>登录名</span><input name="username" id="loginName" type="text"/></div>
                <div class="m_right02"><span>&nbsp;&nbsp;密码</span><input name="password" id="loginPass" type="password"/></div>
             <div class="m_right04">
             	<input type="submit" class="denglu" name="loginBtn" value="登录"/>
             </div> 
             </div>
 	    </div>
       </div>
</form>
</body>
</html>
