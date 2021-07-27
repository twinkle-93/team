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

import kr.co.dto.LoginVO;
import kr.co.dto.MemberDTO;
import kr.co.dto.PageTO;
import kr.co.dto.QnaDTO;
import kr.co.service.qna.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Inject
	private QnaService qService;

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(QnaDTO dto) {
		qService.insert(dto);

		return "redirect:/qna/list";
	}

	// list.GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {

		int curPage = 1;

		PageTO<QnaDTO> to = new PageTO<QnaDTO>(curPage);
		int amount = qService.getAmount();
		to.setAmount(amount);

		List<QnaDTO> list = qService.list(to.getStartNum(), to.getPerPage());
		to.setList(list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/qna/list");

		return mav;
	}

	// 일반 목록에서 페이징처리
	// list.GET.curPage
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage) {

		int amount = qService.getAmount();

		PageTO<QnaDTO> to = new PageTO<QnaDTO>(curPage);
		to.setAmount(amount);

		List<QnaDTO> list = qService.list(to.getStartNum(), to.getPerPage());

		to.setList(list);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/qna/list");

		return mav;
	}

	// 검색 목록에서 사용
	// list(search).GET.curPage
	@RequestMapping(value = "/list/{curPage}/{search_option}/{keyword}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage,
			@PathVariable("search_option") String search_option, @PathVariable("keyword") String keyword) {

		PageTO<QnaDTO> to = new PageTO<QnaDTO>(curPage);

		int amount = 0;
		if (search_option == null || keyword == null)
			amount = qService.getAmount();
		if (search_option != null || keyword != null)
			amount = qService.getAmount_search(search_option, keyword);
		to.setAmount(amount);

		List<QnaDTO> list = new ArrayList<QnaDTO>();
		if (search_option == null || keyword == null)
			list = qService.list(to.getStartNum(), to.getPerPage());
		if (search_option != null || keyword != null)
			list = qService.listAll(to.getStartNum(), to.getPerPage(), search_option, keyword);
		to.setList(list);

		int count = qService.getCount(search_option, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/qna/list");
		return mav;
	}

	// list(search).POST
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView list(@RequestParam(defaultValue = "") String search_option,
			@RequestParam(defaultValue = "") String keyword) throws Exception {

		int curPage = 1;

		PageTO<QnaDTO> to = new PageTO<QnaDTO>(curPage);

		int amount = qService.getAmount_search(search_option, keyword);
		to.setAmount(amount);

		List<QnaDTO> list = qService.listAll(to.getStartNum(), to.getPerPage(), search_option, keyword);
		to.setList(list);

		int count = qService.getCount(search_option, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/qna/list");
		return mav;
	}

	// read.GET
	@RequestMapping(value = "/read/{qna_id}/{qna_num}", method = RequestMethod.GET)
	public String read(@PathVariable("qna_id") String qna_id, @PathVariable("qna_num") int qna_num, Model model,
			HttpSession session) {

		
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
              if (login == null) {
            	  return "redirect:/member/loginGet";
              }
              
		if (!login.getM_id().equals(qna_id))
			return "redirect:/member/loginGet";
		
		QnaDTO dto = qService.read(qna_id, qna_num);
		model.addAttribute("dto", dto);
		return "/qna/read";
	}

	// update.GET
	@RequestMapping(value = "/update/{qna_id}/{qna_num}", method = RequestMethod.GET)
	public String update(@PathVariable("qna_id") String qna_id, @PathVariable("qna_num") int qna_num, Model model, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(qna_id))
			return "redirect:";

               QnaDTO dto = qService.read(qna_id, qna_num);
               model.addAttribute("dto", dto);
		return "/qna/update";

	}

	// update.POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(QnaDTO dto, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(dto.getQna_id()))
			return "redirect:/";
               System.out.println(dto.getQna_id());
		qService.update(dto);
		return "redirect:/qna/read/" + dto.getQna_id() + "/" + dto.getQna_num();
	}

	// delete.GET
	@RequestMapping(value = "/delete/{qna_id}", method = RequestMethod.GET)
	public String delete(@PathVariable("qna_id") String qna_id, HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (!login.getM_id().equals(qna_id))
			return "redirect:/";

		qService.delete(qna_id);
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
	public void login(LoginVO vo, Model model) {

		QnaDTO dto = (QnaDTO) qService.login(vo);
		if (dto == null)
			System.out.println("아이디나 비밀번호가 틀린 것");

		model.addAttribute("login", dto);
	}

	// logout.GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
