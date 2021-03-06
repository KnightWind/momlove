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
		<link type="image/x-icon" rel="shortcut icon" href="/assets/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css" />
		<style type="text/css">
			.detail-content .selectTdClass {
			    background-color: #EDF5FA !important;
			}
			.detail-content table.noBorderTable td, table.noBorderTable th, table.noBorderTable caption {
			    border: 1px dashed #DDDDDD !important;
			}
			.detail-content table {
			    border-collapse: collapse;
			    display: table;
			    margin-bottom: 10px;
			}
			.detail-content td, th {
			    border: 1px solid #DDDDDD;
			    padding: 5px 10px;
			}
			.detail-content caption {
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
			.detail-content th {
			    background-color: #F7F7F7;
			    border-top: 1px solid #BBBBBB;
			}
			.detail-content table tr.firstRow th {
			    border-top-width: 2px;
			}
			.detail-content .ue-table-interlace-color-single {
			    background-color: #FCFCFC;
			}
			.detail-content .ue-table-interlace-color-double {
			    background-color: #F7FAFF;
			}
			.detail-content td p {
			    margin: 0;
			    padding: 0;
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
									<li><a href="/goto/61">加盟流程</a></li>
									<li><a href="/goto/62">加盟费用</a></li>
									<li><a href="/goto/63">常见问题</a></li>
								</ul>
							</div>
						</div>
						
					</td>
					<td>
						<div class="ml10">
							<div class="acc-container acc-container-list">
								<form id="submitfrom"  action="/goto/${moduleId}" method="post">
									<h3 class="acc-default-title">
										 <c:choose>
										 	<c:when test="${moduleId eq 61}">加盟流程</c:when>
										 	<c:when test="${moduleId eq 62}">加盟费用</c:when>
										 	<c:when test="${moduleId eq 63}">常见问题</c:when>
										 </c:choose>
									</h3>
									<div class="acc-content acc-content-list">
										 <div class="detail-container" style="width: 750px;">
											<div class="detail-title">
												${info.title }
											</div>
<%--											<div class="detail-sub-title">--%>
<%--												<span>发布日期: <fmt:formatDate value="${info.createTime}" type="date" pattern="yyyy-MM-dd"/> </span><span>访问量:${info.clickNum}次</span>--%>
<%--											</div>--%>
											<div class="detail-content pt10" style="max-width: 700px; overflow: auto;">
												<c:if test="${not empty info.avatarUrl }">
													<div align="center">
														<!-- width="500px;" -->
														<img style="max-width: 700px;" alt="${info.title }"  src="${info.avatarUrl }">
													</div>
													<br/>
												</c:if>
												 ${info.content }
												 ${info.photodesc}
											</div>
										</div>
									</div>
<%--									<div class="page-container pagebar mt10 ">--%>
<%--										<%@ include file="page.jsp"%>				 --%>
<%--									</div>--%>
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
