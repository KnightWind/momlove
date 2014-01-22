<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/jsp/common/data.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8" />
		<title>主页</title>
		<link type="image/x-icon" rel="shortcut icon" href="/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
	</head>
	<body>
		<div class="content-wrapper">
		<table style="width:100%;">
				<tr>
					<td style="width:200px;">
						<div class="acc-tabs-container">
							<div class="acc-tabs">
								<ul>
									<li <c:if test="${moduleId eq 31}">class="active"</c:if>><a href="/goto/31">产品系列1</a></li>
									<li <c:if test="${moduleId eq 32}">class="active"</c:if>><a href="/goto/32">产品系列2</a></li>
									<li <c:if test="${moduleId eq 33}">class="active"</c:if>><a href="/goto/33">产品系列3</a></li>
									<li <c:if test="${moduleId eq 34}">class="active"</c:if>><a href="/goto/34">产品系列4</a></li>
									<li <c:if test="${moduleId eq 35}">class="active"</c:if>><a href="/goto/35">产品系列5</a></li>
								</ul>
							</div>
						</div>
						<div class="acc-container">
							<h3  class="acc-default-title showcursor">联系方式</h3>
							<div class="acc-content">
								<ul>
										<li>地址：湖南省武冈市工业园</li>
										<li>电话：0739888888</li>
										<li>手机：18873907576</li>
										<li>邮箱：18873907676@163.com</li>
										<li>联系人：刘孙球</li>
										<li>&nbsp;</li>
										<li>&nbsp;</li>
										<li>&nbsp;</li>
										<li>&nbsp;</li>
								</ul>
							</div>
						</div>
					</td>
					<td>
						<div class="ml10">
							<div class="acc-container acc-container-list">
								<form id="submitfrom" action="/goto/${moduleId}" method="post">
									<h3 class="acc-default-title">
										<c:choose>
											<c:when test="${moduleId eq 31}">产品系列1</c:when>
											<c:when test="${moduleId eq 32}">产品系列2</c:when>
											<c:when test="${moduleId eq 33}">产品系列3</c:when>
											<c:when test="${moduleId eq 34}">产品系列4</c:when>
											<c:when test="${moduleId eq 35}">产品系列5</c:when>
										</c:choose>
									</h3>
									<div class="acc-content acc-content-list">
										<ul>
											<c:forEach var="actvit" items="${pageModel.datas}" varStatus="status">
												<li>
													<div style="width: 150px; max-height: 100px; overflow: hidden; text-align:center;margin: 0 auto;" >
														<a  class="fl" href="/view/${actvit.id }"  >
															<img style="max-height: 100px;" width="150"  src="${actvit.avatarUrl }"" alt="${actvit.title }"" />
														</a>
														<p>${actvit.title }</p>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="page-container pagebar mt10 ">
										<%@ include file="page.jsp"%>				 
									</div>
								</form>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="footer mt20">
		</div>
	</body>
	<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.js"></script>
	<script type="text/javascript" src="/js/biz.ajax.js"></script>
	<script type="text/javascript" src="/js/biz.base.js"></script>
	<script type="text/javascript">
	loadData();
	jQuery(function($) {
        $(document).ready( function() {
			//加载数据
        	loadCallBack();
		});
	});
	
	
	function loadCallBack(){
		$( ".acc-expand-panel" ).accordion({
			collapsible: true,
			activate: function() {
				Toolkit.resizeIframe();
			}
		});
		$( ".acc-collapse-panel" ).accordion({
			collapsible: true,
			active: false,
			activate: function() {
				Toolkit.resizeIframe();
			}
		});
	}
	</script>
</html>
