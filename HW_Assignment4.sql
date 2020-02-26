USE TSQL
GO
--------------------------------------------------------------------------------------------------------------------
--You need a SELECT statement that uses the COUNT function to return the number of unique mgrid values.  
--Grading criterial: Your SELECT statement needs to return just a single row, that contains a single integer value.  
--That integer should be the number of unique mgrid values.  Do not return a list of unique mgrid�s, 
--------------------------------------------------------------------------------------------------------------------

SELECT COUNT(DISTINCT mgrid) AS Unique_MGR_IDs
FROM HR.Employees;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--You need to write a SELECT statement that uses a subquery to returns all the companyname�s that have placed at least one order where the freight is greater than $800.00. 
--Grading Criteria:  Your SELECT statement needs to use a subquery.  If no subquery is used than you will be marked down. 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT companyname
FROM Sales.Customers AS c
WHERE custid IN (SELECT custid
		FROM Sales.Orders
		WHERE freight > 800)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--You need to write a correlated subquery that returns ALL the order information for any customer that lives in the city of Boise that has placed an order with a freight value > 800. 
--Grading Criteria:  Must use a correlated subquery to resolve this query. If no correlated subquery is used then you will be marked down. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 SELECT *
 FROM Sales.OrderDetails AS od
	LEFT OUTER JOIN Sales.Orders AS o
	ON od.orderid = o.orderid
 WHERE o.freight > 800
	AND o.custid =
		(SELECT c.custid
		FROM Sales.Customers AS c
		WHERE c.custid = o.custid AND c.city = 'Boise');

