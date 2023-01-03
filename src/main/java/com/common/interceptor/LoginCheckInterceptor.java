package com.common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.user.model.UserVO;

import lombok.extern.log4j.Log4j;

/* Interceptor (servlet�� ���� �ִ� filter�� �����)
 *  - ��Ʈ�ѷ��� ����Ǳ� ���� ���� ó���� ���� ������ 
 *    ������������ ���ͼ��Ϳ��� �����Ѵ�.
 *  - ���� ���
 *  1. ���ͼ��� ����
 *     [1] HandlerInterceptor�������̽��� ��ӹ޴� ���
 *     [2] HandlerInterceptorAdapter �߻�Ŭ������ ��ӹ޴� ���
 *      
 *  2. ���ͼ��� ��� => servlet-context.xml���� ����ϰ� ���� ������ ����
 *  <!-- Interceptor���� =========================================================== -->
   <interceptors>
         <interceptor>
            <mapping path="/user/**"/>
            <mapping path="/admin/**"/>
            <beans:bean class="com.common.interceptor.LoginCheckInterceptor"/>
         </interceptor>
   </interceptors>
 * */
@Log4j
public class LoginCheckInterceptor implements HandlerInterceptor{
	//[1] Controller�� �����ϱ� ���� ȣ��Ǵ� �޼���
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		log.info("preHandler()");
		
		String header=req.getHeader("Ajax");

		HttpSession ses=req.getSession();
		UserVO user=(UserVO)ses.getAttribute("loginUser");
		if(user==null) {			
			if("true".equals(header)) { 
				res.sendError(400);			
			}else {
				String view="/WEB-INF/views/msg.jsp";
				
				req.setAttribute("message", "로그인해야 이용 가능합니다.");
				req.setAttribute("loc", "/index");
				
				RequestDispatcher disp=req.getRequestDispatcher(view);
				disp.forward(req, res);
			}
			return false;
		}
		
		return true;
	}
	
	//[2] Controller�� ������ ��, ���� �並 �����ϱ� ���� ȣ��Ǵ� �޼���
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object handler, ModelAndView mv) throws Exception{
		log.info("postHandle()");
		HandlerInterceptor.super.postHandle(req,res,handler,mv);
	}
	
	//[3] Controller�� �����ϰ� �並 ������ �Ŀ� ȣ��Ǵ� �޼���
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception ex) throws Exception{
		log.info("afterCompletion()");
	}
	
}