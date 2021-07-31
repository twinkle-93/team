package kr.co.service.notice;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.dto.NoticeDTO;

@Service
public interface NoticeService {
	
	void insert(NoticeDTO notice);

	List<NoticeDTO> list(NoticeDTO notice);

	NoticeDTO read(String n_num);

	void update(NoticeDTO notice);

	void delete(String n_num);

	List<NoticeDTO> list(int startNum, int perPage);

	int getAmount();
	
}