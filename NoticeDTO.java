package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

//CREATE TABLE notice(
//n_num NUMBER PRIMARY KEY,
//n_id VARCHAR2(100) NOT NULL,
//n_title VARCHAR2(300) NOT NULL,
//n_content VARCHAR2(3000) NOT NULL,
//n_regdate DATE DEFAULT SYSDATE,
//n_updatedate DATE DEFAULT SYSDATE,
//n_filename VARCHAR2(300),
//CONSTRAINT fk_notice_n_id FOREIGN KEY(n_id) REFERENCES member(m_id) ON DELETE CASCADE
//)

public class NoticeDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int n_num;
	private String n_id;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private Date n_updateDate;
	private String n_filename;

	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int n_num, String n_id, String n_title, String n_content, Date n_regdate, Date n_updateDate,
			String n_filename) {
		super();
		this.n_num = n_num;
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regdate = n_regdate;
		this.n_updateDate = n_updateDate;
		this.n_filename = n_filename;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_id() {
		return n_id;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}

	public Date getN_updateDate() {
		return n_updateDate;
	}

	public void setN_updateDate(Date n_updateDate) {
		this.n_updateDate = n_updateDate;
	}

	public String getN_filename() {
		return n_filename;
	}

	public void setN_filename(String n_filename) {
		this.n_filename = n_filename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((n_content == null) ? 0 : n_content.hashCode());
		result = prime * result + ((n_filename == null) ? 0 : n_filename.hashCode());
		result = prime * result + ((n_id == null) ? 0 : n_id.hashCode());
		result = prime * result + n_num;
		result = prime * result + ((n_regdate == null) ? 0 : n_regdate.hashCode());
		result = prime * result + ((n_title == null) ? 0 : n_title.hashCode());
		result = prime * result + ((n_updateDate == null) ? 0 : n_updateDate.hashCode());
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
		NoticeDTO other = (NoticeDTO) obj;
		if (n_content == null) {
			if (other.n_content != null)
				return false;
		} else if (!n_content.equals(other.n_content))
			return false;
		if (n_filename == null) {
			if (other.n_filename != null)
				return false;
		} else if (!n_filename.equals(other.n_filename))
			return false;
		if (n_id == null) {
			if (other.n_id != null)
				return false;
		} else if (!n_id.equals(other.n_id))
			return false;
		if (n_num != other.n_num)
			return false;
		if (n_regdate == null) {
			if (other.n_regdate != null)
				return false;
		} else if (!n_regdate.equals(other.n_regdate))
			return false;
		if (n_title == null) {
			if (other.n_title != null)
				return false;
		} else if (!n_title.equals(other.n_title))
			return false;
		if (n_updateDate == null) {
			if (other.n_updateDate != null)
				return false;
		} else if (!n_updateDate.equals(other.n_updateDate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "NoticeDTO [n_num=" + n_num + ", n_id=" + n_id + ", n_title=" + n_title + ", n_content=" + n_content
				+ ", n_regdate=" + n_regdate + ", n_updateDate=" + n_updateDate + ", n_filename=" + n_filename + "]";
	}

}