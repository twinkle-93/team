package kr.co.dao.coupon;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOImpl implements CouponDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.coupon";
}
