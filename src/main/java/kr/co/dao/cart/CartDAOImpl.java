package kr.co.dao.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSession session;

	private final String NAMESPACE = "kr.co.cart";

	@Override
	public int countCart(String c_g_code, String c_m_id) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("c_m_id", c_m_id);
		map.put("c_g_code", c_g_code);

		return session.selectOne(NAMESPACE + ".countCart", map);
	}

	@Override
	public void insert(CartVO dto) {
		session.insert(NAMESPACE + ".insert", dto);
	}

	@Override
	public void updateCart(CartVO dto) {
		session.update(NAMESPACE + ".updateCart", dto);
	}

	@Override
	public List<CartVO> listCart(String c_m_id) {
		return session.selectList(NAMESPACE + ".listCart", c_m_id);
	}

	@Override
	public int sumMoney(String c_m_id) {
		return session.selectOne(NAMESPACE + ".sumMoney", c_m_id);
	}

	@Override
	public void delete(int c_id) {
		session.delete(NAMESPACE + ".delete", c_id);
	}

	@Override
	public void modify(CartVO vo) {
		session.update(NAMESPACE + ".modify", vo);
	}

	@Override
	public void deleteById(String c_m_id) {
		session.delete(NAMESPACE+".deleteById", c_m_id);
		
	}
}