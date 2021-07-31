package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

public class NoticeDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int n_num;
	private String n_id;
	private String n_title;
	private String n_content;
	private Date n_regDate;
	private Date n_updateDate;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int n_num, String n_id, String n_title, String n_content, Date n_regDate, Date n_updateDate) {
		super();
		this.n_num = n_num;
		this.n_id = n_id;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_regDate = n_regDate;
		this.n_updateDate = n_updateDate;
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

	public Date getN_regDate() {
		return n_regDate;
	}

	public void setN_regDate(Date n_regDate) {
		this.n_regDate = n_regDate;
	}

	public Date getN_updateDate() {
		return n_updateDate;
	}

	public void setN_updateDate(Date n_updateDate) {
		this.n_updateDate = n_updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((n_id == null) ? 0 : n_id.hashCode());
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
		if (n_id == null) {
			if (other.n_id != null)
				return false;
		} else if (!n_id.equals(other.n_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "NoticeDTO [n_num=" + n_num + ", n_id=" + n_id + ", n_title=" + n_title + "]";
	}
	
	
}