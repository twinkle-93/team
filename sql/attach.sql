drop table attach

//////////////////////////////////////

CREATE TABLE attach(
   a_filename VARCHAR2(300) NOT NULL,
   a_num NUMBER,
   a_regdate DATE DEFAULT SYSDATE,
   a_code varchar2(300),
   a_filenum NUMBER
)

