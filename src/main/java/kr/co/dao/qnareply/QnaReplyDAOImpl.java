package kr.co.dao.qnareply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.QnaReplyDTO;

@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.qnareply";

	@Override
	public void insert(QnaReplyDTO to) {
		session.insert(NAMESPACE+".insert",to);
		
	}

	@Override
	public List<QnaReplyDTO> list(int qna_about_num) {
		return session.selectList(NAMESPACE+".list", qna_about_num);
	}

	@Override
	public void update(QnaReplyDTO dto) {
		session.update(NAMESPACE+".update", dto);
	}

	@Override
	public void delete(int qna_reply_num) {
		session.delete(NAMESPACE+".delete", qna_reply_num);
		
	}
}