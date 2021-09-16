-- 5-1
use world; -- world 데이터베이스 접속

desc city; 

-- 5-2
SELECT id, name
FROM city;

-- 5-3
SELECT id, name, countrycode, district, population
FROM city;

-- 5-4
SELECT *
FROM city;

-- 5-5
SELECT district, countrycode, name, id
FROM city;

-- 5-6 
SELECT *
FROM country;

-- 5-7
SELECT *
FROM world.country;

-- 5-8
SELECT *
FROM box_office;

-- 5-9
SELECT *
FROM mywork.box_office;

-- 5-10
SELECT *
  FROM city
 WHERE countrycode = 'KOR';
 
 
-- 5-11
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND district LIKE 'K%'; 
 
 
-- 5-12
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND district LIKE '%K';
   
   
-- 5-13
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND district LIKE '%ong%';
   
   
-- 5-14
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
    OR district LIKE '%ong%';

-- 5-15
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND 2 > 3; 
   
-- 5-16
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND NOT 2 > 3;    
   

-- 5-17
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND district IN ('seoul', 'kyonggi');


-- 5-18
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
   AND ( district ='seoul'
         OR
         district = 'kyonggi');
         
         
-- 5-19
SELECT code, name, continent, region, population
  FROM country
 WHERE population > 100000000;
 

-- 5-20
SELECT code, name, continent, region, population
  FROM country
 WHERE population >= 45000000
   AND population <= 55000000 ;
   
-- 5-21
SELECT code, name, continent, region, population
  FROM country
 WHERE population BETWEEN 45000000 AND 55000000 ;

-- 5-22
USE mywork;

SELECT *
  FROM box_office
 WHERE release_date >= '2018-01-01'
   AND release_date <= '2018-12-31'
   AND rep_country = '한국';
   
   
-- 5-23
SELECT *
  FROM box_office
 WHERE release_date BETWEEN '2019-01-01' AND '2019-12-31'
   AND audience_num >= 5000000 ;
   
   
-- 5-24
SELECT years, ranks, movie_name, release_date, audience_num, sale_amt / 100000000 AS sales
  FROM box_office
 WHERE release_date BETWEEN '2019-01-01' AND '2019-12-31'
   AND ( audience_num >= 5000000 
        OR   sale_amt >= 40000000000);  
        
-- 5-25  
USE world;

SELECT code, name, continent, region, population
  FROM country
 WHERE population > 100000000
 ORDER BY population ASC;
 
 
-- 5-26
SELECT name, continent, region 
  FROM country
 WHERE population > 50000000
 ORDER BY continent, region; 
 
 
-- 5-27
SELECT name, continent, region 
  FROM country
 WHERE population > 50000000
 ORDER BY continent, region DESC; 
 
 
-- 5-28
SELECT code, name, continent, region, population
  FROM country
 WHERE population > 100000000
 ORDER BY 5 ASC;
 
 
-- 5-29
SELECT *
  FROM country
 ORDER BY 4, 3, 2;
 
 

-- 5-30
SELECT name, continent, region 
  FROM country
 WHERE population > 50000000
 ORDER BY 4 DESC;
 
 
-- 5-31
USE mywork;

SELECT *
  FROM BOX_OFFICE
 LIMIT 10;
 
 
-- 5-32
SELECT *
  FROM box_office
 WHERE release_date BETWEEN '2019-01-01' AND '2019-12-31'
   AND audience_num >= 5000000 
 ORDER BY sale_amt DESC
 LIMIT 5;
 

-- 1분 Quiz-1
SELECT language, isofficial, percentage
  FROM countrylanguage;

-- 1분 Quiz-2
SELECT *
  FROM box_office
 WHERE years = 2012
   AND release_date >= '2019-01-01'
   AND release_date <= '2019-12-31'
  ;

-- 1분 Quiz-3
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
 ORDER BY name, population DESC;

-- 1분 Quiz-4
SELECT *
  FROM city
 WHERE countrycode = 'KOR'
 ORDER BY name, population DESC
 LIMIT 5;
 

-- Self Check 1
USE world;

SELECT *
  FROM countrylanguage
 WHERE percentage >= 99
 ORDER BY countrycode;
 
-- Self Check 2
SELECT *
  FROM mywork.box_office
 WHERE years = 2019
   AND ranks BETWEEN 1 AND 10
 ORDER BY ranks;

-- Self Check 3
USE mywork;

SELECT *
  FROM box_office
 WHERE years = 2019
   AND movie_type NOT IN ('장편','기타')
 ORDER BY ranks
  ;
  
-- Self Check 4
SELECT *
  FROM box_office
 WHERE years = 2019
 ORDER BY screen_num DESC
 LIMIT 10
  ;