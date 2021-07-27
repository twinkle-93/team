package kr.co.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.member.MemberDAO;
import kr.co.dto.LoginVO;
import kr.co.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mDao;

	@Override
	public void insert(MemberDTO dto) {
		mDao.insert(dto);
	}

	@Override
	public List<MemberDTO> list() {
		return mDao.list();
	}

	@Override
	public MemberDTO read(String m_id) {
		return mDao.read(m_id);
	}

	@Override
	public void update(MemberDTO dto) {
		mDao.update(dto);
	}

	@Override
	public void delete(String m_id) {
		mDao.delete(m_id);
	}

	@Override
	public MemberDTO login(LoginVO vo) {
		return mDao.login(vo);
	}

	@Override
	public int getAmount() {
		return mDao.getAmount();
	}

	@Override
	public List<MemberDTO> list(int startNum, int perPage) {
		return mDao.list(startNum, perPage);
	}

	@Override
	public int getAmount_search(String search_option, String keyword) {
		return mDao.getAmount_search(search_option, keyword);
	}

	@Override
	public List<MemberDTO> listAll(int startNum, int perPage, String search_option, String keyword) {
		return mDao.listAll(startNum, perPage, search_option, keyword);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		return mDao.getCount(search_option, keyword);
	}

}
