<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8" />
		<title>主页</title>
		<link type="image/x-icon" rel="shortcut icon" href="/assets/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
	</head>
	<body>
		<div class="content-wrapper">
		<form id="search" action="/infoSearch" method="post">
			<input type="hidden" value="${keyword }" name="keyword"/>
				<div class="search-container">
					<div class="search-condition">
						Hi, 您现在搜索关键字'${keyword }', 共找到${pageModel.rowsCount}个内容.
					</div>
					<div class="result-container" >
						<c:forEach var="info" items="${pageModel.datas}" varStatus="status">
							<div class="item">
									<div class="title">
										<a href="/view/${info.id }">${info.title }</a>
									</div>
									<div class="content">
										<c:choose>
				                        	<c:when test="${fn:length(info.content)>300 }">
				                        			${fn:substring(info.content,0,300) }.......
				                        	</c:when>
				                        	<c:otherwise>
						                        ${info.content}
				                        	</c:otherwise>
			                        	</c:choose>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="page-container pagebar mt10 ">
						<%@ include file="page.jsp"%>				 
				</div>
		</form>
		</div>
	</body>
	<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.js"></script>
	<script type="text/javascript" src="/js/biz.base.js?var=1"></script>
	<script type="text/javascript">
	jQuery(function($) {
        $(document).ready( function() {
        	Toolkit.resizeIframe();
		});
	});
	</script>
</html>