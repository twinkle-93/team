package kr.co.dao.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.review";
}
