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
		<title>母爱时光官网，婴童产品，婴儿奶粉，童装，玩具系列</title>
		<meta http-equiv="keywords" content="母爱时光,儿童产品,婴童产品，婴童奶粉">
		<meta http-equiv="description" content="洞口县母爱时光商贸有限公司，关注婴童产品，儿童奶粉系列，儿童玩具系列，是湖南邵阳地区最大的童婴连锁品牌">
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
									<li <c:if test="${moduleId eq 2}">class="active"</c:if>><a href="/goto/2">公司新闻</a></li>
									<li <c:if test="${moduleId eq 21}">class="active"</c:if>><a href="/goto/21">行业资讯</a></li>
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
							<form id="submitfrom"  action="/goto/${moduleId}" method="post">
								<h3 class="acc-default-title">公司动态</h3>
								<div class="acc-content acc-content-list">
									<ul>
										<c:forEach var="info" items="${pageModel.datas}" varStatus="status">
											<c:choose>
												<c:when test="${fn:length(pageModel.datas) eq  (status.index+1)}">
													<li>
													<a class="li-middle-width nobr" href="/view/${info.id }">
														<i class="icon icon-arrow"></i> ${info.title }
													</a>
													<span class='time'>
																<fmt:formatDate value="${info.createTime}" type="date" pattern="yyyy-MM-dd"/>
															</span>
													</li>
												</c:when>
												<c:otherwise>
													<li class="bbds">
													<a class="li-middle-width nobr" href="/view/${info.id }">
														<i class="icon icon-arrow"></i> ${info.title }
													</a>
													<span class='time'>
																<fmt:formatDate value="${info.createTime}" type="date" pattern="yyyy-MM-dd"/>
															</span>
													</li>
												</c:otherwise>
											</c:choose>
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
	jQuery(function($) {
        $(document).ready( function() {
			//加载数据
        	loadData(loadCallBack);
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
