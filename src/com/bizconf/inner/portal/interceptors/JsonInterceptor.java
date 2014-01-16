package com.bizconf.inner.portal.interceptors;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bizconf.inner.portal.bean.BizInfo;
import com.bizconf.inner.portal.constant.Constant;
import com.bizconf.inner.portal.service.InfoService;
import com.bizconf.inner.portal.util.JsonUtil;
import com.bizconf.inner.portal.util.StringUtil;
import com.libernate.liberc.ActionForward;
import com.libernate.liberc.interceptor.SysInterceptorExt;

@Service
public class JsonInterceptor implements SysInterceptorExt {
	
	@Autowired
	InfoService infoService;
	
	Log logger = LogFactory.getLog(JsonInterceptor.class);

	@Override
	public Object doAfter(HttpServletRequest request, HttpServletResponse arg1,
			Object arg2) throws IOException {
		
		try{
			String url = request.getRequestURL().toString();
			//删除和设置首页显示
			if(url.indexOf("save")>-1 || url.indexOf("setShowIndex")>-1 || url.indexOf("del")>-1){
				String moduleId = request.getParameter("moduleId");
				int mId = 0;
				if(!StringUtil.isEmpty(moduleId))mId = Integer.parseInt(moduleId);
				String jsonName = Constant.jsonModule.get(mId);
				if(!StringUtil.isEmpty(jsonName)){
					
					List<BizInfo> infos = infoService.getIndexStaticInfos(mId);
					JsonUtil.genStaticJson(jsonName, infos);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Object doBefore(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		//String url = request.getRequestURL().toString();
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute(Constant.USER) == null) {
			return new ActionForward.Forward("/unauthortoLogin.jsp");
		}else{
				long pretime = (Long)session.getAttribute("activetime");
				long currentTime = new Date().getTime();
				if((currentTime - pretime)>1800*1000l){
					return new ActionForward.Forward("/unauthortoLogin.jsp");
				}else{
					session.setAttribute("activetime",currentTime);
				}
		}
		return null;
	}

	@Override
	public int getPriority() {
		return 100;
	}

}
