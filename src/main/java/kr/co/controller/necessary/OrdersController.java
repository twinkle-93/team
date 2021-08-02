package kr.co.controller.necessary;

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
import org.springframework.web.servlet.ModelAndView;

import kr.co.dto.CartVO;
import kr.co.dto.MemberDTO;
import kr.co.dto.OrdersDTO;
import kr.co.dto.OrdersDTO2;
import kr.co.service.cart.CartService;
import kr.co.service.member.MemberService;
import kr.co.service.orders.OrdersService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Inject
	private OrdersService oService;
	
	@Inject
	private CartService cService;
	
	@Inject
	private MemberService mService;
	
	
	// insert.GET
	// cart/list 그대로 받아옴
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView insert(HttpSession session, ModelAndView mav) {
		
		// 로그인 세션이 있다면, c_m_id의 아이디 값을 저장해준다
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		String c_m_id = dto.getM_id();

		if (session.getAttribute("login") == null)
			System.out.println("로그인이 필요합니다");

		// 1) 장바구니 목록
		// 멤버 아이디에 해당하는 장바구니 목록을 가져온다
		List<CartVO> list = cService.listCart(c_m_id);

		// 2) 장바구니의 유무 파악
		// 멤버 아이디에 해당하느 장바구니가 존재하는 지 유무를 판단한다
		int count = list.size();

		// 3) 전체 금액
		// 장바구니 목록에 있는 전체 금액을 호출한다
		int sumMoney = cService.sumMoney(c_m_id);

		// 4) 배송비
		// 장바구니 목록에 있는 전체 금액(sumMoney)에 비례한 배송비를 계산한다
		int fee = sumMoney >= 100000 ? 0 : 2500;

		// 5) 전체 금액 + 배송비
		// 전체금액과 배송비를 합한 총 주문금액을 계산한다
		int allSum = sumMoney + fee;
		
		//회원정보read
		MemberDTO member = mService.read(c_m_id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // 장바구니 목록
		map.put("count", count); // 장바구니 유무 여무
		map.put("sumMoney", sumMoney); // 장바구니에 등록된 전체 금액
		map.put("fee", fee); // 전체 금액에 따른 배송비
		map.put("allSum", allSum); // 총 금액
		map.put("member", member); // 회원 정보
		mav.setViewName("/orders/insert");
		mav.addObject("map", map);

		return mav;
	}

	// insert.POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(OrdersDTO orders) {
		
		// orders insert
		oService.insert(orders);
		
		// m_point update 
		int updatePoint = mService.pointRead(orders.getO_id()) - orders.getO_pointDiscount();
		mService.pointUpdate(orders.getO_id(), updatePoint);
		
		// m_money update
		int updateMoney = mService.moneyRead(orders.getO_id()) - orders.getO_paymentAmount();
		mService.moneyUpdate(orders.getO_id(),updateMoney);
		
		// cart delete
		cService.deleteById(orders.getO_id());
		
		return "redirect:/orders/listById/"+ orders.getO_id();

	}

	// listById.GET 멤버별 orders list
		@RequestMapping(value = "/listById/{m_id}", method = RequestMethod.GET)
		public String listById(@PathVariable("m_id") String m_id, Model model) {
			
			List<OrdersDTO2> list = oService.listById(m_id);
			System.out.println(list);
			model.addAttribute("list", list);
			return "/orders/listById";
		}
		
		// orders list
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public List<OrdersDTO2> list(Model model) {
			
			List<OrdersDTO2> list = oService.list();
			model.addAttribute("list", list);
			
			return list;
		}

	// read.GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read() {

	}

	// read.POST
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public void read(Model model) {

	}

	// update.GET
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update() {

	}

	// update.POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void update(Model model) {

	}

	// delete.GET
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete() {

	}

	// delete.GET
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(Model model) {
		
	}

}
