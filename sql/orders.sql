drop table orders

select * from orders

//////////////////////////////////////

create table orders (
o_id varchar2(50) NOT NULL,
o_name varchar2(50) NOT NULL,
o_number NUMBER,
o_code varchar2(50),
o_price NUMBER NOT NULL,
o_totalPrice NUMBER NOT NULL,
o_regDate DATE default SYSDATE,
o_zipCode varchar2(50),
o_address varchar2(100) NOT NULL,
o_detailAddress varchar2(100) NOT NULL,
o_phone varchar2(100) NOT NULL,
o_memo varchar2(100),
o_point NUMBER,
o_discount NUMBER,
o_paymentAmount NUMBER NOT NULL,
o_pointDiscount NUMBER,
o_amount NUMBER
)

