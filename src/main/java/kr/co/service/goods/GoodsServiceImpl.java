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
		if(files == null) {
			return;
		}
		System.out.println(goods.getG_thumbnail());
		for(String filename : files) {
		    gDao.addAttach(filename, goods.getG_code());
		}
		
		System.out.println(goods);
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
	public List<GoodsDTO> listAll(int startNum, int perPage, String search_option, String keyword) {
		return gDao.listAll(startNum, perPage, search_option, keyword);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		return gDao.getCount(search_option, keyword);
	}

	@Override
	public int getAmount_search(String search_option, String keyword) {
		return gDao.getAmount_search(search_option, keyword);
	}

	@Override
	public List<String> getAttach(int gCode) {
		// TODO Auto-generated method stub
		return gDao.getAttach(gCode);
	}

}