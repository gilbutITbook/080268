USE mywork;

-- 9-1
SELECT YEAR(a.release_date), a.movie_name, a.sale_amt
  FROM box_office a
 WHERE a.ranks = 1
 ORDER BY 1;
 

-- 9-2
SELECT YEAR(a.release_date), a.movie_name, a.sale_amt, AVG(a.sale_amt)
  FROM box_office a
 WHERE a.ranks = 1
 GROUP BY 1, 2
 ORDER BY 1;
 

-- 9-3
SELECT AVG(sale_amt)
  FROM box_office
 WHERE ranks = 1;
 

-- 9-4
USE world;

SELECT a.name, a.district, a.population, a.countrycode, 
       ( SELECT b.name
           FROM country b
          WHERE a.countrycode = b.code 
       ) countryname
FROM city a;
 

-- 9-5
SELECT a.name, a.district, a.population, a.countrycode, 
       ( SELECT b.name, b.continent
           FROM country b
          WHERE a.countrycode = b.code 
       ) countryname
FROM city a;
 

-- 9-6
SELECT a.name, a.district, a.population, a.countrycode, 
       ( SELECT b.name
           FROM country b
       ) countryname
FROM city a;


-- 9-7
USE mywork;

SELECT a.dept_no, a.dept_name, b.emp_no
  FROM departments a
 INNER JOIN dept_manager b
    ON a.dept_no = b.dept_no
 WHERE SYSDATE() BETWEEN b.from_date AND b.to_date;
 

-- 9-8
SELECT a.dept_no, a.dept_name,
      ( SELECT b.emp_no
          FROM dept_manager b
         WHERE a.dept_no = b.dept_no
           AND SYSDATE() BETWEEN b.from_date AND b.to_date
      ) emp_no
  FROM departments a
 ORDER BY 1;
  

-- 9-9
SELECT b.dept_no, b.emp_no, c.first_name, c.last_name
  FROM dept_manager b, 
       employees c
 WHERE b.emp_no = c.emp_no
   AND SYSDATE() BETWEEN b.from_date AND b.to_date;
 
       
-- 9-10
SELECT a.dept_no, a.dept_name,
       mng.emp_no, mng.first_name, mng.last_name
  FROM departments a, 
      ( SELECT b.dept_no, b.emp_no, c.first_name, c.last_name
          FROM dept_manager b, 
               employees c
         WHERE b.emp_no = c.emp_no
          AND SYSDATE() BETWEEN b.from_date AND b.to_date
      ) mng
 WHERE a.dept_no = mng.dept_no
 ORDER BY 1;
  

-- 9-11
SELECT a.dept_no, a.dept_name,
       b.emp_no, c.first_name, c.last_name
  FROM departments a, 
       dept_manager b, 
       employees c
 WHERE a.dept_no = b.dept_no
   AND b.emp_no  = c.emp_no
   AND SYSDATE() BETWEEN b.from_date AND b.to_date
 ORDER BY 1;
 

-- 9-12
SELECT a.dept_no, a.dept_name,
       COUNT(*) cnt, SUM(c.salary) salary, AVG(c.salary) dept_avg
  FROM departments a, 
       dept_emp b, 
       salaries c
 WHERE a.dept_no = b.dept_no
   AND b.emp_no  = c.emp_no
   AND SYSDATE() BETWEEN b.from_date AND b.to_date
   AND SYSDATE() BETWEEN c.from_date AND c.to_date
 GROUP BY a.dept_no, a.dept_name
 ORDER BY 1;
 

-- 9-13
SELECT AVG(f.salary)
  FROM ( SELECT a.dept_no, a.dept_name,
                COUNT(*) cnt, SUM(c.salary) salary
           FROM departments a, 
                dept_emp b, 
                salaries c
          WHERE a.dept_no = b.dept_no
            AND b.emp_no  = c.emp_no
            AND SYSDATE() BETWEEN b.from_date AND b.to_date
            AND SYSDATE() BETWEEN c.from_date AND c.to_date
          GROUP BY a.dept_no, a.dept_name
       ) f ;
 
-- 9-14
SELECT YEAR(a.release_date), a.ranks, a.movie_name,
       ROUND(a.sale_amt / b.total_amt * 100,2) percentage
  FROM box_office a
 INNER JOIN (SELECT YEAR(release_date) years, SUM(sale_amt) total_amt
               FROM box_office
              WHERE YEAR(release_date) >= 2015
              GROUP BY 1
             ) b
    ON YEAR(a.release_date) = b.years
 WHERE a.ranks <= 3
 ORDER BY 1, 2;
 
 
-- 9-15
SELECT a.dept_no, a.dept_name,
       mng.emp_no, mng.first_name, mng.last_name
  FROM departments a, 
      ( SELECT b.dept_no, b.emp_no, c.first_name, c.last_name
          FROM dept_manager b, 
               employees c
         WHERE b.emp_no = c.emp_no
           AND SYSDATE() BETWEEN b.from_date AND b.to_date
           AND a.dept_no = b.dept_no
      ) mng
  ORDER BY 1;
 
 
-- 9-16  
SELECT a.dept_no, a.dept_name,
       mng.emp_no, mng.first_name, mng.last_name
  FROM departments a, 
      LATERAL 
      ( SELECT b.dept_no, b.emp_no, c.first_name, c.last_name
          FROM dept_manager b, 
               employees c
         WHERE b.emp_no = c.emp_no
           AND SYSDATE() BETWEEN b.from_date AND b.to_date
           AND a.dept_no = b.dept_no
      ) mng
  ORDER BY 1;
  
  
-- 9-17
SELECT a.dept_no, a.dept_name,
       mng.emp_no, mng.first_name, mng.last_name
  FROM departments a
 INNER JOIN LATERAL 
      ( SELECT b.dept_no, b.emp_no, c.first_name, c.last_name
          FROM dept_manager b, 
               employees c
         WHERE b.emp_no = c.emp_no
           AND SYSDATE() BETWEEN b.from_date AND b.to_date
           AND a.dept_no = b.dept_no
      ) mng
  ORDER BY 1;  
  

-- 9-18
SELECT ranks, movie_name, sale_amt
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND sale_amt >= ( SELECT MAX(sale_amt)
                       FROM box_office
                      WHERE YEAR(release_date) = 2018
                   );


-- 9-19
SELECT ranks, movie_name, sale_amt
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND sale_amt >= ( SELECT sale_amt
                       FROM box_office
                      WHERE YEAR(release_date) = 2018
                        AND ranks BETWEEN 1 AND 3
                   );
 
       
-- 9-20
SELECT ranks, movie_name, sale_amt
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND sale_amt >= ANY ( SELECT sale_amt
                           FROM box_office
                          WHERE YEAR(release_date) = 2018
                            AND ranks BETWEEN 1 AND 3
                       );
       
-- 9-21
SELECT ranks, movie_name, sale_amt
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND sale_amt >= ALL ( SELECT sale_amt
                           FROM box_office
                          WHERE YEAR(release_date) = 2018
                            AND ranks BETWEEN 1 AND 3
                       );
       
       
-- 9-22
SELECT ranks, movie_name, director
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND movie_name IN ( SELECT movie_name
                       FROM box_office
                      WHERE YEAR(release_date) = 2018
                   );
       
-- 9-23
SELECT ranks, movie_name, director
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND (movie_name, director) IN ( SELECT movie_name, director
                                     FROM box_office
                                    WHERE YEAR(release_date) = 2018
                                 );
       
-- 9-24
SELECT ranks, movie_name, release_date, sale_amt, rep_country
  FROM box_office
 WHERE YEAR(RELEASE_DATE) = 2019
   AND ranks BETWEEN 1 AND 100
   AND rep_country NOT IN ( SELECT rep_country
                              FROM box_office
                             WHERE YEAR(release_date) = 2018
                               AND ranks BETWEEN 1 AND 100
                          );
 
       
-- 9-25
SELECT ranks, movie_name, director
  FROM box_office a
 WHERE YEAR(RELEASE_DATE) = 2019
   AND EXISTS ( SELECT 1
                  FROM box_office b
                 WHERE YEAR(release_date) = 2018
                   AND a.movie_name = b.movie_name
              );
       
       
-- 9-26
SELECT ranks, movie_name, release_date, sale_amt, rep_country
  FROM box_office a
 WHERE YEAR(RELEASE_DATE) = 2019
   AND ranks BETWEEN 1 AND 100
   AND NOT EXISTS ( SELECT 1
                      FROM box_office b
                     WHERE YEAR(release_date) = 2018
                       AND ranks BETWEEN 1 AND 100
                       AND a.rep_country = b.rep_country
                  );
       
       
-- 1ºÐ ÄûÁî 2
USE world;

SELECT a.name, a.district, a.population, a.countrycode, 
       ( SELECT CONCAT(b.name, ' / ', b.continent) 
           FROM country b
          WHERE a.countrycode = b.code 
       ) countryname
FROM city a;


-- 1ºÐ ÄûÁî 3
USE mywork;

SELECT ranks, movie_name, director
  FROM box_office a
 WHERE YEAR(release_date) = 2019
   AND EXISTS ( SELECT 1
                  FROM box_office b
                 WHERE YEAR(b.release_date) = 2018
                   AND a.movie_name = b.movie_name
                   AND a.director   = b.director
              );



-- Self Check 1.
USE mywork;

SELECT YEAR(a.release_date), a.movie_name, a.sale_amt
  FROM box_office a, 
       ( SELECT AVG(sale_amt) avg_amt
           FROM box_office
          WHERE ranks = 1
       ) b
 WHERE a.ranks = 1
   AND a.sale_amt > b.avg_amt
 ORDER BY 1;
 
 
-- Self Check 2.
SELECT k.dept_no, a.emp_no, a.salary, k.sal
  FROM salaries a
      ,( SELECT b.dept_no,  MAX(c.salary) sal
           FROM dept_emp b
          INNER join salaries c
             ON b.emp_no = c.emp_no
          WHERE SYSDATE() BETWEEN c.from_date AND c.to_date
          GROUP BY 1 
        ) k
 WHERE a.salary = k.sal
 ORDER BY 1;


-- Self Check 3.
SELECT years, 
       SUM(CASE WHEN months BETWEEN  1 AND  3 THEN sal_amt ELSE 0 END) qt1_amt,
       SUM(CASE WHEN months BETWEEN  4 AND  6 THEN sal_amt ELSE 0 END) qt2_amt,
       SUM(CASE WHEN months BETWEEN  7 AND  9 THEN sal_amt ELSE 0 END) qt3_amt,
       SUM(CASE WHEN months BETWEEN 10 AND 12 THEN sal_amt ELSE 0 END) qt4_amt
 FROM (      
        SELECT YEAR(release_date) years, 
               MONTH(release_date) months, 
               SUM(sale_amt) sal_amt
          FROM box_office
         WHERE YEAR(release_date) IN (2018,2019)
         GROUP BY 1, 2
      ) a
 GROUP BY 1
 ORDER BY 1;
 
 
 
-- Self Check 4 
SELECT COUNT(*)
  FROM employees a
 WHERE NOT EXISTS ( SELECT 1
                      FROM dept_emp b
                    WHERE SYSDATE() BETWEEN b.from_date AND b.to_date
                      AND a.emp_no = b.emp_no
                  ) ;