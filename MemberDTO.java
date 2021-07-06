package kr.co.dto;
import java.io.Serializable;
import java.util.Date;
//create table member(
//m_id varchar2(300) primary key,
//m_pw varchar2(300) not null,
//m_name varchar2(300) not null,
//m_birth date not null,
//m_email varchar2(300) not null,
//m_zipCode varchar2(300),
//m_adress varchar2(300),
//m_detailAdress varchar2(300),
//m_phone varchar2(300) not null,
//m_gender varchar2(300) not null,
//m_money number DEFAULT 0,
//m_point number DEFAULT 0,
//m_myLike number DEFAULT 0,
//m_myBasket number DEFAULT 0,
//m_myLevel number DEFAULT 1,
//m_exp number DEFAULT 0,
//m_grade varchar2(300) not null,
//m_regDate date default sysdate,
//m_updateDate date default sysdate,
//m_membership varchar2(300) not null,
//m_membershipLevel number,
//m_myCoupon number
//)

public class MemberDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String m_id;
	private String m_pw;
	private String m_name;
	private Date m_birth;
	private String m_email;
	private String m_zipCode;
	private String m_detailAdress;
	private String m_phone;
	private String m_gender;
	private int m_money;
	private int m_point;
	private int m_myLike;
	private int m_myBasket;
	private int m_myLevel;
	private int m_exp;
	private String m_grade;
	private Date m_regDate;
	private Date m_updateDate;
	private String m_membership;
	private int m_membershipLevel;
	private int m_myCoupon;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String m_id, String m_pw, String m_name, Date m_birth, String m_email, String m_zipCode,
			String m_detailAdress, String m_phone, String m_gender, int m_money, int m_point, int m_myLike,
			int m_myBasket, int m_myLevel, int m_exp, String m_grade, Date m_regDate, Date m_updateDate,
			String m_membership, int m_membershipLevel, int m_myCoupon) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_email = m_email;
		this.m_zipCode = m_zipCode;
		this.m_detailAdress = m_detailAdress;
		this.m_phone = m_phone;
		this.m_gender = m_gender;
		this.m_money = m_money;
		this.m_point = m_point;
		this.m_myLike = m_myLike;
		this.m_myBasket = m_myBasket;
		this.m_myLevel = m_myLevel;
		this.m_exp = m_exp;
		this.m_grade = m_grade;
		this.m_regDate = m_regDate;
		this.m_updateDate = m_updateDate;
		this.m_membership = m_membership;
		this.m_membershipLevel = m_membershipLevel;
		this.m_myCoupon = m_myCoupon;
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

	public Date getM_birth() {
		return m_birth;
	}

	public void setM_birth(Date m_birth) {
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

	public int getM_myLike() {
		return m_myLike;
	}

	public void setM_myLike(int m_myLike) {
		this.m_myLike = m_myLike;
	}

	public int getM_myBasket() {
		return m_myBasket;
	}

	public void setM_myBasket(int m_myBasket) {
		this.m_myBasket = m_myBasket;
	}

	public int getM_myLevel() {
		return m_myLevel;
	}

	public void setM_myLevel(int m_myLevel) {
		this.m_myLevel = m_myLevel;
	}

	public int getM_exp() {
		return m_exp;
	}

	public void setM_exp(int m_exp) {
		this.m_exp = m_exp;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public Date getM_regDate() {
		return m_regDate;
	}

	public void setM_regDate(Date m_regDate) {
		this.m_regDate = m_regDate;
	}

	public Date getM_updateDate() {
		return m_updateDate;
	}

	public void setM_updateDate(Date m_updateDate) {
		this.m_updateDate = m_updateDate;
	}

	public String getM_membership() {
		return m_membership;
	}

	public void setM_membership(String m_membership) {
		this.m_membership = m_membership;
	}

	public int getM_membershipLevel() {
		return m_membershipLevel;
	}

	public void setM_membershipLevel(int m_membershipLevel) {
		this.m_membershipLevel = m_membershipLevel;
	}

	public int getMyCoupon() {
		return m_myCoupon;
	}

	public void setMyCoupon(int m_myCoupon) {
		this.m_myCoupon = m_myCoupon;
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
				+ ", m_email=" + m_email + ", m_zipCode=" + m_zipCode + ", m_detailAdress=" + m_detailAdress
				+ ", m_phone=" + m_phone + ", m_gender=" + m_gender + ", m_money=" + m_money + ", m_point=" + m_point
				+ ", m_myLike=" + m_myLike + ", m_myBasket=" + m_myBasket + ", m_myLevel=" + m_myLevel + ", m_exp="
				+ m_exp + ", m_grade=" + m_grade + ", m_regDate=" + m_regDate + ", m_updateDate=" + m_updateDate
				+ ", m_membership=" + m_membership + ", m_membershipLevel=" + m_membershipLevel + ", m_myCoupon="
				+ m_myCoupon + "]";
	}


	}

	
	
	
	
	
	
	
	
