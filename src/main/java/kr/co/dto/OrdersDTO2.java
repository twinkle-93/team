package kr.co.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class OrdersDTO2 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String o_id;
	private String o_name;
	private int o_number;
	private String o_code;
	private int o_price;
	private int o_totalprice;
	private Date o_regDate;
	private String o_zipcode;
	private String o_address;
	private String o_detailAddress;
	private String o_phone;
	private String o_memo;
	private int o_point;
	private int o_discount;
	private int o_paymentAmount;
	private int o_pointDiscount;
	private int o_amount;

	public OrdersDTO2() {
		// TODO Auto-generated constructor stub
	}

	public OrdersDTO2(String o_id, String o_name, int o_number, String o_code, int o_price, int o_totalprice,
			Date o_regDate, String o_zipcode, String o_address, String o_detailAddress, String o_phone, String o_memo,
			int o_point, int o_discount, int o_paymentAmount, int o_pointDiscount, int o_amount) {
		super();
		this.o_id = o_id;
		this.o_name = o_name;
		this.o_number = o_number;
		this.o_code = o_code;
		this.o_price = o_price;
		this.o_totalprice = o_totalprice;
		this.o_regDate = o_regDate;
		this.o_zipcode = o_zipcode;
		this.o_address = o_address;
		this.o_detailAddress = o_detailAddress;
		this.o_phone = o_phone;
		this.o_memo = o_memo;
		this.o_point = o_point;
		this.o_discount = o_discount;
		this.o_paymentAmount = o_paymentAmount;
		this.o_pointDiscount = o_pointDiscount;
		this.o_amount = o_amount;
	}





	public String getO_code() {
		return o_code;
	}



	public void setO_code(String o_code) {
		this.o_code = o_code;
	}



	public int getO_point() {
		return o_point;
	}



	public void setO_point(int o_point) {
		this.o_point = o_point;
	}



	public int getO_amount() {
		return o_amount;
	}



	public void setO_amount(int o_amount) {
		this.o_amount = o_amount;
	}



	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public int getO_number() {
		return o_number;
	}

	public void setO_number(int o_number) {
		this.o_number = o_number;
	}

	public int getO_price() {
		return o_price;
	}

	public void setO_price(int o_price) {
		this.o_price = o_price;
	}

	public int getO_totalprice() {
		return o_totalprice;
	}

	public void setO_totalprice(int o_totalprice) {
		this.o_totalprice = o_totalprice;
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

	public String getO_address() {
		return o_address;
	}

	public void setO_address(String o_address) {
		this.o_address = o_address;
	}

	public String getO_detailAddress() {
		return o_detailAddress;
	}

	public void setO_detailAddress(String o_detailAddress) {
		this.o_detailAddress = o_detailAddress;
	}

	public String getO_phone() {
		return o_phone;
	}

	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}

	public String getO_memo() {
		return o_memo;
	}

	public void setO_memo(String o_memo) {
		this.o_memo = o_memo;
	}

	public int getO_discount() {
		return o_discount;
	}

	public void setO_discount(int o_discount) {
		this.o_discount = o_discount;
	}

	public int getO_paymentAmount() {
		return o_paymentAmount;
	}

	public void setO_paymentAmount(int o_paymentAmount) {
		this.o_paymentAmount = o_paymentAmount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getO_pointDiscount() {
		return o_pointDiscount;
	}


	public void setO_pointDiscount(int o_pointDiscount) {
		this.o_pointDiscount = o_pointDiscount;
	}

	@Override
	public int hashCode() {
		return Objects.hash(o_number);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdersDTO2 other = (OrdersDTO2) obj;
		return o_number == other.o_number;
	}

	@Override
	public String toString() {
		return "OrdersDTO2 [o_id=" + o_id + ", o_name=" + o_name + ", o_number=" + o_number + ", o_code=" + o_code
				+ ", o_price=" + o_price + ", o_totalprice=" + o_totalprice + ", o_regDate=" + o_regDate
				+ ", o_zipcode=" + o_zipcode + ", o_address=" + o_address + ", o_detailAddress=" + o_detailAddress
				+ ", o_phone=" + o_phone + ", o_memo=" + o_memo + ", o_point=" + o_point + ", o_discount=" + o_discount
				+ ", o_paymentAmount=" + o_paymentAmount + ", o_pointDiscount=" + o_pointDiscount + ", o_amount="
				+ o_amount + "]";
	}

	

	
	
	
	
	

	

	

	

}
