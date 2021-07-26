drop table goods

create table goods(
g_category_large varchar2(300) not null,
g_category_small varchar2(300) not null,
g_num number,
g_name varchar2(300) not null,
g_size varchar2(300) not null,
g_price number not null,
g_content varchar2(300) not null,
g_code varchar2(300) not null primary key,
g_amount number default 0,
g_regDate date default sysdate, 
g_updateDate date default sysdate,
g_filename varchar2(300),
g_likeAmount number default 0,
g_starAmount number default 0,
g_check number default 0,
g_point number default 0
)

select * from goods

delete from goods

ALTER TABLE goods ADD g_thumbnail varchar2(300);


// 테스트
SELECT a_filename FROM attach WHERE a_code = '테스트1'