관리자 권한으로 로그인하고
상품의 정보를 추가, 수정, 삭제 할 수 있도록 관리자 영역을 만들고
외부 사용자가 관리자 영역을 접근할 수 없도록 인터셉터로 처리하자

create table admin(
a_id varchar2(300) primary key,
a_pw varchar2(300) not null,
a_name varchar2(300) not null,
a_email varchar2(300) not null,
a_regDate date default sysdate,
a_updateDate date default sysdate
)

select * from admin

insert into admin (a_id, a_pw, a_name, a_email)
values ('관리자', '0000', '관리자', 'a@naver.com' )