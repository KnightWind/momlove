package com.bizconf.inner.portal.action;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.bizconf.inner.portal.bean.BizInfo;
import com.bizconf.inner.portal.bean.PageBean;
import com.bizconf.inner.portal.service.InfoService;
import com.libernate.liberc.ActionForward;
import com.libernate.liberc.LiberInvocation;
import com.libernate.liberc.annotation.AsController;
import com.libernate.liberc.annotation.CParam;
import com.libernate.liberc.annotation.ReqPath;

@ReqPath("/")
public class IndexController {
	
	@Autowired
	InfoService infoService;
	
	public Object doRequest(LiberInvocation inv)throws Exception{
		 //System.out.println("index  getted!!");
		
		return new ActionForward.Forward("/index.jsp");
	}
	
	
	@AsController(path = "/goto/{moduleId:([0-9]+)}")
	public Object gotoMoudul(@CParam("moduleId") int moduleId,
			@CParam("pageNo") int pageNo,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setAttribute("moduleId", moduleId);
		String forward = "/jsp/page/main.jsp";
		if(moduleId==0){
			//北京销售
			request.setAttribute("bjsales", infoService.getIndexStaticInfos(81));
			//上海销售
			request.setAttribute("shsales", infoService.getIndexStaticInfos(82));
			//新人秀
			request.setAttribute("newers", infoService.getIndexStaticInfos(84));
			//团队照片
			request.setAttribute("groupactvits", infoService.getIndexStaticInfos(85));
			//优秀员工
			request.setAttribute("excellenters", infoService.getIndexStaticInfos(83));
			//公告
			request.setAttribute("placards", infoService.getPlacardStaticInfos());
		}
		else if(moduleId==2 || moduleId==21){
			//PageBean<BizInfo> infos = infoService.getInfosByMoudel(moduleId, 10, 1);
			request.setAttribute("pageModel", infoService.getPlacardStaticInfos(10, pageNo));
			forward = "/jsp/page/bizplacard.jsp";
			
		}else if(moduleId>30){
			
			request.setAttribute("pageModel", infoService.getInfosByMoudel(moduleId, 10, pageNo));
			forward = "/jsp/page/bizdepts.jsp";
		}else if(moduleId>4 && moduleId<8){
			request.setAttribute("pageModel", infoService.getInfosByMoudel(moduleId, 10, pageNo));
			forward = "/jsp/page/downloads.jsp";
		}
		return new ActionForward.Forward(forward);
	}
	
	
	@AsController(path = "/subitems/{moduleId:([0-9]+)}")
	public Object subitems(@CParam("moduleId") int moduleId,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		List<BizInfo> infos = infoService.getLimitInfosByMoudelAndTime(moduleId, 10);
		request.setAttribute("items", infos);
		return new ActionForward.Forward("/jsp/page/items.jsp");
	}
	
	@AsController(path = "/view/{id:([0-9]+)}")
	public Object view(@CParam("id") long id,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		
		infoService.updateClickNum(id);
		request.setAttribute("info", infoService.getInfoById(id));
		return new ActionForward.Forward("/jsp/page/viewInfo.jsp");
	}
	
	//信息查找
	@AsController(path = "/infoSearch")
	public Object infoSearch(@CParam("keyword") String keyword,
			@CParam("pageNo") int pageNo,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if(keyword!=null){
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		PageBean<BizInfo> page = infoService.getInfosByKeyword(keyword, 10, pageNo);
		dealContent(page.getDatas());
		request.setAttribute("pageModel", page);
		request.setAttribute("keyword", keyword);
		return new ActionForward.Forward("/jsp/page/search.jsp");
	}
	
	
	private void dealContent(List<BizInfo> infos){
		if(infos!=null && !infos.isEmpty()){
			for(BizInfo info:infos){
				String content = info.getContent();
				content = content.replaceAll("</?[^>]+>", "");
				content = content.replaceAll("\\s*|\t|\r|\n", "");
				info.setContent(content);
				//System.out.println(content);
			}
		}
	}
}
