package com.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminCheckInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		log.info("AdminCheck preHandle()");
		HttpSession ses=req.getSession();
		UserVO user=(UserVO)ses.getAttribute("loginUser"); //key값(loginUser) 맞춰주기
		if(user!=null) {
			if(user.getStatus()!=9) {
				req.setAttribute("message", "관리자만 이용 가능합니다.");
				req.setAttribute("loc", "/");
				RequestDispatcher disp=req.getRequestDispatcher("/WEB-INF/views/msg.jsp");
				disp.forward(req, res);
				return false; //관리자가 아닌 경우
			}else {
				return true; //관리자가 맞다면 true
			}
		}
		return false; //로그인 하지 않은 경우
	}
}
