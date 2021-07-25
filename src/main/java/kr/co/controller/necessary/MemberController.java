package kr.co.controller.necessary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dto.LoginVO;
import kr.co.dto.MemberDTO;
import kr.co.dto.PageTO;
import kr.co.service.member.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService mService;

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberDTO dto) {
		mService.insert(dto);

		return "redirect:/member/loginGet";

	}

	// 210715 회원관리 페이징처리
	// list.GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		int curPage = 1;

		PageTO<MemberDTO> to = new PageTO<MemberDTO>(curPage);
		int amount = mService.getAmount();
		to.setAmount(amount);

		List<MemberDTO> list = mService.list(to.getStartNum(), to.getPerPage());
		to.setList(list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/member/list");

		return mav;
	}

	// 일반 목록에서 페이징처리
	// list.GET.curPage
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage) {

		int amount = mService.getAmount();

		PageTO<MemberDTO> to = new PageTO<MemberDTO>(curPage);
		to.setAmount(amount);

		List<MemberDTO> list = mService.list(to.getStartNum(), to.getPerPage());

		to.setList(list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/member/list");

		return mav;
	}

	// 검색 목록에서 사용
	// list(search).GET.curPage
	@RequestMapping(value = "/list/{curPage}/{search_option}/{keyword}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage,
			@PathVariable("search_option") String search_option, @PathVariable("keyword") String keyword) {

		PageTO<MemberDTO> to = new PageTO<MemberDTO>(curPage);

		int amount = 0;
		if (search_option == null || keyword == null)
			amount = mService.getAmount();
		if (search_option != null || keyword != null)
			amount = mService.getAmount_search(search_option, keyword);
		to.setAmount(amount);

		List<MemberDTO> list = new ArrayList<MemberDTO>();
		if (search_option == null || keyword == null)
			list = mService.list(to.getStartNum(), to.getPerPage());
		if (search_option != null || keyword != null)
			list = mService.listAll(to.getStartNum(), to.getPerPage(), search_option, keyword);
		to.setList(list);

		int count = mService.getCount(search_option, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/member/list");
		return mav;
	}

	// list(search).POST
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView list(@RequestParam(defaultValue = "m_name") String search_option,
			@RequestParam(defaultValue = "") String keyword) throws Exception {

		int curPage = 1;

		PageTO<MemberDTO> to = new PageTO<MemberDTO>(curPage);

		int amount = mService.getAmount_search(search_option, keyword);
		to.setAmount(amount);

		List<MemberDTO> list = mService.listAll(to.getStartNum(), to.getPerPage(), search_option, keyword);
		to.setList(list);

		int count = mService.getCount(search_option, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/member/list");
		return mav;
	}

	// read.GET
	@RequestMapping(value = "/read/{m_id}", method = RequestMethod.GET)
	public String read(@PathVariable("m_id") String m_id, Model model, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(m_id))
			return "redirect:/";

		MemberDTO dto = mService.read(m_id);
		model.addAttribute("dto", dto);
		return "/member/read";
	}

	// update.GET
	@RequestMapping(value = "/update/{m_id}", method = RequestMethod.GET)
	public String update(@PathVariable("m_id") String m_id, Model model, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(m_id))
			return "redirect:/";

		MemberDTO dto = mService.read(m_id);
		model.addAttribute("dto", dto);
		return "/member/update";

	}

	// update.POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberDTO dto, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(dto.getM_id()))
			return "redirect:/";

		mService.update(dto);
		return "redirect:/member/read/" + dto.getM_id();
	}

	// delete.GET
	@RequestMapping(value = "/delete/{m_id}", method = RequestMethod.GET)
	public String delete(@PathVariable("m_id") String m_id, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(m_id))
			return "redirect:/";

		mService.delete(m_id);
		session.invalidate();

		return "redirect:/";
	}

	// loginGET.GET
	@RequestMapping(value = "/loginGet", method = RequestMethod.GET)
	public void login() {

		// loginGet.jsp로 이동

	}

	// 컨트롤러 사용 이전에 인터셉터가 먼저 실행된다
	// loginPOST.POST
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void login(LoginVO vo, Model model, RedirectAttributes rttr) {

		MemberDTO dto = (MemberDTO) mService.login(vo);
		
		// 로그인 관련 (로그인 정보가 틀렸을때)
		// rttr.addFlashAttribute("msg", false);
		
		model.addAttribute("login", dto);
	}

	// logout.GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}

}
