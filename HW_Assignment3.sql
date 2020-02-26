USE TSQL
GO


CREATE TABLE MyData  
(C1 varchar(max)); 
GO 

INSERT INTO MyData VALUES ( 
'Four score and seven years ago our ' + 
'fathers brought forth on this continent, ' +  
'a new nation, conceived in Liberty, and ' + 
'dedicated to the proposition that ' +  
'all men are created equal.'); 
GO 

SELECT
LEFT(C1,2)+
SUBSTRING(C1,4,2)+
SUBSTRING(C1,CHARINDEX('dedicat',C1), 7)+
SUBSTRING(C1,CHARINDEX('ion',C1),3)+
SUBSTRING(C1,CHARINDEX(' to ', C1),4)+
SUBSTRING(C1,CHARINDEX('all',C1),4)+
SUBSTRING(C1,CHARINDEX('nation',C1),6)+
SUBSTRING(C1,CHARINDEX('s',C1),1)+
RIGHT(C1,1)
FROM MyData


DECLARE @D1 varchar(100) = '2019-10-09 09:10:10.123'; 
DECLARE @D2 varchar(100) = '09-10-19 09:10:10.123'; 
DECLARE @D3 varchar(100) = 'Wednesday, 09 October 2019';  

-- Display @D1 in yyyy-mm-dd format 
SELECT CAST(@D1 AS date) AS [yyyy-mm-dd]; 

-- Display @D1 in mm/dd/yyyy format 
SELECT @D1, CONVERT(varchar(100), CAST(@D1 AS DATE), 101) AS [mm/dd/yyyy];  

-- Display @D2 in mon dd yyyy hh:mmAM 
SELECT @D2, CONVERT(varchar(100), CAST(@D2 AS DATETIME), 100) AS [mon dd yyyy hh:mmAM]  

-- Display @D2 in hh:mi:ss:mmmmmmmAM  format   
SELECT @D2, CONVERT(varchar(100), CAST(@D2 AS TIME), 109) AS [hh:mi:ss:mmmmmmmAM] 

-- Display @D3 in YYYYMMDD format 
SELECT @D3, CONVERT(varchar(100), PARSE(@D3 AS DATE), 112) AS [YYYYMMDD];  

-- Display @D3 in hh:mmAM 
SELECT @D3, CONVERT(varchar(100), PARSE(@D3 AS TIME), 100) AS [hh:mmAM];   