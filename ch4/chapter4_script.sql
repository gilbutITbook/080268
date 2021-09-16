-- 코드 4-1
CREATE DATABASE mywork;

-- 코드 4-2
CREATE DATABASE IF NOT EXISTS mywork;

-- 코드 4-3
DROP DATABASE mywork;

-- 코드 4-4
use mywork;

-- 코드 4-5
CREATE TABLE highschool_students (
       student_no    VARCHAR(20),
       student_name  VARCHAR(100),
       grade         TINYINT,
       class         VARCHAR(50),
       gender        VARCHAR(20),
       age           SMALLINT,
       enter_date    DATE
);       


-- 코드 4-6
DESCRIBE highschool_students;


-- 코드 4-7
DROP TABLE highschool_students;

-- 코드 4-8
CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE
);

-- 코드 4-9
DESC highschool_students;

-- 코드 4-10
-- 테이블 삭제 
DROP TABLE highschool_students;

-- 테이블 생성, 기본키 추가
CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL PRIMARY KEY,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE
);

-- 테이블 구조 조회 
DESC highschool_students;


-- 코드 4-11
-- 테이블 삭제 
DROP TABLE highschool_students;

-- 테이블 생성, 기본키 추가
CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE,
       PRIMARY KEY (student_no)
);


-- 코드 4-12
-- 테이블 삭제 
DROP TABLE highschool_students;

-- 테이블 생성, 기본키 추가
CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE,
       CONSTRAINT  PRIMARY KEY (student_no)
);


-- 코드 4-13
-- 기본 키 삭제
ALTER TABLE highschool_students
DROP PRIMARY KEY ;

-- 코드 4-14
-- 기본 키 추가
ALTER TABLE highschool_students
ADD PRIMARY KEY (student_no);



-- 코드 4-23
SELECT COUNT(*) FROM box_office;

SELECT COUNT(*) FROM employees;

SELECT COUNT(*) FROM departments;

SELECT COUNT(*) FROM dept_manager;

SELECT COUNT(*) FROM dept_emp;

SELECT COUNT(*) FROM titles;

SELECT COUNT(*) FROM salaries;



