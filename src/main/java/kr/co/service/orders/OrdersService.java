package kr.co.service.orders;

import java.util.List;

import kr.co.dto.OrdersDTO;

public interface OrdersService {
	
	void insert(OrdersDTO orders);

	List<OrdersDTO> listById(String m_id);

}
