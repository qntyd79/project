package com.company.bbs.utill;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("login") != null) {	
			logger.info("clear login data before");
			session.removeAttribute("login");
		} 
		return true;
		
		// TODO Auto-generated method stub
        // return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)	throws Exception {

		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object memberVO = modelMap.get("memberVO");

		if (memberVO != null) {	
			logger.info("new login success");
			session.setAttribute("login", memberVO);
			response.sendRedirect("/modules/member/login.do");		
		} 
		
		// TODO Auto-generated method stub
        // super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
		// TODO Auto-generated method stub
		// super.afterCompletion(request, response, handler, ex);
	}
}
