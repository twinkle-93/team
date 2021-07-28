package kr.co.service.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.coupon.CouponDAO;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CouponDAO cDao;
}
