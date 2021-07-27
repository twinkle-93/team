package kr.co.dto;

import java.io.Serializable;

public class CartVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int c_id;
	private String c_m_id;
	private String c_g_code;
	private String c_g_name;
	private int c_g_price;
	private int c_amount;

	public CartVO() {

	}

	public CartVO(int c_id, String c_m_id, String c_g_code, String c_g_name, int c_g_price, int c_amount) {
		super();
		this.c_id = c_id;
		this.c_m_id = c_m_id;
		this.c_g_code = c_g_code;
		this.c_g_name = c_g_name;
		this.c_g_price = c_g_price;
		this.c_amount = c_amount;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_m_id() {
		return c_m_id;
	}

	public void setC_m_id(String c_m_id) {
		this.c_m_id = c_m_id;
	}

	public String getC_g_code() {
		return c_g_code;
	}

	public void setC_g_code(String c_g_code) {
		this.c_g_code = c_g_code;
	}

	public String getC_g_name() {
		return c_g_name;
	}

	public void setC_g_name(String c_g_name) {
		this.c_g_name = c_g_name;
	}

	public int getC_g_price() {
		return c_g_price;
	}

	public void setC_g_price(int c_g_price) {
		this.c_g_price = c_g_price;
	}

	public int getC_amount() {
		return c_amount;
	}

	public void setC_amount(int c_amount) {
		this.c_amount = c_amount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + c_id;
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
		CartVO other = (CartVO) obj;
		if (c_id != other.c_id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CartVO [c_id=" + c_id + ", c_m_id=" + c_m_id + ", c_g_code=" + c_g_code + ", c_g_name=" + c_g_name
				+ ", c_g_price=" + c_g_price + ", c_amount=" + c_amount + "]";
	}

}
