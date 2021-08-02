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

		// 파일에 goods code를 적용시키기 위해 먼저 insert를 적용한다
		gDao.insert(goods);

		// filename을 attach에 넣기위한 용도로 goods에 filename을 저장한다
		String[] g_filenames = goods.getG_filename();

		for (String g_filename : g_filenames)
			gDao.addAttach(g_filename, goods.getG_code());
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
	public void update(GoodsDTO goods) {
		gDao.update(goods);

		// 수정 중에 파일을 추가해서 올린다면
		// 기존 DB 내용을 다 지우고, 넘긴 DB 내용으로 적용시킨다
		// (단점: 기존에 있는 것들의 regDate가 전부 변경된다)

		gDao.deleteAllFile(goods.getG_code());

		if (goods.getG_code() == null)
			return;

		for (String g_filename : goods.getG_filename())
			gDao.addAttach(g_filename, goods.getG_code());
	}

	@Transactional
	@Override
	public void delete(String g_code) {

		// 파일 삭제(attach)
		gDao.deleteAllFile(g_code);

		// 굿즈 삭제(goods)
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
		return gDao.listAll(startNum, perPage, search_option, keyword);
	}

	@Override
	public int getCount(String search_option, String keyword) {
		return gDao.getCount(search_option, keyword);
	}

	@Override
	public List<String> getAttach(String g_code) {
		return gDao.getAttach(g_code);
	}

	@Override
	public void deleteFilename(String filename) {
		gDao.deleteFilename(filename);
	}

	@Override
	public void insertStarAmount(Integer g_starAmount, String g_code) {
		gDao.insertStarAmount(g_starAmount, g_code);
	}

	@Override
	public List<GoodsDTO> list_category_large(int startNum, int perPage, String g_category_large) {
		return gDao.list_category_large(startNum, perPage, g_category_large);
	}

	@Override
	public List<GoodsDTO> list_category_small(int startNum, int perPage, String g_category_small) {
		return gDao.list_category_small(startNum, perPage, g_category_small);
	}

	@Override
	public List<GoodsDTO> saleList() {
		return gDao.saleList();
	}

	@Override
	public List<GoodsDTO> regList() {
		return gDao.regList();
	}
	
	@Override
	public int getAmount_largeCategory(String g_category_large) {
		return gDao.getAmount_largeCategory(g_category_large);
	}
	
	@Override
	public int getAmount_SmallCategory(String g_category_small) {
		return gDao.getAmount_SmallCategory(g_category_small);
	}

}
