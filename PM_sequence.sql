


truncate table [dbo].[Client_PMSEQUENCE_DAF]
truncate table [dbo].[Client_PMSEQUENCE_PRD]
 insert into [dbo].[Client_PMSEQUENCE_PRD]

   select *  FROM [Lilly_Straging].[dbo].[Asset Analytix PM Sequence table]

   select * from [dbo].[Client_PMSEQUENCE_DAF]
      select * from [dbo].[Client_PMSEQUENCE_PRD]
