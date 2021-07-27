package kr.co.dao.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.admin";

	@Override
	public AdminVO login(AdminVO vo) {
		return session.selectOne(NAMESPACE + ".login", vo);
	}
}