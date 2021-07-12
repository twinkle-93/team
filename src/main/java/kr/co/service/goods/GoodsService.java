package kr.co.service.goods;

import java.util.List;

import kr.co.dto.GoodsDTO;

public interface GoodsService {

	void insert(GoodsDTO goods);

	List<GoodsDTO> list();

	GoodsDTO read(String g_code);

	void update(GoodsDTO dto);

	void delete(String g_code);

	int getAmount();

	List<GoodsDTO> list(int startNum, int perPage);

	List<GoodsDTO> listAll(int startNum, int perPage, String search_option, String keyword);

	int getCount(String search_option, String keyword);

	int getAmount_search(String search_option, String keyword);

	List<String> getAttach(int gCode);

}
