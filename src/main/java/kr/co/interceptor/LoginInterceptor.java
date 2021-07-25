package kr.co.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.dto.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 컨트롤러 이전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// "login" 이라는 이름의 바인딩이 존재하는 지 확인
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");

		// 존재하면 삭제
		if (dto != null)
			session.invalidate();
		return true;
	}

	// 컨트롤러 이후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// 로그인 작업 확인 여부
		HttpSession session = request.getSession();
		// model.addAttribute("login", dto) 를 가져오기 위해
		// modelAndView.getModel() 를 사용한다
		Map<String, Object> map = modelAndView.getModel();

		// 확인 여부를 위해 object로 받아줘야한다
		// controller 에서 model.addAttribute("login", dto)로 날린게 있어???
		Object dto = map.get("login");

		// model.addAttribute("login", dto) 날린게 있으면 로그인 실행
		if (dto != null) {
			// 세션을 날려주고, 주소 이동
			session.setAttribute("login", dto);
			response.sendRedirect("/");
		}

		// 로그인이 안됐으면 다시 로그인 창
		else
			response.sendRedirect("/member/loginGet");
	}

}
