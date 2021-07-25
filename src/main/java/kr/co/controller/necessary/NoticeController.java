package kr.co.controller.necessary;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dto.NoticeDTO;
import kr.co.service.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService nService;

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void getInsert() throws Exception {
		logger.info("get insert");

	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String postInsert(NoticeDTO dto) throws Exception {
		logger.info("post insert");

		nService.insert(dto);

		return "redirect:/";
	}

	// list.GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("get list");

		List<NoticeDTO> list = nService.list();

		model.addAttribute("list", list);
	}

	// read.GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("n_num") int n_num, Model model) throws Exception {
		logger.info("get read");
		NoticeDTO dto = nService.read(n_num);
		model.addAttribute("read", dto);

	}

	// update.GET
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getModify(@RequestParam("n_num") int n_num, Model model) throws Exception {
		logger.info("get update");

		NoticeDTO dto = nService.read(n_num);

		model.addAttribute("update", dto);

	}

	// update.POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postupdate(NoticeDTO dto) throws Exception {
		logger.info("post update");

		nService.update(dto);

		return "redirect:/notice/list";

	}

	// delete.GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("n_num") int n_num, Model model) throws Exception {
		logger.info("get delete");

		model.addAttribute("delete", n_num);

	}

	// delete.POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("n_num") int n_num) throws Exception {
		logger.info("post delete");

		nService.delete(n_num);

		return "redirect:/notice/list";
	}
}
