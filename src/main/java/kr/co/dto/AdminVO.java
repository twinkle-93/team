package kr.co.dto;

public class AdminVO {
	private String a_id;
	private String a_pw;
	private String a_name;
	private String a_email;
	private String a_regDate;
	private String a_updateDate;

	public AdminVO() {

	}

	public AdminVO(String a_id, String a_pw, String a_name, String a_email, String a_regDate, String a_updateDate) {
		super();
		this.a_id = a_id;
		this.a_pw = a_pw;
		this.a_name = a_name;
		this.a_email = a_email;
		this.a_regDate = a_regDate;
		this.a_updateDate = a_updateDate;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getA_pw() {
		return a_pw;
	}

	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_email() {
		return a_email;
	}

	public void setA_email(String a_email) {
		this.a_email = a_email;
	}

	public String getA_regDate() {
		return a_regDate;
	}

	public void setA_regDate(String a_regDate) {
		this.a_regDate = a_regDate;
	}

	public String getA_updateDate() {
		return a_updateDate;
	}

	public void setA_updateDate(String a_updateDate) {
		this.a_updateDate = a_updateDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((a_id == null) ? 0 : a_id.hashCode());
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
		AdminVO other = (AdminVO) obj;
		if (a_id == null) {
			if (other.a_id != null)
				return false;
		} else if (!a_id.equals(other.a_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "adminVO [a_id=" + a_id + ", a_pw=" + a_pw + ", a_name=" + a_name + ", a_email=" + a_email
				+ ", a_regDate=" + a_regDate + ", a_updateDate=" + a_updateDate + "]";
	}

}
