drop table notice

//////////////////////////////////////

CREATE TABLE notice(
n_num NUMBER PRIMARY KEY,
n_id VARCHAR2(100) NOT NULL,
n_title VARCHAR2(300) NOT NULL,
n_content VARCHAR2(3000) NOT NULL,
n_regdate DATE DEFAULT SYSDATE,
n_updatedate DATE DEFAULT SYSDATE,
CONSTRAINT fk_notice_n_id FOREIGN KEY(n_id) REFERENCES admin(a_id) ON DELETE CASCADE
)

SELECT * FROM notice

// member(m_id) -> admin(a_id)


delete from goods where g_code = '패딩 테스트'