package kr.co.dto;

public class LoginVO {

	private String m_id;
	private String m_pw;
	private String m_name;

	public LoginVO() {

	}

	public LoginVO(String m_id, String m_pw, String m_name) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
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

}
