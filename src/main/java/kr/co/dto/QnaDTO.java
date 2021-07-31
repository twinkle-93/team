package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

public class QnaDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int qna_num;
	private String qna_id;
	private String qna_title;
	private String qna_content;
	private Date qna_regDate;
	private Date qna_updateDate;
	private int qna_recnt;
	
	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaDTO(int qna_num, String qna_id, String qna_title, String qna_content, Date qna_regDate,
			Date qna_updateDate, int qna_recnt) {
		super();
		this.qna_num = qna_num;
		this.qna_id = qna_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regDate = qna_regDate;
		this.qna_updateDate = qna_updateDate;
		this.qna_recnt = qna_recnt;
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

	public int getQna_recnt() {
		return qna_recnt;
	}

	public void setQna_recnt(int qna_recnt) {
		this.qna_recnt = qna_recnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((qna_id == null) ? 0 : qna_id.hashCode());
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
		QnaDTO other = (QnaDTO) obj;
		if (qna_id == null) {
			if (other.qna_id != null)
				return false;
		} else if (!qna_id.equals(other.qna_id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "QnaDTO [qna_num=" + qna_num + ", qna_id=" + qna_id + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_regDate=" + qna_regDate + ", qna_updateDate=" + qna_updateDate + ", qna_recnt="
				+ qna_recnt + "]";
	}

	
}