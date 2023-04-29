USE [MyStoreDB]
--HOW TO PASS MULTIPLE VALUES TO A SINGLE PARAMETER IN SQL STORED PROCEDURE? - SQL STORED PROCEDURE WITH MULTI VALUED PARAMETER
SELECT EmployeeID
      ,FirstName
      ,LastName
      ,Email
      ,Phone
      ,D.DepartmentName
FROM dbo.Employee AS E
INNER JOIN dbo.Department AS D 
ON E.DepartmentID = D.DepartmentID

--Stored Procedure with multiple value for integer type column
ALTER PROCEDURE GetEmpDetailsWithParams
@EmpID as varchar(100)
AS 
BEGIN

SELECT EmployeeID
      ,FirstName
      ,LastName
      ,Email
      ,Phone
      ,D.DepartmentName
FROM dbo.Employee AS E
INNER JOIN dbo.Department AS D 
ON E.DepartmentID = D.DepartmentID
WHERE E.EmployeeID IN (SELECT * FROM string_split(@EmpID,','))

END

--execute stored procedure
EXEC GetEmpDetailsWithParams '1,2,3'

--Stored Procedure with multiple value for string type column
CREATE PROCEDURE GetEmpDetailsWithDeptParams
@DeptName as varchar(100)
AS 
BEGIN

SELECT EmployeeID
      ,FirstName
      ,LastName
      ,Email
      ,Phone
      ,D.DepartmentName
FROM dbo.Employee AS E
INNER JOIN dbo.Department AS D 
ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN (SELECT * FROM string_split(@DeptName,','))

END

--execute stored procedure
EXEC GetEmpDetailsWithDeptParams 'Executive,Finance,Human Resources'