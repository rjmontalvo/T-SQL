USE TSQL
GO

--QUERY 1 (with TOP):
SELECT DISTINCT TOP 10 c.custid AS "Customer ID", c.contactname AS "Customer Name"
FROM Sales.Customers AS c
ORDER BY custid;

--QUERY 1 (with FETCH):
SELECT DISTINCT c.custid AS "Customer ID", c.contactname AS "Customer Name"
FROM Sales.Customers AS c
ORDER BY custid
OFFSET 0 ROW
FETCH NEXT 10 ROWS ONLY;

--QUERY 2 (records 11-20)
SELECT DISTINCT c.custid AS "Customer ID", c.contactname AS "Customer Name"
FROM Sales.Customers AS c
ORDER BY custid
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

--QUERY 3 (record 21-30)
SELECT DISTINCT c.custid AS "Customer ID", c.contactname AS "Customer Name"
FROM Sales.Customers AS c
ORDER BY custid
OFFSET 20 ROWS
FETCH NEXT 10 ROWS ONLY;