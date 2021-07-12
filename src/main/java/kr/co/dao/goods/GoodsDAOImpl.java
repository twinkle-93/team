package kr.co.dao.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	private SqlSession session;

	private final String NAMESPACE = "kr.co.goods";

	@Override
	public void insert(GoodsDTO goods) {
		session.insert(NAMESPACE + ".insert", goods);
	}

	@Override
	public List<GoodsDTO> list() {
		return session.selectList(NAMESPACE + ".list");
	}

	@Override
	public GoodsDTO read(String g_code) {
		return session.selectOne(NAMESPACE + ".read", g_code);
	}

	@Override
	public void update(GoodsDTO dto) {
		session.update(NAMESPACE + ".update", dto);
	}

	@Override
	public void delete(String g_code) {
		session.delete(NAMESPACE + ".delete", g_code);
	}

	@Override
	public int getAmount() {
		return session.selectOne(NAMESPACE + ".getAmount");
	}

	@Override
	public List<GoodsDTO> list(int startNum, int perPage) {

		RowBounds rb = new RowBounds(startNum - 1, perPage);
		return session.selectList(NAMESPACE + ".list", null, rb);
	}

	@Override
	public List<GoodsDTO> listAll(int startNum, int perPage, String search_option, String keyword) {
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
	public int getAmount_search(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectOne(NAMESPACE + ".getAmount_search", map);
	}

	@Override
	public void addAttach(String filename, String g_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("g_code", g_code);
		
		session.insert(NAMESPACE+".addGoodsAttach", map);
		
	}

	@Override
	public List<String> getAttach(String g_code) {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".getGoodsAttach", g_code);
	}

}
