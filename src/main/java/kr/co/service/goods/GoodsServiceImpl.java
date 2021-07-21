package kr.co.service.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.goods.GoodsDAO;
import kr.co.dto.GoodsDTO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDAO gDao;
	
	@Transactional
	@Override
	public void insert(GoodsDTO goods) {
		
		gDao.insert(goods);
		
		String[] files = goods.getG_filename();
		if (files == null) {
			return;
		}
		for(String filename : files) {
			gDao.addAttach(filename,goods.getG_code());
		}
	}

	@Override
	public List<GoodsDTO> list() {
		return gDao.list();
	}

	@Override
	public GoodsDTO read(String g_code) {
		return gDao.read(g_code);
	}

	@Override
	public void update(GoodsDTO dto) {
		gDao.update(dto);
	}

	@Override
	public void delete(String g_code) {
		gDao.delete(g_code);
	}

	@Override
	public int getAmount() {
		return gDao.getAmount();
	}

	@Override
	public List<GoodsDTO> list(int startNum, int perPage) {
		return gDao.list(startNum, perPage);
	}

	@Override
	public int getAmount_search(String search_option, String keyword) {
		return gDao.getAmount_search(search_option, keyword);
	}

	@Override
	public List<GoodsDTO> listAll(int startNum, int perPage, String search_option, String keyword) {
		return gDao.listAll(startNum,perPage,search_option,keyword);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		return gDao.getCount(search_option,keyword);
	}

	@Override
	public List<String> getAttach(String g_code) {
		return gDao.getAttach(g_code);
	}

	@Override
	public List<GoodsDTO> list_category_large(int startNum, int perPage, String g_category_large) {
		return gDao.list_category_large(startNum, perPage,g_category_large);
	}

	@Override
	public List<GoodsDTO> list_category_small(int startNum, int perPage, String g_category_small) {
		return gDao.list_category_small(startNum, perPage,g_category_small);
	}


}
