package com.bizconf.inner.portal.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.bizconf.inner.portal.bean.BizInfo;
import com.bizconf.inner.portal.interceptors.JsonInterceptor;
import com.bizconf.inner.portal.service.InfoService;
import com.bizconf.inner.portal.util.StringUtil;
import com.bizconf.inner.portal.util.UploadUtil;
import com.libernate.liberc.ActionForward;
import com.libernate.liberc.annotation.AsController;
import com.libernate.liberc.annotation.CParam;
import com.libernate.liberc.annotation.Interceptors;
import com.libernate.liberc.annotation.ReqPath;
@Interceptors({JsonInterceptor.class})
@ReqPath("manage")
public class InfoManageController  extends BaseController {
	
	@Autowired
	InfoService infoService;
	
	@AsController(path = "/infolist/{moudulId:([0-9]+)}")
	public Object login(@CParam("moudulId") int moudulId,
			@CParam("pageNo") int pageNo,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setAttribute("pageModel", infoService.getInfosByMoudel(moudulId, 10, pageNo));
		request.setAttribute("moudulId",moudulId);
		return new ActionForward.Forward("/jsp/admin/info_list.jsp");
	}
	
	
	@AsController(path = "/photolist/{moudulId:([0-9]+)}")
	public Object photolist(@CParam("moudulId") int moudulId,
			@CParam("pageNo") int pageNo,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setAttribute("pageModel", infoService.getInfosByMoudel(moudulId, 10, pageNo));
		request.setAttribute("moudulId",moudulId);
		return new ActionForward.Forward("/jsp/admin/photo_list.jsp");
	}
	
	
	@AsController(path = "/toEditInfo")
	public Object toEditInfo(@CParam("moduleId") int moduleId,
			@CParam("id") long id,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			if(id>0l){
				request.setAttribute("info", infoService.getInfoById(id));
			}
			request.setAttribute("moduleId", moduleId);
			return new ActionForward.Forward("/jsp/admin/editInfo.jsp");
	}
	
	@AsController(path = "/toEditPhoto")
	public Object toPhotoInfo(@CParam("moduleId") int moduleId,
			@CParam("id") long id,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			if(id>0l){
				request.setAttribute("info", infoService.getInfoById(id));
			}
			request.setAttribute("moduleId", moduleId);
			return new ActionForward.Forward("/jsp/admin/editPhoto.jsp");
	}
	
	@AsController(path = "/saveInfo")
	public Object editInfo(BizInfo info, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			String op = "add"; 
		 	if(info.getId()>0) 
		 		op = "update";
		 	request.setAttribute("op", op);
			if(infoService.saveBizInfo(info)!=null){
		 		request.setAttribute("status", 1);
		 	}else{
		 		request.setAttribute("status", 0);
		 	}
			String forwardUrl = "/manage/infolist/"+info.getModuleId();
			
			return new ActionForward.Forward(forwardUrl);
	}
	
	
	
	@AsController(path = "/savePhoto")
	public Object savePhoto(BizInfo info, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			String op = "add"; 
		 	if(info.getId()>0){
		 		BizInfo orgInfo = infoService.getInfoById(info.getId());
		 		op = "update";
		 		if(!orgInfo.getAvatarUrl().equals(info.getAvatarUrl())){
		 			UploadUtil.cleanFile(orgInfo.getAvatarUrl());
		 		}
		 	} 
		 	request.setAttribute("op", op);
			if(infoService.saveBizInfo(info)!=null){
		 		request.setAttribute("status", 1);
		 	}else{
		 		request.setAttribute("status", 0);
		 	}
			String forwardUrl = "/manage/photolist/"+info.getModuleId();
			
			return new ActionForward.Forward(forwardUrl);
	}
	
	
	@AsController(path = "/delinfo")
	public Object delinfo(@CParam("moduleId") int moduleId,
			@CParam("id") long id,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			 
			String op = "delete"; 
		 	request.setAttribute("op", op);
		 	
		 	if(infoService.delBizInfo(id)){
		 		request.setAttribute("status", 1);
		 	}else{
		 		request.setAttribute("status", 0);
		 	}
			String forwardUrl = "/manage/infolist/"+moduleId;
			return new ActionForward.Forward(forwardUrl);
	}
	
	@AsController(path = "/delphoto")
	public Object delphoto(@CParam("moduleId") int moduleId,
			@CParam("id") long id,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			 
			String op = "delete"; 
		 	request.setAttribute("op", op);
		 	
		 	BizInfo info = infoService.getInfoById(id);
		 	if(info!=null && !StringUtil.isEmpty(info.getAvatarUrl())){
		 		UploadUtil.cleanFile(info.getAvatarUrl());
		 	}
		 	if(infoService.delBizInfo(id)){
		 		request.setAttribute("status", 1);
		 	}else{
		 		request.setAttribute("status", 0);
		 	}
		 
			String forwardUrl = "/manage/photolist/"+moduleId;
			return new ActionForward.Forward(forwardUrl);
	}
	
	@AsController(path = "/viewInfo/{id:([0-9]+)}")
	public Object viewInfo(
			@CParam("id") long id,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			request.setAttribute("info", infoService.getInfoById(id));
			return new ActionForward.Forward("/jsp/admin/viewInfo.jsp");
	}
	
	
	@AsController(path = "/setShowIndex")
	public Object setIndexShow(
			@CParam("id") long id,
			@CParam("showIndex") int showIndex,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			
			BizInfo info = infoService.getInfoById(id);
			if(info!=null){
				info.setShowIndex(showIndex);
				info.setUpdateTime(new Date());
				infoService.updateInfo(info);
				return "{'state':'success'}";
			}
			return "{'state':\"error\"}";
	}
	
//	@AsController(path = "/viewInfo/{id:([0-9]+)}")
//	public Object viewInfo(
//			@CParam("id") long id,HttpServletRequest request, HttpServletResponse response)
//			throws Exception {
//			request.setAttribute("info", infoService.getInfoById(id));
//			return new ActionForward.Forward("/jsp/admin/viewInfo.jsp");
//	}
	
	
	@AsController(path = "/toEditZsjm/{moudulId:([0-9]+)}")
	public Object toEditZsjm(@CParam("moudulId") int moduleId, HttpServletRequest request, HttpServletResponse response){
			try {
				request.setAttribute("info", infoService.getInfoByMoudel(moduleId));
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("moduleId", moduleId);
			return new ActionForward.Forward("/jsp/admin/editZsjm.jsp");
	}
	
	@AsController(path = "/saveZsjm")
	public Object saveBridgeNum(BizInfo info, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			String op = "add"; 
		 	if(info.getId()>0) 
		 		op = "update";
		 	request.setAttribute("op", op);
			if(infoService.saveBizInfo(info)!=null){
		 		request.setAttribute("status", 1);
		 	}else{
		 		request.setAttribute("status", 0);
		 	}
			String forwardUrl = "/manage/toEditZsjm";
			return new ActionForward.Forward(forwardUrl);
	}
}
