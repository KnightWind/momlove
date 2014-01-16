<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息列表</title>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/reset.css?ver=${version}" />
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/rightbox.css?ver=${version}" />
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.css"/>
<%--<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/js/jquery.uniform/themes/default/css/uniform.custom.css">--%>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/style.css"/>

<script type="text/javascript" src="${baseUrlStatic}/js/jquery-1.8.3.js?ver=${version}"></script>	
<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/jquery-ui-1.9.2.custom.js"></SCRIPT>
<script type="text/javascript" src="${baseUrlStatic}/js/widgets.js"></script>
<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/util.js"></SCRIPT>
<SCRIPT type="text/javascript" src="${baseUrlStatic}/js/common.js"></SCRIPT>

<script type="text/javascript">
	function delInfo(id){
		confirmDialog("确认删除信息？", function() {
			var url = "/manage/delphoto?"
				url += "moduleId=";
				url += $("input[name=moudulId]").val();
				url += "&id=";
				url += id;
			window.location = url;
		});
	}
	
	function toEditInfo(id){
		if(!id)id =0;
		var url = "/manage/toEditPhoto?"
		url += "moduleId=";
		url += $("input[name=moudulId]").val();
		url += "&id=";
		url += id;
		window.location = url;
	}
	
	$(document).ready(function(){
		var op = "${op}"
		var status = "${status}"
		if(op == 'add'){
			if(status== "1") successDialog("添加信息成功！");
			else
				errorDialog("添加信息失败！");
		}else if(op == 'update'){
			if(status== "1") successDialog("修改信息成功！");
			else
				errorDialog("修改信息失败！");
		}else if(op == 'delete'){
			if(status== "1") successDialog("删除信息成功！");
			else
				errorDialog("删除信息失败！");
		}
	});
	
	
	
	function setShowIndex(obj,id){
		var state = $(obj).attr("showIndex");
		var setstate = 0;
		var msg = "确认";
		var showinfo = "";
		var stateinfo = "显示";
		if(state=="0"){
			msg += "设置首页显示";
			showinfo = "取消首页显示";
			setstate = 1;
		}else{
			msg += "取消首页显示";
			setstate = 0;
			showinfo = "设置首页显示";
			stateinfo = "不显示";
		}
		confirmDialog(msg,function(){
			$.ajax({
		      	type: "POST",
		      	url:"/manage/setShowIndex",
		      	dataType:"text",
		      	data:{"id":id,"showIndex":setstate,"moduleId":${moudulId}},
		      	success:function(data){
		      		data = eval("("+data+")");
		      		if(data.state=='success'){
		      			successDialog("设置成功!");
		      			$(obj).attr("showIndex",setstate);
		      			$(obj).html(showinfo);
		      			$("#showIndexInfo"+id).html(stateinfo);
		      		}else{
		      			errorDialog("设置首页显示错误！");
		      		}
		      	},
		        error:function(XMLHttpRequest, textStatus, errorThrown) {
		        	errorDialog("设置首页显示异常！"+XMLHttpRequest+"\n"+textStatus+"\n"+errorThrown);
		        }
			}); 
			
		});
	}
</script>
</head>
<body>
<form id="query" name="query" action="/manage/infolist/${moudulId}" method="post">
	<div class="main_content">
			<input type="hidden"  name="isphoto" value="true"/>
			<input type="hidden"  name="moudulId" value="${moudulId}"/>
			<input type="hidden"  name="id" value=""/>
		<div class="m_top1">
			<input name="button_01" class="button_01" onclick="toEditInfo();" type="button" value="添加照片"
				onmouseover="this.className='Btn_Hover_01'"
				onmouseout="this.className='Btn_01'" />
		</div>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" id="table_box">
			<tr class="table003" height="38">
				<td width="30%" height="38" bgcolor="d3eaef" class="STYLE10"><div
						align="center">
						<span><b>照片预览</b></span>
					</div>
				</td>
				<td width="30%" height="38" bgcolor="d3eaef" class="STYLE10"><div
						align="center">
						<span><b>描叙</b></span>
					</div>
				</td>
				<td width="10%" height="38" bgcolor="d3eaef" class="STYLE10"><div
						align="center">
						<span><b>首页显示</b></span>
					</div>
				</td>
				<td width="30%" height="38" bgcolor="d3eaef" class="STYLE10"><div
						align="center">
						<span><b>操作</b></span>
					</div>
				</td>
			</tr>
			<c:if test="${fn:length(pageModel.datas)<=0}">
				<tr class="table001" height="32"  >
			            <td height="32" colspan="11" align="center">无数据</td>
			     </tr>
			</c:if>
			<c:forEach var="info" items="${pageModel.datas}" varStatus="status">
				<tr class="table001" height="32">
					<td height="32">
					<div align="center">
							<c:choose>
								<c:when test="${info.avatarUrl !=''}">
									<img height="80px;" src="${info.avatarUrl}" alt="${info.title}" />
								</c:when>
								<c:otherwise>
									<img height="80px;" src="${baseUrlStatic}/images/ico13.gif" alt="${info.title}" />
								</c:otherwise>
							</c:choose>
							<p>${info.title}</p>
						</div>
					</td>
					
					<td height="32"><div align="center">
							<span>${info.content } ${info.photodesc}</span>
						</div>
					</td>
					<td height="32"><div align="center">
							<span id="showIndexInfo${info.id }">
							<c:choose>
								<c:when test="${info.showIndex eq 0 }">
									 不显示
								</c:when>
								<c:otherwise>
									 显示
								</c:otherwise>
							</c:choose>
							</span>
						</div>
					</td>
					<td height="32"><div align="center">
							<c:choose>
								<c:when test="${info.showIndex eq 0 }">
									<a onclick="setShowIndex(this,${info.id });" href="#" showIndex="0" class="edit">设置首页显示</a>
								</c:when>
								<c:otherwise>
									<a onclick="setShowIndex(this,${info.id });" href="#" showIndex="1" class="edit">取消首页显示</a>
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:toEditInfo('${info.id }')" class="edit">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="Javascript:delInfo('${info.id }')" class="edit">删除</a>
						</div>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td class="table_bottom" height="38" colspan="6"> 
					 <jsp:include page="/jsp/common/page_info.jsp" />
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>

