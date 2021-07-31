package kr.co.service.goods;

import java.util.List;

import kr.co.dto.GoodsDTO;

public interface GoodsService {

	void insert(GoodsDTO goods);

	List<GoodsDTO> list();

	GoodsDTO read(String g_code);

	void update(GoodsDTO goods);

	void delete(String g_code);

	int getAmount();

	List<GoodsDTO> list(int startNum, int perPage);

	int getAmount_search(String search_option, String keyword);

	List<GoodsDTO> listAll(int startNum, int perPage, String search_option, String keyword);

	int getCount(String search_option, String keyword);

	List<String> getAttach(String g_code);

	void deleteFilename(String filename);

	void insertStarAmount(Integer g_starAmount, String g_code);

	List<GoodsDTO> list_category_large(int startNum, int perPage, String g_category_large);

	List<GoodsDTO> list_category_small(int startNum, int perPage, String g_category_small);
	
	List<GoodsDTO> saleList();

	List<GoodsDTO> regList();
	
	int getAmount_largeCategory(String g_category_large);

	int getAmount_SmallCategory(String g_category_small);
}
