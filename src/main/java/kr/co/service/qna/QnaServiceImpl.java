package kr.co.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.qna.QnaDAO;
import kr.co.dto.LoginVO;
import kr.co.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qDao;

	
	@Override
	public void insert(QnaDTO dto) {
		qDao.insert(dto);
		
	}

	@Override
	public List<QnaDTO> list() {
		return qDao.list();
	}

	@Override
	public QnaDTO read(String qna_id, int qna_num) {
		return qDao.read(qna_id, qna_num);
	}

	

	@Override
	public void update(QnaDTO dto) {
		qDao.update(dto);
		
	}

	@Override
	public void delete(String qna_id) {
		qDao.delete(qna_id);
		
	}

	@Override
	public int getAmount() {
		return qDao.getAmount();
	}

	@Override
	public List<QnaDTO> list(int startNum, int perPage) {
		return qDao.list(startNum, perPage);
	}

	@Override
	public int getAmount_search(String search_option, String keyword) {
		return qDao.getAmount_search(search_option, keyword);
	}

	@Override
	public List<QnaDTO> listAll(int startNum, int perPage, String search_option, String keyword) {
		return qDao.listAll(startNum, perPage, search_option, keyword);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		return qDao.getCount(search_option, keyword);
	}

	@Override
	public QnaDTO login(LoginVO vo) {
		return qDao.login(vo);
		
	}


}
