package kr.co.controller.necessary;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dto.AdminVO;
import kr.co.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private AdminService aService;

	@RequestMapping(value = "/loginGet", method = RequestMethod.GET)
	public void login() {

		// loginGet.jsp로 이동

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public ModelAndView login(AdminVO vo, HttpSession session, ModelAndView mav) {

		// 수정 완료
		
		// 1)
		// 여기서 문제점이라 하면, 회원 테이블(목록)이랑 관리자 테이블(목록)이 따로 존재한다는 점이다
		// 회원 수정과 삭제에서 session을 login을 요구한다
	
		// 3)
		// 관리자 로그인 시,
		// 회원 수정이 아이디값이 안넘어가서 불가능하다
	
		// 4)
		// 일반회원 -> 관리자 로그인 시,
		// 세션이 2개가 잡혀버린다
		
		AdminVO admin = aService.login(vo);

		if (admin != null) {
			session.setAttribute("admin", admin);
			mav.setViewName("redirect:/");
			
		} else {
			mav.setViewName("/admin/loginGet");
			mav.addObject("msg", "failure");
		}

		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

}