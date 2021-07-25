drop table member

select * from member

m_membership varchar2(300),
m_membershipLevel number default 0,

/////////////////////////////////

create table member(
m_id varchar2(300) not null primary key,
m_pw varchar2(300) not null,
m_name varchar2(300) not null,
m_birth date not null,
m_email varchar2(300) not null,
m_zipCode varchar2(300) not null,
m_adress varchar2(300) not null,
m_detailAdress varchar2(300) not null,
m_phone varchar2(300) not null,
m_gender varchar2(300) not null,
m_regDate date default sysdate,
m_updateDate date default sysdate
)

select * from member


/////////////////////////////////
/////////////////////////////////
디폴트 값은 저장해두지 말자(수정)
m_money number DEFAULT 0,
m_point number DEFAULT 0,
m_myLike number DEFAULT 0,
m_myBasket number DEFAULT 0,
m_myLevel number DEFAULT 1,
m_exp number DEFAULT 0,
m_grade varchar2(300) not null,
m_myCoupon number DEFAULT 0
/////////////////////////////////
/////////////////////////////////
