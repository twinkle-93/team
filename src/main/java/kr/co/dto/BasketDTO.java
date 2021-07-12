package kr.co.dto;

import java.io.Serializable;

public class BasketDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int b_num;
	private String b_code;
	private String b_name;
	private int b_price;
	private int b_amount;
	private int b_totalprice;

	public BasketDTO() {
		// TODO Auto-generated constructor stub
	}

	public BasketDTO(int b_num, String b_code, String b_name, int b_price, int b_amount, int b_totalprice) {
		super();
		this.b_num = b_num;
		this.b_code = b_code;
		this.b_name = b_name;
		this.b_price = b_price;
		this.b_amount = b_amount;
		this.b_totalprice = b_totalprice;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public int getB_amount() {
		return b_amount;
	}

	public void setB_amount(int b_amount) {
		this.b_amount = b_amount;
	}

	public int getB_totalprice() {
		return b_totalprice;
	}

	public void setB_totalprice(int b_totalprice) {
		this.b_totalprice = b_totalprice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + b_amount;
		result = prime * result + ((b_code == null) ? 0 : b_code.hashCode());
		result = prime * result + ((b_name == null) ? 0 : b_name.hashCode());
		result = prime * result + b_num;
		result = prime * result + b_price;
		result = prime * result + b_totalprice;
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
		BasketDTO other = (BasketDTO) obj;
		if (b_amount != other.b_amount)
			return false;
		if (b_code == null) {
			if (other.b_code != null)
				return false;
		} else if (!b_code.equals(other.b_code))
			return false;
		if (b_name == null) {
			if (other.b_name != null)
				return false;
		} else if (!b_name.equals(other.b_name))
			return false;
		if (b_num != other.b_num)
			return false;
		if (b_price != other.b_price)
			return false;
		if (b_totalprice != other.b_totalprice)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BasketDTO [b_num=" + b_num + ", b_code=" + b_code + ", b_name=" + b_name + ", b_price=" + b_price
				+ ", b_amount=" + b_amount + ", b_totalprice=" + b_totalprice + "]";
	}

}
