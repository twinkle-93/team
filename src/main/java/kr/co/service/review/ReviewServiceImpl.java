package kr.co.service.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.goods.GoodsDAO;
import kr.co.dao.review.ReviewDAO;
import kr.co.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO rDao;
	
	@Autowired
	private GoodsDAO gDao;

	@Override
	public void insert(ReviewDTO dto) {
		rDao.insert(dto);
		Integer g_starAmount = rDao.g_starAmount(dto.getR_code());
		gDao.insertStarAmount(g_starAmount, dto.getR_code());
	}
	
	@Override
	public List<ReviewDTO> listByRegDate(String r_code, int startNum, int perPage) {
		return rDao.listByRegDate(r_code, startNum, perPage);
	}

	@Override
	public List<ReviewDTO> listByHighStar(String r_code, int startNum, int perPage) {
		return rDao.listByHighStar(r_code, startNum, perPage);
	}

	@Override
	public List<ReviewDTO> listByLowStar(String r_code, int startNum, int perPage) {
		return rDao.listByLowStar(r_code, startNum, perPage);
	}

	@Override
	public void update(ReviewDTO dto) {
		rDao.update(dto);
		Integer g_starAmount = rDao.g_starAmount(dto.getR_code());
		gDao.insertStarAmount(g_starAmount, dto.getR_code());
		
	}

	@Override
	public List<ReviewDTO> listById(String r_code, String r_id) {
		return rDao.listById(r_code, r_id);
		
	}

	@Override
	public void delete(int r_num) {
		rDao.delete(r_num);
		
	}

	@Override
	public int getAmount(String r_code) {
		return rDao.getAmount(r_code);
	}
}
