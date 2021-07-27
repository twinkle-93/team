package kr.co.service.wishlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.wishlist.WishListDAO;

@Service
public class WishListServiceImpl implements WishListService{

	@Autowired
	private WishListDAO wlDao;
}
