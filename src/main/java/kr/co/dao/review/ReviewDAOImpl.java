package kr.co.dao.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "kr.co.review";

	@Override
	public void insert(ReviewDTO dto) {
		session.insert(NAMESPACE+".insert", dto);
	}

	@Override
	public List<ReviewDTO> listByRegDate(String r_code, int startNum, int perPage) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);

		return session.selectList(NAMESPACE+".listByRegDate", r_code, rb);
	}
	
	@Override
	public List<ReviewDTO> listByHighStar(String r_code, int startNum, int perPage) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);

		return session.selectList(NAMESPACE+".listByHighStar", r_code, rb);
	}
	
	@Override
	public List<ReviewDTO> listByLowStar(String r_code, int startNum, int perPage) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);

		return session.selectList(NAMESPACE+".listByLowStar", r_code, rb);
	}
	
	@Override
	public void update(ReviewDTO dto) {
		session.update(NAMESPACE+".update", dto);
		
	}

	@Override
	public Integer g_starAmount(String g_code) {
		return session.selectOne(NAMESPACE+".g_starAmount",g_code);
	}

	@Override
	public List<ReviewDTO> listById(String r_code, String r_id) {
		Map<String, Object> map = new  HashMap<String, Object>();
		map.put("r_code", r_code);
		map.put("r_id", r_id);
		return session.selectList(NAMESPACE+".listById", map);
		
	}

	@Override
	public void delete(int r_num) {
		session.delete(NAMESPACE+".delete", r_num);
	}

	@Override
	public int getAmount(String r_code) {
		return session.selectOne(NAMESPACE+".getAmount",r_code);
	}
}
