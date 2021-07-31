package kr.co.dao.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.CouponDTO;

@Repository
public class CouponDAOImpl implements CouponDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.coupon";

	@Override
	public List<CouponDTO> read(int c_num) {
		return session.selectList(NAMESPACE+".read", c_num);
	}
}
