package kr.co.dao.basket;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BasketDAOImpl implements BasketDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.basket";
}
