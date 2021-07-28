package kr.co.service.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.qna.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qDao;
}
