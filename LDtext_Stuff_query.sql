SELECT wonum,
  STUFF((SELECT ', ' + CAST(LTRIM(RTRIM([LDTEXT] )) AS VARCHAR(10)) [text()]
           FROM [dbo].[WO_log]
          
           FOR XML PATH(''),TYPE).value('.','NVARCHAR(MAX)'),1,2,' ') Codes
   FROM [dbo].[WO_log] where wonum='M10903457'
 Group by [WONUM]

 Select * from [dbo].[WO_log]
   SELECT WONUM,
          LEFT(cs.[LDTEXT], Len(cs.[LDTEXT]) - 1) AS Codes
   FROM   [dbo].[WO_log] SS
          CROSS APPLY (SELECT [LDTEXT] + ','
                       FROM   [dbo].[WO_log] CR
                       WHERE  CR.wonum = SS.wonum
                             -- AND CR.seat = SS.seat
                       FOR XML PATH('')) cs ([LDTEXT])
   GROUP  BY wonum,
             LEFT(cs.[LDTEXT], Len(cs.[LDTEXT]) - 1)


