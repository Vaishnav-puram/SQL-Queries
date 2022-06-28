use [AdventureWorks2012]
SELECT * FROM [HumanResources].[Department]

 SELECT Name from [HumanResources].[Department]
 select groupname from [HumanResources].[Department]
 select distinct groupname from [HumanResources].[Department]
 SELECT GROUPNAME FROM [HumanResources].[Department] WHERE GROUPNAME='Research and Development'
 SELECT DEPARTMENTID FROM [HumanResources].[Department] WHERE GROUPNAME='Research and Development'
 SELECT Name,DEPARTMENTID FROM [HumanResources].[Department] WHERE GROUPNAME LIKE'Research and Development'

 SELECT * FROM [HumanResources].[Employee]
 SELECT * FROM [HumanResources].[Employee] WHERE OrganizationLevel=2
 SELECT * FROM [HumanResources].[Employee] WHERE OrganizationLevel IN(2,3)
 SELECT * FROM [HumanResources].[Employee] WHERE JOBTITLE LIKE 'FACILITIES MANAGER'

 -- GIVE ALL THE EMPLOYEES WHO HAS WORD MANAGER IN THE JOBTITLE
 SELECT * FROM [HumanResources].[Employee] WHERE JOBTITLE LIKE '%MANAGER'

 -- GIVE ALL THE EMPLOYEES WHO HAS WORD CONTROL IN THE JOBTITLE
  SELECT * FROM [HumanResources].[Employee] WHERE JOBTITLE LIKE '%CONTROL%'

  -- GIVE ALL THE EMPLOYEES WHO ARE BORN AFTER JAN 1,1980
  SELECT * FROM [HumanResources].[Employee] WHERE BirthDate >'1/1/1980'

  -- GIVE ALL THE EMPLOYEES WHO ARE BORN BETWEEN JAN 1,1970 AND JAN 1,1980
  SELECT * FROM [HumanResources].[Employee] WHERE BirthDate >'1/1/1970' AND BirthDate <'1/1/1980'
  SELECT * FROM [HumanResources].[Employee] WHERE BirthDate BETWEEN '1/1/1970' AND '1/1/1980'

  --GIVE ALL THE EMPLOYEES ORDER BY ID
   SELECT * FROM [HumanResources].[Employee] ORDER BY BusinessEntityID

   --GIVE ALL THE EMPLOYEES ORDER BY ID IN DESCENDING ORDER
   SELECT * FROM [HumanResources].[Employee] ORDER BY BusinessEntityID DESC

   --CHANGING COLUMN NAME TEMPORARILY USING ALIAS
   SELECT LoginID AS ID from [HumanResources].[Employee]

   --ADDING TEMPORARY COLUMN WHICH INDICATES 10 HOURS INCREMENT IN VACATIONHOURS
   SELECT LoginID  ,VacationHours ,VacationHours+10 AS ExtendedVacationHours from [HumanResources].[Employee]


   --INTO IS USED TO STORE THE NEW DATA INTO NEW TABLE AS [HumanResources].[Employee2]
   SELECT LoginID  ,VacationHours ,VacationHours+10 AS ExtendedVacationHours INTO [HumanResources].[Employee2] FROM [HumanResources].[Employee]
   SELECT * FROM [HumanResources].[Employee2]

   SELECT * FROM [Production].[Product]
   SELECT NAME,LISTPRICE,LISTPRICE+10 AS NEWLISTPRICE INTO [Production].[Product_2] FROM [Production].[Product]
   SELECT * FROM [Production].[Product_2]

   --STORING NEWDATA CREATED IN A TEMPORARY TABLE USING '#'
   SELECT LoginID  ,VacationHours ,VacationHours+10 AS ExtendedVacationHours INTO #tempTable FROM [HumanResources].[Employee]
   SELECT * FROM #tempTable --WHEN SESSION CLOSED IT CAN'T ACCESSED

   --DELET DATA FROM TABLE
   SELECT * FROM [Production].[Product_2]
   DELETE FROM [Production].[Product_2] WHERE NAME LIKE 'BEARING BALL'
   SELECT * FROM [Production].[Product_2]

   --UPDATE THE DATA 
   UPDATE [Production].[Product_2] SET NAME='VAISHNAV' WHERE NAME LIKE 'ADJUSTABLE RACE'
   UPDATE [Production].[Product_2] SET LISTPRICE=20.00 WHERE NAME LIKE 'VAISHNAV'


