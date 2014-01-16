<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="head">
    <div class="header_left">
		<img id="logo_icon" class="logo png" src="/images/bg/mom.jpg" width="100" alt=""/>
    <span class="name">母爱时光信息管理平台</span>
    </div>
    <c:if test="${!empty user}">
    <div class="header_right">
     	<div class="header_right01">
        	<ul class="head_right">
			    <li><img class="geli" src="${baseUrlStatic}/images/geli.jpg" width="2" height="24" /></li>
			    <li><img class="go_out" src="${baseUrlStatic}/images/go_out.jpg" width="16" height="16" /></li>
			    <li><a  title="${LANG['bizconf.jsp.admin.CopyOfadminIndex.res5']}" href="javascript:logout();">退出登录</a></li>
			</ul> 
     	</div>
        <div class="header_right02">
        <div class="aname"><img src="${baseUrlStatic}/images/user.jpg" width="15" height="15" /><span></span></div>
        </div>
  </div>
    </c:if>
    
</div>   
