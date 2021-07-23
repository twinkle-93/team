package kr.co.service.review;

import java.util.List;

import kr.co.dto.ReviewDTO;

public interface ReviewService {

	void insert(ReviewDTO dto);
	
	List<ReviewDTO> listByRegDate(String r_code, int startNum, int perPage);

	List<ReviewDTO> listByHighStar(String r_code, int startNum, int perPage);

	List<ReviewDTO> listByLowStar(String r_code, int startNum, int perPage);

	void update(ReviewDTO dto);

	List<ReviewDTO> listById(String r_code, String r_id);

	void delete(int r_num);

	int getAmount(String r_code);

	

	


}
