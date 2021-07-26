package kr.co.dao.member;

import java.util.List;

import kr.co.dto.LoginVO;
import kr.co.dto.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	List<MemberDTO> list();

	MemberDTO read(String m_id);

	void update(MemberDTO dto);

	void delete(String m_id);

	MemberDTO login(LoginVO vo);

	int getAmount();

	List<MemberDTO> list(int startNum, int perPage);

	int getAmount_search(String search_option, String keyword);

	List<MemberDTO> listAll(int startNum, int perPage, String search_option, String keyword);

	int getCount(String search_option, String keyword);

}
