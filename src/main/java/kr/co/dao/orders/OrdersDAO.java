package kr.co.dao.orders;

import java.util.List;

import kr.co.dto.OrdersDTO;

public interface OrdersDAO {
	
	void insert(OrdersDTO orders);

	List<OrdersDTO> listById(String m_id);

}
