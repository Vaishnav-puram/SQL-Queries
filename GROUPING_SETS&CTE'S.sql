--COMMON TABLE EXPRESSION CTE

SELECT * FROM [Sales].[SalesTerritory]

WITH CTE_DEMO
AS(SELECT * FROM [Sales].[SalesTerritory])
SELECT * FROM CTE_DEMO WHERE Name LIKE 'North%' OR CountryRegionCode LIKE 'US'


--GROUP BY
SELECT NAME ,NULL,NULL,SUM(SalesYTD) AS SALESSUM  FROM [Sales].[SalesTerritory] GROUP BY NAME
UNION ALL
SELECT NAME ,[Group] ,NULL,SUM(SalesYTD) AS SALESSUM  FROM [Sales].[SalesTerritory] GROUP BY NAME , [Group]
UNION ALL
SELECT NAME ,[Group] ,CountryRegionCode,SUM(SalesYTD) AS SALESSUM FROM [Sales].[SalesTerritory] GROUP BY NAME , [Group],CountryRegionCode


--GROUPING SETS WITH THIS WE CAN SIMPLIFY ABOVE EXPRESSIONS
SELECT NAME ,[Group] ,CountryRegionCode,SUM(SalesYTD) AS SALESSUM FROM [Sales].[SalesTerritory] GROUP BY
 GROUPING SETS
 (
	(Name),
	(Name,CountryRegionCode),
	(Name,CountryRegionCode,[Group])

 )


--ROLLUP WITH THIS WE CAN SIMPLIFY ABOVE EXPRESSIONS
SELECT NAME ,[Group] ,CountryRegionCode,SUM(SalesYTD) AS SALESSUM FROM [Sales].[SalesTerritory] GROUP BY
ROLLUP
(
	(Name,CountryRegionCode,[Group])
)


--CUBE
SELECT NAME ,[Group] ,CountryRegionCode,SUM(SalesYTD) AS SALESSUM FROM [Sales].[SalesTerritory] GROUP BY
CUBE
(
	(Name,CountryRegionCode,[Group])
)

