USE DEMO
SELECT * FROM EMPSAL

SELECT AVG(SALARY) AS AVGSALARY FROM EMPSAL 

SELECT COUNT(SALARY) FROM EMPSAL

SELECT SUM(SALARY) FROM EMPSAL

SELECT MIN(SALARY) FROM EMPSAL

SELECT MAX(SALARY) FROM EMPSAL

SELECT * FROM MYORDER

SELECT ORDERID,ORDERNAME,CONCAT(ORDERID,' ',ORDERNAME) AS CONCATORDER FROM MYORDER

SELECT ORDERID,ORDERNAME,CONCAT(ORDERID,' ',RAND()) AS CONCATORDER FROM MYORDER

--LEFT
SELECT ORDERNAME, LEFT(ORDERNAME,5) FROM MYORDER

--RIGHT
SELECT ORDERNAME, RIGHT(ORDERNAME,5) FROM MYORDER

--SUBSTRING
SELECT ORDERNAME, SUBSTRING(ORDERNAME,2,4) FROM MYORDER

--LOWER
SELECT ORDERNAME, LOWER(ORDERNAME) FROM MYORDER

--UPPER
SELECT ORDERNAME, UPPER(ORDERNAME) FROM MYORDER

--LENGTH
SELECT ORDERNAME, LEN(ORDERNAME) FROM MYORDER

SELECT ORDERNAME ,CONCAT(UPPER(LEFT(ORDERNAME,1)),LOWER(SUBSTRING(ORDERNAME,2,LEN(ORDERNAME)))) FROM MYORDER


--TRIM
SELECT '   MYTEXT        '
SELECT LEN('   MYTEXT        ')  --LENGTH IS 9
--LTRIM
SELECT LTRIM('   MYTEXT        ')
SELECT LEN(LTRIM('   MYTEXT        ')) --LENGTH IS 6
--RTRIM
SELECT RTRIM('   MYTEXT        ')
SELECT LTRIM(RTRIM('   MYTEXT        '))
SELECT LEN(LTRIM(RTRIM('   MYTEXT        ')))
