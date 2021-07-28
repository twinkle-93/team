package kr.co.controller.necessary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dto.CartVO;
import kr.co.dto.MemberDTO;
import kr.co.service.cart.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Inject
	private CartService cService;

	// insert.GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insert() {

	}

	// :::::::::::::::완료:::::::::::::::
	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute CartVO vo, HttpSession session) {

		// 테스트
		System.out.println("read에서 전달받은 vo: " + vo);

		System.out.println("상품 코드: " + vo.getC_g_code());
		System.out.println("장바구니에 들어갈 수량: " + vo.getC_amount());

		// 로그인 세션이 있다면, c_m_id의 아이디 값을 저장해준다
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		vo.setC_m_id(dto.getM_id());

		if (session.getAttribute("login") == null)
			System.out.println("로그인이 필요합니다");

		// 장바구니에 기존 상품이 있는 지 검사
		// 상품코드와 멤버 아이디에 해당하는 상품의 갯수를 파악해서 int 변수에 넣어준다
		int goods_count = cService.countCart(vo.getC_g_code(), vo.getC_m_id());
		System.out.println("장바구니에 동일한 상품의 갯수: " + goods_count);

		// 상품이 0개라면 없으니 insert를 사용하여 등록!
		if (goods_count == 0)
			cService.insert(vo);

		// 상품이 있다면 update를 사용하여 장바구니 수정!
		else
			cService.updateCart(vo);

		return "redirect:/cart/list";

	}

	// 20210714 장바구니 리스트
	// :::::::::::::::완료:::::::::::::::
	// list.GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session, ModelAndView mav) {

		// 로그인 세션이 있다면, c_m_id의 아이디 값을 저장해준다
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String c_m_id = dto.getM_id();

		if (session.getAttribute("login") == null)
			System.out.println("로그인이 필요합니다");

		// 1) 장바구니 목록
		// 멤버 아이디에 해당하는 장바구니 목록을 가져온다
		List<CartVO> list = cService.listCart(c_m_id);

		// 테스트
		System.out.println("장바구니 목록: " + list);

		// 2) 장바구니의 유무 파악
		// 멤버 아이디에 해당하느 장바구니가 존재하는 지 유무를 판단한다
		int count = list.size();
		
		// 3) 전체 금액
		// 장바구니 목록에 있는 전체 금액을 호출한다
		int sumMoney = cService.sumMoney(c_m_id);

		// 테스트
		System.out.println("전체 금액: " + sumMoney);

		// 4) 배송비
		// 장바구니 목록에 있는 전체 금액(sumMoney)에 비례한 배송비를 계산한다
		int fee = sumMoney >= 100000 ? 0 : 2500;

		// 5) 전체 금액 + 배송비
		// 전체금액과 배송비를 합한 총 주문금액을 계산한다
		int allSum = sumMoney + fee;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // 장바구니 목록
		map.put("count", count); // 장바구니 유무 여무
		map.put("sumMoney", sumMoney); // 장바구니에 등록된 전체 금액
		map.put("fee", fee); // 전체 금액에 따른 배송비
		map.put("allSum", allSum); // 총 금액
		mav.setViewName("/cart/list");
		mav.addObject("map", map);

		return mav;
	}

	// update.POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam int[] c_amount, @RequestParam String[] c_g_code, HttpSession session) {

		// int[] amount
		// <c:forEach> 태그 안에서 배열로 적용되어 장바구니에 있는 수량이 저장이 된다
		for(int x : c_amount)
			System.out.println(x);

		// String[] c_g_code
		// <c:forEach> 태그 안에서 배열로 적용되어 장바구니에 있는 상품의 코드들이 저장이 된다
		for(String x : c_g_code)
			System.out.println(x);

		// 로그인하지 않으면 NullPointerException 발생
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		
		// 로그인 세션이 있다면, c_m_id의 아이디 값을 저장해준다
		String c_m_id = dto.getM_id();

		for (int i = 0; i < c_g_code.length; i++) {

			// mapper 에서 찾기 위해 new CartVO()를 임시로 만들어 사용한다
			CartVO vo = new CartVO();

			vo.setC_m_id(c_m_id);
			vo.setC_amount(c_amount[i]);
			vo.setC_g_code(c_g_code[i]);

			// 동기화(수정)
			cService.modify(vo);
		}

		return "redirect:/cart/list";

	}

	// delete.GET
	@RequestMapping(value = "/delete/{c_id}", method = RequestMethod.GET)
	public String delete(@PathVariable("c_id") int c_id) {

		cService.delete(c_id);
		return "redirect:/cart/list";
	}

}
