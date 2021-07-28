package kr.co.dao.orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.OrdersDTO;

@Repository
public class OrdersDAOImpl implements OrdersDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.order";
	
	@Override
	public void insert(OrdersDTO orders) {
		
		for(int i = 0; i<orders.getO_code().length; i++ ) {
			String o_code = orders.getO_code()[i];
			int o_point = orders.getO_point()[i];
			int o_amount = orders.getO_amount()[i];
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("point", o_point);
			map.put("code", o_code);
			map.put("amount", o_amount);
			map.put("orders", orders);
			session.insert(NAMESPACE+".insert", map);
		}
	}
	
	@Override
	public List<OrdersDTO> listById(String m_id) {
		return session.selectList(NAMESPACE+".listById", m_id);
	}
}
