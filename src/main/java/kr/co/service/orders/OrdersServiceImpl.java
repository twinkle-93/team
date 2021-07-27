package kr.co.service.orders;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.orders.OrdersDAO;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired
	private OrdersDAO oDao;
}
