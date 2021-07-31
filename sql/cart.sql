DROP TABLE cart

////////////////////////////////////

CREATE TABLE cart(
c_id number primary key,
c_m_id varchar2(300) not null, constraint fk_c_m_id foreign key(c_m_id) references member(m_id) on delete cascade,
c_g_code varchar2(300) not null, constraint fk_c_g_code foreign key(c_g_code) references goods(g_code) on delete cascade,
c_g_name varchar2(300) not null,
c_g_price number default 0,
c_amount number default 0
)
!
ALTER TABLE cart ADD c_g_point number default 0



////////////////////////////////////
////////////////////////////////////

select * from cart
ALTER TABLE cart DROP COLUMN c_g_point

delete from cart

select * from member

카트 아이디
카트를 사용중인 멤버 아이디 foreign key(c_m_id)
카트에 담긴 상품 코드 foreign key(c_g_code)
카트 수량
 