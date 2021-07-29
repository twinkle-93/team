package kr.co.dao.qnareply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.qnareply";
}
