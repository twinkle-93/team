package kr.co.dao.qnareply;

import java.util.List;

import kr.co.dto.QnaReplyDTO;

public interface QnaReplyDAO {

	void insert(QnaReplyDTO to);

	List<QnaReplyDTO> list(int qna_about_num);

	void update(QnaReplyDTO dto);

	void delete(int qna_reply_num);

}
