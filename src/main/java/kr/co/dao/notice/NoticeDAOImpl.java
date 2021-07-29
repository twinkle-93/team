package kr.co.dao.notice;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.notice";

	@Override
	public void insert(NoticeDTO notice) {
		session.insert(NAMESPACE+".insert", notice);
	}

	@Override
	public List<NoticeDTO> list(NoticeDTO notice) {
		return session.selectList(NAMESPACE+".list", notice);
	}

	@Override
	public NoticeDTO read(String n_num) {
		return session.selectOne(NAMESPACE+".read", n_num);
	}

	@Override
	public void update(NoticeDTO notice) {
		session.update(NAMESPACE+".update", notice);
	}

	@Override
	public void delete(String n_num) {
		session.delete(NAMESPACE+".delete", n_num);
	}

	@Override
	public int getAmount() {
		return session.selectOne(NAMESPACE+".getAmount");
	}

	@Override
	public List<NoticeDTO> list(int startNum, int perPage) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);
		return session.selectList(NAMESPACE+".list", null, rb);
	}

}