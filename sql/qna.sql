drop table qna

//////////////////////////////////////

CREATE TABLE qna(
qna_num NUMBER PRIMARY KEY,
qna_id VARCHAR2(30),
qna_title VARCHAR2(30) NOT NULL,
qna_content VARCHAR2(300) NOT NULL,
qna_regDate DATE DEFAULT SYSDATE,
qna_updateDate DATE DEFAULT SYSDATE
)

SELECT * FROM qna

!
alter table qna ADD qna_recnt number default 0