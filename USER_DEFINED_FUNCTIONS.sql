/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[CostYTD]
      ,[CostLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[Sales].[SalesTerritory]


--USER DEFINED FUNCTIONS
CREATE FUNCTION YTDSUM()
RETURNS MONEY
AS
BEGIN
DECLARE @STORESUM MONEY 
SELECT @STORESUM =SUM(SalesYTD) FROM [Sales].[SalesTerritory]
RETURN @STORESUM
END

DECLARE @RESULT AS MONEY
SELECT @RESULT=dbo.YTDSUM()
PRINT @RESULT

--PARAMETERIZED FUNCTIONS
CREATE FUNCTION YTDSUM1
(@GROUP VARCHAR(50)) 
RETURNS MONEY
AS
BEGIN
DECLARE @YTDSUM AS MONEY
SELECT @YTDSUM=SUM(SalesYTD) FROM [Sales].[SalesTerritory]
WHERE [GROUP]= @GROUP
RETURN @YTDSUM
END

DECLARE @ANS AS MONEY
SELECT @ANS=dbo.YTDSUM1('North America')
PRINT @ANS


--FUNCTIONS RETURNING TABLES
CREATE FUNCTION MYTABLE
(@TERRITORY INT)
RETURNS TABLE
AS RETURN
SELECT Name,CountryRegionCode,[Group],SalesYTD FROM [Sales].[SalesTerritory]
WHERE [TerritoryID]=@TERRITORY

SELECT * FROM MYTABLE(7)