-- �ڵ� 4-1
CREATE DATABASE mywork;

-- �ڵ� 4-2
CREATE DATABASE IF NOT EXISTS mywork;

-- �ڵ� 4-3
DROP DATABASE mywork;

-- �ڵ� 4-4
use mywork;

-- �ڵ� 4-5
CREATE TABLE highschool_students (
       student_no    VARCHAR(20),
       student_name  VARCHAR(100),
       grade         TINYINT,
       class         VARCHAR(50),
       gender        VARCHAR(20),
       age           SMALLINT,
       enter_date    DATE
);       


-- �ڵ� 4-6
DESCRIBE highschool_students;


-- �ڵ� 4-7
DROP TABLE highschool_students;

-- �ڵ� 4-8
CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE
);

-- �ڵ� 4-9
DESC highschool_students;

-- �ڵ� 4-10
-- ���̺� ���� 
DROP TABLE highschool_students;

-- ���̺� ����, �⺻Ű �߰�
CREATE TABLE highschool_students (
       student_no    VARCHAR(20)  NOT NULL PRIMARY KEY,
       student_name  VARCHAR(100) NOT NULL,
       grade         TINYINT          NULL,
       class         VARCHAR(50)      NULL,
       gender        VARCHAR(20)      NULL,
       age           SMALLINT         NULL,
       enter_date    DATE
);

-- ���̺� ���� ��ȸ 
DESC highschool_students;


-- �ڵ� 4-11
-- ���̺� ���� 
DROP TABLE highschool_students;

-- ���̺� ����, �⺻Ű �߰�
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


-- �ڵ� 4-12
-- ���̺� ���� 
DROP TABLE highschool_students;

-- ���̺� ����, �⺻Ű �߰�
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


-- �ڵ� 4-13
-- �⺻ Ű ����
ALTER TABLE highschool_students
DROP PRIMARY KEY ;

-- �ڵ� 4-14
-- �⺻ Ű �߰�
ALTER TABLE highschool_students
ADD PRIMARY KEY (student_no);



-- �ڵ� 4-23
SELECT COUNT(*) FROM box_office;

SELECT COUNT(*) FROM employees;

SELECT COUNT(*) FROM departments;

SELECT COUNT(*) FROM dept_manager;

SELECT COUNT(*) FROM dept_emp;

SELECT COUNT(*) FROM titles;

SELECT COUNT(*) FROM salaries;



