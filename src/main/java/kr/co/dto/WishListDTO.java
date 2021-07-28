package kr.co.dto;

import java.io.Serializable;

public class WishListDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int w_num;
	private String w_code;
	private String w_name;
	private int w_price;
	private int w_amount;
	private int w_totalprice;

	public WishListDTO() {
		// TODO Auto-generated constructor stub
	}

	public WishListDTO(int w_num, String w_code, String w_name, int w_price, int w_amount, int w_totalprice) {
		super();
		this.w_num = w_num;
		this.w_code = w_code;
		this.w_name = w_name;
		this.w_price = w_price;
		this.w_amount = w_amount;
		this.w_totalprice = w_totalprice;
	}

	public int getW_num() {
		return w_num;
	}

	public void setW_num(int w_num) {
		this.w_num = w_num;
	}

	public String getW_code() {
		return w_code;
	}

	public void setW_code(String w_code) {
		this.w_code = w_code;
	}

	public String getW_name() {
		return w_name;
	}

	public void setW_name(String w_name) {
		this.w_name = w_name;
	}

	public int getW_price() {
		return w_price;
	}

	public void setW_price(int w_price) {
		this.w_price = w_price;
	}

	public int getW_amount() {
		return w_amount;
	}

	public void setW_amount(int w_amount) {
		this.w_amount = w_amount;
	}

	public int getW_totalprice() {
		return w_totalprice;
	}

	public void setW_totalprice(int w_totalprice) {
		this.w_totalprice = w_totalprice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + w_amount;
		result = prime * result + ((w_code == null) ? 0 : w_code.hashCode());
		result = prime * result + ((w_name == null) ? 0 : w_name.hashCode());
		result = prime * result + w_num;
		result = prime * result + w_price;
		result = prime * result + w_totalprice;
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
		WishListDTO other = (WishListDTO) obj;
		if (w_amount != other.w_amount)
			return false;
		if (w_code == null) {
			if (other.w_code != null)
				return false;
		} else if (!w_code.equals(other.w_code))
			return false;
		if (w_name == null) {
			if (other.w_name != null)
				return false;
		} else if (!w_name.equals(other.w_name))
			return false;
		if (w_num != other.w_num)
			return false;
		if (w_price != other.w_price)
			return false;
		if (w_totalprice != other.w_totalprice)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "WishListDTO [w_num=" + w_num + ", w_code=" + w_code + ", w_name=" + w_name + ", w_price=" + w_price
				+ ", w_amount=" + w_amount + ", w_totalprice=" + w_totalprice + "]";
	}

}
