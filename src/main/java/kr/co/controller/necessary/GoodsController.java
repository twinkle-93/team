package kr.co.controller.necessary;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dto.GoodsDTO;
import kr.co.dto.PageTO;
import kr.co.service.goods.GoodsService;
import kr.co.utils.Utils;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Inject
	private GoodsService gService;

	@Inject
	private ServletContext sc;

	private String uploadPath = "resourcse" + File.separator + "img";

	// 관리자모드 (예비로 사용)
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void admin() {

	}

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(GoodsDTO goods) {

		gService.insert(goods);

		return "redirect:/goods/list/" + 1;
	}

	// list.GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Model model) {

		int curPage = 1;
		int amount = gService.getAmount();
		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);
		to.setAmount(amount);

		List<GoodsDTO> list = gService.list(to.getStartNum(), to.getPerPage());
		to.setList(list);

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		mav.addObject("map", map);

		mav.setViewName("/goods/list");

		return mav;
	}

	// 일반 목록에서 페이징처리
	// list.Get.curPage
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage) {

		// 테스트
		System.out.println("페이지 클릭시 일로 들어왔다 page1");

		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);

		// 테스트
		int amount = gService.getAmount();
		System.out.println(amount);
		to.setAmount(amount);

		List<GoodsDTO> list = gService.list(to.getStartNum(), to.getPerPage());
		to.setList(list);

		// model.addAttribute("to", to);
		// return "/goods/list";

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		mav.addObject("map", map);

		mav.setViewName("/goods/list");

		return mav;
	}

	// 검색 목록에서 사용
	// list(search).Get.curPage
	@RequestMapping(value = "/list/{curPage}/{search_option}/{keyword}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage,
			@PathVariable("search_option") String search_option, @PathVariable("keyword") String keyword) {

		// 테스트
		System.out.println("페이지 클릭시 일로 들어왔다 page2");

		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);

		int amount = 0;

		if (search_option == null || keyword == null)
			amount = gService.getAmount();

		if (search_option != null || keyword != null)
			amount = gService.getAmount_search(search_option, keyword);

		// 테스트
		System.out.println(amount);
		to.setAmount(amount);

		// getAmount/getAmount_search 에 의해 amount 값이 변경된다

		List<GoodsDTO> list = new ArrayList<GoodsDTO>();

		if (search_option == null || keyword == null)
			list = gService.list(to.getStartNum(), to.getPerPage());

		if (search_option != null || keyword != null)
			list = gService.listAll(to.getStartNum(), to.getPerPage(), search_option, keyword);

		to.setList(list);

		int count = gService.getCount(search_option, keyword);

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("count", count);
		mav.addObject("map", map);

		mav.setViewName("/goods/list");

		return mav;
	}

	// list(search).POST
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView list(
			// 입력되지 않으면, default 값으로 g_code/"" 를 받아온다
			@RequestParam(defaultValue = "g_name") String search_option,
			@RequestParam(defaultValue = "") String keyword) throws Exception {

		int curpage = 1;

		// amount를 goods 모든 개수에서 가져오는 문제점이 존재한다
		// int amount = gService.getAmount();
		int amount = gService.getAmount_search(search_option, keyword);

		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curpage);
		// System.out.println("getFinishedPageNum(to 생성하자 마자): " +
		// to.getFinishedPageNum());
		to.setAmount(amount);
		// System.out.println("getFinishedPageNum(amount 조정하자 마자 ): " +
		// to.getFinishedPageNum());

		// 반환할 값
		// search_option, keyword, count(검색결과 수), list(검색 결과물)
		List<GoodsDTO> list = gService.listAll(to.getStartNum(), to.getPerPage(), search_option, keyword);
		to.setList(list);
		int count = gService.getCount(search_option, keyword);

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		mav.addObject("map", map);

		// 검색시 페이징 처리를 위한 테스트
		// System.out.println("getList: " + to.getList());
		// System.out.println("getBeginPageNum: " + to.getBeginPageNum());

		// 검색 결과물에 따른 getFinishedPageNum 가 작동되지 않음을 확인할 수 있다
		// System.out.println("getFinishedPageNum: " + to.getFinishedPageNum());
		// System.out.println("getCurPage: " + to.getCurPage());

		mav.setViewName("/goods/list");
		return mav;
	}

	// read.GET
	@RequestMapping(value = "/read/{g_code}", method = RequestMethod.GET)
	public String read(@PathVariable("g_code") String g_code, @ModelAttribute("curPage") Integer curPage, Model model) {
		GoodsDTO dto = gService.read(g_code);
		model.addAttribute("dto", dto);
		return "/goods/read";
	}

	// update.GET
	@RequestMapping(value = "/update/{g_code}", method = RequestMethod.GET)
	public String update(@PathVariable("g_code") String g_code, @ModelAttribute("curPage") Integer curPage,
			Model model) {
		GoodsDTO dto = gService.read(g_code);
		model.addAttribute("dto", dto);
		return "/goods/update";
	}

	// update.POST
	@RequestMapping(value = "/update/{g_code}", method = RequestMethod.POST)
	public String update(@PathVariable("g_code") String g_code, GoodsDTO dto, Integer curPage) {
		// System.out.println(dto);
		gService.update(dto);
		return "redirect:/goods/read/" + dto.getG_code() + "?curPage=" + curPage;
	}

	// delete.GET
	@RequestMapping(value = "/delete/{g_code}", method = RequestMethod.POST)
	public String delete(@PathVariable("g_code") String g_code, @ModelAttribute("curPage") Integer curPage) {
		gService.delete(g_code);
		return "redirect:/goods/list/" + curPage;
	}

	// delete.ajax.POST
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public int delete(HttpServletRequest request) {
		String[] arr = request.getParameterValues("arr");

		for (int i = 0; i < arr.length; i++) {
			gService.delete(arr[i]);
		}

		if (arr.length == 0)
			return 0;

		return 1;
	}

	@ResponseBody
	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST, produces = "appliacation/json; charset=utf8")
	public List<String> uploadfile(MultipartHttpServletRequest request) throws Exception {
		String filename = null;

		String largeCategory = request.getParameter("largeCategory");
		String smallGategory = request.getParameter("smallGategory");
		String g_code = request.getParameter("g_code");

		List<MultipartFile> files = request.getFiles("file");

		List<String> filenames = new ArrayList<String>();

		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = files.get(i);
			String oriName = file.getOriginalFilename();
			String uploadPath = sc.getRealPath(this.uploadPath);
			filename = Utils.uploadFile(oriName, uploadPath, file, largeCategory, smallGategory, g_code);
			filenames.add(filename);
		}

		return filenames;

	}

	@ResponseBody
	@RequestMapping(value = "/uploadthumbnail", method = RequestMethod.POST)
	public String uploadthumbnail(MultipartHttpServletRequest request) throws Exception {
		String filename = null;
		String g_code = request.getParameter("g_code");
		MultipartFile file = request.getFile("file");

		String oriName = file.getOriginalFilename();
		String uploadPath = sc.getRealPath(this.uploadPath);
		filename = Utils.uploadThumbnail(oriName, uploadPath, file, g_code);

		return filename;
	}

	@ResponseBody
	@RequestMapping(value = "/getAttach/{g_code}", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public List<String> getAttach(@PathVariable("g_code") String g_code) {
		return gService.getAttach(g_code);
	}

}