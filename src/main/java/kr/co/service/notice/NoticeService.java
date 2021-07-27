package kr.co.service.notice;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.dto.NoticeDTO;

@Service
public interface NoticeService {
	
	//목록
	public List<NoticeDTO> list() throws Exception;

	//작성
	public void insert(NoticeDTO dto) throws Exception;
	
	//조회
	public NoticeDTO read(int n_num) throws Exception;
	
	//수정
	public void update(NoticeDTO dto) throws Exception;
	
	//삭제
	public void delete(int n_num) throws Exception;

}