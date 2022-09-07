USE [Lilly_PMO]
GO
insert into [dbo].[JPassetsplink]
SELECT distinct--[JPASSETSPLINKID]
      [Job Plan][JPNUM]
      ,null[SAFETYPLANID]
      ,null[ITEMNUM]
      ,[Asset Number][ASSETNUM]
      ,[Location Code][LOCATION]
      ,null[ISDEFAULTASSETSP]
      ,null[WOREQWHENPURCH]
      ,null[WOTYPEWHENPURCH]
      ,[Organization][ORGID]
      ,[Site][SITEID]
      ,null[ITEMSETID]
      ,[JOBPLANID] [JOBPLANID]
      ,[ROWSTAMP][ROWSTAMP]
      ,[PLUSCREVNUM][PLUSCJPREVNUM]
  FROM [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan WhereUsed table] a
  join [dbo].[Client_JOBPLAN] b on a.[Job Plan]=b.jpnum and a.Site=b.SITEID
  where a.[Asset Number] is not null

 