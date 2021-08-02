package kr.co.service.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.goods.GoodsDAO;
import kr.co.dao.orders.OrdersDAO;
import kr.co.dto.OrdersDTO;
import kr.co.dto.OrdersDTO2;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired
	private OrdersDAO oDao;
	
	@Autowired
	private GoodsDAO gDao;

	@Override
	public void insert(OrdersDTO orders) {
		oDao.insert(orders); 
		
		// g_amount update
		for(int i = 0; i<orders.getO_code().length; i++ ) {
			String o_code = orders.getO_code()[i];
			int amount = gDao.amountRead(o_code) - orders.getO_amount()[i];
			gDao.amountUpdate(o_code, amount);			
		}
		
	}

	@Override
	public List<OrdersDTO2> listById(String m_id) {
		return oDao.listById(m_id);
	}

	@Override
	public List<OrdersDTO2> list() {
		return oDao.list();
	}
}
