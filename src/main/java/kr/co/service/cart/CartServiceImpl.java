package kr.co.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.cart.CartDAO;
import kr.co.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cDao;

	@Override
	public int countCart(String c_g_code, String c_m_id) {
		return cDao.countCart(c_g_code, c_m_id);
	}

	@Override
	public void insert(CartVO dto) {
		cDao.insert(dto);
	}

	@Override
	public void updateCart(CartVO dto) {
		cDao.updateCart(dto);
	}

	@Override
	public List<CartVO> listCart(String c_m_id) {
		return cDao.listCart(c_m_id);
	}

	@Override
	public int sumMoney(String c_m_id) {
		return cDao.sumMoney(c_m_id);
	}

	@Override
	public void delete(int c_id) {
		cDao.delete(c_id);
	}

	@Override
	public void modify(CartVO vo) {
		cDao.modify(vo);
	}

	@Override
	public void deleteById(String c_m_id) {
		cDao.deleteById(c_m_id);
		
	}
}
