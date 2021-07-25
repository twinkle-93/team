package kr.co.dao.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession session;

	private final String NAMESPACE = "kr.co.qna";

}
