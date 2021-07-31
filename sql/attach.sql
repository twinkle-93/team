drop table attach

//////////////////////////////////////

CREATE TABLE attach(
   a_num number not null,
   a_filename VARCHAR2(300) not null,
   a_code VARCHAR2(300) not null, constraint fk_attach_a_code foreign key(a_code) references goods(g_code) on delete cascade,
   a_regdate date default SYSDATE
)

delete from attach

select * from attach
