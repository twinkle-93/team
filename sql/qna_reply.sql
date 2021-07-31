drop table qna_reply


CREATE TABLE qna_reply(
qna_reply_num NUMBER PRIMARY KEY,
qna_about_num NUMBER, CONSTRAINT qna_reply_fk_qna_about_num FOREIGN KEY(qna_about_num) REFERENCES qna(qna_num) on delete cascade,
qna_reply_id VARCHAR2(30),
qna_reply_content VARCHAR2(300),
qna_reply_regDate DATE DEFAULT SYSDATE,
qna_reply_updateDate  DATE DEFAULT SYSDATE
)

SELECT * FROM qna_reply