package kr.co.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// session 로그인이 되어있으면 실행가능하게 설정

		HttpSession session = request.getSession();

		// 관리자 로그인이 존재한다면 true로 날려준다
		if (session.getAttribute("admin") != null)
			return true;
		
		if (session.getAttribute("login") == null) {
			response.sendRedirect("/member/loginGet");
			return false;
		} 
		
		else
			return true;
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}

}