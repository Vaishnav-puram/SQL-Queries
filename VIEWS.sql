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

--VIEWS
 CREATE VIEW CUSTOMVIEW AS SELECT TERRITORYID ,NAME FROM [AdventureWorks2012].[Sales].[SalesTerritory] WHERE COUNTRYREGIONCODE LIKE 'US'
 SELECT * FROM CUSTOMVIEW 

SELECT * FROM [Sales].[SalesPerson]
 CREATE VIEW JOINTABLES_FORVIEWS AS SELECT [NAME] ,[GROUP],[SALESQUOTA] FROM [AdventureWorks2012].[Sales].[SalesTerritory] A INNER JOIN [Sales].[SalesPerson] B ON A.TERRITORYID=B.TERRITORYID WHERE [GROUP] LIKE 'NORTH AMERICA' 
 SELECT * FROM JOINTABLES_FORVIEWS

  

