/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [WONUM]
      ,[CHANGEDATE]
      ,[LDTEXT]
  FROM [AMS_MAY].[dbo].[WO_log_30_06]


  	CREATE TABLE sample(dex INT, col VARCHAR(100));

INSERT INTO sample(dex, col) 
VALUES (2, 'This is line 1.' + CHAR(13)+CHAR(10) + 'This is line 2.');

SELECT *
FROM sample;