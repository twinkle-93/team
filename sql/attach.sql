drop table attach

//////////////////////////////////////

CREATE TABLE attach(
	a_filename VARCHAR2(300) NOT NULL,
	a_num NUMBER,
	a_regdate DATE DEFAULT SYSDATE,
	a_code varchar2(300),
	a_filenum NUMBER
)

select * from attach where a_code=144


ALTER TABLE attach ADD a_filenum NUMBER;
DELETE from attach WHERE a_code = 
delete from attach