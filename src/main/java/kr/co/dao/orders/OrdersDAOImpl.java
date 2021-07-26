package kr.co.dao.orders;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAOImpl implements OrdersDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.order";
}
