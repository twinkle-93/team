package kr.co.home;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dto.GoodsDTO;
import kr.co.service.goods.GoodsService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Inject
	private GoodsService gService;

	@Inject
	private ServletContext sc;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {

		// 판매 순(수정)
		List<GoodsDTO> saleList = gService.saleList();

		// 등록 순(수정)
		List<GoodsDTO> regList = gService.regList();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("saleList", saleList.subList(0, 6));
		map.put("regList", regList.subList(0, 6));

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("/market/main");

		return mav;
	}

}
