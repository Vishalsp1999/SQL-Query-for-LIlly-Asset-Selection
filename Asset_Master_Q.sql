-----insert record------
drop table AX_Asset_master

Select * into AX_Asset_master
from [HONDA_HCM_Staging].[dbo].[AX_Asset_Master]
where 1=2

insert into [Honda_Repository].[dbo].[AX_Asset_master]
select --[Id]
      [IsDeleted]
      ,[CreatedBy]
      ,[CreatedOn]
      ,[ModifiedOn]
      ,[ModifiedBy]
      ,[Name]
      ,[Description]
      ,[Manufacturer]
      ,[Serial]
      ,[Location]
      ,[Notes]
      ,[ECRRanking]
      ,[MakeModel]
      ,[SiteId]
      ,[OrgId]
      ,[AssetNum]
      ,[Vendor]
      ,[FailureCode]
      ,[PurchasePrice]
      ,[InstalledDate]
      ,[WarrantyExpDate]
      ,[TotalCost]
      ,[BudgetCost]
      ,[IsRunning]
      ,[AssetType]
      ,[StatusId]
      ,[AssetId]
      ,[SerialNum]
      ,[AssetTag]
      ,[CId]
      ,[SId]
      ,[Quantity]
      ,[DepartmentId]
      ,[IsPmOptimization]
      ,[OldECRRanking]
      ,[Ref_Asset_Number]
      ,[Ref_Parent_Number]
      ,[Ref_Parent_Asset_Number]
      ,[Ref_Id]
      ,[AssetClass]
      ,[CLASSSTRUCTUREID]
      ,[MANUFACTURERID]
      ,null as [LOCDESCRIPTION]
      ,'2022-02-01 00:00:00.000' [Effective_Startdate]
      ,'9999-12-31 23:59:59.000' [Effective_Enddate]
      ,'N' [Effective_Currentflag]
      ,'BI Team' [Updated_BY]
      ,getdate() [Updated_On]
      ,'BI Team' [Inserted_By]
      ,getdate() [Inserted_On] 
 from [Honda_Repository].[dbo].[PMO_3410012] 
 where StatusId='IN-Active'

--where assetnum  not in (select distinct assetnum from [Honda_Repository].[dbo].[AX_Asset_master] )  

select Distinct assetnum from ax_asset_master where  [Effective_Currentflag]='Y' and StatusId='A-Active'

 FROM [Honda_Repository].[dbo].[AX_Asset_Master]
  where [Updated_On]='2022-06-03 16:06:58.117'


  select * from PMO_3410012


  update [dbo].[AX_Asset_Master]
  set [Effective_Startdate]='2022-05-01 00:00:00.000'


  select * from [dbo].[AX_Asset_Master]


  select * from Client_Workorder

