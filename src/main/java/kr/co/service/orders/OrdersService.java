package kr.co.service.orders;

import java.util.List;

import kr.co.dto.OrdersDTO;
import kr.co.dto.OrdersDTO2;

public interface OrdersService {
	
	void insert(OrdersDTO orders);

	List<OrdersDTO2> listById(String m_id);

	List<OrdersDTO2> list();


}
