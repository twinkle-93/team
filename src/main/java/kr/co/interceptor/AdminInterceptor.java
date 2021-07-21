package kr.co.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	// 컨트롤러 이전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		session.removeAttribute("login");
			
		if (session.getAttribute("admin") == null) {
			// servlet-context 에 설정된 컨트롤러 이전에 관리자 로그인 세션이 들어가있는 지 확인한다
			response.sendRedirect("/admin/loginGet");
			return false;
		} else
			return true;
	}

	// 컨트롤러 이후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}