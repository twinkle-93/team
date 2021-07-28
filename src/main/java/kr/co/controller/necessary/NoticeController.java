package kr.co.controller.necessary;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dto.NoticeDTO;
import kr.co.dto.PageTO;
import kr.co.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	private NoticeService nService;
	
	//insert.get
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {
		
	}
	
	//insert.post
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(NoticeDTO notice) {
		nService.insert(notice);
		
		return "redirect:/notice/list";
	}
	
	//list.get
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		
		int curPage = 1;
		int amount = nService.getAmount();
		
		PageTO<NoticeDTO> to = new PageTO<NoticeDTO>(curPage);
		to.setAmount(amount);
		
		List<NoticeDTO> list = nService.list(to.getStartNum(), to.getPerPage());
		to.setList(list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/notice/list");
		
		return mav;
	}
	
	//일반 목록 페이징
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage) {
		
		PageTO<NoticeDTO> to = new PageTO<NoticeDTO>(curPage);
		
		int amount = nService.getAmount();
		to.setAmount(amount);
		
		List<NoticeDTO> list = nService.list(to.getStartNum(), to.getPerPage());
		to.setList(list);
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		mav.addObject("map", map);
		
		mav.setViewName("/notice/list");
		
		return mav;
	}
	
	//read.get
	@RequestMapping(value = "/read/{n_num}", method = RequestMethod.GET)
	public String read(@PathVariable("n_num") String n_num, Model model) {
		NoticeDTO notice = nService.read(n_num);
		model.addAttribute("notice", notice);
		
		return "/notice/read";
	}
	
	//update.get
	@RequestMapping(value = "/update/{n_num}", method = RequestMethod.GET)
	public String update(@PathVariable("n_num") String n_num, Model model) {
		 NoticeDTO notice = nService.read(n_num);
		 model.addAttribute("notice", notice);
		 return "/notice/update";
		
	}
	//update.post
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeDTO notice) {
		
		nService.update(notice);
		
		return "redirect:/notice/read/" + notice.getN_num();
	}
	
	//delete
	@RequestMapping(value = "/delete/{n_num}", method = RequestMethod.POST )
	public String delete(@PathVariable("n_num") String n_num) {
		nService.delete(n_num);
		
		return "redirect:/notice/list";
	}
	
	
}






















