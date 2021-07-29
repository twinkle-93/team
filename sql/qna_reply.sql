drop table qna_reply

//////////////////////////////////////

CREATE TABLE qna_reply(
qna_reply_num NUMBER PRIMARY KEY,
qna_about_num NUMBER,
qna_reply_id VARCHAR2(30),
qna_reply_content VARCHAR2(300),
qna_reply_regDate DATE DEFAULT SYSDATE,
qna_reply_updateDate  DATE DEFAULT SYSDATE
)

select*from qna_reply