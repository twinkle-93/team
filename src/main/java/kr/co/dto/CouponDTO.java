package kr.co.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class CouponDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int c_num;
	private String c_name;
	private int c_discount;
	private Date c_regDate;
	private int c_totalPrice;
	private int c_endDate;

	public CouponDTO() {
		// TODO Auto-generated constructor stub
	}

	public CouponDTO(int c_num, String c_name, int c_discount, Date c_regDate, int c_totalPrice, int c_endDate) {
		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_discount = c_discount;
		this.c_regDate = c_regDate;
		this.c_totalPrice = c_totalPrice;
		this.c_endDate = c_endDate;
	}
	public int getC_endDate() {
		return c_endDate;
	}

	public void setC_endDate(int c_endDate) {
		this.c_endDate = c_endDate;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public int getC_discount() {
		return c_discount;
	}

	public void setC_discount(int c_discount) {
		this.c_discount = c_discount;
	}

	public Date getC_regDate() {
		return c_regDate;
	}

	public void setC_regDate(Date c_regDate) {
		this.c_regDate = c_regDate;
	}

	

	public int getC_totalPrice() {
		return c_totalPrice;
	}

	public void setC_totalPrice(int c_totalPrice) {
		this.c_totalPrice = c_totalPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(c_num);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CouponDTO other = (CouponDTO) obj;
		return c_num == other.c_num;
	}

	@Override
	public String toString() {
		return "CouponDTO [c_num=" + c_num + ", c_name=" + c_name + ", c_discount=" + c_discount + ", c_regDate="
				+ c_regDate + ", c_totalPrice=" + c_totalPrice + ", c_endDate=" + c_endDate + ", getC_endDate()="
				+ getC_endDate() + ", getC_num()=" + getC_num() + ", getC_name()=" + getC_name() + ", getC_discount()="
				+ getC_discount() + ", getC_regDate()=" + getC_regDate() + ", getC_totalPrice()=" + getC_totalPrice()
				+ ", hashCode()=" + hashCode() + ", getClass()=" + getClass() + ", toString()=" + super.toString()
				+ "]";
	}

	
}
	