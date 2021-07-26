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
	private String m_adress;
	private String m_detailAdress;
	private String m_phone;
	private String m_gender;
	private String m_regDate;
	private String m_updateDate;
	
	/*
	private int m_money;
	private int m_point;
	private int m_myLike;
	private int m_myBasket;
	private int m_myLevel;
	private int m_exp;
	private String m_grade;
	private String m_membership;
	private int m_membershipLevel;
	private int m_myCoupon;
	*/

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String m_id, String m_pw, String m_name, String m_birth, String m_email, String m_zipCode,
			String m_adress, String m_detailAdress, String m_phone, String m_gender, String m_regDate,
			String m_updateDate) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_email = m_email;
		this.m_zipCode = m_zipCode;
		this.m_adress = m_adress;
		this.m_detailAdress = m_detailAdress;
		this.m_phone = m_phone;
		this.m_gender = m_gender;
		this.m_regDate = m_regDate;
		this.m_updateDate = m_updateDate;
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

	public String getM_adress() {
		return m_adress;
	}

	public void setM_adress(String m_adress) {
		this.m_adress = m_adress;
	}

	public String getM_detailAdress() {
		return m_detailAdress;
	}

	public void setM_detailAdress(String m_detailAdress) {
		this.m_detailAdress = m_detailAdress;
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
				+ ", m_email=" + m_email + ", m_zipCode=" + m_zipCode + ", m_adress=" + m_adress + ", m_detailAdress="
				+ m_detailAdress + ", m_phone=" + m_phone + ", m_gender=" + m_gender + ", m_regDate=" + m_regDate
				+ ", m_updateDate=" + m_updateDate + "]";
	}

}