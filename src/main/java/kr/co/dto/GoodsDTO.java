package kr.co.dto;

import java.io.Serializable;
import java.util.Arrays;

public class GoodsDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String g_category_large;
	private String g_category_small;
	private int g_num;
	private String g_name;
	private String g_size;
	private int g_price;
	private String g_content;
	private String g_code;
	private int g_amount;
	private String g_regDate;
	private String g_updateDate;
	private String[] g_filename;
	private int g_likeAmount;
	private int g_starAmount;
	private int g_check;
	private int g_point;
	private String g_thumbnail;

	public GoodsDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public GoodsDTO(String g_category_large, String g_category_small, int g_num, String g_name, String g_size,
			int g_price, String g_content, String g_code, int g_amount, String g_regDate, String g_updateDate,
			String[] g_filename, int g_likeAmount, int g_starAmount, int g_check, int g_point, String g_thumbnail) {
		super();
		this.g_category_large = g_category_large;
		this.g_category_small = g_category_small;
		this.g_num = g_num;
		this.g_name = g_name;
		this.g_size = g_size;
		this.g_price = g_price;
		this.g_content = g_content;
		this.g_code = g_code;
		this.g_amount = g_amount;
		this.g_regDate = g_regDate;
		this.g_updateDate = g_updateDate;
		this.g_filename = g_filename;
		this.g_likeAmount = g_likeAmount;
		this.g_starAmount = g_starAmount;
		this.g_check = g_check;
		this.g_point = g_point;
		this.g_thumbnail = g_thumbnail;
	}

	public String getG_category_large() {
		return g_category_large;
	}

	public void setG_category_large(String g_category_large) {
		this.g_category_large = g_category_large;
	}

	public String getG_category_small() {
		return g_category_small;
	}

	public void setG_category_small(String g_category_small) {
		this.g_category_small = g_category_small;
	}

	public int getG_num() {
		return g_num;
	}

	public void setG_num(int g_num) {
		this.g_num = g_num;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_size() {
		return g_size;
	}

	public void setG_size(String g_size) {
		this.g_size = g_size;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	public String getG_content() {
		return g_content;
	}

	public void setG_content(String g_content) {
		this.g_content = g_content;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public int getG_amount() {
		return g_amount;
	}

	public void setG_amount(int g_amount) {
		this.g_amount = g_amount;
	}

	public String getG_regDate() {
		return g_regDate;
	}

	public void setG_regDate(String g_regDate) {
		this.g_regDate = g_regDate;
	}

	public String getG_updateDate() {
		return g_updateDate;
	}

	public void setG_updateDate(String g_updateDate) {
		this.g_updateDate = g_updateDate;
	}

	public String[] getG_filename() {
		return g_filename;
	}

	public void setG_filename(String[] g_filename) {
		this.g_filename = g_filename;
	}

	public int getG_likeAmount() {
		return g_likeAmount;
	}

	public void setG_likeAmount(int g_likeAmount) {
		this.g_likeAmount = g_likeAmount;
	}

	public int getG_starAmount() {
		return g_starAmount;
	}

	public void setG_starAmount(int g_starAmount) {
		this.g_starAmount = g_starAmount;
	}

	public int getG_check() {
		return g_check;
	}

	public void setG_check(int g_check) {
		this.g_check = g_check;
	}

	public int getG_point() {
		return g_point;
	}

	public void setG_point(int g_point) {
		this.g_point = g_point;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public String getG_thumbnail() {
		return g_thumbnail;
	}


	public void setG_thumbnail(String g_thumbnail) {
		this.g_thumbnail = g_thumbnail;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((g_code == null) ? 0 : g_code.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GoodsDTO other = (GoodsDTO) obj;
		if (g_code == null) {
			if (other.g_code != null)
				return false;
		} else if (!g_code.equals(other.g_code))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "GoodsDTO [g_category_large=" + g_category_large + ", g_category_small=" + g_category_small + ", g_num="
				+ g_num + ", g_name=" + g_name + ", g_size=" + g_size + ", g_price=" + g_price + ", g_content="
				+ g_content + ", g_code=" + g_code + ", g_amount=" + g_amount + ", g_regDate=" + g_regDate
				+ ", g_updateDate=" + g_updateDate + ", g_filename=" + Arrays.toString(g_filename) + ", g_likeAmount="
				+ g_likeAmount + ", g_starAmount=" + g_starAmount + ", g_check=" + g_check + ", g_point=" + g_point
				+ ", g_thumbnail=" + g_thumbnail + "]";
	}

	

}
