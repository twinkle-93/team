package kr.co.dao.wishlist;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishListDAOImpl implements WishListDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.wishlist";
}
