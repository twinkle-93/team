package kr.co.service.qnareply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.qnareply.QnaReplyDAO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService{

	@Autowired
	private QnaReplyDAO qrDao;
}
