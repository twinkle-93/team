drop table member

select * from member

delete from member

/////////////////////////////////

create table member(
m_id varchar2(300) not null primary key,
m_pw varchar2(300) not null,
m_name varchar2(300) not null,
m_point number DEFAULT 0,
m_money number DEFAULT 0,
m_birth date not null,
m_email varchar2(300) not null,
m_zipCode varchar2(300) not null,
m_address varchar2(300) not null,
m_detailaddress varchar2(300) not null,
m_phone varchar2(300) not null,
m_gender varchar2(300) not null,
m_regDate date default sysdate,
m_updateDate date default sysdate,
m_coupon number DEFAULT 1
)

update member set m_money = 1000000 where m_id = 'm003'


/////////////////////////////////
/////////////////////////////////
디폴트 값은 저장해두지 말자(수정)
m_myLike number DEFAULT 0,
m_myBasket number DEFAULT 0,
m_myLevel number DEFAULT 1,
m_exp number DEFAULT 0,
m_grade varchar2(300) not null,
m_myCoupon number DEFAULT 0
/////////////////////////////////
/////////////////////////////////
