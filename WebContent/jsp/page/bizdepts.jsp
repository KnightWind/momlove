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
		<title>产品中心</title>
		<link type="image/x-icon" rel="shortcut icon" href="/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
		<style type="text/css">
			#acc-content img {
				border: 3px solid #F2F2F2;
				max-height: 100px;
				max-width: 150px;
			}
			#acc-content p{
				text-align: center;
				width:150px;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
				course:hand;
			}
		</style>
	</head>
	<body>
		<div class="content-wrapper">
		<table style="width:100%;">
				<tr>
					<td style="width:200px;">
						<div class="acc-tabs-container">
							<div class="acc-tabs">
								<ul>
									<li <c:if test="${moduleId eq 31}">class="active"</c:if>><a href="/goto/31">>>奶粉系列</a></li>
									<li <c:if test="${moduleId eq 32}">class="active"</c:if>><a href="/goto/32">>>童装系列</a></li>
									<li <c:if test="${moduleId eq 33}">class="active"</c:if>><a href="/goto/33">>>玩具系列</a></li>
									<li <c:if test="${moduleId eq 34}">class="active"</c:if>><a href="/goto/34">>>日用品系列</a></li>
								</ul>
							</div>
						</div>
						<div class="acc-container">
							<h3  class="acc-default-title showcursor">联系方式</h3>
							<div class="acc-content">
								<ul>
										<li>地址：洞口县工业园108号</li>
										<li>手机：18873907576  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18873907676</li>
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
											<c:when test="${moduleId eq 31}">>>奶粉系列</c:when>
											<c:when test="${moduleId eq 32}">>>童装系列</c:when>
											<c:when test="${moduleId eq 33}">>>玩具系列</c:when>
											<c:when test="${moduleId eq 34}">>>日用品系列</c:when>
										</c:choose>
									</h3>
									<div class="acc-content acc-content-list" style="float:left;width:100%;">
										<ul>
											<c:forEach var="actvit" items="${pageModel.datas}" varStatus="status">
												<li style="float:left;padding: 10px 8px;width: 160px;">
													<div style="width: 150px; max-height: 100px; overflow: hidden; text-align:center;margin: 0 auto;" >
														<a  class="fl" href="/view/${actvit.id }"  >
															<img style="max-height: 100px;" width="150"  src="${actvit.avatarUrl }"" alt="${actvit.title }"" />
														</a>
													</div>
													<p>${actvit.title }</p>
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
