package kr.co.dao.cart;

import java.util.List;

import kr.co.dto.CartVO;

public interface CartDAO {

	int countCart(String c_g_code, String c_m_id);

	void insert(CartVO dto);

	void updateCart(CartVO dto);

	List<CartVO> listCart(String c_m_id);

	int sumMoney(String c_m_id);

	void delete(int c_id);

	void modify(CartVO vo);

}
