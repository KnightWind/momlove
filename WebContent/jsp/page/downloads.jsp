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
		<title>母爱时光</title>
		<link type="image/x-icon" rel="shortcut icon" href="/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
		<link type="text/css" rel="stylesheet" href="/css/ueditor.css" />
	</head>
	<body>
		<div class="content-wrapper">
		<table style="width:100%;">
				<tr>
					<td style="width:200px;">
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
							<c:forEach var="info" items="${pageModel.datas}" varStatus="status">
								<div class="detail-container" style="width: 750px;">
									<div class="detail-title">
										${info.title }
									</div>
									<div class="detail-content pt10" style="max-width: 700px; overflow: auto;">
										<c:if test="${not empty info.avatarUrl }">
											<div align="center">
												<!-- width="500px;" -->
												<img style="max-width: 700px;" alt="${info.title }"  src="${info.avatarUrl }">
											</div>
											<br/>
										</c:if>
										 ${info.content }
									</div>
								</div>
							</c:forEach>
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
			/**
			$( ".acc-expand-panel" ).accordion({
				collapsible: true
			});
			$( ".acc-collapse-panel" ).accordion({
				collapsible: true,
				active: false
			});*/
			
			//加载数据
        	//loadData(callBack);
		});
        
        
	});
	
     var callBack =  function (){
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
		  
		  //alert('aaa');
      }
	</script>
</html>
