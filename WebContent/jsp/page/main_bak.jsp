<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	</head>
	<body>
		<table style="width:100%;">
				<tr>
					<td style="width:200px;">
						<div class="acc-container acc-expand-panel">
							<h3 class="acc-title">常用流程</h3>
							<div class="acc-content">
								<ul id="ul_commonflow">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud帐号申请流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud正式站点申请流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议帐号申请流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 差旅费报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 加班餐费报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 招待费用报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 礼品报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 病假流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 事假流程</a></li>
								</ul>
							</div>
						</div>
						<br /><br />
						<div class="acc-container acc-collapse-panel">
							<h3 class="acc-title">常用软件</h3>
							<div class="acc-content">
								<ul id="ul_softwares">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud  IPAD-APP</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议手机应用</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Office2007</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Axure</a></li>
								</ul>
							</div>
						</div>
						<br /><br />
						<div class="acc-container acc-collapse-panel">
							<h3 class="acc-title">常用申请表</h3>
							<div class="acc-content">
								<ul id="ul_application">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud  IPAD-APP</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议手机应用</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Office2007</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Axure</a></li>
								</ul>
							</div>
						</div>
					</td>
					<td>
						<div class="outlet">
							<div class="acc-container  acc-notice-panel">
								<h3 class="acc-title">会畅公告牌</h3>
								<div class="acc-content bb0">
									<ul id="ul_bizplacard">
										
									</ul>
								</div>
							</div>
							<br /><br />
							<div class="acc-container acc-expand-panel">
								<h3 class="acc-title">部门文件夹</h3>
								<div class="acc-content">
									<div id="depart-forder">
										<ul>
											<li class="active"><a href="/subitems/31" target="departFrame">Operations</a></li>
											<li><a href="/subitems/32" target="departFrame">Marketing</a></li>
											<li><a href="/subitems/33" target="departFrame">Sales</a></li>
											<li><a href="/subitems/34" target="departFrame">Finance</a></li>
											<li><a href="/subitems/35" target="departFrame">Admin</a></li>
										</ul>
										<div class="tab-content">
											<iframe width="100%" allowtransparency='true' frameborder="0" id="departFrame" name="departFrame" scrolling="no" src="/subitems/31"></iframe>
										</div>
									</div>
									<ul id="departList">
									</ul>
								</div>
							</div>
						</div>
					</td>
					<td style="width:240px;">
						<div id="accordion" class="acc-container acc-expand-panel">
							<h3 class="acc-title">Top Sales  BJ</h3>
							<div class="acc-content">
								<ul id="ul_bjsales">
									<li>
										<img class="employ-image" src="/images/bg/img_test.png" alt="" />
										<div class="employ-info">
											<p><a class="empoy-name" href="#">武卫</a></p>
											<p><a class="empoy-enname" href="#">Barry Wu</a></p>
											<p>部门:</p>
											<p><a class="empoy-depart" href="#">Operation</a></p>
											<p>职位:</p>
											<p><a class="empoy-job" href="#">Product supervisor</a></p>
										</div>
									</li>
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud正式站点申请流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议帐号申请流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 差旅费报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 加班餐费报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 招待费用报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 礼品报销流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 病假流程</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 事假流程</a></li>
								</ul>
							</div>
						</div>
						<br />
						<div id="accordion" class="acc-container acc-collapse-panel">
							<h3 class="acc-title">Top Sales  SH</h3>
							<div class="acc-content">
								<ul id="ul_shsales">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud  IPAD-APP</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议手机应用</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Office2007</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Axure</a></li>
								</ul>
							</div>
						</div>
						<br />
						<div id="accordion" class="acc-container acc-collapse-panel">
							<h3 class="acc-title">优秀员工</h3>
							<div class="acc-content">
								<ul id="ul_excellenters">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud  IPAD-APP</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议手机应用</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Office2007</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Axure</a></li>
								</ul>
							</div>
						</div>
						<br />
						<div id="accordion" class="acc-container acc-collapse-panel">
							<h3 class="acc-title">新人Show</h3>
							<div class="acc-content">
								<ul id="ul_newers">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud  IPAD-APP</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议手机应用</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Office2007</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Axure</a></li>
								</ul>
							</div>
						</div>
						<br />
						<div id="accordion" class="acc-container acc-collapse-panel">
							<h3 class="acc-title">团队活动照</h3>
							<div class="acc-content">
								<ul id="ul_groupactives">
									<li><a href="#"><i class="icon icon-arrow"></i> ConfCloud  IPAD-APP</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> 电话会议手机应用</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Office2007</a></li>
									<li><a href="#"><i class="icon icon-arrow"></i> Axure</a></li>
								</ul>
							</div>
						</div>
					</td>
				</tr>
			</table>
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
        	loadData();
        	
        	
			$('#depart-forder a').on("click", function(event){
		    	var tab = jQuery(this),
		    	tabParent = tab.parent();
				tabParent.addClass('active').siblings().removeClass('active');
			});
			$( ".acc-expand-panel" ).accordion({
				collapsible: true
			});
			$( ".acc-collapse-panel" ).accordion({
				collapsible: true,
				active: false
			});
			app.loadNotices(function(result) {
				var noticeList = $("#noticeList");
				if (result && result.notices) {
					var datas = result.notices;
					for (var i=0; i<datas.length; i++) {
						var item = datas[i];
						var noticeLi = $("<li></li>");
						$("<a><i class='icon icon-arrow'></i> "+item.title+"</a>").appendTo(noticeLi);
						$("<span class='time'>"+item.time+"</span>").appendTo(noticeLi);
						noticeList.append(noticeLi);
					}
				}
				$( ".acc-notice-panel" ).accordion({
					collapsible: true
				});
				Toolkit.resizeIframe();
			});
		});
	});
	
	</script>
</html>
