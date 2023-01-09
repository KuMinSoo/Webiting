package com.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginCheckInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		log.info("preHandler()");
		
		String header=req.getHeader("Ajax");

		HttpSession ses=req.getSession();
		UserVO user=(UserVO)ses.getAttribute("loginUser");
		if(user==null) {			
			if("true".equals(header)) { 
				//Ajax요청이 맞다면 400에러 발생 => error를 처리하는 콜백함수에서 받아 처리한다.
				res.sendError(400);			
			}else {
				String view="/WEB-INF/views/msg.jsp";
				
				req.setAttribute("message", "로그인해야 이용 가능합니다.");
				req.setAttribute("loc", req.getContextPath()+"/login");
				
				RequestDispatcher disp=req.getRequestDispatcher(view);
				disp.forward(req, res);
			}
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv) throws Exception{
		log.info("postHandle()");
		HandlerInterceptor.super.postHandle(req,res,handler,mv);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception ex) throws Exception{
		log.info("afterCompletion()");
	}
	
}
