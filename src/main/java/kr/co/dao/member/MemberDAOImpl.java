package kr.co.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dto.LoginVO;
import kr.co.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	private final String NAMESPACE = "kr.co.member";

	@Override
	public void insert(MemberDTO dto) {
		session.insert(NAMESPACE + ".insert", dto);
	}

	@Override
	public List<MemberDTO> list() {
		return session.selectList(NAMESPACE + ".list");
	}

	@Override
	public MemberDTO read(String m_id) {
		return session.selectOne(NAMESPACE + ".read", m_id);
	}

	@Override
	public void update(MemberDTO dto) {
		session.update(NAMESPACE + ".update", dto);
	}

	@Override
	public void delete(String m_id) {
		session.delete(NAMESPACE + ".delete", m_id);
	}

	@Override
	public MemberDTO login(LoginVO vo) {
		return session.selectOne(NAMESPACE + ".login", vo);
	}

	@Override
	public int getAmount() {
		return session.selectOne(NAMESPACE + ".getAmount");
	}

	@Override
	public List<MemberDTO> list(int startNum, int perPage) {
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
	public List<MemberDTO> listAll(int startNum, int perPage, String search_option, String keyword) {

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
	public void pointUpdate(String m_id, int m_point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("m_point", m_point);
		session.update(NAMESPACE+".pointUpdate", map);
	}
	
	@Override
	public int pointRead(String m_id) {
		return session.selectOne(NAMESPACE+".pointRead", m_id);
	}
	
	@Override
	public int moneyRead(String m_id) {
		return session.selectOne(NAMESPACE+".moneyRead", m_id);
	}
	
	@Override
	public void moneyUpdate(String m_id, int m_money) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("m_money", m_money);
		session.update(NAMESPACE+".moneyUpdate", map);
		
	}

	@Override
	public int couponRead(String m_id) {
		return session.selectOne(NAMESPACE+".couponRead", m_id);
	}
}
