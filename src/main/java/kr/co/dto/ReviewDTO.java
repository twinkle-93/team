package kr.co.dto;

import java.io.Serializable;

public class ReviewDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int r_num;
	private String r_id;
	private String r_code;
	private int r_star;
	private String r_filename;
	private String r_content;
	private String r_regDate;
	private String r_updateDate;
	private String r_title;

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}


	public ReviewDTO(int r_num, String r_id, String r_code, int r_star, String r_filename, String r_content,
			String r_regDate, String r_updateDate, String r_title) {
		super();
		this.r_num = r_num;
		this.r_id = r_id;
		this.r_code = r_code;
		this.r_star = r_star;
		this.r_filename = r_filename;
		this.r_content = r_content;
		this.r_regDate = r_regDate;
		this.r_updateDate = r_updateDate;
		this.r_title = r_title;
	}


	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public int getR_star() {
		return r_star;
	}

	public void setR_star(int r_star) {
		this.r_star = r_star;
	}

	public String getR_filename() {
		return r_filename;
	}

	public void setR_filename(String r_filename) {
		this.r_filename = r_filename;
	}
	
	

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_regDate() {
		return r_regDate;
	}


	public void setR_regDate(String r_regDate) {
		this.r_regDate = r_regDate;
	}


	public String getR_updateDate() {
		return r_updateDate;
	}


	public void setR_updateDate(String r_updateDate) {
		this.r_updateDate = r_updateDate;
	}
	
	public String getR_title() {
		return r_title;
	}


	public void setR_title(String r_title) {
		this.r_title = r_title;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((r_code == null) ? 0 : r_code.hashCode());
		result = prime * result + ((r_filename == null) ? 0 : r_filename.hashCode());
		result = prime * result + ((r_id == null) ? 0 : r_id.hashCode());
		result = prime * result + r_num;
		result = prime * result + r_star;
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
		ReviewDTO other = (ReviewDTO) obj;
		if (r_code == null) {
			if (other.r_code != null)
				return false;
		} else if (!r_code.equals(other.r_code))
			return false;
		if (r_filename == null) {
			if (other.r_filename != null)
				return false;
		} else if (!r_filename.equals(other.r_filename))
			return false;
		if (r_id == null) {
			if (other.r_id != null)
				return false;
		} else if (!r_id.equals(other.r_id))
			return false;
		if (r_num != other.r_num)
			return false;
		if (r_star != other.r_star)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "ReviewDTO [r_num=" + r_num + ", r_id=" + r_id + ", r_code=" + r_code + ", r_star=" + r_star
				+ ", r_filename=" + r_filename + ", r_content=" + r_content + ", r_regDate=" + r_regDate
				+ ", r_updateDate=" + r_updateDate + ", r_title=" + r_title + "]";
	}

	
	

	

}
