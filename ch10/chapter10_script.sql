-- 10-1
USE mywork;

CREATE TABLE emp_test (
       emp_no    INT          NOT NULL,
       emp_name  VARCHAR(30)  NOT NULL,
       hire_date DATE             NULL,
       salary    INT              NULL,
       PRIMARY KEY (emp_no) 
);
     

-- 10-2
INSERT INTO emp_test ( emp_no, emp_name, hire_date, salary )
              VALUES ( 1001, '���ν�Ÿ��', '2021-01-01', 1000);
 
SELECT *
  FROM emp_test;
  
-- 10-3
INSERT INTO emp_test ( emp_no, emp_name, hire_date )
              VALUES ( 1002, '�����۴���', '2021-02-01');
 
SELECT *
  FROM emp_test;
 

-- 10-4
INSERT INTO emp_test ( hire_date, emp_no, emp_name )
              VALUES ( '2021-02-10', 1003, '��������' );
 
SELECT *
  FROM emp_test;
 

-- 10-5
INSERT INTO emp_test ( emp_no, hire_date  )
              VALUES ( 1004, '2021-02-10' );
 

-- 10-6
INSERT INTO emp_test ( emp_no, emp_name, hire_date )
              VALUES ( 1003, '��ó�����θ�', '2021-01-10' );


-- 10-7
INSERT INTO emp_test 
              VALUES ( 1004, '��ó�����θ�', '2021-01-10', 3000 );
 
SELECT *
  FROM emp_test;
 

-- 10-8
INSERT INTO emp_test VALUES 
ROW ( 1005, '��������',  '2021-03-01', 4000 ),
ROW ( 1006, '��Ƽ��ȣŷ', '2021-03-05', 5000 );
 
SELECT *
  FROM emp_test;
  

-- 10-9
INSERT INTO emp_test VALUES 
( 1007, '����Ŭ�з�����','2021-04-01', 2200 ),
( 1008, '�ƽ���',     '2021-04-05', 3300 ),
( 1009, '�����ö�ũ',  '2021-04-05', 4400 );
 
SELECT *
  FROM emp_test;
 
       
-- 10-10
CREATE TABLE emp_test2 (
       emp_no    INT          NOT NULL,
       emp_name  VARCHAR(30)  NOT NULL,
       hire_date DATE             NULL,
       salary    INT              NULL,
       PRIMARY KEY (emp_no) 
);

  

-- 10-11
INSERT INTO emp_test2 ( emp_no, emp_name, hire_date, salary )
SELECT emp_no, emp_name, hire_date, salary
  FROM emp_test
 WHERE emp_no IN (1001,1002);
 
SELECT *
  FROM emp_test2 ;

-- 10-12
INSERT INTO emp_test2 
SELECT *
  FROM emp_test
 WHERE emp_no IN (1003,1004);
 
SELECT *
  FROM emp_test2 ;
 

-- 10-13
INSERT INTO emp_test2 ( emp_no, emp_name, hire_date, salary )
SELECT emp_no, emp_name, hire_date, salary
  FROM emp_test
 WHERE emp_no >= 1004;


-- 10-14
INSERT INTO emp_test
SELECT emp_no + 10, emp_name, hire_date, 100
  FROM emp_test
 WHERE emp_no >= 1008;
 
SELECT *
  FROM emp_test; 
 
 
-- 10-15
CREATE TABLE emp_update1
SELECT *
  FROM emp_test;
  
ALTER TABLE emp_update1
  ADD CONSTRAINT PRIMARY KEY (emp_no);
  
  
CREATE TABLE emp_update2
SELECT *
  FROM emp_test2;
  
ALTER TABLE emp_update2
  ADD CONSTRAINT PRIMARY KEY (emp_no);
  
 
 
-- 10-16  
UPDATE emp_update1
   SET emp_name = CONCAT(emp_name, '2'),
       salary   = salary + 100;
       
SELECT *
  FROM emp_update1;

  
-- 10-17
UPDATE emp_update1
   SET emp_no = emp_no + 1
 WHERE emp_no >= 1018;


-- 10-18
UPDATE emp_update1
   SET emp_no = emp_no + 1
 WHERE emp_no >= 1018
 ORDER BY emp_no DESC;
 
SELECT *
  FROM emp_update1; 

-- 10-19
UPDATE emp_update2 a, 
       emp_update1 b
   SET a.salary = b.salary + 1000
 WHERE a.emp_no = b.emp_no;
 
SELECT *
  FROM emp_update2;
 
       
-- 10-20
UPDATE emp_update2 a, 
       emp_update1 b
   SET b.salary = IFNULL(b.salary, 0),
       a.salary = b.salary + 2000
 WHERE a.emp_no = b.emp_no;
 
SELECT *
  FROM emp_update2;
  
SELECT *
  FROM emp_update1;
  
       
-- 10-21
INSERT INTO emp_update2 
SELECT emp_no, emp_name, hire_date, salary
  FROM emp_update1 a
 WHERE emp_no BETWEEN 1003 AND 1005
ON DUPLICATE KEY UPDATE emp_name = a.emp_name, 
                        salary   = a.salary;
 
SELECT *
  FROM emp_update2;
       
       
-- 10-22
CREATE TABLE emp_delete AS
SELECT *
  FROM emp_test;
  
ALTER TABLE emp_delete
ADD CONSTRAINT PRIMARY KEY (emp_no);
       
SELECT *
  FROM emp_delete;
  
  
-- 10-23
DELETE FROM emp_delete
 WHERE salary IS NULL;
 
SELECT *
  FROM emp_delete; 
 
       
-- 10-24
DELETE FROM emp_delete;
 
SELECT *
  FROM emp_delete; 
 
       
-- 10-25
INSERT INTO emp_delete
SELECT *
  FROM emp_test;
  
SELECT *
  FROM emp_delete
 ORDER BY emp_name; 
       
-- 10-26
DELETE FROM emp_delete
 WHERE emp_name = '�ƽ���'
 ORDER BY emp_no DESC
 LIMIT 1;
 
SELECT *
  FROM emp_delete
 WHERE emp_name = '�ƽ���';
 

-- 10-27
CREATE TABLE emp_delete2 AS
SELECT *
  FROM emp_test;
  
ALTER TABLE emp_delete2
ADD CONSTRAINT PRIMARY KEY (emp_no);

SELECT *
  FROM emp_delete2;
  
  
-- 10-28
DELETE a, b
  FROM emp_delete a
      ,emp_delete2 b
 WHERE a.emp_no = b.emp_no;
 
SELECT *
  FROM emp_delete;
  
SELECT *
  FROM emp_delete2;
   
   
-- 10-29
DELETE FROM emp_delete2;

INSERT INTO emp_delete 
SELECT *
  FROM emp_test
 WHERE emp_no <> 1018;
 
INSERT INTO emp_delete2 
SELECT *
  FROM emp_test;
  
SELECT *
  FROM emp_delete;
  
SELECT *
  FROM emp_delete2;
  
  
-- 10-30
DELETE FROM b
 USING emp_delete a, emp_delete2 b
 WHERE a.emp_no = b.emp_no;
  
SELECT *
  FROM emp_delete;
  
SELECT *
  FROM emp_delete2;
  
  
-- 10-31
-- autocommit Ȯ��
SELECT @@AUTOCOMMIT;

-- autocommit ��Ȱ��ȭ 
SET autocommit = 0;

-- autocommit ���� Ȯ��
SELECT @@AUTOCOMMIT;

  
-- 10-32
CREATE TABLE emp_tran1 AS
SELECT *
  FROM emp_test;
  
ALTER TABLE emp_tran1
ADD CONSTRAINT PRIMARY KEY (emp_no);  
  
CREATE TABLE emp_tran2 AS
SELECT *
  FROM emp_test;

ALTER TABLE emp_tran2
ADD CONSTRAINT PRIMARY KEY (emp_no);


-- 10-33
-- emp_tran1 ���� 
DELETE FROM emp_tran1;

-- emp_tran2 ����
DELETE FROM emp_tran2;

-- ���� ���
ROLLBACK;

-- ������ Ȯ��
SELECT *
  FROM emp_tran1;
  
SELECT *
  FROM emp_tran2;



-- 10-34
-- emp_tran1 ���� 
DELETE FROM emp_tran1;

-- ���� �ݿ�
COMMIT;

-- emp_tran2 ����
DELETE FROM emp_tran2;

-- ���� ���
ROLLBACK;

-- ������ Ȯ��
SELECT *
  FROM emp_tran1;
  
SELECT *
  FROM emp_tran2;


-- 10-35
-- autocommit Ȱ��ȭ 
SET autocommit = 1;

-- ������ �Է� 
INSERT INTO emp_tran1
SELECT *
  FROM emp_test;

-- �Է� ��� ó��   
ROLLBACK;

-- emp_tran1 ��ȸ 
SELECT *
  FROM emp_tran1;
    

-- 10-36
-- Ʈ����� ���� 
START TRANSACTION;

-- ������ ���� 
DELETE FROM emp_tran1
 WHERE emp_no >= 1006;
 
-- ������ ����
UPDATE emp_tran1
   SET salary = 0
 WHERE salary IS NULL;
 
ROLLBACK;


SELECT *
  FROM emp_tran1;
  
  
-- 10-37
START TRANSACTION;

-- savepoint A ���� 
SAVEPOINT A;

-- ����1 
DELETE FROM EMP_TRAN1 
WHERE SALARY IS NULL;

-- savepoint B ���� 
SAVEPOINT B;

-- ����2
DELETE FROM EMP_TRAN1
WHERE EMP_NAME = '�ƽ���'
ORDER BY emp_no
LIMIT 1;

-- savepoint B ���� �۾� ��� 
ROLLBACK TO SAVEPOINT B;

COMMIT;

SELECT * 
  FROM EMP_TRAN1;





  
  
-- 1�� ���� 1
USE mywork;

INSERT INTO emp_test VALUES
(2001,'�念��','2020-01-01', 1500),
(2002,'�ֹ���','2020-01-31', NULL);


-- 1�� ���� 2
UPDATE emp_update2 a, 
       emp_update1 b
   SET a.emp_name = b.emp_name
 WHERE a.emp_no = b.emp_no
   AND a.emp_no IN (1001, 1002) ;


-- 1�� ���� 3
DELETE FROM emp_delete
 WHERE emp_name = '�����ö�ũ'
 ORDER BY emp_no
 LIMIT 1;
 
 
-- 1�� ���� 4
START TRANSACTION;

-- �߸� ������ DELETE ��
DELETE FROM emp_tran2
 WHERE salary = 100;
 
-- ������ Ȯ�� 
SELECT *
  FROM emp_tran2;
  
-- ���� �۾� ���   
ROLLBACK;  


-- Self Check 1.
INSERT INTO emp_test2 ( emp_no, emp_name, hire_date, salary )
SELECT emp_no, emp_name, hire_date, salary
  FROM emp_test a
 WHERE emp_no >= 1004
   AND NOT EXISTS ( SELECT 1
                      FROM emp_test2 b
                     WHERE a.emp_no = b.emp_no) ;

 
 
-- Self Check 2.
CREATE TABLE box_office_copy AS
SELECT years, ranks, movie_name, release_date, sale_amt, audience_num, 0 last_year_audi_num
  FROM box_office
 WHERE 1 = 2;
 
INSERT INTO box_office_copy
SELECT years, ranks, movie_name, release_date, sale_amt, audience_num, 0
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND audience_num >= 8000000;

-- Self Check 3.
UPDATE box_office_copy a
      ,box_office b
  SET a.last_year_audi_num = b.audience_num
WHERE a.ranks = b.ranks
  AND YEAR(b.release_date) = 2018;
 
 
-- Self Check 4 
DELETE FROM dept_emp
 WHERE SYSDATE() NOT BETWEEN from_date AND to_date;
 
-- Self Check 5
-- 1.Ʈ����� ����
START TRANSACTION;

-- 2.box_office_copy2 ���̺� ���� 
CREATE TABLE box_office_copy2 AS
SELECT *
  FROM box_office_copy; 

-- 3.box_office_copy2 ���̺� ��ü ���� 
DELETE FROM box_office_copy2;


-- 4.2017�� 1~10�� ������ ������ INSERT 
INSERT INTO box_office_copy2
SELECT years, ranks, movie_name, release_date, sale_amt, audience_num, 0
  FROM box_office
 WHERE YEAR(release_date) = 2017
   AND ranks BETWEEN 1 AND 10;
   
-- 5.��� �۾� ���
ROLLBACK;