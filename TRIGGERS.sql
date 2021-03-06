SELECT * FROM [HumanResources].[Shift]
--TRIGGER
--CREATE TRIGGER DEMO_TRIGGER ON [HumanResources].[Shift] AFTER/BEFROE INSERT/UPDATE/DELETE
--AS 
--BEGIN
--PRINT 'INSERT IS NOT ALLOWED, YOU NEED APPROVAL'
--ROLLBACK TRANSACTION
--END
--GO

CREATE TRIGGER DEMO_TRIGGER ON [HumanResources].[Shift] AFTER INSERT
AS 
BEGIN
PRINT 'INSERT IS NOT ALLOWED, YOU NEED APPROVAL'
ROLLBACK TRANSACTION
END
GO

INSERT INTO [HumanResources].[Shift] VALUES ('VAISHNAV','08:00:00.000000','14:00:00.00000',GETDATE())

--INSERT IS NOT ALLOWED, YOU NEED APPROVAL
--Msg 3609, Level 16, State 1, Line 19
--The transaction ended in the trigger. The batch has been aborted.



--DATABASE LEVEL TRIGGER
CREATE TRIGGER DEMO_DATABASE_TRIGGER ON DATABASE AFTER CREATE_TABLE
AS 
BEGIN
PRINT 'CREATION OF NEW TABLE IS NOT ALLOWED'
ROLLBACK TRANSACTION
END
GO

CREATE TABLE MYTABLE(ROLLNO INT , NAME VARCHAR(20))

--CREATION OF NEW TABLE IS NOT ALLOWED
--Msg 3609, Level 16, State 2, Line 36
--The transaction ended in the trigger. The batch has been aborted.
