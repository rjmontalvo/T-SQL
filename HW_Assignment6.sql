USE TSQL
GO

CREATE OR ALTER PROC USP_Get_Order_Info(@orderid int = NULL, @custid int = NULL, @productid int =null)
AS
BEGIN
--if more than 1 parameter
IF 
	((@orderid IS NOT NULL) AND (@custid IS NOT NULL OR @productid IS NOT NULL))
	OR
	((@custid IS NOT NULL) AND (@orderid IS NOT NULL OR @productid IS NOT NULL))
	OR
	((@productid IS NOT NULL) AND (@orderid IS NOT NULL OR @custid IS NOT NULL))
	SELECT 'Too many parameters passed'
--no parameters
ELSE IF (@orderid IS NULL AND @custid IS NULL AND @productid IS NULL)
	SELECT *
	FROM Sales.Orders AS o
		LEFT OUTER JOIN
		Sales.OrderDetails AS od
	ON o.orderid = od.orderid;
--orderid
ELSE IF @orderid IS NOT NULL
	SELECT * 
	FROM Sales.Orders AS o
		JOIN
		Sales.OrderDetails AS od
		ON o.orderid = od.orderid
	WHERE o.orderid = @orderid;
--custid
ELSE IF @custid IS NOT NULL
	SELECT *
	FROM Sales.Orders AS o
		JOIN
		Sales.OrderDetails AS od
		ON o.orderid = od.orderid
	WHERE o.custid = @custid;
--productid
ELSE IF @productid IS NOT NULL
	SELECT *
	FROM Sales.Orders AS o
		JOIN
		Sales.OrderDetails AS od
		ON o.orderid = od.orderid
	WHERE o.orderid IN 
	(SELECT od.orderid 
	FROM Sales.OrderDetails AS od 
	WHERE productid = @productid);
END
GO

EXEC USP_Get_Order_Info; 
EXEC USP_Get_Order_Info @orderid = 10250; 
EXEC USP_Get_Order_Info @custid = 25; 
EXEC USP_Get_Order_INfo @productid = 10; 
EXEC USP_Get_Order_Info @orderid = 10250, @custid = 25, @productid = 10; 
EXEC USP_Get_Order_Info @orderid = 10250, @custid = 25; 
EXEC USP_Get_Order_Info @orderid = 10250, @productid = 10; 
EXEC USP_Get_Order_Info @custid = 25, @productid = 10; 