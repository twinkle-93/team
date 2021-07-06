package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

//	CREATE TABLE coupon(
//			c_num NUMBER PRIMARY KEY,
//			c_name VARCHAR2(60) NOT NULL,
//			c_discount NUMBER NOT NULL,
//			c_regDate DATE DEFAULT SYSDATE,
//			c_endDate DATE,
//			c_totalPrice NUMBER DEFAULT 0
//			)
	
	
public class CouponDTO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int c_num;
	private String c_name;
	private int c_discount;
	private Date c_regDate;
	private Date c_endDate;
	private int c_totalPrice;
	
	public CouponDTO() {
		// TODO Auto-generated constructor stub
	}

	public CouponDTO(int c_num, String c_name, int c_discount, Date c_regDate, Date c_endDate, int c_totalPrice) {
		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_discount = c_discount;
		this.c_regDate = c_regDate;
		this.c_endDate = c_endDate;
		this.c_totalPrice = c_totalPrice;
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

	public Date getC_endDate() {
		return c_endDate;
	}

	public void setC_endDate(Date c_endDate) {
		this.c_endDate = c_endDate;
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
		final int prime = 31;
		int result = 1;
		result = prime * result + c_discount;
		result = prime * result + ((c_endDate == null) ? 0 : c_endDate.hashCode());
		result = prime * result + ((c_name == null) ? 0 : c_name.hashCode());
		result = prime * result + c_num;
		result = prime * result + ((c_regDate == null) ? 0 : c_regDate.hashCode());
		result = prime * result + c_totalPrice;
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
		CouponDTO other = (CouponDTO) obj;
		if (c_discount != other.c_discount)
			return false;
		if (c_endDate == null) {
			if (other.c_endDate != null)
				return false;
		} else if (!c_endDate.equals(other.c_endDate))
			return false;
		if (c_name == null) {
			if (other.c_name != null)
				return false;
		} else if (!c_name.equals(other.c_name))
			return false;
		if (c_num != other.c_num)
			return false;
		if (c_regDate == null) {
			if (other.c_regDate != null)
				return false;
		} else if (!c_regDate.equals(other.c_regDate))
			return false;
		if (c_totalPrice != other.c_totalPrice)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CouponDTO [c_num=" + c_num + ", c_name=" + c_name + ", c_discount=" + c_discount + ", c_regDate="
				+ c_regDate + ", c_endDate=" + c_endDate + ", c_totalPrice=" + c_totalPrice + "]";
	}
	
	
	
	
	
	
}
