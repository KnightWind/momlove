/*
 * zmlk - TestController.java
 * 2011-8-5 下午12:13:00
 */
package com.bizconf.inner.portal.action;

import java.io.File;
import java.io.FileNotFoundException;

import javax.servlet.http.HttpServletRequest;

import com.bizconf.inner.portal.util.ImageTool;
import com.bizconf.inner.portal.util.StringUtil;
import com.bizconf.inner.portal.util.UploadUtil;
import com.libernate.liberc.ActionForward;
import com.libernate.liberc.LiberCFile;
import com.libernate.liberc.annotation.AsController;
import com.libernate.liberc.annotation.CParam;
import com.libernate.liberc.annotation.ReqPath;
import com.libernate.liberc.annotation.httpmethod.Get;
import com.libernate.liberc.annotation.httpmethod.Post;
import com.libernate.liberc.exception.LiberCFileException;

/**
 * @Author Chris Gao (hongliang_gao@sina.com)
 * @version 2011-8-5 下午12:13:00
 */

@ReqPath("upload")
public class UploadController extends BaseController {
	@AsController @Get
	public Object preUpload(@CParam("mId") int mId,HttpServletRequest request) {
		request.setAttribute("mId", mId);
		//System.out.println("will upload ……");
		return new ActionForward.Forward("/jsp/admin/upload_common.jsp");
	}
	
	@AsController @Post
	public Object common(@CParam("mId") int mId,
			@CParam("commonFile") LiberCFile file,HttpServletRequest request) {
		
		String rip = request.getRemoteAddr();
		String fileName = UploadUtil.renamePhoto(file, rip);
		String error = "";
		if(file.getSize() > 500 * 1024){
			error = "alert('" + "最大上传图片 "+ 500 + "KB" + "。');window.history.back();";
		}else{
			try {
				
				file.save(UploadUtil.getStoragePath()+File.separator+ fileName
						, "jpg","JPG","GIF","gif","png","PNG");
				
				//创建一张等比缩放的图片作为首页显示图片
//				String prePath = UploadUtil.getPreViewStoragePath()+File.separator+ fileName;
//				String ext = UploadUtil.getExt(file.getOriginalFilename());
				//团队活动照
//				if(mId!=85){
//					ImageTool.getPreviewImage(file.getInputStream(), prePath, ext);
//				}else{
//					ImageTool.getPreviewImage(file.getInputStream(), prePath, 93,150);
//				}
			}
			catch (LiberCFileException e) {
				error = "alert('不支持您上传传的文件类型。');window.history.back();";
				fileName = "";
				e.printStackTrace();
			}
			catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		String ret = "<script language=\"javascript\">";
		if(StringUtil.isNotBlank(error)){
			fileName = "";
		}
		
		ret += error;
		ret += "parent.uploadCallback(\""+fileName+"\");";
		ret += "</script>";
		return ret;
	}
	
	
	@AsController @Post
	public Object ueupload(@CParam("commonFile") LiberCFile file,HttpServletRequest request) {
		
		System.out.println("find it!!!");
		return "{'url':'upload/20131218/49841387354233774.docx','fileType':'.docx','state':'SUCCESS','original':'confcloudV2.0产品需求文档(20131017).docx'}";
	}
}
