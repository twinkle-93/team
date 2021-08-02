package kr.co.dto;

import java.io.Serializable;

public class MemberDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	// birth : date 형식으로 변경 바람 
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_birth;
	private String m_email;
	private String m_zipCode;
	private String m_address;
	private String m_detailAddress;
	private String m_phone;
	private String m_gender;
	private String m_regDate;
	private String m_updateDate;
	private int m_point;
	private int m_money;
	private int m_coupon;
	
	/*
	private int m_myLike;
	private int m_myBasket;
	private int m_myLevel;
	private int m_exp;
	private String m_grade;
	private String m_membership;
	private int m_membershipLevel;
	*/

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public MemberDTO(String m_id, String m_pw, String m_name, String m_birth, String m_email, String m_zipCode,
			String m_address, String m_detailAddress, String m_phone, String m_gender, String m_regDate,
			String m_updateDate, int m_point, int m_money, int m_coupon) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_email = m_email;
		this.m_zipCode = m_zipCode;
		this.m_address = m_address;
		this.m_detailAddress = m_detailAddress;
		this.m_phone = m_phone;
		this.m_gender = m_gender;
		this.m_regDate = m_regDate;
		this.m_updateDate = m_updateDate;
		this.m_point = m_point;
		this.m_money = m_money;
		this.m_coupon = m_coupon;
	}



	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_zipCode() {
		return m_zipCode;
	}

	public void setM_zipCode(String m_zipCode) {
		this.m_zipCode = m_zipCode;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_detailAddress() {
		return m_detailAddress;
	}

	public void setM_detailAddress(String m_detailAddress) {
		this.m_detailAddress = m_detailAddress;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_regDate() {
		return m_regDate;
	}

	public void setM_regDate(String m_regDate) {
		this.m_regDate = m_regDate;
	}

	public String getM_updateDate() {
		return m_updateDate;
	}

	public void setM_updateDate(String m_updateDate) {
		this.m_updateDate = m_updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getM_money() {
		return m_money;
	}

	public void setM_money(int m_money) {
		this.m_money = m_money;
	}

	public int getM_point() {
		return m_point;
	}


	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	

	public int getM_coupon() {
		return m_coupon;
	}



	public void setM_coupon(int m_coupon) {
		this.m_coupon = m_coupon;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((m_id == null) ? 0 : m_id.hashCode());
		result = prime * result + ((m_pw == null) ? 0 : m_pw.hashCode());
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
		MemberDTO other = (MemberDTO) obj;
		if (m_id == null) {
			if (other.m_id != null)
				return false;
		} else if (!m_id.equals(other.m_id))
			return false;
		if (m_pw == null) {
			if (other.m_pw != null)
				return false;
		} else if (!m_pw.equals(other.m_pw))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_birth=" + m_birth
				+ ", m_email=" + m_email + ", m_zipCode=" + m_zipCode + ", m_address=" + m_address
				+ ", m_detailAddress=" + m_detailAddress + ", m_phone=" + m_phone + ", m_gender=" + m_gender
				+ ", m_regDate=" + m_regDate + ", m_updateDate=" + m_updateDate + ", m_point=" + m_point + ", m_money="
				+ m_money + ", m_coupon=" + m_coupon + "]";
	}

	
	

}