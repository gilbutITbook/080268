-- 6-1
SELECT ABS(1), ABS(-1);

-- 6-2
SELECT LENGTH('mysql');

-- 6-3
SELECT 7 % 2, 7 MOD 2, 7 / 2, 7 DIV 2;

-- 6-4
SELECT CEIL(4.5), FLOOR(4.5);

-- 6-5
SELECT LN(100), LOG(100), LOG(10, 100), LOG10(100);

-- 6-6
SELECT MOD(5,4), 5 MOD 4, 5 % 4 ;

-- 6-7
SELECT POWER(4,3), SQRT(3), SIGN(5), SIGN(-7);

-- 6-8
SELECT ROUND(2.4536, 1), ROUND(2.4536, 2), ROUND(2.4536, 3), ROUND(2.4536,0), ROUND(2.4536);

-- 6-9
SELECT ROUND(1153.456, -1), ROUND(1153.456, -2), 
       TRUNCATE(2.4536, 2), TRUNCATE(1153.456, -2);
       
-- 6-10
SELECT RAND(), RAND(3), RAND(5);

-- 6-11
SELECT CHAR_LENGTH('SQL'), LENGTH('SQL'), CHAR_LENGTH('È«±æµ¿'), LENGTH('È«±æµ¿');

-- 6-12
SELECT CONCAT('This','Is','MySQL') AS CONCAT1, 
       CONCAT('SQL',NULL, 'Books') AS CONCAT2,
       CONCAT_WS(',','This','Is','MySQL') AS CONCAT_WS;

-- 6-13
SELECT FORMAT(123456789.123456, 3) fmt, 
       INSTR('ThisIsSQL', 'sql') instring, 
       LOCATE('my', 'TheMyDBMSMySQL', 5) locates,
       POSITION('my' IN 'TheMyDBMSMySQL') pos
; 

-- 6-14
SELECT LOWER('ABcD'), LCASE('ABcD'),
       UPPER('abcD'), UCASE('abcD');

-- 6-15
SELECT LPAD('SQL',7,'#'),
       RPAD('SQL',7,'#');


-- 6-16
SELECT LTRIM('     SQL     '),
       RTRIM('     SQL     ');
       
-- 6-17
SELECT LEFT('ThisIsMySQL', 4),
       RIGHT('ThisIsMySQL', 3);
       
-- 6-18
SELECT REPEAT('SQL',3),
       REPLACE('»ýÀÏ ÃàÇÏÇØ Ã¶¼ö¾ß', 'Ã¶¼ö', '¿µÈñ') REP,
       REVERSE('SQL');
       
       
-- 6-19
SELECT SUBSTR('This Is MySQL', 6,2) FIRST,
       SUBSTRING('This Is MySQL', 6) SECOND,
       MID('This Is MySQL',-5) THIRD;
       
       
-- 6-20
SELECT TRIM('  MySQL  ') BASIC,
       TRIM(LEADING '*' FROM '***SQL***') LEFT_TRIM,
       TRIM(TRAILING '*' FROM '***SQL***') RIGHT_TRIM,
       TRIM(BOTH '*' FROM '***SQL***') BOTHS;
       
       
-- 6-21
SELECT STRCMP('MySQL','mysql') SAME,
       STRCMP('MySQL1','mysql2') SMALL,
       STRCMP('MySQL2','mysql1') LARGE;
       
-- 6-22
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE,
       CURTIME(), CURRENT_TIME(), CURRENT_TIME,
       NOW(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP;
       
-- 6-23
SELECT DAYNAME('2021-03-10'),
       DAYOFMONTH('2021-03-10'), DAY('2021-03-10'),
       DAYOFWEEK('2021-03-10'),
       DAYOFYEAR('2021-03-10');
       
       
-- 6-24
SELECT LAST_DAY('2021-03-10'),
       YEAR('2021-03-10'), 
       MONTH('2021-03-10'), 
       QUARTER('2021-03-10'),
       WEEKOFYEAR('2021-03-10');
       
-- 6-25
SELECT DATE('2021-03-10 10:23:31'),
       TIME('2021-03-10 10:23:31');       
       
-- 6-26
SELECT DATE_ADD('2021-01-20', INTERVAL 5 DAY) DATEADD,
       ADDDATE('2021-01-20', INTERVAL 5 DAY) ADD_DATE1,
       ADDDATE('2021-01-20', 5 ) ADD_DATE2;    
       
-- 6-27
SELECT DATE_ADD('2021-01-20', INTERVAL '1 2' YEAR_MONTH) DATEADD,
       ADDDATE('2021-01-20', INTERVAL '1 2' DAY_HOUR ) ADD_DATE;
       
-- 6-28
SELECT DATE_SUB('2021-01-20', INTERVAL 5 DAY) DATESUB,
       SUBDATE('2021-01-20', INTERVAL 5 DAY) SUB_DATE1,
       SUBDATE('2021-01-20', 5 ) SUB_DATE2;
       
-- 6-29
SELECT EXTRACT(YEAR_MONTH    FROM '2020-01-20 13:32:03') YEARMON,
       EXTRACT(DAY_HOUR      FROM '2020-01-20 13:32:03') DAYHOUR,
       EXTRACT(MINUTE_SECOND FROM '2020-01-20 13:32:03') MINSEC;
       
       
-- 6-30
SELECT DATEDIFF('2021-01-31','2021-01-21') Diff1,
       DATEDIFF('2021-01-31','2021-02-01') Diff2,
       DATEDIFF('2021-01-31 00:00:00','2021-01-30 23:59:59') Diff3;
       
       
-- 6-31
SELECT DATE_FORMAT('2021-01-20 13:42:54','%d-%b-%Y') Fmt1,
       DATE_FORMAT('2021-02-20 13:42:54','%U %W %j') Fmt2;
       
       
-- 6-32
SELECT STR_TO_DATE('21,01,2021','%d,%m,%Y') CONV1,
       STR_TO_DATE('19:30:17','%H:%i:%s') CONV2,
       STR_TO_DATE('19:30:17','%h:%i:%s') CONV3;


-- 6-33
SELECT MAKEDATE(2021,1) MDATE1,
       MAKEDATE(2021,100) MDATE2,
       MAKEDATE(2020,365) MDATE3;


-- 6-34
SELECT SYSDATE(), SLEEP(2), SYSDATE();

SELECT NOW(), SLEEP(2), NOW();


-- 6-35
SELECT WEEK('2021-01-03', 0) MODE0,
       WEEK('2021-01-03', 1) MODE1,
       WEEK('2021-01-03', 2) MODE2,
       WEEK('2021-01-03', 3) MODE3,
       WEEK('2021-01-03', 4) MODE4,
       WEEK('2021-01-03', 5) MODE5,
       WEEK('2021-01-03', 6) MODE6,
       WEEK('2021-01-03', 7) MODE7;
       
-- 6-36       
SELECT YEARWEEK('2021-01-03')    NOMODE,
       YEARWEEK('2021-01-03', 0) MODE0,
       YEARWEEK('2021-01-03', 1) MODE1,
       YEARWEEK('2021-01-03', 2) MODE2,
       YEARWEEK('2021-01-03', 3) MODE3,
       YEARWEEK('2021-01-03', 4) MODE4,
       YEARWEEK('2021-01-03', 5) MODE5,
       YEARWEEK('2021-01-03', 6) MODE6,
       YEARWEEK('2021-01-03', 7) MODE7;
       
-- 6-37
SELECT CAST(10 AS CHAR)                CONV_CHAR,
       CAST('-10' AS SIGNED )          CONV_INT,
       CAST('10.2131' AS DECIMAL)      CONV_DEC1,
       CAST('10.2131' AS DECIMAL(6,4)) CONV_DEC2,
       CAST('10.2131' AS DOUBLE)       CONV_DOUBLE,
       CAST('2021-10-31' AS DATE)      CONV_DATE,
       CAST('2021-10-31' AS DATETIME)  CONV_DATETIME;
       
       
-- 6-38
SELECT CONVERT(10, CHAR)                CONV_CHAR,
       CONVERT('-10', SIGNED )          CONV_INT,
       CONVERT('10.2131', DECIMAL)      CONV_DEC1,
       CONVERT('10.2131', DECIMAL(6,4)) CONV_DEC2,
       CONVERT('10.2131', DOUBLE)       CONV_DOUBLE,
       CONVERT('2021-10-31', DATE)      CONV_DATE,
       CONVERT('2021-10-31', DATETIME)  CONV_DATETIME;
       
       
-- 6-39
SELECT IF( 2 > 1, 1, 0) IF1,
       IF( 'A' = 'a', 'SAME', 'NOT SAME') IF2,
       IF( 1=2, 1, 'A') IF3;
       
       
-- 6-40
SELECT IFNULL( 1, 0) IFNULL1,
       IFNULL(NULL * 3, 0) IFNULL2;
       
       
-- 6-41
SELECT NULLIF(1, 1) NULLIF1,
       NULLIF(1, 0) NULLIF2,
       NULLIF(NULL, NULL) NULLIF3;
       
       
-- 6-42
SELECT CASE 1 WHEN 0 THEN 'A'
              WHEN 1 THEN 'B'
       END CASE1,
       CASE 9 WHEN 0 THEN 'A'
              WHEN 1 THEN 'B'
              ELSE 'None'
       END CASE2,
       CASE WHEN 25 BETWEEN 1  AND 19 THEN '10´ë'
            WHEN 25 BETWEEN 20 AND 29 THEN '20´ë'
            WHEN 25 BETWEEN 30 AND 39 THEN '30´ë'
            ELSE '30´ë ÀÌ»ó'
       END CASE3;
       
       
-- 6-43
SELECT SLEEP(5);


-- 6-44
USE mywork;

SELECT DATABASE(), SCHEMA(), USER();


-- 6-45
USE world;

SELECT code, CONCAT(name, ' (', continent, ')') names, region, population
  FROM country
 WHERE population BETWEEN 45000000 AND 55000000 ;
 

-- 6-46 
USE mywork;

SELECT years, ranks, movie_name, release_date, audience_num, ROUND(sale_amt / 100000000) AS sales
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND rep_country = 'ÇÑ±¹'
   AND audience_num >= 5000000 ; 
   
   
-- 6-47
SELECT ranks, movie_name, DAYNAME(release_date),
       CASE WHEN QUARTER(release_date) IN (1,2) THEN '»ó¹Ý±â'
            ELSE 'ÇÏ¹Ý±â'
       END case1
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND ranks <= 10
ORDER BY 1; 


-- 1ºÐ ÄûÁî 3
SELECT REPLACE('»êÅä³¢ Åä³¢¾ß', 'Åä³¢', '°ÅºÏÀÌ');

-- 1ºÐ ÄûÁî 4
SELECT DAYNAME(LAST_DAY(CURDATE()));

-- 1ºÐ ÄûÁî 5
USE world;
 
SELECT name, IFNULL(indepyear, '¾øÀ½')
  FROM country;


-- Self Check1
SELECT ADDDATE('20210512', 100) 100ÀÏ,
       ADDDATE('20210512', 500) 500ÀÏ,
       ADDDATE('20210512', 1000) 1000ÀÏ;

-- Self Check2
USE mywork;

SELECT movie_name, release_date
  FROM box_office
 WHERE EXTRACT(YEAR_MONTH FROM release_date) = '201912';

-- Self Check3
SELECT movie_name, REPLACE(director, ',', '/') directors
  FROM box_office;
  

-- Self Check4
SELECT movie_name, release_date
  FROM box_office
 WHERE YEAR(release_date) = 2019
   AND INSTR(movie_name, ':') > 0;

