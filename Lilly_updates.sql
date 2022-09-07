--select * into Client_workorder_DAF
--from client_workorder where SITEID='DAF'

--Select * into PMO_3410012_DAF
--from [dbo].[PMO_3410012] where siteid='DAF'

--Select * into relatedrecord_ALL from [LILLY_Repository_New].dbo.relatedrecord_ALL

Select * from [dbo].[PMO_3410012]

Select downtime from [dbo].[Client_workorder_PRD]
select * from [dbo].[AX_Segment_Metric_Facts]

select * from [dbo].[AX_Segment_Metric_Facts] order by 2

--Select * into [dbo].[AX_Asset_Saving] from [LILLY_Repository_New].
--[dbo].[AX_Asset_Metric_Facts_ALL] where 1=2

Select top 1 * from [dbo].[AX_Asset_Saving]


--update a
--set a.segmentmasterid=b.segmentmasterid
-- from [dbo].[AX_Asset_Saving] a left join AX_Segment_Metric_Facts b on a.SegmentMasterDescription
--=b.SegmentMasterDescription 

Select * from [dbo].[AX_Asset_Saving_PRD] order by 1
Select * from [dbo].[Client_workorder_PRD]
select * from [dbo].[AX_Segment_Metric_Facts] order by 1
Select * from PMO_3410012_PRD order by 1
Select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]
Select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
Select * from [dbo].[Segment_Objects]
Select * from  [dbo].[AX_Asset_Metric_Facts]



Select * from [dbo].[AX_Asset_Saving_DAF]  where siteid='DAF'
Select * from [dbo].[Client_workorder_DAF] where siteid='DAF'
select * from [dbo].[AX_Segment_Metric_Facts] where siteid='PRD' order by 2
Select * from PMO_3410012_DAF where siteid='DAF' order by 1
Select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo] where siteid='DAF'
Select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs] where siteid='DAF'
Select * from [dbo].[Segment_Objects] where siteid='DAF'
Select * from  [dbo].[AX_Asset_Metric_Facts] where siteid='DAF'


--update a
--set a.segmentmasterid=b.segmentmasterid
--Select * from [dbo].[segment_objects] a left join AX_Segment_Metric_Facts b on a.SegmentMasterDescription
--=b. and a.siteid=b.siteid

