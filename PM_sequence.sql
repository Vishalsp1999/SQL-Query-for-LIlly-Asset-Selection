


truncate table [dbo].[Client_PMSEQUENCE_DAF]
truncate table [dbo].[Client_PMSEQUENCE_PRD]
 insert into [dbo].[Client_PMSEQUENCE_PRD]SELECT [Pm Nbr] [PMNUM]      ,[Job Pln Nbr (Mmb Pm Sqnc)][JPNUM]      ,[Intrvl Nbr][INTERVAL]      ,null[ORGID]      ,[Site Cd][SITEID]      ,null[PMSEQUENCEID]      ,null[ROWSTAMP]      ,null[HNAACTION]      ,null[TOTALWORKUNITS]  FROM [Lilly_Straging].[dbo].[Asset Analytix PM Sequence table]  where [Site Cd]='PRD'

   select *  FROM [Lilly_Straging].[dbo].[Asset Analytix PM Sequence table]

   select * from [dbo].[Client_PMSEQUENCE_DAF]
      select * from [dbo].[Client_PMSEQUENCE_PRD]

