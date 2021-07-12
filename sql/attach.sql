drop table attach

//////////////////////////////////////

CREATE TABLE attach(
	a_filename VARCHAR2(300) NOT NULL,
	a_num NUMBER,
	a_regdate DATE DEFAULT SYSDATE,
	a_code varchar2(300)
)

select * from attach

ALTER TABLE attach DROP COLUMN a_filename;
ALTER TABLE attach ADD a_filenum NUMBER;
