package kr.co.controller.necessary;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.dto.PageTO;
import kr.co.dto.ReviewDTO;
import kr.co.service.review.ReviewService;

@RestController
@RequestMapping("/reviews")
public class ReviewController {

	@Inject
	private ReviewService rService;

	// 등록
	@RequestMapping(value = "/review", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public void insert(@RequestBody Map<String, Object> map) {

		// 테스트
		System.out.println("/reviews/review map: " + map);

		String r_code = map.get("r_code").toString();
		String r_content = map.get("r_content").toString();
		String r_id = map.get("r_id").toString();
		int r_star = Integer.parseInt(map.get("r_star").toString());
		String r_title = map.get("r_title").toString();

		ReviewDTO dto = new ReviewDTO(0, r_id, r_code, r_star, null, r_content, null, null, r_title);

		rService.insert(dto);
	}

	// 첫번째
	@RequestMapping(value = "/listByRegDate/{r_code}/{curPage}", method = RequestMethod.GET)
	public PageTO<ReviewDTO> listByRegDate(@PathVariable("r_code") String r_code, @PathVariable("curPage") Integer curPage) {
		
		int amount = rService.getAmount(r_code);
		PageTO<ReviewDTO> to = new PageTO<ReviewDTO>(curPage);
		to.setAmount(amount);
		to.setPerPage(5);
		
		List<ReviewDTO> list = rService.listByRegDate(r_code,to.getStartNum(),to.getPerPage());
		to.setList(list);
		
		return to;
	}

	// 두번째
	@RequestMapping(value = "/listByHighStar/{r_code}/{curPage}", method = RequestMethod.GET)
	public PageTO<ReviewDTO> listByHighStar(@PathVariable("r_code") String r_code, @PathVariable("curPage") Integer curPage) {
		
		int amount = rService.getAmount(r_code);
		PageTO<ReviewDTO> to = new PageTO<ReviewDTO>(curPage);
		to.setAmount(amount);
		to.setPerPage(5);
		
		List<ReviewDTO> list = rService.listByHighStar(r_code,to.getStartNum(),to.getPerPage());
		to.setList(list);
		
		return to;
	}

	// 세번째
	@RequestMapping(value = "/listByLowStar/{r_code}/{curPage}", method = RequestMethod.GET)
	public PageTO<ReviewDTO> listByLowStar(@PathVariable("r_code") String r_code, @PathVariable("curPage") Integer curPage) {
		
		int amount = rService.getAmount(r_code);
		PageTO<ReviewDTO> to = new PageTO<ReviewDTO>(curPage);
		to.setAmount(amount);
		to.setPerPage(5);
		
		List<ReviewDTO> list = rService.listByLowStar(r_code,to.getStartNum(),to.getPerPage());
		to.setList(list);
		
		return to;
	}

	// 네번째
	@RequestMapping(value = "/listById/{r_code}/{r_id}", method = RequestMethod.GET)
	public List<ReviewDTO> listById(@PathVariable("r_code") String r_code, @PathVariable("r_id") String r_id) {
		return rService.listById(r_code, r_id);
	}

	// 수정
	@RequestMapping(value = "/review", method = RequestMethod.PUT, produces = "application/text;charset=utf8")
	public void update(@RequestBody Map<String, Object> map) {

		// 테스트
		System.out.println("update: " + map);

		String r_code = map.get("r_code").toString();
		String r_content = map.get("r_content").toString();
		int r_star = Integer.parseInt(map.get("r_star").toString());
		String r_title = map.get("r_title").toString();
		int r_num = Integer.parseInt(map.get("r_num").toString());

		ReviewDTO dto = new ReviewDTO(r_num, null, r_code, r_star, null, r_content, null, null, r_title);

		rService.update(dto);
	}
	// 삭제
	@RequestMapping(value = "/review", method = RequestMethod.DELETE)
	public void delete(@RequestBody Map<String, Object> map) {
		int r_num = Integer.parseInt(map.get("r_num").toString());
		String r_code = map.get("r_code").toString();
		rService.delete(r_num, r_code);
	}
	
	// 리뷰 총 개수
	@RequestMapping(value = "/getAmount/{r_code}", method = RequestMethod.GET)
	public int getAmount(@PathVariable("r_code") String r_code) {
		return rService.getAmount(r_code);
	}

}