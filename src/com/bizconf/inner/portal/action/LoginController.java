package com.bizconf.inner.portal.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bizconf.inner.portal.constant.Constant;
import com.libernate.liberc.ActionForward;
import com.libernate.liberc.annotation.AsController;
import com.libernate.liberc.annotation.ReqPath;

@ReqPath("login")
public class LoginController  extends BaseController {
	
	@AsController(path = "/tologin")
	public Object login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//System.out.println("come to this!!");
		return new ActionForward.Forward("/jsp/admin/login.jsp");
	}
	
	
	@AsController(path = "/checklogin")
	public Object checklogin(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		if("bizconf".equals(name) && "admin".equals(password)){
			
			HttpSession session = request.getSession(false);
			Map<String, String> userMap = new HashMap<String, String>(2);
			userMap.put("username", name);
			userMap.put("password", password);
			long currentTime = new Date().getTime();
			session.setAttribute(Constant.USER, userMap);
			session.setAttribute("activetime", currentTime);
			
			return new ActionForward.Forward("/jsp/admin/index.jsp");
		}else {
			request.setAttribute("errorinfo", 1);
			return new ActionForward.Forward("/jsp/admin/login.jsp");
		}
	}
	
	
	@AsController(path = "/welcome")
	public Object welcome(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
			return new ActionForward.Forward("/jsp/admin/welcome.jsp");
	}
	
	
	@AsController(path = "/loginOut")
	public Object loginOut(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			request.getSession(false).invalidate();
			return new ActionForward.Forward("/unauthortoLogin.jsp");
	}
}
