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
	public void insert(NoticeDTO notice) {
		nDao.insert(notice);
	}

	@Override
	public List<NoticeDTO> list(NoticeDTO notice) {
		return nDao.list(notice);
	}

	@Override
	public NoticeDTO read(String n_num) {
		return nDao.read(n_num);
	}

	@Override
	public void update(NoticeDTO notice) {
		nDao.update(notice);
	}

	@Override
	public void delete(String n_num) {
		nDao.delete(n_num);
	}

	@Override
	public List<NoticeDTO> list(int startNum, int perPage) {
		return nDao.list(startNum, perPage);
	}

	@Override
	public int getAmount() {
		return nDao.getAmount();
	}


	
}