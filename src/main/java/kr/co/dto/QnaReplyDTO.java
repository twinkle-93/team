package kr.co.dto;

import java.io.Serializable;
import java.util.Date;

public class QnaReplyDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int qna_reply_num;
	private int qna_about_num;
	private String qna_reply_id;
	private String qna_reply_content;
	private Date qna_reply_regDate;
	private Date qna_reply_updateDate;
public QnaReplyDTO() {
	// TODO Auto-generated constructor stub
}
public QnaReplyDTO(int qna_reply_num, int qna_about_num, String qna_reply_id, String qna_reply_content,
		Date qna_reply_regDate, Date qna_reply_updateDate) {
	super();
	this.qna_reply_num = qna_reply_num;
	this.qna_about_num = qna_about_num;
	this.qna_reply_id = qna_reply_id;
	this.qna_reply_content = qna_reply_content;
	this.qna_reply_regDate = qna_reply_regDate;
	this.qna_reply_updateDate = qna_reply_updateDate;
}
public int getQna_reply_num() {
	return qna_reply_num;
}
public void setQna_reply_num(int qna_reply_num) {
	this.qna_reply_num = qna_reply_num;
}
public int getQna_about_num() {
	return qna_about_num;
}
public void setQna_about_num(int qna_about_num) {
	this.qna_about_num = qna_about_num;
}
public String getQna_reply_id() {
	return qna_reply_id;
}
public void setQna_reply_id(String qna_reply_id) {
	this.qna_reply_id = qna_reply_id;
}
public String getQna_reply_content() {
	return qna_reply_content;
}
public void setQna_reply_content(String qna_reply_content) {
	this.qna_reply_content = qna_reply_content;
}
public Date getQna_reply_regDate() {
	return qna_reply_regDate;
}
public void setQna_reply_regDate(Date qna_reply_regDate) {
	this.qna_reply_regDate = qna_reply_regDate;
}
public Date getQna_reply_updateDate() {
	return qna_reply_updateDate;
}
public void setQna_reply_updateDate(Date qna_reply_updateDate) {
	this.qna_reply_updateDate = qna_reply_updateDate;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}
@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((qna_reply_id == null) ? 0 : qna_reply_id.hashCode());
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
	QnaReplyDTO other = (QnaReplyDTO) obj;
	if (qna_reply_id == null) {
		if (other.qna_reply_id != null)
			return false;
	} else if (!qna_reply_id.equals(other.qna_reply_id))
		return false;
	return true;
}


}
