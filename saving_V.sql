drop table Saving_Oct1

select * from  Saving_July
-----------------Saving Query------------------
 select * into [KITE_Staging].dbo.Saving_Nov31 from(
select j.*,
	( (j.[Cumulative Savings Yr5] - j.min_cumulative)/ nullif((j.max_cumulative - j.min_cumulative) ,0) ) * 100 as SavingIndex
from ( select i.*,
( i.[Payback_Period 1] + i.[Payback_Period 2] + i.[Payback_Period 3] + i.[Payback_Period 4] + i.[Payback_Period 5] ) as  'Payback (In Years)' ,
min(i.[Cumulative Savings Yr5])over() min_cumulative,
max(i.[Cumulative Savings Yr5])over() max_cumulative
from (
select h.*,
(h.[Cumulative Cash Flow Y4] + h.[Cumulative Total MC Yr5]) as 'Cumulative Cash Flow Y5',
round(case when (h.[Exercise cost] < 0 and h.[Cumulative Cash Flow Y1] > 0 ) then (0 + ((-h.[Exercise cost])/ h.[Cumulative Total MC Yr1])) else 0 end,2) 'Payback_Period 1',
round(case when (h.[Cumulative Cash Flow Y1] < 0 and h.[Cumulative Cash Flow Y2] > 0 ) then (1 + ((-h.[Cumulative Cash Flow Y1])/ h.[Cumulative Total MC Yr2])) else 0 end,2) 'Payback_Period 2',
round(case when (h.[Cumulative Cash Flow Y2] < 0 and h.[Cumulative Cash Flow Y3] > 0 ) then (2 + ((-h.[Cumulative Cash Flow Y2])/ h.[Cumulative Total MC Yr3])) else 0 end,2) 'Payback_Period 3',
round(case when (h.[Cumulative Cash Flow Y3] < 0 and h.[Cumulative Cash Flow Y4] > 0 ) then (3 + ((-h.[Cumulative Cash Flow Y3])/ h.[Cumulative Total MC Yr4])) else 0 end,2) 'Payback_Period 4' ,
round(case when (h.[Cumulative Cash Flow Y4] < 0 and (h.[Cumulative Cash Flow Y4] + h.[Cumulative Total MC Yr5]) > 0 ) then (4 + ((-h.[Cumulative Cash Flow Y4])/ h.[Cumulative Total MC Yr5])) else 0 end,2) 'Payback_Period 5'
from( select g.*,
(g.[Cumulative Cash Flow Y3] + g.[Cumulative Total MC Yr4]) as 'Cumulative Cash Flow Y4'
from( select f.*,
(f.[Cumulative Cash Flow Y2] + f.[Cumulative Total MC Yr3]) as 'Cumulative Cash Flow Y3'
from ( select e.*,
(e.[Cumulative Cash Flow Y1] + e.[Cumulative Total MC Yr2]) as 'Cumulative Cash Flow Y2'
from ( select d.*,
(d.[Cumulative Total MC Yr1]) as 'Cumulative Savings Yr1',
(d.[Cumulative Total MC Yr1] + d.[Cumulative Total MC Yr2]) as 'Cumulative Savings Yr2',
(d.[Cumulative Total MC Yr1] + d.[Cumulative Total MC Yr2] + d.[Cumulative Total MC Yr3]) as 'Cumulative Savings Yr3',
(d.[Cumulative Total MC Yr1] + d.[Cumulative Total MC Yr2] + d.[Cumulative Total MC Yr3] + d.[Cumulative Total MC Yr4]) as 'Cumulative Savings Yr4',
(d.[Cumulative Total MC Yr1] + d.[Cumulative Total MC Yr2] + d.[Cumulative Total MC Yr3] + d.[Cumulative Total MC Yr4] + d.[Cumulative Total MC Yr5]) as 'Cumulative Savings Yr5',
(-20000) as 'Exercise cost',
((-20000) + d.[Cumulative Total MC Yr1]) as 'Cumulative Cash Flow Y1'
from ( select c.*, 
	(c.[Decreased SDT Hrs] * 1200) as 'Scheduled DT Savings',
	(c.PMRM - (c.[Total MC (After PMO)] + c.[RM Cost (After ) Yr1]) + c.[Unscheduled DT Saving Yr1] + (c.[Decreased SDT Hrs] * 1200)) as 'Cumulative Total MC Yr1' ,
	(c.PMRM - (c.[Total MC (After PMO)] + c.[RM Cost (After ) Yr2]) + c.[Unscheduled DT Saving Yr2] + (c.[Decreased SDT Hrs] * 1200)) as 'Cumulative Total MC Yr2' ,
	(c.PMRM - (c.[Total MC (After PMO)] + c.[RM Cost (After ) Yr3]) + c.[Unscheduled DT Saving Yr3] + (c.[Decreased SDT Hrs] * 1200)) as 'Cumulative Total MC Yr3' ,
	(c.PMRM - (c.[Total MC (After PMO)] + c.[RM Cost (After ) Yr4]) + c.[Unscheduled DT Saving Yr4] + (c.[Decreased SDT Hrs] * 1200)) as 'Cumulative Total MC Yr4' ,
	(c.PMRM - (c.[Total MC (After PMO)] + c.[RM Cost (After ) Yr5]) + c.[Unscheduled DT Saving Yr5] + (c.[Decreased SDT Hrs] * 1200)) as 'Cumulative Total MC Yr5'

from  ( select b.*,
		(b.Reduction_in_Unscheduled_DT_Hrs_yr1 * 1683) as 'Unscheduled DT Saving Yr1',
		(b.Reduction_in_Unscheduled_DT_Hrs_yr2 * 1683) as 'Unscheduled DT Saving Yr2',
		(b.Reduction_in_Unscheduled_DT_Hrs_yr3 * 1683) as 'Unscheduled DT Saving Yr3',
		(b.Reduction_in_Unscheduled_DT_Hrs_yr4 * 1683) as 'Unscheduled DT Saving Yr4',
		(b.Reduction_in_Unscheduled_DT_Hrs_yr5 * 1683) as 'Unscheduled DT Saving Yr5',
		(b.[pmdowntime] - b.[Sched DT Hrs After]) as 'Decreased SDT Hrs' ,
		(b.[PM Labor (After)] + b.[PM Spares (After)]) as 'Total MC (After PMO)'  
from (select a.*,
	([GBDowntime] * 0.01) as 'Reduction_in_Unscheduled_DT_Hrs_yr1' ,
	([GBDowntime] * 0.07) as 'Reduction_in_Unscheduled_DT_Hrs_yr2' ,
	([GBDowntime] * 0.13) as 'Reduction_in_Unscheduled_DT_Hrs_yr3' ,
	([GBDowntime] * 0.17) as 'Reduction_in_Unscheduled_DT_Hrs_yr4' ,
	([GBDowntime] * 0.2) as 'Reduction_in_Unscheduled_DT_Hrs_yr5',
	([pmdowntime] - ([pmdowntime] * 0.35)) as 'Sched DT Hrs After',
	([pmlaborcost] - ([pmlaborcost] * 0.25)) as 'PM Labor (After)',
	([pmsparecost] - ([pmsparecost] * 0.2)) as 'PM Spares (After)' ,

	([NONpmTotal] - ([NONpmTotal] * 0.01)) as 'RM Cost (After ) Yr1' ,
	([NONpmTotal] - ([NONpmTotal] * 0.07)) as 'RM Cost (After ) Yr2' ,
	([NONpmTotal] - ([NONpmTotal] * 0.13)) as 'RM Cost (After ) Yr3' ,
	([NONpmTotal] - ([NONpmTotal] * 0.17)) as 'RM Cost (After ) Yr4' ,
	([NONpmTotal] - ([NONpmTotal] * 0.2)) as 'RM Cost (After ) Yr5' ,
	([pmtotal] + [NONpmTotal] ) as 'PMRM' 
from 
(select SegmentMasterID,SegmentMasterDescription,isnull([pmlaborcost],0)[pmlaborcost],isnull([pmsparecost],0)[pmsparecost],isnull([pmtotal],0)[pmtotal],isnull([NONpmlaborcost],0)[NONpmlaborcost],isnull([NONpmsparecost],0)[NONpmsparecost],
isnull([NONpmTotal],0)[NONpmTotal],isnull([pmdowntime],0)[pmdowntime],isnull([GBDowntime],0) [GBDowntime]
 from [dbo].[AX_Segment_Metric_Facts_1]
where year='28-Feb-2022')a 
) b
--where b.Asset_Master_Group_Details_Desc='Building\Booth-Dummy Company Record USA-999999' 
)c  )d  )e )f )g )h  )i )j

)k

update [AX_Segment_Metric_Facts1]
set [SegmentGroupID]=102

-----------------------

update a
 set a. [SegmentMasterID]= b.[SegmentMasterID]
 from [AX_Segment_Metric_Facts] a
 inner join 
 (
 select row_number() OVER(order by SegmentMasterDescription) [SegmentMasterID] , SegmentMasterDescription 
 from [AX_Segment_Metric_Facts] )b
 on a.SegmentMasterDescription=b.SegmentMasterDescription

 drop table [dbo].[AX_Asset_Saving1],[dbo].[AX_Asset_Saving11]

truncate table [AX_Asset_Saving]

select * from [Honda_Repository].[dbo].[AX_Asset_Saving1]

select * into [dbo].[AX_Asset_Saving1]
from [Sherwin_Williams_Repository].[dbo].[AX_Asset_Saving]
where 1=2
----------------------
 insert  into [dbo].[AX_Asset_Saving1]
(
[SegmentMasterID]
      ,[SegmentMasterDescription]
      ,[PM_Labor_Cost]
      ,[PM_Spares_Cost]
      ,[PM_TMC_Before]
      ,[RM_Labor_Cost]
      ,[RM_Spares_Cost]
      ,[RM_Cost_Before]
      ,[Sched_DT_Hrs_Before]
      ,[Unscheduled_DT]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr1]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr2]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr3]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr4]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr5]
      ,[Unscheduled_DT_Saving_Yr1]
      ,[Unscheduled_DT_Saving_Yr2]
      ,[Unscheduled_DT_Saving_Yr3]
      ,[Unscheduled_DT_Saving_Yr4]
      ,[Unscheduled_DT_Saving_Yr5]
      ,[Sched_DT_Hrs_After]
      ,[Decreased_SDT_Hrs]
      ,[Scheduled_DT_Savings]
      ,[PM_Labor_After]
      ,[PM_Spares_After]
      ,[Total_MC_After_PMO]
      ,[RM_Cost_After_Yr1]
      ,[RM_Cost_After_Yr2]
      ,[RM_Cost_After_Yr3]
      ,[RM_Cost_After_Yr4]
      ,[RM_Cost_After_Yr5]
      ,[Cumulative_Total_MC_Yr1]
      ,[Cumulative_Total_MC_Yr2]
      ,[Cumulative_Total_MC_Yr3]
      ,[Cumulative_Total_MC_Yr4]
      ,[Cumulative_Total_MC_Yr5]
      ,[Cumulative_Savings_Yr1]
      ,[Cumulative_Savings_Yr2]
      ,[Cumulative_Savings_Yr3]
      ,[Cumulative_Savings_Yr4]
      ,[Cumulative_Savings_Yr5]
      ,[Exercise_cost]
      ,[Payback_Period]
      ,[Savings_index]
      ,[year],[ST_PM_Labor_Yr1],[ST_Spares_Yr1]
	  )
SELECT [SegmentMasterID]
      ,[SegmentMasterDescription]
      ,[pmlaborcost]
      ,[pmsparecost]
      ,[pmtotal]
      ,[NONpmlaborcost]
      ,[NONpmsparecost]
      ,[NONpmTotal]
      ,[pmdowntime]
      ,[GBDowntime]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr1]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr2]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr3]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr4]
      ,[Reduction_in_Unscheduled_DT_Hrs_yr5]
	  ,[Unscheduled DT Saving Yr1]
      ,[Unscheduled DT Saving Yr2]
      ,[Unscheduled DT Saving Yr3]
      ,[Unscheduled DT Saving Yr4]
      ,[Unscheduled DT Saving Yr5]
      ,[Sched DT Hrs After]
	  ,[Decreased SDT Hrs]
	  ,[Scheduled DT Savings]
      ,[PM Labor (After)]
      ,[PM Spares (After)]
	  ,[Total MC (After PMO)]
      ,[RM Cost (After ) Yr1]
      ,[RM Cost (After ) Yr2]
      ,[RM Cost (After ) Yr3]
      ,[RM Cost (After ) Yr4]
      ,[RM Cost (After ) Yr5]
      --,[PMRM]
      ,[Cumulative Total MC Yr1]
      ,[Cumulative Total MC Yr2]
      ,[Cumulative Total MC Yr3]
      ,[Cumulative Total MC Yr4]
      ,[Cumulative Total MC Yr5]
      ,[Cumulative Savings Yr1]
      ,[Cumulative Savings Yr2]
      ,[Cumulative Savings Yr3]
      ,[Cumulative Savings Yr4]
      ,[Cumulative Savings Yr5]
      ,[Exercise cost]
      ,[Payback (In Years)]
      ,[SavingIndex]
	  ,'28-Feb-2022' as Year,
	  null,null
  FROM [KITE_Staging].dbo.Saving_Nov31



select sum(Sched_DT_Hrs_After),sum(Sched_DT_Hrs_Before)
from [Sherwin_Williams_Repository].[dbo].[AX_Asset_Saving1]

select * into [dbo].[Segment_Objects1]
from [Honda_Repository].[dbo].[Segment_Objects]
where 1=2

drop table [dbo].[AX_Asset_Saving]
truncate table [Segment_Objects1]
insert into [dbo].[Segment_Objects1] 

select aa.assetnum,s.SegmentMasterID,
'2022-02-01 00:00:00.000' [Effective_Startdate],
'9999-12-31 00:00:00.000' [Effective_Enddate],
'Y' [Effective_Currentflag],
'BI Team' [Updated_BY],
getdate() [Updated_On],
'BI Team' [Inserted_By],
getdate() [Inserted_On]
from [dbo].[AX_Asset_Master] aa
left join [dbo].[AX_Segment_Metric_Facts_1] s
on CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURER],'-',aa.[MakeModel])= s.SegmentMasterDescription
where aa.[Effective_Currentflag]='Y'
--where aa.assetnum  not in('RL-BXM-098','RL-1234') and aa.sid=2
--where aa.StatusId in('OPERATING','ACTIVE')
--where not exists(select Asset_Master_Group_Details_ID from [dbo].[AX_Segment_Metric_Facts]  so where so.Asset_Master_Group_Details_ID=s.Asset_Master_Group_Details_ID)


select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]

-----------------------
--------------------TS and Cummulative- Saving--------------------

update ax 
set ax.total_saving=c.total_saving,
	ax.cumulative=c.cumulative
 from [AX_Segment_Metric_Facts_1] ax 
join cumulative c
on ax.[SegmentMasterDescription]=c.key1 
where --ax.Asset_Master_GroupID=102 and 
ax.year='28-Feb-2022' 

----------------Saving_index---------------------

update ax 
set ax.saving_index=c.Savings_index
from [dbo].[AX_Segment_Metric_Facts_1] ax 
join [dbo].[AX_Asset_Saving1]  c
on ax.[SegmentMasterDescription]=c.[SegmentMasterDescription]
where --ax.Asset_Master_GroupID=102 and 
ax.year='28-Feb-2022'
and c.year='28-Feb-2022'

update [AX_Segment_Metric_Facts]
set saving_index=0

drop table [dbo].[AX_Asset_Saving]


select * from  [Honda_Repository].[dbo].[AX_Segment_Metric_Facts1]

select * from [dbo].[AX_Asset_Master]

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]

select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]

update a
set a.PLUSCMODELNUM=b.makemodel
from [Assets_with_high_criticality_bot_no_pm_wo] a
left join  [dbo].[AX_Asset_Master] b
on a.assetnum=b.assetnum

update a
set a.PLUSCMODELNUM=b.makemodel
 from [Assets_with_low_criticality_and_high_pm_hrs] a
left join  [dbo].[AX_Asset_Master] b
on a.assetnum=b.assetnum



[360Navigator_Kite_Live_18_02]

select 


