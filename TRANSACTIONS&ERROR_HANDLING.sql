--TRANSACTIONS
SELECT * FROM [Sales].[SalesTerritory]

BEGIN TRANSACTION
	UPDATE Sales.SalesTerritory
	SET CostYTD=1.00
	WHERE TerritoryID=1
COMMIT TRANSACTION

--@@error gives the error number of the last executed statement  @@error=0=success ,@@error>0 error occurred
DECLARE @@ERRORRESULT VARCHAR(20)
BEGIN TRANSACTION
INSERT INTO [Sales].[SalesTerritory]
           ([Name]
           ,[CountryRegionCode]
           ,[Group]
           ,[SalesYTD]
           ,[SalesLastYear]
           ,[CostYTD]
           ,[CostLastYear]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
           ('RAHUL','SE','IN',1.00,1.00,1.00,1.00,'43689A10-E30B-497F-B0DE-11DE20267FF3',GETDATE())
SET @@ERRORRESULT=@@ERROR
--PRINT @@ERROR
IF(@@ERRORRESULT=0)
  BEGIN
	PRINT 'SUCCESS!!!'
	COMMIT TRANSACTION
  END
ELSE
  --PRINT @@ERROR
  BEGIN
	PRINT 'ERROR OCCURRED!!!'
	ROLLBACK TRANSACTION
  END


--CUSTOM ERROR MESSAGE
DECLARE @@ERRORRESULT1 VARCHAR(20)
BEGIN TRANSACTION
INSERT INTO [Sales].[SalesTerritory]
           ([Name]
           ,[CountryRegionCode]
           ,[Group]
           ,[SalesYTD]
           ,[SalesLastYear]
           ,[CostYTD]
           ,[CostLastYear]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
           ('RAHUL','SE','IN',1.00,1.00,1.00,1.00,'43689A10-E30B-497F-B0DE-11DE20267FF3',GETDATE())
SET @@ERRORRESULT1=@@ERROR
IF(@@ERRORRESULT1=0)
 BEGIN
	PRINT 'SUCCESS!!!'
	COMMIT TRANSACTION
  END
ELSE
  BEGIN
	RAISERROR('STATEMENT FAILED!!!--THIS IS CUSTOM ERROR MESSAGE',17,1)
	ROLLBACK TRANSACTION
  END

--TRY AND CATCH
BEGIN TRY
BEGIN TRANSACTION
DECLARE @@ERRORRESULT2 VARCHAR(20)
BEGIN TRANSACTION
INSERT INTO [Sales].[SalesTerritory]
           ([Name]
           ,[CountryRegionCode]
           ,[Group]
           ,[SalesYTD]
           ,[SalesLastYear]
           ,[CostYTD]
           ,[CostLastYear]
           ,[rowguid]
           ,[ModifiedDate])
     VALUES
           ('RAHUL','SE','IN',1.00,1.00,1.00,1.00,'43689A10-E30B-497F-B0DE-11DE20267FF3',GETDATE())
COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT 'CATCH STATEMENT EXECUTED'
	ROLLBACK TRANSACTION
END CATCH