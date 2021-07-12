package kr.co.controller.necessary;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	private ServletContext sc;
	
	private String uploadPath = "resources"+File.separator+"img";

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(GoodsDTO goods) {

		gService.insert(goods);
//		return "redirect:/goods/list/" + 1;
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

	// �씪諛� 紐⑸줉�뿉�꽌 �궗�슜
	// list.Get.curPage
	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage) {
		
		// �뀒�뒪�듃
		System.out.println("�럹�씠吏� �겢由��떆 �씪濡� �뱾�뼱�솕�떎 page1");
		
		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);
		
		int amount = gService.getAmount();
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
	
	
	// 寃��깋 紐⑸줉�뿉�꽌 �궗�슜
	// list(search).Get.curPage
	@RequestMapping(value = "/list/{curPage}/{search_option}/{keyword}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("curPage") Integer curPage, 
			@PathVariable("search_option") String search_option,
			@PathVariable("keyword") String keyword) {

		// �뀒�뒪�듃
		System.out.println("�럹�씠吏� �겢由��떆 �씪濡� �뱾�뼱�솕�떎 page2");
		
		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curPage);
		
		int amount = gService.getAmount();
		
		if(search_option!=null || keyword!=null)
			amount = gService.getAmount_search(search_option, keyword);
		
		// �뀒�뒪�듃
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

	// list(search).POST
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView list(
			// �엯�젰�릺吏� �븡�쑝硫�, default 媛믪쑝濡� g_code/"" 瑜� 諛쏆븘�삩�떎
			@RequestParam(defaultValue = "g_name") String search_option,
			@RequestParam(defaultValue = "") String keyword) throws Exception {

		int curpage = 1;
		
		// amount瑜� goods 紐⑤뱺 媛쒖닔�뿉�꽌 媛��졇�삤�뒗 臾몄젣�젏�씠 議댁옱�븳�떎
		// int amount = gService.getAmount();
		int amount = gService.getAmount_search(search_option, keyword);

		PageTO<GoodsDTO> to = new PageTO<GoodsDTO>(curpage);
		// System.out.println("getFinishedPageNum(to �깮�꽦�븯�옄 留덉옄): " + to.getFinishedPageNum());
		to.setAmount(amount);
		// System.out.println("getFinishedPageNum(amount 議곗젙�븯�옄 留덉옄 ): " + to.getFinishedPageNum());

		// 諛섑솚�븷 媛�
		// search_option, keyword, count(寃��깋寃곌낵 �닔), list(寃��깋 寃곌낵臾�)
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
		
		// 寃��깋�떆 �럹�씠吏� 泥섎━瑜� �쐞�븳 �뀒�뒪�듃
		// System.out.println("getList: " + to.getList());
		// System.out.println("getBeginPageNum: " + to.getBeginPageNum());
		
		// 寃��깋 寃곌낵臾쇱뿉 �뵲瑜� getFinishedPageNum 媛� �옉�룞�릺吏� �븡�쓬�쓣 �솗�씤�븷 �닔 �엳�떎
		// System.out.println("getFinishedPageNum: " + to.getFinishedPageNum());
		// System.out.println("getCurPage: " + to.getCurPage());
		
		mav.setViewName("/goods/list");
		return mav;
	}
	

	// read.GET
	@RequestMapping(value = "/read/{g_code}", method = RequestMethod.GET, produces = "text/plain;charset=utf8")
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
	@RequestMapping(value = "/update/{g_code}", method = RequestMethod.POST )
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
	
	//관리자모드 (예비로 사용)
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
	public void admin() {
    	
    }
    
    @ResponseBody
	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST, produces="application/json; charset=utf8" )
	public List<String> uploadfile(MultipartHttpServletRequest request) throws Exception {
		String filename = null;
		
		String largeCategory = request.getParameter("largeCategory");
		String smallCategory = request.getParameter("smallCategory");
		String gCode = request.getParameter("gCode");		
		 
		List<MultipartFile> files = request.getFiles("file");
		
		List<String> filenames = new ArrayList<String>();
		
		for(int i = 0; i<files.size(); i++) {
		MultipartFile file = files.get(i);
		String oriName = file.getOriginalFilename();
		String uploadPath = sc.getRealPath(this.uploadPath);
		filename = Utils.uploadFile(oriName, uploadPath, file, largeCategory, smallCategory, gCode);
		filenames.add(filename);
		}
		
	return filenames;
		
	}
    
    @ResponseBody
	@RequestMapping(value = "/uploadthumbnail", method = RequestMethod.POST )
	public String uploadthumbnail(MultipartHttpServletRequest request) throws Exception {
		String filename = null;
		String gCode = request.getParameter("gCode");		
		MultipartFile file = request.getFile("file");
		System.out.println(file);
		String oriName = file.getOriginalFilename();
		String uploadPath = sc.getRealPath(this.uploadPath);
		filename = Utils.uploadThumbnail(oriName, uploadPath, file, gCode);

	return filename;
		
	}
    
    @ResponseBody
	@RequestMapping(value = "/getAttach/{gCode}", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	public List<String> getAttach(@PathVariable("gCode") String gCode){
		return gService.getAttach(gCode);
	}
    
    
	   
	   

}
