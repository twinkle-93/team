package kr.co.service.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.coupon.CouponDAO;
import kr.co.dto.CouponDTO;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CouponDAO cDao;

	@Override
	public List<CouponDTO> read(int c_num) {
		return cDao.read(c_num);
	}
}
