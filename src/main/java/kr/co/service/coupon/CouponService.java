package kr.co.service.coupon;

import java.util.List;

import kr.co.dto.CouponDTO;

public interface CouponService {

	List<CouponDTO> read(int c_num);

}
