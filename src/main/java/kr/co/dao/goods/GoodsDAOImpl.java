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
	public void update(GoodsDTO goods) {
		session.update(NAMESPACE + ".update", goods);
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
	public int getAmount_search(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectOne(NAMESPACE + ".getAmount_search", map);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectOne(NAMESPACE + ".getCount", map);
	}

	@Override
	public List<GoodsDTO> listAll(int startNum, int perPage, String search_option, String keyword) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		return session.selectList(NAMESPACE + ".listAll", map, rb);
	}

	// 210721 파일 업로드(수정)

	@Override
	public void addAttach(String g_filename, String g_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("g_filename", g_filename);
		map.put("g_code", g_code);

		session.insert(NAMESPACE + ".addAttach", map);
	}

	@Override
	public List<String> getAttach(String g_code) {

		return session.selectList(NAMESPACE + ".getAttach", g_code);
	}

	@Override
	public void deleteFilename(String filename) {
		session.delete(NAMESPACE + ".deleteFilename", filename);
	}

	@Override
	public void deleteAllFile(String g_code) {
		session.delete(NAMESPACE + ".deleteAllFile", g_code);
	}

	@Override
	public void insertStarAmount(Integer g_starAmount, String g_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("g_starAmount", g_starAmount);
		map.put("g_code", g_code);
		session.update(NAMESPACE + ".insertStarAmount", map);

	}

	@Override
	public List<GoodsDTO> list_category_large(int startNum, int perPage, String g_category_large) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("g_category_large", g_category_large);

		return session.selectList(NAMESPACE + ".list_category_large", map, rb);
	}

	@Override
	public List<GoodsDTO> list_category_small(int startNum, int perPage, String g_category_small) {
		RowBounds rb = new RowBounds(startNum - 1, perPage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("g_category_small", g_category_small);

		return session.selectList(NAMESPACE + ".list_category_small", map, rb);

	}

	@Override
	public List<GoodsDTO> saleList() {
		return session.selectList(NAMESPACE+".saleList");
	}

	@Override
	public List<GoodsDTO> regList() {
		return session.selectList(NAMESPACE+".regList");
	}
	@Override
	public int amountRead(String g_code) {
		return session.selectOne(NAMESPACE+".amountRead", g_code);
	}
	
	@Override
	public void amountUpdate(String g_code, int g_amount) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("g_amount", g_amount);
		map.put("g_code", g_code);
		session.update(NAMESPACE+".amountUpdate", map);
		
	}

}
