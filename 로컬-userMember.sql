-- 모두 입력을 해야된다.
CREATE TABLE USERMEMBER(
NO NUMBER,                -- pk
ID VARCHAR2(20) NOT NULL CHECK(REGEXP_LIKE(ID, '^[가-힣A-Za-z0-9]{3,20}$')),    -- 한글로만 이루어져 있어야 한다. 최소 3글자 최대 20자 까지 허용한다.
PWD CHAR(1000) NOT NULL,    -- content 글자사이즈는 1000자로 할당한다.
NAME VARCHAR2(50) NOT NULL CHECK(REGEXP_LIKE(NAME, '^[가-힣A-Za-z0-9]{2,10}$')),-- 한글과 영문자로 구성되어 있어야 하며, 최소 2글자 최대 10글자로 허용한다.        
REG_DATE DATE DEFAULT SYSDATE
);
ALTER TABLE USERMEMBER
ADD CONSTRAINT USERMEMBER_PK PRIMARY KEY (NO);

CREATE SEQUENCE USERMEMBER_SEQ
START WITH 1
INCREMENT BY 1;

select * from usermember;

--GENDER CHAR(1) NOT NULL CHECK(GENDER IN ('M','F')),
--SCORE NUMBER(3) NOT NULL CHECK(SCORE BETWEEN 0 AND 100),
drop table usermember;

