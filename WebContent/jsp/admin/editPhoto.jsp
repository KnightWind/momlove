<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/jsp/common/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>base info</title>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/reset.css"/>
<link rel="stylesheet" type="text/css" href="${baseUrlStatic}/css/enterprise/rightbox.css"/>
<SCRIPT type="text/javascript" src="/static/js/jquery-1.8.3.js"></SCRIPT>
<script type="text/javascript" src="/static/js/jquery-validation-1.10.0/dist/jquery.validate.js"></script>
 
<script type="text/javascript">
function uploadCallback(url){
	$("#previewLoadImg").hide();
	$("#frameImg").attr("src", "/upload/preUpload?mId=${moduleId}");
	if(url && url.length>0){
		$("#previewImg").attr("src", "/uploadphotos/" + url);
		$("#avatarUrl").val("/uploadphotos/" + url);
		//$("#fakeAvatar").val("/previwephotos/" + url);
	}
}

function submitForm(){
	//if($("#infotitle").val())
	$("#profileForm").submit();
	$("#submit_btn").attr("disabled","disabled");
}
</script>
</head>
<body>
<div class="y_emile">
<div class="y_emile_01">
   	<div class="y_emile_01_top"><span>照片信息：</span></div>
   	<form name="profileForm" id="profileForm" action="/manage/savePhoto" method="post">
		<table class="form-table" style="margin-left:60px">
		  <tr>
		    <td align="right">
		    	照片标题：
		    </td>
		    <td class="form-table-td">
		    	<input type="hidden" id="infoId" name="id" value="${info.id }"/>
		    	<c:choose>
	       			<c:when test="${empty info}">
	       				<input type="hidden" name="showIndex" value="0" />
	       			</c:when>
	       			<c:otherwise>
	       				<input type="hidden" name="showIndex" value="${info.showIndex}" />
	       			</c:otherwise>
	       		</c:choose>
		    	<input type="hidden" id="moduleId" name="moduleId" value="${moduleId}"/>
		    	<input id="infotitle" name="title" class="text-input" type="text" value="${info.title }"/>
		    </td>
		  </tr>
		 
		  <tr>
		    <td align="right">
		    	
		    </td>
		    <td class="form-table-td">
		    	<div style="height: 100px;position: relative;">
		    		<c:choose>
					   <c:when test="${!empty info.avatarUrl}">
					  	 <img id="previewImg" src="${info.avatarUrl}" style="height:48px;"  alt=""/>
					   </c:when>
					   <c:otherwise>
							<img id="previewImg" src="${baseUrlStatic}/images/ico13.gif" style="height:48px;"  alt=""/>		
					   </c:otherwise>
					</c:choose>      
					<img id="previewLoadImg" src="/static/images/loading.gif" style="display: none;">
					<input id="avatarUrl" name="avatarUrl" type="hidden" value="${info.avatarUrl}"/>
					<input id="fakeAvatar" name="fakeAvatar" type="hidden" value="${info.fakeAvatar}"/>
		    	</div>
		    </td>
		  </tr>
		   <tr>
		    <td align="right">
		    	选择照片
		    </td>
		    <td class="form-table-td">
		    	<div style="position: relative;">
		    		<iframe style="float: left;" id="frameImg" src="/upload/preUpload?mId=${moduleId}" width="230" height="25" frameborder="0" scrolling="no"></iframe>
	            	<div style="clear: both;"></div>
		    	</div>
		    </td>
		  </tr>
		  <tr>
		    <td align="right">
		    	照片描叙：
		    </td>
		    <td class="form-table-td">
		    	 <div style="position: relative;width: 690px;overflow: hidden;">
					<textarea rows="6" cols="42" name="photodesc">${info.content} ${info.photodesc}</textarea>
		    	</div>
		    </td>
		  </tr>
		  <tr>
			 <td align="right">
			 </td>
		  	<td align="center" >
		  		<input type="button" value="提交"  id="submit_btn" onclick="submitForm();"/>
		  	</td>
		  </tr>
		</table>    	
   		 
	</form>
	</div>
</div>
</body>
</html>
