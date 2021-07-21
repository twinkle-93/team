package kr.co.service.review;

import java.util.List;

import kr.co.dto.ReviewDTO;

public interface ReviewService {

	void insert(ReviewDTO dto);

	List<ReviewDTO> listByRegDate(String r_code);

	List<ReviewDTO> listByHighStar(String r_code);

	List<ReviewDTO> listByLowStar(String r_code);

	void update(ReviewDTO dto);

	List<ReviewDTO> listById(String r_code, String r_id);

	void delete(int r_num);

}
