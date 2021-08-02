drop table coupon

/////////////////////////////////
CREATE TABLE coupon(
c_num NUMBER PRIMARY KEY,
c_name VARCHAR2(60) NOT NULL,
c_discount NUMBER NOT NULL,
c_regDate DATE DEFAULT SYSDATE,
c_endDate NUMBER DEFAULT 10,
c_totalPrice NUMBER DEFAULT 0
)

*c_endDate 수정 - 사용가능기간(일)

* 웰컴쿠폰 생성
INSERT INTO COUPON (c_num, c_name, c_discount) VALUES (1, 'WELCOM COUPON', 3000)

SELECT * FROM coupon
