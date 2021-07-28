package kr.co.controller.necessary;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

	@Resource
	private String uploadPath;

	// 관리자 모드 창
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
	public String update(@PathVariable("g_code") String g_code, GoodsDTO goods, Integer curPage) {

		goods.setG_code(g_code);
		gService.update(goods);
		return "redirect:/goods/read/" + goods.getG_code() + "?curPage=" + curPage;
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

	// 210719 파일업로드 구현

	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public String uploadAjax(MultipartHttpServletRequest request) throws Exception {

		String uploadPath = sc.getRealPath(this.uploadPath);

		MultipartFile fileForm = request.getFile("file");

		return Utils.uploadFile(fileForm, uploadPath);
	}

	@ResponseBody
	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	// ResponseEntity<byte[]>
	// file은 byte[] 와 헤더로 저장되어 있다
	// 그걸 표현하기 위한 수단
	public ResponseEntity<byte[]> displayFile(String filename) throws Exception {

		String uploadPath = sc.getRealPath(this.uploadPath);

		// 테스트
		System.out.println("uploadPath: " + uploadPath);

		InputStream in = new FileInputStream(uploadPath + filename);

		ResponseEntity<byte[]> entity = null;

		try {

			String extendName = Utils.getExtendName(filename);
			HttpHeaders headers = new HttpHeaders();
			MediaType mType = Utils.getMediaType(extendName);

			if (mType != null)
				headers.setContentType(mType);
			else {
				filename = filename.substring(filename.indexOf("_") + 1);
				headers.setContentType(org.springframework.http.MediaType.APPLICATION_OCTET_STREAM);
				// 문자열 안에 ""를 넣기 위해 \를 사용한다
				headers.add("Content-Disposition",
						"attachment;filename=\"" + new String(filename.getBytes("UTF-8"), "ISO-8859-1"));
			}

			// 전송 성공 여부 파악
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			// 전송 실패 여부 파악
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}

		finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}

		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST, produces = "text/plain;charset=utf8")
	public String deleteFile(String filename) throws Exception {
		// throws Exception : 뒤로가기 버튼 시, null에 대한 예외처리

		// attach에 저장된 filename 삭제
		gService.deleteFilename(filename);

		String uploadPath = sc.getRealPath(this.uploadPath);

		// 테스트
		// System.out.println("삭제할 파일: " + filename);

		// '/'를 File.seperatorChar로 대체하여 항상 모든 OS 에서 안전하도록 설정한다
		filename.replace('/', File.separatorChar);

		// 테스트
		// System.out.println("삭제할 파일: " + filename);

		String extendName = Utils.getExtendName(filename);

		if (Utils.getMediaType(extendName) != null) {
			File file = new File(uploadPath, Utils.getSystemFileName(filename));
			file.delete();
		}

		File file = new File(uploadPath, filename);
		file.delete();

		return filename;
	}

	@ResponseBody
	@RequestMapping(value = "/getAttach/{g_code}", method = RequestMethod.GET)
	public List<String> getAttach(@PathVariable("g_code") String g_code) {

		return gService.getAttach(g_code);
	}

	// list.large category
	@RequestMapping(value = "/list/categoryl/{g_category_large}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("g_category_large") String g_category_large) {

		// 테스트
		// System.out.println("라지카테고리 goodsctrl");

		int curPage = 1;
		int amount = gService.getAmount();
		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);
		to.setAmount(amount);

		List<GoodsDTO> list = gService.list_category_large(to.getStartNum(), to.getPerPage(), g_category_large);
		to.setList(list);

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		mav.addObject("map", map);

		mav.setViewName("/goods/goods_list_large");
		return mav;
	}

	// list.small.category
	@RequestMapping(value = "/list/categorys/{g_category_small}", method = RequestMethod.GET)
	public ModelAndView list1(@PathVariable("g_category_small") String g_category_small) {
		System.out.println("스몰카테고리 goodsctrl");

		int curPage = 1;
		int amount = gService.getAmount();
		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);
		to.setAmount(amount);

		List<GoodsDTO> list = gService.list_category_small(to.getStartNum(), to.getPerPage(), g_category_small);
		to.setList(list);

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("to", to);
		mav.addObject("map", map);

		mav.setViewName("/goods/goods_list_large");
		return mav;
	}

}