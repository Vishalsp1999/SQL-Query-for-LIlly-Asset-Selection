select * into Assets_with_high_criticality_bot_no_pm_wo_PRD1
from [Honda_Repository].dbo.Assets_with_high_criticality_bot_no_pm_wo
where 1=2 

Select * from [dbo].Assets_with_high_criticality_bot_no_pm_wo

--truncate table [dbo].Assets_with_high_criticality_bot_no_pm_wo
 insert into  [dbo].Assets_with_high_criticality_bot_no_pm_wo
select distinct CMMS_Asset_ID,NONPM_count,case when pmactlabhrs>0 then 'YES' else 'NO' end 'NONPM(YES/NO)' ,aa.siteid,aa.dept
,AssetClass
,[MANUFACTURER]
,MakeModel,null,
case when ECRRanking=1 then 1
when ECRRanking=2 then 2
when ECRRanking=3 then 3
when ECRRanking =0 or ECRRanking is null then 4 end 
ECRRanking,
case when ECRRanking=1 then 1
when ECRRanking=2 then 2
when ECRRanking=3 then 3
when ECRRanking =0 or ECRRanking is null then 4 
---when ECRRanking>160 and ECRRanking<=315 then '5'
end 'priority',
nonpmactlabhrs, 
'31-Mar-2022' year ,null,
case when ECRRanking=1 then 1
when ECRRanking=2 then 2
when ECRRanking=3 then 3
when ECRRanking =0 or ECRRanking is null then 4 
end 'priority_description'--,sid
from [Lilly_Repository_3years].[dbo].[AX_Asset_Metric_Facts] aa
left join [Lilly_Repository_3years].[dbo].[PMO_3410012_DAF] a on aa.CMMS_Asset_ID=a.assetnum 
where aa.siteid='DAF'
--a.Effective_Currentflag='Y' and 
--a.StatusId='Active' 
--where rm_count>0 

select distinct OldECRRanking from [Lilly_Repository_25-08].[dbo].[PMO_3410012_PRD]


select distinct AX_Priority from [LILLY_Repository_New].dbo.Assets_with_high_criticality_bot_no_pm_wo_ALL
select * from [Honda_Repository].[dbo].[AX_Asset_Master] a where a.Effective_Currentflag='Y' and a.StatusId='A-Active'

select hnarisk from [Honda_Staging].[dbo].[Asset_jan_22]

--update a
--set a.ecrranking=b.hnarisk
--from [Honda_Repository].[dbo].[AX_Asset_Master] a
-- join [Honda_Staging].[dbo].[Asset_jan_22] b
--on a.AssetNum=b.ASSETNUM
--where a.Effective_Currentflag='Y'

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]

update a
set a.ECRRanking=b.HNARISK
 from [Honda_Repository].[dbo].[AX_Asset_Master_Dec] a
   join [dbo].[ASSET_DEC] b
on a.assetnum=b.AssetNum
where a.Effective_Currentflag='Y'  --and b.Effective_Currentflag='Y'




update a
set a.ECRRanking=b.hnarisk
  from [AX_Assetmaster_Sep] a
  left join Assetmaster_SEP b
on a.assetnum=b.AssetNum
where a.Effective_Currentflag='Y' --and b.Effective_Currentflag='Y'



update a
set a.ECRRanking=b.hnarisk
 from [Honda_Repository].dbo.AX_Asset_Master a
left join  [Honda_Repository].dbo.Assets_with_high_criticality_bot_no_pm_wo b
on a.assetnum=b.assetnum   
where a.Effective_Currentflag='Y'


select * from [Honda_Repository].[dbo].[AX_Asset_Master] a
where a.Effective_Currentflag='Y' and ECRRanking > 0  is not null

select * from [Honda_Repository].[dbo].[AX_Asset_Master_Dec] a
where a.Effective_Currentflag='Y' and ECRRanking is  null

update a
set a.ECRRanking=b.ECRRanking
 from [Honda_Repository].[dbo].[AX_Asset_Master_Dec] a
left join  [Honda_Repository].[dbo].[AX_Asset_Master] b
on a.assetnum=b.assetnum
where a.Effective_Currentflag='Y' and b.Effective_Currentflag='Y'

--update a
--set a.assetclass=b.assetclass
--from [Assetmaster_Aug] a
--left join
--[AX_Assetmaster_Aug] b
--on a.assetnum=b.assetnum
----------------------------------------------------------------------------------------------

drop table 
[dbo].[Assets_with_low_criticality_and_high_pm_hrs1]
-----------------------------LowCriticality-----------------------

select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
Select * from [AX_Asset_Metric_Facts] where siteid='DAF'

select * into [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
from  [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs]
where 1=2

truncate table [dbo].[Assets_with_low_criticality_and_high_pm_hrs]

insert into [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
select distinct CMMS_Asset_ID,PMcount,case when nonpmactlabhrs>0 then 'YES' else 'NO' end 'PM(YES/NO)' ,aa.siteid,aa.dept
,AssetClass
,[MANUFACTURER]
,MakeModel,null,
case when ECRRanking=1 then 1
when ECRRanking=2 then 2
when ECRRanking=3 then 3
when ECRRanking =0 or ECRRanking is null then 4 end 
ECRRanking,
case when ECRRanking=1 then 1
when ECRRanking=2 then 2
when ECRRanking=3 then 3
when ECRRanking =0 or ECRRanking is null then 4 end
 'priority',
pmactlabhrs, 
'31-Mar-2022' year ,null,
case when ECRRanking=1 then 1
when ECRRanking=2 then 2
when ECRRanking=3 then 3
when ECRRanking =0 or ECRRanking is null then 4 
end 'priority_description'
from [Lilly_Repository_3years].[dbo].[AX_Asset_Metric_Facts] aa
left join [Lilly_Repository_3years].[dbo].[PMO_3410012_DAF] a on aa.CMMS_Asset_ID=a.assetnum 
where aa.siteid='DAF'
--a.Effective_Currentflag='Y' and 
--StatusId='Active'
--where pm_count>0 --and a.year='31-Mar-2021' and aa.year='31-Mar-2021' 

select * from Ax_Asset_Master
----------------------------------------------------------------------------
select * from [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs1]

select * from [Assets_with_low_criticality_and_high_pm_hrs1]

drop table [dbo].[Assets_with_high_criticality_bot_no_pm_wo],[dbo].[Assets_with_low_criticality_and_high_pm_hrs],[dbo].[AX_Asset_Metric_Facts],
[dbo].[AX_Asset_Saving],[dbo].[AX_Segment_Metric_Facts],[dbo].[Segment_Objects]

--drop table [dbo].[AX_SegmentMasterBK]

select * from [Assets_with_low_criticality_and_high_pm_hrs]


select * into [Assets_with_high_criticality_bot_no_pm_wo_All1] from [dbo].[Assets_with_high_criticality_bot_no_pm_wo_DAF1]

select * into [dbo].[Assets_with_low_criticality_and_high_pm_hrs_ALL1] 
from [dbo].[Assets_with_low_criticality_and_high_pm_hrs_DAF1]


 insert into [dbo].[Assets_with_low_criticality_and_high_pm_hrs_ALL1] 
select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs_PRD1]

select * from [Assets_with_low_criticality_and_high_pm_hrs_ALL1]

insert into [Assets_with_high_criticality_bot_no_pm_wo_All1] 
select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo_PRD1]

select * into [dbo].[Asset_Master_all] 
from [dbo].[Asset_Master_DAF]
where 1=2 --[wocount>0]=1

insert into select * from [Segment_Objects_ALL1]
select *,'PRD' as Siteid  from [dbo].[Segment_Objects_PRD1]


update a
set a.oldecrranking=b.ax_priority
from [Honda_Repository].[dbo].[AX_Asset_Master] a
left join  [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs1] b
on a.assetnum=b.assetnum

------------------PM DASH -----New Low Criticality chart Query------------

select distinct CMMS_Asset_ID,PM_count,case when nonpmactlabhrs>0 then 'YES' else 'NO' end 'PM(YES/NO)' ,aa.siteid,aa.dept
,AssetClass
,[MANUFACTURERNAME]
,[PLUSCMODELNUM],
hnarisk,
pmactlabhrs,
case when hnarisk>0 and hnarisk<=40 then '1'
when hnarisk>40 and hnarisk<=80 then '2'
when hnarisk>80 and hnarisk<=119 then '3'
when hnarisk>120 and hnarisk<=160 then '4'
when hnarisk>160 and hnarisk<=315 then '5'
end 'priority',

case when hnarisk>0 and hnarisk<=40 then '0-40'
when hnarisk>40 and hnarisk<=80 then '40-80'
when hnarisk>80 and hnarisk<=119 then '80-119'
when hnarisk>120 and hnarisk<=160 then '120-160'
when hnarisk>160 and hnarisk<=315 then '160-315'
end 'priority_description',

case
when pmactlabhrs > 0 and pmactlabhrs <= 20 then '1-20'
when pmactlabhrs > 20 and pmactlabhrs <= 40 then '21-40'
when pmactlabhrs > 40 and pmactlabhrs <= 60 then '41-60'
when pmactlabhrs > 60 and pmactlabhrs <= 80 then '61-80'
when pmactlabhrs > 80 and pmactlabhrs <= 100 then '80-100'
when pmactlabhrs > 100 and pmactlabhrs <= 300 then '101-300'
when pmactlabhrs > 300 and pmactlabhrs <= 500 then '301-500'
when pmactlabhrs > 500  then '>500'
else '0'
end 'Labor_Hrs_bk', 
'31-May-2021' year 
from [Honda_Repository].[dbo].[AX_Asset_Metric_Facts] aa
left join [dbo].[Assetmaster_May] a on aa.CMMS_Asset_ID=a.assetnum



------------------NONPM DASH -----New High Criticality chart Query--

select distinct CMMS_Asset_ID,NONPM_count,case when pmactlabhrs>0 then 'YES' else 'NO' end 'NONPM(YES/NO)' ,aa.siteid,aa.dept
,AssetClass
,[MANUFACTURERNAME]
,[PLUSCMODELNUM]
,nonpmactlabhrs,
case when hnarisk>0 and hnarisk<=40 then '1'
when hnarisk>40 and hnarisk<=80 then '2'
when hnarisk>80 and hnarisk<=119 then '3'
when hnarisk>120 and hnarisk<=160 then '4'
when hnarisk>160 and hnarisk<=315 then '5'
end 'priority',

case when hnarisk>0 and hnarisk<=40 then '0-40'
when hnarisk>40 and hnarisk<=80 then '40-80'
when hnarisk>80 and hnarisk<=119 then '80-119'
when hnarisk>120 and hnarisk<=160 then '120-160'
when hnarisk>160 and hnarisk<=315 then '160-315'
end 'priority_description',

case
when nonpmactlabhrs > 0 and nonpmactlabhrs <= 10 then '1-10'
when nonpmactlabhrs > 10 and nonpmactlabhrs <= 20 then '11-20'
when nonpmactlabhrs > 20 and nonpmactlabhrs <= 50 then '21-50'
when nonpmactlabhrs > 50 and nonpmactlabhrs <= 100 then '51-100'
when nonpmactlabhrs > 100 and nonpmactlabhrs <= 300 then '101-300'
when nonpmactlabhrs >300  then '>300'
else '0'
end 'Labor_Hrs_bk',

'31-May-2021' year 
from [Honda_Repository].[dbo].[AX_Asset_Metric_Facts] aa
left join [dbo].[Assetmaster_May] a on aa.CMMS_Asset_ID=a.assetnum  
--where rm_count>0 




------------------------

select distinct SegmentMasterID from Segment_Objects_ALL1 where siteId='PRD' --and SegmentMasterID='2014'
order by 1

select * from AX_Segment_Metric_Facts_all1 where siteId='PRD' and 
SegmentMasterID='2014'


insert into Segment_Objects_ALL1
select * ,'DAF' as Siteid 
from [dbo].[Segment_Objects_DAF1] --order by 2

select * from [dbo].[Segment_Objects_PRD1]