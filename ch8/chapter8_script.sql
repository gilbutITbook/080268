-- 8-1
USE world;

SELECT a.id, a.name, a.countrycode, b.code, b.name country_name, 
       a.district, a.population
  FROM city a
 INNER JOIN country b
    ON a.countrycode = b.code
 ORDER BY 1  ;


-- 8-2
SELECT b.name country_name, a.language, a.isofficial, a.percentage
  FROM countrylanguage a
 INNER JOIN country b
    ON a.countrycode = b.code
 ORDER BY 1;


-- 8-3
SELECT b.name country_name, a.language, a.isofficial, a.percentage
  FROM countrylanguage a
 INNER JOIN country b
    ON a.countrycode = b.code
 WHERE a.countrycode = 'KOR'   
 ORDER BY 1;
 

-- 8-4
SELECT a.code, a.name, a.continent, a.region, a.population, b.language
  FROM country a
 INNER JOIN countrylanguage b
    ON a.code = b.countrycode 
 WHERE a.code = 'KOR'
 ORDER BY 1;
 

-- 8-5
SELECT a.code, a.name, a.continent, a.region, a.population, b.language,
       c.name, c.district, c.population
  FROM country a
 INNER JOIN countrylanguage b
    ON a.code = b.countrycode 
 INNER JOIN city c
    ON a.code = c.countrycode
 WHERE a.code = 'KOR'
 ORDER BY 1;
 
 
-- 8-6
SELECT a.code, a.name, a.continent, a.region, a.population, b.language,
       name, c.district, c.population
  FROM country a
 INNER JOIN countrylanguage b
    ON a.code = b.countrycode 
 INNER JOIN city c
    ON a.code = c.countrycode
 WHERE a.code = 'KOR'
 ORDER BY 1;
 

-- 8-7
SELECT b.name country_name, a.language, a.isofficial, a.percentage
  FROM countrylanguage a,
       country b
 WHERE a.countrycode = b.code
   AND a.countrycode = 'KOR'   
 ORDER BY 1;
 

-- 8-8
SELECT a.code, a.name, a.continent, a.region, a.population, b.language,
       c.name, c.district, c.population
  FROM country a,
       countrylanguage b,
       city c
 WHERE a.code = b.countrycode 
   AND a.code = c.countrycode
   AND a.code = 'KOR'
 ORDER BY 1;
 

-- 8-9
SELECT a.continent, COUNT(*)
  FROM country a  
 GROUP BY a.continent;
 
       
-- 8-10
SELECT a.continent, COUNT(*)
  FROM country a  
 INNER JOIN city b
    ON a.code = b.countrycode
 GROUP BY a.continent ;
 

-- 8-11
SELECT a.continent, COUNT(*)
  FROM country a  
  LEFT OUTER JOIN city b
    ON a.code = b.countrycode
 GROUP BY a.continent ;
 
 
-- 8-12
SELECT a.continent, COUNT(*) 전체건수, COUNT(b.name) 도시건수 
  FROM country a  
  LEFT OUTER JOIN city b
    ON a.code = b.countrycode
 GROUP BY a.continent ; 
 


-- 8-13
SELECT a.continent, COUNT(*) 전체건수, COUNT(b.name) 도시건수 
  FROM country a  
 RIGHT OUTER JOIN city b
    ON a.code = b.countrycode
 GROUP BY a.continent ;
 

-- 8-14
SELECT a.continent, COUNT(*) 전체건수, COUNT(b.name) 도시건수 
  FROM city b
 RIGHT OUTER JOIN country a  
    ON a.code = b.countrycode
 GROUP BY a.continent ;
 

-- 8-15
SELECT a.continent, COUNT(*) 전체건수, COUNT(b.name) 도시건수 
  FROM country a  
NATURAL JOIN city b
 GROUP BY a.continent ;
 

-- 8-16
SELECT *
  FROM city a
NATURAL JOIN countrylanguage b ;

       
-- 8-17
SELECT a.continent, COUNT(*) 전체건수, COUNT(b.name) 도시건수 
  FROM country a  
 INNER JOIN city b
 GROUP BY a.continent ;
 
       
-- 8-18
USE mywork;

CREATE TABLE tbl1 ( col1 INT, col2 VARCHAR(20));

CREATE TABLE tbl2 ( col1 INT, col2 VARCHAR(20));

INSERT INTO tbl1 VALUES (1,'가'),(2,'나'),(3,'다');

INSERT INTO tbl2 VALUES (1,'A'),(2,'B');

SELECT * FROM tbl1;

SELECT * FROM tbl2;
       
       
-- 8-19
SELECT col1
  FROM tbl1
 UNION 
SELECT col1
  FROM tbl2;
       
       
-- 8-20
SELECT col1, col2
  FROM tbl1
 UNION 
SELECT col1, col2
  FROM tbl2;
       
       
-- 8-21
SELECT col1, col2
  FROM tbl1
 UNION 
SELECT col1
  FROM tbl2;
       
-- 8-22
SELECT col1
  FROM tbl1
 UNION ALL
SELECT col1
  FROM tbl2;
       
       
-- 8-23
SELECT col1, col2
  FROM tbl1
 ORDER BY 1 DESC
 UNION 
SELECT col1, col2
  FROM tbl2;
       
       
-- 8-24
( SELECT col1, col2 FROM tbl1 ORDER BY 1 DESC )
 UNION 
SELECT col1, col2
  FROM tbl2;
       

-- 8-25
( SELECT col1, col2 FROM tbl1 ORDER BY 1 DESC LIMIT 3)
 UNION 
SELECT col1, col2
  FROM tbl2;
 
 
 
-- 8-26
USE mywork;

SELECT * 
FROM employees;

SELECT * 
FROM departments;

SELECT * 
FROM dept_emp;

-- 사원의 사번, 이름, 부서명 조회하기
SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name) emp_name,
       c.dept_name
  FROM employees a
 INNER JOIN dept_emp b
    ON a.emp_no = b.emp_no
 INNER JOIN departments c
    ON b.dept_no = c.dept_no
 ORDER BY a.emp_no;


-- 8-27
SELECT * 
FROM dept_manager;

-- Marketing과 Finance 부서의 현재 관리자 정보 조회하기
SELECT b.dept_name, a.emp_no, CONCAT(c.first_name, ' ', c.last_name) emp_name
      ,a.from_date ,a.to_date
  FROM dept_manager a
 INNER JOIN departments b
    ON a.dept_no = b.dept_no
 INNER JOIN employees c
    ON a.emp_no = c.emp_no
 WHERE b.dept_name IN ('Marketing','Finance')
   AND SYSDATE() BETWEEN a.from_date AND a.to_date;
   
   
-- 8-28
-- 모든 부서의 이름과 현재 관리자의 사번 조회하기
SELECT b.dept_name, a.emp_no, a.from_date ,a.to_date
  FROM dept_manager a
 RIGHT JOIN departments b
    ON a.dept_no = b.dept_no
 WHERE SYSDATE() BETWEEN IFNULL(a.from_date,SYSDATE())
                     AND IFNULL(a.to_date,  SYSDATE());  
                     
                     
-- 8-29
-- 부서별 사원 수와 전체 부서의 총 사원 수 구하기 
SELECT a.dept_name, count(*)
  FROM departments a
 INNER JOIN dept_emp b
    ON a.dept_no = b.dept_no
 WHERE  SYSDATE() BETWEEN b.from_date AND b.to_date
 GROUP BY a.dept_name
 UNION 
SELECT '전체', COUNT(*)
  FROM dept_emp
 WHERE SYSDATE() BETWEEN from_date AND to_date;
 
 
 
 
-- Self Check 


-- 1분 퀴즈 2
USE world;

SELECT a.name, COUNT(*)
  FROM country a
 INNER JOIN city b
    ON a.code = b.countrycode    
GROUP BY a.name WITH ROLLUP ;

-- 1분 퀴즈 3
SELECT a.name, COUNT(b.language)
  FROM country a
  LEFT JOIN countrylanguage b
    ON a.code = b.countrycode
 WHERE a.continent = 'Africa'
 GROUP BY a.name
 HAVING COUNT(b.language) = 0;
 

-- 1분 퀴즈 4
SELECT a.continent, COUNT(*) 전체건수, COUNT(b.name) 도시건수 
  FROM country a  
 CROSS JOIN city b
 GROUP BY a.continent ;
 
 
-- 1분 퀴즈 5
USE mywork;

SELECT * FROM tbl1
 UNION ALL
SELECT * FROM tbl2
 WHERE col1 = 1;

 
  


-- Self Check1
USE mywork;

SELECT a.emp_no, CONCAT(a.first_name, ' ', a.last_name) emp_name,
       c.dept_name
  FROM employees a,
       dept_emp b,
       departments c
 WHERE a.emp_no = b.emp_no
   AND b.dept_no = c.dept_no
 ORDER BY a.emp_no;



-- Self Check2
SELECT b.dept_name, a.emp_no, CONCAT(c.first_name, ' ', c.last_name) emp_name,
       a.from_date ,a.to_date
  FROM dept_manager a
 RIGHT JOIN departments b
    ON a.dept_no = b.dept_no
 LEFT JOIN employees c
    ON a.emp_no = c.emp_no
 WHERE SYSDATE() BETWEEN IFNULL(a.from_date,SYSDATE())
                     AND IFNULL(a.to_date,  SYSDATE());


-- Self Check3
SELECT a.emp_no, a.first_name, a.last_name,  a.birth_date, c.dept_name
  FROM employees a
NATURAL JOIN dept_emp b
NATURAL JOIN departments c 
 WHERE EXTRACT(YEAR_MONTH FROM a.birth_date) >= '196502';
 
   
-- Self Check4
SELECT '관리자' gubun, a.emp_no, b.salary
  FROM dept_manager a
 INNER JOIN salaries b
    ON a.emp_no = b.emp_no
 WHERE a.dept_no = 'd007'
   AND SYSDATE() BETWEEN a.from_date AND a.to_date
   AND SYSDATE() BETWEEN b.from_date AND b.to_date
UNION ALL
SELECT '사원', a.emp_no, b.salary
  FROM dept_emp a
 INNER JOIN salaries b
    ON a.emp_no = b.emp_no
 WHERE a.dept_no = 'd007'
   AND SYSDATE() BETWEEN a.from_date AND a.to_date
   AND SYSDATE() BETWEEN b.from_date AND b.to_date;
   
   