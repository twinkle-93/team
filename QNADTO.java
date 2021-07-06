package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

//CREATE TABLE qna(
//qna_num NUMBER PRIMARY KEY,
//qna_id VARCHAR2(30),
//qna_pw VARCHAR2(30) NOT NULL,
//qna_title VARCHAR2(30) NOT NULL,
//qna_content VARCHAR2(300) NOT NULL,
//qna_regDate DATE DEFAULT SYSDATE,
//qna_updateDate DATE DEFAULT SYSDATE,
//CONSTRAINT fk_qna_qna_id FOREIGN KEY(qna_id) REFERENCES member(m_id) ON DELETE CASCADE
//)

public class QNADTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int qna_num;
	private String qna_id;
	private String qna_pw;
	private String qna_title;
	private String qna_content;
	private Date qna_regDate;
	private Date qna_updateDate;

	public QNADTO() {
		// TODO Auto-generated constructor stub
	}

	public QNADTO(int qna_num, String qna_id, String qna_pw, String qna_title, String qna_content, Date qna_regDate,
			Date qna_updateDate) {
		super();
		this.qna_num = qna_num;
		this.qna_id = qna_id;
		this.qna_pw = qna_pw;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regDate = qna_regDate;
		this.qna_updateDate = qna_updateDate;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}

	public String getQna_pw() {
		return qna_pw;
	}

	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_regDate() {
		return qna_regDate;
	}

	public void setQna_regDate(Date qna_regDate) {
		this.qna_regDate = qna_regDate;
	}

	public Date getQna_updateDate() {
		return qna_updateDate;
	}

	public void setQna_updateDate(Date qna_updateDate) {
		this.qna_updateDate = qna_updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((qna_content == null) ? 0 : qna_content.hashCode());
		result = prime * result + ((qna_id == null) ? 0 : qna_id.hashCode());
		result = prime * result + qna_num;
		result = prime * result + ((qna_pw == null) ? 0 : qna_pw.hashCode());
		result = prime * result + ((qna_regDate == null) ? 0 : qna_regDate.hashCode());
		result = prime * result + ((qna_title == null) ? 0 : qna_title.hashCode());
		result = prime * result + ((qna_updateDate == null) ? 0 : qna_updateDate.hashCode());
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
		QNADTO other = (QNADTO) obj;
		if (qna_content == null) {
			if (other.qna_content != null)
				return false;
		} else if (!qna_content.equals(other.qna_content))
			return false;
		if (qna_id == null) {
			if (other.qna_id != null)
				return false;
		} else if (!qna_id.equals(other.qna_id))
			return false;
		if (qna_num != other.qna_num)
			return false;
		if (qna_pw == null) {
			if (other.qna_pw != null)
				return false;
		} else if (!qna_pw.equals(other.qna_pw))
			return false;
		if (qna_regDate == null) {
			if (other.qna_regDate != null)
				return false;
		} else if (!qna_regDate.equals(other.qna_regDate))
			return false;
		if (qna_title == null) {
			if (other.qna_title != null)
				return false;
		} else if (!qna_title.equals(other.qna_title))
			return false;
		if (qna_updateDate == null) {
			if (other.qna_updateDate != null)
				return false;
		} else if (!qna_updateDate.equals(other.qna_updateDate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "QNADTO [qna_num=" + qna_num + ", qna_id=" + qna_id + ", qna_pw=" + qna_pw + ", qna_title=" + qna_title
				+ ", qna_content=" + qna_content + ", qna_regDate=" + qna_regDate + ", qna_updateDate=" + qna_updateDate
				+ "]";
	}

	
	
}
	