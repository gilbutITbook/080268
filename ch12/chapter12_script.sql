-- 12-1
USE mywork;

-- ���� ���� ���̺�
CREATE TABLE covid19_country 
(
  countrycode                 VARCHAR(10) NOT NULL, 
  countryname                 VARCHAR(80) NOT NULL, 
  continent                   VARCHAR(50), 
  population                  DOUBLE,
  population_density          DOUBLE,
  median_age                  DOUBLE,
  aged_65_older               DOUBLE,
  aged_70_older               DOUBLE,
  hospital_beds_per_thousand  INT,
  PRIMARY KEY (countrycode)
);

-- �ڷγ� ������ ���̺�
CREATE TABLE covid19_data 
(
  countrycode                 VARCHAR(10) NOT NULL, 
  issue_date                  DATE        NOT NULL,  
  cases                       INT, 
  new_cases_per_million       DOUBLE, 
  deaths                      INT, 
  icu_patients                INT, 
  hosp_patients               INT, 
  tests                       INT, 
  reproduction_rate           DOUBLE, 
  new_vaccinations            INT, 
  stringency_index            DOUBLE,
  PRIMARY KEY (countrycode, issue_date)
);


-- 12-2
-- 01.covid19_country_insert.sql ���� ����  

-- 12-3
-- 02.covid19_data_insert.sql ���� ���� 


-- 12-4
SELECT COUNT(*)
  FROM covid19_country;
  
SELECT COUNT(*)
  FROM covid19_data;
  

-- 12-5
-- ���ʿ��� ������ �����ϱ� 
SELECT countrycode, countryname
  FROM covid19_country
 WHERE countrycode LIKE 'OWID%'
 ORDER BY 1;

-- 12-6
-- ����� ���� ������ ���� 
DELETE FROM covid19_country
 WHERE countrycode LIKE 'OWID%';
 
DELETE FROM covid19_data
 WHERE countrycode LIKE 'OWID%';

-- 12-7
-- ������ Į�� �� NULL ó��
UPDATE covid19_country
   SET population                 = IFNULL(population, 0)
      ,population_density         = IFNULL(population_density, 0)
      ,median_age                 = IFNULL(median_age, 0)
      ,aged_65_older              = IFNULL(aged_65_older, 0)
      ,aged_70_older              = IFNULL(aged_70_older, 0)
      ,hospital_beds_per_thousand = IFNULL(hospital_beds_per_thousand, 0);
    
UPDATE covid19_data
   SET cases                 = IFNULL(cases, 0)
      ,new_cases_per_million = IFNULL(new_cases_per_million, 0)
      ,deaths                = IFNULL(deaths, 0)
      ,icu_patients          = IFNULL(icu_patients, 0)
      ,hosp_patients         = IFNULL(hosp_patients, 0)
      ,tests                 = IFNULL(tests, 0)
      ,reproduction_rate     = IFNULL(reproduction_rate, 0)
      ,new_vaccinations      = IFNULL(new_vaccinations, 0)
      ,stringency_index      = IFNULL(stringency_index, 0);
      

-- 12-8
WITH null_check1 AS (
SELECT population + population_density + median_age + aged_65_older + 
       aged_70_older + hospital_beds_per_thousand as plus_col
  FROM covid19_country
),
null_check2 AS (
SELECT CASE WHEN plus_col IS NULL THEN 'NULL' 
            ELSE 'NOT NULL'
       END chk
  FROM null_check1
)
SELECT chk, COUNT(*)
  FROM null_check2
 GROUP BY chk  
;


-- 12-9
-- 2020�� ����� �� ���� 10���� ��ȸ
SELECT b.countryname,
       SUM(a.deaths) death_num,
       SUM(a.cases) case_num
  FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 WHERE YEAR(a.issue_date) = 2020
 GROUP BY b.countryname
 ORDER BY 2 DESC
 LIMIT 10;
       
-- 12-10
-- 2020�� �α� ��� Ȯ���� ���� ����� �� ���� ��ȸ
SELECT countryname, death_num, case_num, population, population_density, 
       ROUND(death_num / population * 100, 5) death_popul_rate,
       ROUND(case_num / population * 100, 5) case_popul_rate
  FROM ( SELECT b.countryname,
                b.population,        
                b.population_density, 
                SUM(a.deaths) death_num,
                SUM(a.cases) case_num
           FROM covid19_data a
          INNER JOIN covid19_country b
             ON a.countrycode = b.countrycode
          WHERE YEAR(a.issue_date) = 2020
          GROUP BY 1, 2, 3
          ORDER BY 4 DESC
          LIMIT 10
        ) t
 ORDER BY 6 DESC, 7 DESC  ;

-- 12-11
-- �츮������ ���� Ȯ���� ���� ����� �� ��ȸ
SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
       SUM(cases) case_num,
       SUM(deaths) death_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1 
 ORDER BY 1;
 
-- 12-12
SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
       SUM(cases) case_num,
       SUM(deaths) death_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1 WITH ROLLUP
 ORDER BY 1;
 
-- 12-13
WITH raw_data1 AS (
SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
       SUM(cases) case_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1
)
SELECT CASE WHEN months = 202001 THEN case_num ELSE 0 END "202001",
       CASE WHEN months = 202002 THEN case_num ELSE 0 END "202002",
       CASE WHEN months = 202003 THEN case_num ELSE 0 END "202003",
       CASE WHEN months = 202004 THEN case_num ELSE 0 END "202004",
       CASE WHEN months = 202005 THEN case_num ELSE 0 END "202005",
       CASE WHEN months = 202006 THEN case_num ELSE 0 END "202006",
       CASE WHEN months = 202007 THEN case_num ELSE 0 END "202007",
       CASE WHEN months = 202008 THEN case_num ELSE 0 END "202008",
       CASE WHEN months = 202009 THEN case_num ELSE 0 END "202009",
       CASE WHEN months = 202010 THEN case_num ELSE 0 END "202010",
       CASE WHEN months = 202011 THEN case_num ELSE 0 END "202011",
       CASE WHEN months = 202012 THEN case_num ELSE 0 END "202012",
       CASE WHEN months = 202101 THEN case_num ELSE 0 END "202101",
       CASE WHEN months = 202102 THEN case_num ELSE 0 END "202102"
  FROM raw_data1;


-- 12-14
WITH raw_data1 AS (
SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
       SUM(cases) case_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1
)
SELECT SUM(CASE WHEN months = 202001 THEN case_num ELSE 0 END) "202001",
       SUM(CASE WHEN months = 202002 THEN case_num ELSE 0 END) "202002",
       SUM(CASE WHEN months = 202003 THEN case_num ELSE 0 END) "202003",
       SUM(CASE WHEN months = 202004 THEN case_num ELSE 0 END) "202004",
       SUM(CASE WHEN months = 202005 THEN case_num ELSE 0 END) "202005",
       SUM(CASE WHEN months = 202006 THEN case_num ELSE 0 END) "202006",
       SUM(CASE WHEN months = 202007 THEN case_num ELSE 0 END) "202007",
       SUM(CASE WHEN months = 202008 THEN case_num ELSE 0 END) "202008",
       SUM(CASE WHEN months = 202009 THEN case_num ELSE 0 END) "202009",
       SUM(CASE WHEN months = 202010 THEN case_num ELSE 0 END) "202010",
       SUM(CASE WHEN months = 202011 THEN case_num ELSE 0 END) "202011",
       SUM(CASE WHEN months = 202012 THEN case_num ELSE 0 END) "202012",
       SUM(CASE WHEN months = 202101 THEN case_num ELSE 0 END) "202101",
       SUM(CASE WHEN months = 202102 THEN case_num ELSE 0 END) "202102"
  FROM raw_data1;
      
  

-- 12-15
-- ������, ���� Ȯ���� ���� ����� �� ��ȸ
WITH raw_data1 AS (
SELECT b.countryname,
       EXTRACT(YEAR_MONTH FROM a.issue_date) months,
       SUM(a.cases) case_num,
       SUM(a.deaths) death_num
  FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 GROUP BY 1, 2
)
SELECT countryname, 
       '1.Ȯ��' gubun,
       SUM(CASE WHEN months = 202001 THEN case_num ELSE 0 END) "202001",
       SUM(CASE WHEN months = 202002 THEN case_num ELSE 0 END) "202002",
       SUM(CASE WHEN months = 202003 THEN case_num ELSE 0 END) "202003",
       SUM(CASE WHEN months = 202004 THEN case_num ELSE 0 END) "202004",
       SUM(CASE WHEN months = 202005 THEN case_num ELSE 0 END) "202005",
       SUM(CASE WHEN months = 202006 THEN case_num ELSE 0 END) "202006",
       SUM(CASE WHEN months = 202007 THEN case_num ELSE 0 END) "202007",
       SUM(CASE WHEN months = 202008 THEN case_num ELSE 0 END) "202008",
       SUM(CASE WHEN months = 202009 THEN case_num ELSE 0 END) "202009",
       SUM(CASE WHEN months = 202010 THEN case_num ELSE 0 END) "202010",
       SUM(CASE WHEN months = 202011 THEN case_num ELSE 0 END) "202011",
       SUM(CASE WHEN months = 202012 THEN case_num ELSE 0 END) "202012",
       SUM(CASE WHEN months = 202101 THEN case_num ELSE 0 END) "202101",
       SUM(CASE WHEN months = 202102 THEN case_num ELSE 0 END) "202102"
  FROM raw_data1
 GROUP BY 1, 2
 UNION ALL
SELECT countryname, 
       '2.���' gubun,
       SUM(CASE WHEN months = 202001 THEN death_num ELSE 0 END) "202001",
       SUM(CASE WHEN months = 202002 THEN death_num ELSE 0 END) "202002",
       SUM(CASE WHEN months = 202003 THEN death_num ELSE 0 END) "202003",
       SUM(CASE WHEN months = 202004 THEN death_num ELSE 0 END) "202004",
       SUM(CASE WHEN months = 202005 THEN death_num ELSE 0 END) "202005",
       SUM(CASE WHEN months = 202006 THEN death_num ELSE 0 END) "202006",
       SUM(CASE WHEN months = 202007 THEN death_num ELSE 0 END) "202007",
       SUM(CASE WHEN months = 202008 THEN death_num ELSE 0 END) "202008",
       SUM(CASE WHEN months = 202009 THEN death_num ELSE 0 END) "202009",
       SUM(CASE WHEN months = 202010 THEN death_num ELSE 0 END) "202010",
       SUM(CASE WHEN months = 202011 THEN death_num ELSE 0 END) "202011",
       SUM(CASE WHEN months = 202012 THEN death_num ELSE 0 END) "202012",
       SUM(CASE WHEN months = 202101 THEN death_num ELSE 0 END) "202101",
       SUM(CASE WHEN months = 202102 THEN death_num ELSE 0 END) "202102"
  FROM raw_data1 
 GROUP BY 1, 2
 ORDER BY 1, 2 ;


-- 12-16
-- ������, ���� Ȯ���� ���� ����� �� ��ȸ�� �� 
CREATE OR REPLACE VIEW covid19_summary1_v AS 
WITH raw_data1 AS (
SELECT b.countryname,
       EXTRACT(YEAR_MONTH FROM a.issue_date) months,
       SUM(a.cases) case_num,
       SUM(a.deaths) death_num
  FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 GROUP BY 1, 2
)
SELECT countryname, 
       '1.Ȯ��' gubun,
       SUM(CASE WHEN months = 202001 THEN case_num ELSE 0 END) "202001",
       SUM(CASE WHEN months = 202002 THEN case_num ELSE 0 END) "202002",
       SUM(CASE WHEN months = 202003 THEN case_num ELSE 0 END) "202003",
       SUM(CASE WHEN months = 202004 THEN case_num ELSE 0 END) "202004",
       SUM(CASE WHEN months = 202005 THEN case_num ELSE 0 END) "202005",
       SUM(CASE WHEN months = 202006 THEN case_num ELSE 0 END) "202006",
       SUM(CASE WHEN months = 202007 THEN case_num ELSE 0 END) "202007",
       SUM(CASE WHEN months = 202008 THEN case_num ELSE 0 END) "202008",
       SUM(CASE WHEN months = 202009 THEN case_num ELSE 0 END) "202009",
       SUM(CASE WHEN months = 202010 THEN case_num ELSE 0 END) "202010",
       SUM(CASE WHEN months = 202011 THEN case_num ELSE 0 END) "202011",
       SUM(CASE WHEN months = 202012 THEN case_num ELSE 0 END) "202012",
       SUM(CASE WHEN months = 202101 THEN case_num ELSE 0 END) "202101",
       SUM(CASE WHEN months = 202102 THEN case_num ELSE 0 END) "202102"
  FROM raw_data1
 GROUP BY 1, 2
 UNION ALL
SELECT countryname, 
       '2.���' gubun,
       SUM(CASE WHEN months = 202001 THEN death_num ELSE 0 END) "202001",
       SUM(CASE WHEN months = 202002 THEN death_num ELSE 0 END) "202002",
       SUM(CASE WHEN months = 202003 THEN death_num ELSE 0 END) "202003",
       SUM(CASE WHEN months = 202004 THEN death_num ELSE 0 END) "202004",
       SUM(CASE WHEN months = 202005 THEN death_num ELSE 0 END) "202005",
       SUM(CASE WHEN months = 202006 THEN death_num ELSE 0 END) "202006",
       SUM(CASE WHEN months = 202007 THEN death_num ELSE 0 END) "202007",
       SUM(CASE WHEN months = 202008 THEN death_num ELSE 0 END) "202008",
       SUM(CASE WHEN months = 202009 THEN death_num ELSE 0 END) "202009",
       SUM(CASE WHEN months = 202010 THEN death_num ELSE 0 END) "202010",
       SUM(CASE WHEN months = 202011 THEN death_num ELSE 0 END) "202011",
       SUM(CASE WHEN months = 202012 THEN death_num ELSE 0 END) "202012",
       SUM(CASE WHEN months = 202101 THEN death_num ELSE 0 END) "202101",
       SUM(CASE WHEN months = 202102 THEN death_num ELSE 0 END) "202102"
  FROM raw_data1 
 GROUP BY 1, 2
 ORDER BY 1, 2 ;
 
-- �̱� ��Ȳ ��ȸ 
SELECT *
  FROM covid19_summary1_v
 WHERE countryname = 'United States';
       
-- 12-17
-- �츮������ ���� ���� Ȯ���� ���� ����� �� ��ȸ
WITH raw_data1 AS (
SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
       SUM(cases) case_num,
       SUM(deaths) death_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1
)
SELECT months, case_num, death_num, 
       SUM(case_num) OVER ( ORDER BY months) cum_case_num,
       SUM(death_num) OVER ( ORDER BY months) cum_death_num
  FROM raw_data1
 ORDER BY 1;
       
-- 12-18
-- ����� ����� �� ���� 3���� ��ȸ
WITH raw_data1 AS (
SELECT b.continent, b.countryname, 
       SUM(a.deaths) death_num,
       SUM(a.cases) case_num
  FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 GROUP BY 1, 2
),
raw_data2 AS (
SELECT continent, countryname, death_num,
       RANK() OVER ( PARTITION BY continent
                     ORDER BY death_num DESC ) ranks
  FROM raw_data1 
)
SELECT *
FROM raw_data2
WHERE ranks <= 3;


       
-- 12-19
CREATE TABLE titanic_data
(	passengerid  INT,
	survived     INT,
	pclass       INT,
	name         VARCHAR(100),
	gender       VARCHAR(50),
	age          DOUBLE,
	sibsp        INT,
	parch        INT,
	ticket       VARCHAR(80),
	fare         DOUBLE,
	cabin        VARCHAR(50) ,
	embarked     VARCHAR(20),
	PRIMARY KEY (passengerid)
);
       
       
-- 12-20
-- 03.titanic_data_insert.sql ���� ���� 
       
       
-- 12-21
SELECT *
  FROM titanic_data;  
       
-- 12-22
-- ������ ���� 
CREATE TABLE titanic AS
SELECT passengerid,
       CASE WHEN survived = 0 THEN '���'
            ELSE '����'
       END survived,
       pclass,
       name,
       CASE WHEN gender = 'male' THEN '����'
            ELSE '����'
       END gender,
       age,
       sibsp,
       parch,
       ticket,
       fare,
       cabin,
       CASE embarked WHEN 'C' THEN '������ �θ��θ�'
                     WHEN 'Q' THEN '���Ϸ��� ����Ÿ��'
                     ELSE '���� ��������'
       END embarked
  FROM titanic_data;

SELECT *
  FROM titanic;
  
    
-- 12-23
-- ���� ������ ���� ����� �� ��ȸ
SELECT gender, survived, COUNT(*)
  FROM titanic
 GROUP BY gender, survived
 ORDER BY gender, survived ;
       
       
-- 12-24
-- ���� ������ ���� ����� ���� ���� ��ȸ
SELECT gender, survived, cnt, 
       ROUND(cnt / SUM(cnt) OVER ( PARTITION BY gender 
                                   ORDER BY gender),2) rates
  FROM ( SELECT gender, survived, count(*) cnt
           FROM titanic
          GROUP BY gender, survived
       ) t ;

       
-- 12-25
-- ���ɴ뺰 ������ ���� ����� �� ��ȸ
SELECT CASE WHEN age BETWEEN  1 AND  9 THEN '1.10������' 
            WHEN age BETWEEN 10 AND 19 THEN '2.10��'
            WHEN age BETWEEN 20 AND 29 THEN '3.20��'
            WHEN age BETWEEN 30 AND 39 THEN '4.30��'
            WHEN age BETWEEN 40 AND 49 THEN '5.40��'
            WHEN age BETWEEN 50 AND 59 THEN '6.50��'
            WHEN age BETWEEN 60 AND 69 THEN '7.60��'
            ELSE '8.70�� �̻�'
       END ages,
       survived,
       COUNT(*) cnt
  FROM titanic
 GROUP BY 1, 2
 ORDER BY 1, 2;
        
       
-- 12-26
SELECT age, COUNT(*)
  FROM titanic
 GROUP BY age
 ORDER BY 1;
               
       
-- 12-27
SELECT CASE WHEN age BETWEEN  0 AND  9 THEN '1.10������' 
            WHEN age BETWEEN 10 AND 19 THEN '2.10��'
            WHEN age BETWEEN 20 AND 29 THEN '3.20��'
            WHEN age BETWEEN 30 AND 39 THEN '4.30��'
            WHEN age BETWEEN 40 AND 49 THEN '5.40��'
            WHEN age BETWEEN 50 AND 59 THEN '6.50��'
            WHEN age BETWEEN 60 AND 69 THEN '7.60��'
            WHEN age IS NULL           THEN '9.�˼�����'
            ELSE '8.70�� �̻�'
       END ages,
       survived,
       COUNT(*) cnt
  FROM titanic
 GROUP BY 1, 2
 ORDER BY 1, 2;
       
-- 12-28
-- ���ɴ뺰, ���� ��޺� ������ ���� ����� �� ��ȸ
SELECT CASE WHEN age BETWEEN  0 AND  9 THEN '1.10������' 
            WHEN age BETWEEN 10 AND 19 THEN '2.10��'
            WHEN age BETWEEN 20 AND 29 THEN '3.20��'
            WHEN age BETWEEN 30 AND 39 THEN '4.30��'
            WHEN age BETWEEN 40 AND 49 THEN '5.40��'
            WHEN age BETWEEN 50 AND 59 THEN '6.50��'
            WHEN age BETWEEN 60 AND 69 THEN '7.60��'
            WHEN age IS NULL           THEN '9.�˼�����'
            ELSE '8.70�� �̻�'
       END ages,
       pclass,
       survived,
       COUNT(*) cnt
  FROM titanic
 GROUP BY 1, 2, 3
 ORDER BY 1, 2, 3;
  
-- 12-29
WITH raw_data AS (
SELECT CASE WHEN age BETWEEN  0 AND  9 THEN '1.10������' 
            WHEN age BETWEEN 10 AND 19 THEN '2.10��'
            WHEN age BETWEEN 20 AND 29 THEN '3.20��'
            WHEN age BETWEEN 30 AND 39 THEN '4.30��'
            WHEN age BETWEEN 40 AND 49 THEN '5.40��'
            WHEN age BETWEEN 50 AND 59 THEN '6.50��'
            WHEN age BETWEEN 60 AND 69 THEN '7.60��'
            WHEN age IS NULL           THEN '9.�˼�����'
            ELSE '8.70�� �̻�'
       END ages,
       pclass,
       survived,
       COUNT(*) cnt
  FROM titanic
 GROUP BY 1, 2, 3
)
SELECT ages, survived, 
       SUM(CASE WHEN pclass = 1 THEN cnt ELSE 0 END) first_class,
       SUM(CASE WHEN pclass = 2 THEN cnt ELSE 0 END) business_class,
       SUM(CASE WHEN pclass = 3 THEN cnt ELSE 0 END) economy_class
  FROM raw_data 
 GROUP BY 1, 2
 ORDER BY 1, 2;
       
       
-- 12-30
-- ���� ���ݰ� �̵��� �� ������ ���� ����� ���� ���� ��ȸ
WITH raw_data AS (
SELECT CASE WHEN sibsp + parch > 0 THEN 'family'
            ELSE 'alone'
       END gubun,
       survived, 
       COUNT(*) cnt
  FROM titanic
 GROUP BY 1, 2
)
SELECT gubun, survived, cnt,
       cnt / SUM(cnt) OVER ( PARTITION BY gubun) gubun_rates,
       cnt / SUM(cnt) OVER ( ) total_rates
  FROM raw_data
 ORDER BY 1, 2;
       
 
 
-- 1�� ���� 1
USE mywork;

SELECT EXTRACT(YEAR_MONTH FROM issue_date) months,
       SUM(cases) / SUM(tests) * 100 test_num
  FROM covid19_data
 WHERE countrycode = 'KOR'
 GROUP BY 1
 ORDER BY 1 ;
 
-- 1�� ���� 2
SELECT embarked, 
       survived,
       COUNT(*) cnt 
  FROM titanic
 GROUP BY 1, 2
 ORDER BY 1, 2;
 

-- Self Check 1.
WITH null_check1 AS (
SELECT cases + new_cases_per_million + deaths + icu_patients + 
       hosp_patients + tests + reproduction_rate + 
       new_vaccinations + stringency_index as plus_col
  FROM covid19_data
),
null_check2 AS (
SELECT CASE WHEN plus_col IS NULL THEN 'NULL' 
            ELSE 'NOT NULL'
       END chk
  FROM null_check1
)
SELECT chk, COUNT(*)
  FROM null_check2
 GROUP BY chk  ;
 

 
-- Self Check 2.
SELECT embarked, 
       survived,
       COUNT(*) cnt,
       COUNT(*) / SUM(count(*)) OVER (PARTITION BY embarked)
  FROM titanic
 GROUP BY 1, 2
 ORDER BY 1, 2;
 

-- Self Check 3.
SELECT b.countryname,
       DATE_FORMAT(a.issue_date, '%Y/%m') months months,
       SUM(a.cases) case_num,
       SUM(a.new_vaccinations) vaccine_num
  FROM covid19_data a
 INNER JOIN covid19_country b
    ON a.countrycode = b.countrycode
 WHERE a.issue_date >= '2020-10-01'
   AND EXISTS ( SELECT 1
                  FROM ( SELECT countrycode,
                                SUM(new_vaccinations)
                           FROM covid19_data c
                          WHERE new_vaccinations > 0
                          GROUP BY 1
                          ORDER BY 2 DESC
                          LIMIT 10
                        ) c
                 WHERE a.countrycode = c.countrycode
                )
 GROUP BY 1, 2;   
 
