package kr.co.dao.qna;

import java.util.List;

import kr.co.dto.LoginVO;
import kr.co.dto.QnaDTO;

public interface QnaDAO {

	// 작성
	void insert(QnaDTO dto);

	// 목록
	List<QnaDTO> list();

	QnaDTO read(String qna_id, int qna_num);

	// 수정
	void update(QnaDTO dto);

	// 삭제
	void delete(String qna_id);

	QnaDTO login(LoginVO vo);

	int getAmount();

	List<QnaDTO> list(int startNum, int perPage);

	int getAmount_search(String search_option, String keyword);

	List<QnaDTO> listAll(int startNum, int perPage, String search_option, String keyword);

	int getCount(String search_option, String keyword);


}
