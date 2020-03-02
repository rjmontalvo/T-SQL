USE TSQL	
GO

SELECT 
	o.orderid, 
	od.productid, 
	od.unitprice, 
	od.qty,
	SUM(od.unitprice*od.qty) AS LineTotal,
	SUM(od.unitprice*od.qty) OVER(PARTITION BY o.orderid ORDER BY productid ASC
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND CURRENT ROW) AS RunningTotal
FROM
	Sales.Orders AS o
	INNER JOIN
	Sales.OrderDetails as od
	ON o.orderid = od.orderid
WHERE o.orderid = '10312'
GROUP BY o.orderid, od.productid, od.unitprice, od.qty
ORDER BY od.productid



