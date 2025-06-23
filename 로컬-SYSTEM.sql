ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 기존사용자 삭제(MODEL)
drop user boardUser cascade;

-- 새로운 사용자 생성
create user boardUser identified by 123456;
    default tablespace users
    temporary tablespace temp;
    
-- 권한설정(접송요청, CURD 요청, 관리자 요청)
grant connect, resource, dba to boardUser;

-- 테이블 스페이스(데이터베이스 저장될 공간 생성)
CREATE TABLESPACE FIRSTDATA
DATAFILE 'C:\oracleexe\oradata\XE\FIRST01.DBF' SIZE 10M;

-- 테이블 스페이스(데이터베이스 저장된 공간 추가) 1m
ALTER TABLESPACE FIRSTDATA
ADD DATAFILE 'C:\oracleexe\oradata\XE\FIRST02.DBF' SIZE 1M;

-- 테이블 스페이스(데이터베이스 저장될 공간 크기 수정하는 방법 : 작게는 안된다.)
ALTER DATABASE
DATAFILE 'C:\oracleexe\oradata\XE\FIRST02.DBF' RESIZE 10M;

-- 테이블 스페이스(데이터베이스 저장될 공간 자동설정하는 방법)
alter database
datafile 'C:\oracleexe\oradata\XE\FIRST01.DBF'
autoextend on
next 1M
maxsize 20M;

--1) 시스템 권한을 가진 자가 계정을 설정 2) TEST 비밀번호 1234 3) CONNECT와 RESOURCE 와 DBA 권한;
CREATE USER TEST IDENTIFIED BY 1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE, DBA TO TEST;