package kr.co.dao.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.LoginVO;
import kr.co.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Autowired
	private SqlSession session;

	private final String NAMESPACE = "kr.co.qna";

	@Override
	public void insert(QnaDTO dto) {
		session.insert(NAMESPACE + ".insert", dto);

	}

	@Override
	public List<QnaDTO> list() {
		return session.selectList(NAMESPACE + ".list");
	}

	@Override
	public void update(QnaDTO dto) {
		session.update(NAMESPACE + ".update", dto);

	}

	@Override
	public void delete(String qna_id) {
		session.delete(NAMESPACE + ".delete", qna_id);

	}

	@Override
	public QnaDTO login(LoginVO vo) {
		return session.selectOne(NAMESPACE + ".login", vo);
	}

	@Override
	public int getAmount() {
		return session.selectOne(NAMESPACE + ".getAmount");
	}

	@Override
	public List<QnaDTO> list(int startNum, int perPage) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);
		return session.selectList(NAMESPACE + ".list", null, rb);

	}

	@Override
	public int getAmount_search(String search_option, String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectOne(NAMESPACE + ".getAmount_search", map);
	}

	@Override
	public List<QnaDTO> listAll(int startNum, int perPage, String search_option, String keyword) {

		RowBounds rb = new RowBounds(startNum - 1, perPage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectList(NAMESPACE + ".listAll", map, rb);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectOne(NAMESPACE + ".getCount", map);
	}

	@Override
	public QnaDTO read(String qna_id, int qna_num) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_id", qna_id);
		map.put("qna_num", qna_num);
		
		return session.selectOne(NAMESPACE + ".read", map);
	}

}
