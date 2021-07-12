package kr.co.service.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.basket.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired
	private BasketDAO bDao;
}
