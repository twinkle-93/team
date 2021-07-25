package kr.co.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.notice.NoticeDAO;
import kr.co.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO nDao;

	@Override
	public void insert(NoticeDTO dto) throws Exception {
		nDao.insert(dto);
	}

	@Override
	public NoticeDTO read(int n_num) throws Exception {
		return nDao.read(n_num);
	}

	@Override
	public void update(NoticeDTO dto) throws Exception {
		nDao.update(dto);
	}

	@Override
	public void delete(int n_num) throws Exception {
		nDao.delete(n_num);
	}

	@Override
	public List<NoticeDTO> list() throws Exception {
		return nDao.list();
	}

}