USE [Lilly_Repository_3years]
GO

insert  into  [0WorkorderAssetSegmentdrilldown_daf]

SELECT b.[Siteid] [Siteid]
	  ,b.[Asset Segment ID]
       ,b.[Asset Segment Description]
      ,a.[AssetNum][Asset Num]
      ,a.[Description][Asset Description]
      ,a.[MANUFACTURERID][Manufacturer]
      ,a.[AssetClass][Asset Class]
      ,a.[Serial][Serial#]
      ,a.[ECRRanking][Criticality (Default Descending Sort)]
      , 0 as [Total Segment Install Value]
     
  FROM [dbo].[PMO_3410012_daf] a
   left join [dbo].[0 Workorder Asset Segments_daf] b  on
  b.[Asset Segment Description]=concat(a.AssetClass,'-',a.MANUFACTURERID,'-',a.MakeModel)
  where a.SiteId='daf' and a.isflag=0 
  order by [Criticality (Default Descending Sort)]desc
  --and b.[Asset Segment Description]='INST0015-ITT PUREFLO-SEE EQUIPMENT LONG DESCRIPTION'

select * from[dbo].[0WorkorderAssetSegmentdrilldown_Daf]
select * from[dbo].[0WorkorderAssetSegmentdrilldown_Prd]

select * from[dbo].[0 Workorder Asset Segments_Daf]
select * from [dbo].[0 Workorder Asset Segments_Prd]

select concat(AssetClass,'_',MANUFACTURERID,'_',MakeModel) from PMO_3410012_prd
--truncate table [dbo].[0WorkorderAssetSegmentdrilldown_daf]

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]
where SITEID='daf'

select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
where SITEID='prd'

select * from [dbo].[0WO By AssetCriticality]