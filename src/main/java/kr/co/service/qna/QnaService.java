package kr.co.service.qna;

import java.util.List;

import kr.co.dto.LoginVO;
import kr.co.dto.QnaDTO;

public interface QnaService {

	void insert(QnaDTO dto);

	List<QnaDTO> list();

	QnaDTO read(String qna_id, int qna_num);

	void update(QnaDTO dto);

	void delete(String qna_id);

	QnaDTO login(LoginVO vo);

	int getAmount();

	List<QnaDTO> list(int startNum, int perPage);

	int getAmount_search(String search_option, String keyword);

	List<QnaDTO> listAll(int startNum, int perPage, String search_option, String keyword);

	int getCount(String search_option, String keyword);

}
