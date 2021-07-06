package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

//create table goods(
//g_category_large varchar2(300) not null,
//g_category_small varchar2(300) not null,
//g_num number,
//g_name varchar2(300) not null,
//g_size varchar2(300) not null,
//g_price number not null,
//g_content varchar2(300) not null,
//g_code varchar2(300) primary key,
//g_amount number default 0,
//g_regDate date default sysdate, 
//g_filename varchar2(300) not null,
//g_likeAmount number default 0,
//g_starAmount number default 0,
//g_check number default 0,
//g_point number default 0
//)

public class GoodsDTO implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String g_category_large;
	private String g_category_small;
	private int g_number;
	private String g_name;
	private String g_size;
	private int g_price;
	private String g_content;
	private String g_code;
	private int g_amount;
	private Date g_regDate;
	private String g_filename;
	private int g_likeAmount;
	private int g_starAmount;
	private int g_check;
	private int g_point;
	
	
	
	public GoodsDTO() {
		// TODO Auto-generated constructor stub
	}



	public GoodsDTO(String g_category_large, String g_category_small, int number, String g_name, String g_size,
			int g_price, String content, String g_code, int g_amount, Date g_regDate, String g_filename,
			int g_likeAmount, int g_starAmount, int g_check, int g_point) {
		super();
		this.g_category_large = g_category_large;
		this.g_category_small = g_category_small;
		this.g_number = number;
		this.g_name = g_name;
		this.g_size = g_size;
		this.g_price = g_price;
		this.g_content = content;
		this.g_code = g_code;
		this.g_amount = g_amount;
		this.g_regDate = g_regDate;
		this.g_filename = g_filename;
		this.g_likeAmount = g_likeAmount;
		this.g_starAmount = g_starAmount;
		this.g_check = g_check;
		this.g_point = g_point;
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



	public int getNumber() {
		return g_number;
	}



	public void setNumber(int number) {
		this.g_number = number;
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



	public String getContent() {
		return g_content;
	}



	public void setContent(String content) {
		this.g_content = content;
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



	public Date getG_regDate() {
		return g_regDate;
	}



	public void setG_regDate(Date g_regDate) {
		this.g_regDate = g_regDate;
	}



	public String getG_filename() {
		return g_filename;
	}



	public void setG_filename(String g_filename) {
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



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((g_content == null) ? 0 : g_content.hashCode());
		result = prime * result + g_amount;
		result = prime * result + ((g_category_large == null) ? 0 : g_category_large.hashCode());
		result = prime * result + ((g_category_small == null) ? 0 : g_category_small.hashCode());
		result = prime * result + g_check;
		result = prime * result + ((g_code == null) ? 0 : g_code.hashCode());
		result = prime * result + ((g_filename == null) ? 0 : g_filename.hashCode());
		result = prime * result + g_likeAmount;
		result = prime * result + ((g_name == null) ? 0 : g_name.hashCode());
		result = prime * result + g_point;
		result = prime * result + g_price;
		result = prime * result + ((g_regDate == null) ? 0 : g_regDate.hashCode());
		result = prime * result + ((g_size == null) ? 0 : g_size.hashCode());
		result = prime * result + g_starAmount;
		result = prime * result + g_number;
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
		if (g_content == null) {
			if (other.g_content != null)
				return false;
		} else if (!g_content.equals(other.g_content))
			return false;
		if (g_amount != other.g_amount)
			return false;
		if (g_category_large == null) {
			if (other.g_category_large != null)
				return false;
		} else if (!g_category_large.equals(other.g_category_large))
			return false;
		if (g_category_small == null) {
			if (other.g_category_small != null)
				return false;
		} else if (!g_category_small.equals(other.g_category_small))
			return false;
		if (g_check != other.g_check)
			return false;
		if (g_code == null) {
			if (other.g_code != null)
				return false;
		} else if (!g_code.equals(other.g_code))
			return false;
		if (g_filename == null) {
			if (other.g_filename != null)
				return false;
		} else if (!g_filename.equals(other.g_filename))
			return false;
		if (g_likeAmount != other.g_likeAmount)
			return false;
		if (g_name == null) {
			if (other.g_name != null)
				return false;
		} else if (!g_name.equals(other.g_name))
			return false;
		if (g_point != other.g_point)
			return false;
		if (g_price != other.g_price)
			return false;
		if (g_regDate == null) {
			if (other.g_regDate != null)
				return false;
		} else if (!g_regDate.equals(other.g_regDate))
			return false;
		if (g_size == null) {
			if (other.g_size != null)
				return false;
		} else if (!g_size.equals(other.g_size))
			return false;
		if (g_starAmount != other.g_starAmount)
			return false;
		if (g_number != other.g_number)
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "GoodsDTO [g_category_large=" + g_category_large + ", g_category_small=" + g_category_small + ", g_number="
				+ g_number + ", g_name=" + g_name + ", g_size=" + g_size + ", g_price=" + g_price + ", g_content=" + g_content
				+ ", g_code=" + g_code + ", g_amount=" + g_amount + ", g_regDate=" + g_regDate + ", g_filename="
				+ g_filename + ", g_likeAmount=" + g_likeAmount + ", g_starAmount=" + g_starAmount + ", g_check="
				+ g_check + ", g_point=" + g_point + "]";
	}
	
	
	
	
	
	
}
