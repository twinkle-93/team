package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

public class OrdersDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String o_id;
	private int o_number;
	private String o_code;
	private int o_price;
	private int o_totalprice;
	private Date o_regDate;
	private String o_zipcode;
	private String o_adress;
	private String o_detailAdress;

	public OrdersDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrdersDTO(String o_id, int o_number, String o_code, int o_price, int totalprice, Date o_regDate,
			String o_zipcode, String o_adress, String o_detailAdress) {
		super();
		this.o_id = o_id;
		this.o_number = o_number;
		this.o_code = o_code;
		this.o_price = o_price;
		this.o_totalprice = totalprice;
		this.o_regDate = o_regDate;
		this.o_zipcode = o_zipcode;
		this.o_adress = o_adress;
		this.o_detailAdress = o_detailAdress;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public int getO_number() {
		return o_number;
	}

	public void setO_number(int o_number) {
		this.o_number = o_number;
	}

	public String getO_code() {
		return o_code;
	}

	public void setO_code(String o_code) {
		this.o_code = o_code;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public int getTotalprice() {
		return o_totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.o_totalprice = totalprice;
	}

	public Date getO_regDate() {
		return o_regDate;
	}

	public void setO_regDate(Date o_regDate) {
		this.o_regDate = o_regDate;
	}

	public String getO_zipcode() {
		return o_zipcode;
	}

	public void setO_zipcode(String o_zipcode) {
		this.o_zipcode = o_zipcode;
	}

	public String getO_adress() {
		return o_adress;
	}

	public void setO_adress(String o_adress) {
		this.o_adress = o_adress;
	}

	public String getO_detailAdress() {
		return o_detailAdress;
	}

	public void setO_detailAdress(String o_detailAdress) {
		this.o_detailAdress = o_detailAdress;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((o_adress == null) ? 0 : o_adress.hashCode());
		result = prime * result + ((o_code == null) ? 0 : o_code.hashCode());
		result = prime * result + ((o_detailAdress == null) ? 0 : o_detailAdress.hashCode());
		result = prime * result + ((o_id == null) ? 0 : o_id.hashCode());
		result = prime * result + o_number;
		result = prime * result + o_price;
		result = prime * result + ((o_regDate == null) ? 0 : o_regDate.hashCode());
		result = prime * result + ((o_zipcode == null) ? 0 : o_zipcode.hashCode());
		result = prime * result + o_totalprice;
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
		OrdersDTO other = (OrdersDTO) obj;
		if (o_adress == null) {
			if (other.o_adress != null)
				return false;
		} else if (!o_adress.equals(other.o_adress))
			return false;
		if (o_code == null) {
			if (other.o_code != null)
				return false;
		} else if (!o_code.equals(other.o_code))
			return false;
		if (o_detailAdress == null) {
			if (other.o_detailAdress != null)
				return false;
		} else if (!o_detailAdress.equals(other.o_detailAdress))
			return false;
		if (o_id == null) {
			if (other.o_id != null)
				return false;
		} else if (!o_id.equals(other.o_id))
			return false;
		if (o_number != other.o_number)
			return false;
		if (o_price != other.o_price)
			return false;
		if (o_regDate == null) {
			if (other.o_regDate != null)
				return false;
		} else if (!o_regDate.equals(other.o_regDate))
			return false;
		if (o_zipcode == null) {
			if (other.o_zipcode != null)
				return false;
		} else if (!o_zipcode.equals(other.o_zipcode))
			return false;
		if (o_totalprice != other.o_totalprice)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrderDTO [o_id=" + o_id + ", o_number=" + o_number + ", o_code=" + o_code + ", o_price=" + o_price
				+ ", o_totalprice=" + o_totalprice + ", o_regDate=" + o_regDate + ", o_zipcode=" + o_zipcode
				+ ", o_adress=" + o_adress + ", o_detailAdress=" + o_detailAdress + "]";
	}

}
