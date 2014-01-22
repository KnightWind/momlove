<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/jsp/common/data.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8"/>
		<title>主页</title>
		<link type="image/x-icon" rel="shortcut icon" href="/assets/favicon.ico" />
		<link type="text/css" rel="stylesheet" href="/css/biz.base.css?var=11" />
		<link type="text/css" rel="stylesheet" href="/css/biz.style.css?var=12" />
	</head>
	<body>
		<div class="content-wrapper">
			<div id="slides" class="clearfix">
				<div class="slides_container">
					<div>
						<a href="#"><img height="200" src="/images/bg/banner-01.jpg" data-src="" alt="Third slide"/></a>
					</div>
					<div>
						<a href="#"><img height="200" src="/images/bg/a1.png" data-src="" alt="Third slide"/></a>
					</div>
					<div>
						<a href="#"><img height="200" src="/images/bg/banner-03.jpg" data-src="" alt="Third slide"/></a>
					</div>
				</div>
				<a href="javascript:;" class="prev"><img src="/images/bg/arrow_left.png" width="20" height="20" alt="Arrow Prev"/></a>
				<a href="javascript:;" class="next"><img src="/images/bg/arrow_right.png" width="20" height="20" alt="Arrow Next"/></a> 
			</div>
			<table style="width:100%;">
					<tr>
						<td style="width:200px;">
							<div class="acc-container">
								<h3 class="acc-default-title showcursor" onclick="showMore(5);">产品系列</h3>
								<div class="acc-content">
									<ul id="">
										<li><a onclick="showMore(31);" href="javascript:void(0);">>>AA系列</a></li>
										<li><a onclick="showMore(32);" href="javascript:void(0);">>>BB系列</a></li>
										<li><a onclick="showMore(33);" href="javascript:void(0);">>>CC系列</a></li>
										<li><a onclick="showMore(34);" href="javascript:void(0);">>>DD系列</a></li>
										<li><a onclick="showMore(35);" href="javascript:void(0);">>>EE系列</a></li>
									</ul>
								</div>
							</div>
							<div class="acc-container">
								<h3 class="acc-default-title showcursor" onclick="showMore(7);">联系方式</h3>
								<div class="acc-content">
<%--									<ul id="ul_application">--%>
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
<%--							<div class="acc-container">--%>
<%--								<h3 class="acc-default-title showcursor" onclick="showMore(6);">常用软件</h3>--%>
<%--								<div class="acc-content">--%>
<%--									<ul id="ul_softwares">--%>
<%--									</ul>--%>
<%--								</div>--%>
<%--							</div>--%>
						</td>
						<td>
							<div class="outlet">
								<div class="acc-container  acc-notice-panel">
									<h3 class="acc-title">公司新闻</h3>
									<div class="acc-content bb0">
<%--										<ul id="ul_bizplacard">--%>
										<ul>
											<c:forEach var="placard" items="${placards}" varStatus="status">
												 <li class='clearfix'>
													 <a class="li-smalll-width nobr" href="/view/${placard.id }" title="${placard.title}" >
															<i class="icon icon-arrow"></i>${placard.title}
													</a>
													<span class="time"><fmt:formatDate value="${placard.createTime}" type="date" pattern="yyyy-MM-dd"/></span>
												</li>
											</c:forEach>
										</ul>
										<div class="clearfix"></div>
										<div class="more-data">
											<a onclick="showMore(2);" href="javascript:void(0);">更多</a>
										</div>
									</div>
								</div>
								<div id="accordion" class="acc-container acc-expand-panel">
									<h3 class="acc-title">产品展示</h3>
									<div class="acc-content team-photos">
<%--										<ul id="ul_groupactives">--%>
										<ul>
											<c:forEach var="actvit" items="${groupactvits}" varStatus="status">
												<li>
													<div style="width: 150px; max-height: 100px; overflow: hidden; text-align:center;margin: 0 auto;" >
														<a  class="fl" href="/view/${actvit.id }"  >
															<img style="max-height: 100px;" width="150"  src="${actvit.avatarUrl }"" alt="${actvit.title }"" />
														</a>
													</div>
												</li>
											</c:forEach>
										</ul>
										<div class="clearfix"></div>
										<div class="more-data">
											<a onclick="showMore(31);" href="javascript:void(0);">更多</a>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td style="width:240px;">
							<div id="accordion" class="acc-container acc-expand-panel">
								<h3 class="acc-title">关于公司</h3>
								<div class="acc-content">
<%--									<ul id="ul_newers">--%>
									<ul>
										<li class='b-dashed clearfix'>
												<div class="employ-image" >
													<a  class="fl empoy-job" href="/view/${newer.id }" >
														<img width="68px" src="/images/bg/mom.jpg" alt="母爱时光" />
													</a>
												</div>
												<div class="employ-info">
<%--												<p><a class="empoy-job" href="/view/${newer.id }" >${newer.title}</a></p>--%>
												<p>
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
													 母爱时光婴幼儿用品有限公司是湖南省武冈市十佳优秀企业
												</p>
											</div>
										</li>
										
									<c:forEach var="newer" items="${newers}" varStatus="status">
											<li class='b-dashed clearfix'>
												<div class="employ-image" >
													<a  class="fl empoy-job" href="/view/${newer.id }" >
														<img width="68px" src="${newer.avatarUrl}" alt="${newer.title}" />
													</a>
												</div>
												<div class="employ-info">
												<p><a class="empoy-job" href="/view/${newer.id }" >${newer.title}</a></p>
												<p>
													<a class="empoy-enname" href="/view/${newer.id }" >
														<c:choose>
								                        	<c:when test="${fn:length(newer.photodesc)>90 }">
								                        			${fn:substring(newer.photodesc,0,90) }.......
								                        	</c:when>
								                        	<c:otherwise>
										                        ${newer.photodesc}
								                        	</c:otherwise>
							                        	</c:choose>
													</a>
												</p>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</table>
		</div>
		<div class="footer mt20">
		</div>
	<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.js"></script>
	<script type="text/javascript" src="/js/slides.min.jquery.js"></script>
	
	<script type="text/javascript">
	var callback = function (){
		$( ".acc-notice-panel" ).accordion({
			collapsible: true
		 });
		
		$( ".acc-expand-panel" ).accordion({
			collapsible: true,
			activate: function() {
				Toolkit.resizeIframe();
			}
		
		});

    	Toolkit.resizeIframe();
		$("li:last").removeClass("b-dashed");
	};
	 var Toolkit = this.Toolkit = {
			    resizeIframe: function() {
			        //console.log(window.name);
			        var frame = jQuery(window.parent.document).find('iframe[name=' + window.name + ']');
			        var frameBody = frame.contents().find("body");
			        var frameHeight = frameBody.outerHeight();
			        frame.height(frameHeight);
			    }
		    };
	

	jQuery(function($) {
        $(document).ready( function() {
        	//加载数据
        	//callback();
        	var b = loadData();
        	if(b){callback();}
        	$('#slides').slides({
				play: 5000,
				preload: true,
				generatePagination: false
			});
		});
	});
	</script>
	<script type="text/javascript" src="/js/biz.base.js"></script>
	</body>
</html>
