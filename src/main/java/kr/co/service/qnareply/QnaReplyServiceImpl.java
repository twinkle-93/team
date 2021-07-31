package kr.co.service.qnareply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.qnareply.QnaReplyDAO;
import kr.co.dto.QnaReplyDTO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService{

	@Autowired
	private QnaReplyDAO qrDao;

	@Override
	public void insert(QnaReplyDTO to) {
		qrDao.insert(to);
	}

	@Override
	public List<QnaReplyDTO> list(int qna_about_num) {
		return qrDao.list(qna_about_num);
	}

	@Override
	public void update(QnaReplyDTO dto) {
		qrDao.update(dto);
	}

	@Override
	public void delete(int qna_reply_num) {
		qrDao.delete(qna_reply_num);
	}
}