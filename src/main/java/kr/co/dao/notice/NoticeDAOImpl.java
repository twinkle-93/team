package kr.co.dao.notice;


import java.util.List;


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
	public void insert(NoticeDTO dto) throws Exception {
		session.insert(NAMESPACE + ".insert", dto);
		
	}

	@Override
	public NoticeDTO read(int n_num) throws Exception {
		return session.selectOne(NAMESPACE + ".read", n_num);
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		session.update(NAMESPACE + ".update", dto);
		
	}

	@Override
	public void delete(int n_num) throws Exception {
		session.delete(NAMESPACE+ ".delete", n_num);
		
	}

	@Override
	public List<NoticeDTO> list() throws Exception {
		return session.selectList(NAMESPACE + ".list");
	}

	
}