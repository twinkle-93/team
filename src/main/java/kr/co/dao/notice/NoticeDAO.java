package kr.co.dao.notice;

import java.util.List;

import kr.co.dto.NoticeDTO;

public interface NoticeDAO {

	void insert(NoticeDTO notice);

	List<NoticeDTO> list(NoticeDTO notice);

	NoticeDTO read(String n_num);

	void update(NoticeDTO notice);

	void delete(String n_num);

	int getAmount();

	List<NoticeDTO> list(int startNum, int perPage);
	
}