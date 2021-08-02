package kr.co.dao.coupon;

import java.util.List;

import kr.co.dto.CouponDTO;

public interface CouponDAO {

	List<CouponDTO> read(int c_num);

}
