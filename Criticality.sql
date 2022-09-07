-----------------AssetWithHigh-----------
--select * from  [Assets_with_high_criticality_bot_no_pm_wo1]

select * into [dbo].[Assets_with_high_criticality_bot_no_pm_wo_June]
from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]   
where 1=2   --[dbo].[Assets_with_low_criticality_and_high_pm_hrs]

select * into [dbo].[Assets_with_low_criticality_and_high_pm_hrs1]
from [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs] 
where 1=2 

select * into [Honda_Repository].[dbo].[Assets_with_high_criticality_bot_no_pm_wo1]
from [Honda_Repository].[dbo].[Assets_with_high_criticality_bot_no_pm_wo]
where 1=2

select * from  [Assets_with_high_criticality_bot_no_pm_wo1]


 insert into  [dbo].[Assets_with_high_criticality_bot_no_pm_wo1]
select distinct CMMS_Asset_ID,NONPM_count,case when pmactlabhrs>0 then 'YES' else 'NO' end 'NONPM(YES/NO)' ,aa.siteid,aa.dept
,AssetClass
,[MANUFACTURERID]
,MakeModel,null,
ECRRanking,
case when ECRRanking>0 and ECRRanking<=40 then '1'
when ECRRanking>40 and ECRRanking<=80 then '2'
when ECRRanking>80 and ECRRanking<=119 then '3'
when ECRRanking>120 and ECRRanking<=160 then '4'
when ECRRanking>160 and ECRRanking<=315 then '5'
end 'priority',
nonpmactlabhrs, 
'28-Feb-2022' year ,null,
case when ECRRanking>0 and ECRRanking<=40 then '0-40'
when ECRRanking>40 and ECRRanking<=80 then '40-80'
when ECRRanking>80 and ECRRanking<=119 then '80-119'
when ECRRanking>120 and ECRRanking<=160 then '120-160'
when ECRRanking>160 and ECRRanking<=315 then '160-315'
end 'priority_description'
from [Honda_Repository].[dbo].[AX_Asset_Metric_Facts1] aa
left join [Honda_Repository].[dbo].[PMO_3410012] a on aa.CMMS_Asset_ID=a.assetnum 
where --a.Effective_Currentflag='Y' and 
a.StatusId='A-Active' 
--where rm_count>0 

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
select * into [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs1]
from  [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs]
where 1=2

insert into [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs1]
select distinct CMMS_Asset_ID,PMcount,case when nonpmactlabhrs>0 then 'YES' else 'NO' end 'PM(YES/NO)' ,aa.siteid,aa.dept
,AssetClass
,[MANUFACTURERID]
,MakeModel,null,
ECRRanking,
case when ECRRanking>0 and ECRRanking<=40 then '1'
when ECRRanking>40 and ECRRanking<=80 then '2'
when ECRRanking>80 and ECRRanking<=119 then '3'
when ECRRanking>120 and ECRRanking<=160 then '4'
when ECRRanking>160 and ECRRanking<=315 then '5'
end 'priority',
pmactlabhrs, 
'28-Feb-2022' year ,null,
case when ECRRanking>0 and ECRRanking<=40 then '0-40'
when ECRRanking>40 and ECRRanking<=80 then '40-80'
when ECRRanking>80 and ECRRanking<=119 then '80-119'
when ECRRanking>120 and ECRRanking<=160 then '120-160'
when ECRRanking>160 and ECRRanking<=315 then '160-315'
end 'priority_description'
from [Honda_Repository].[dbo].[AX_Asset_Metric_Facts1] aa
left join [Honda_Repository].[dbo].[PMO_3410012] a on aa.CMMS_Asset_ID=a.assetnum 
where --a.Effective_Currentflag='Y' and 
StatusId='A-Active'
--where pm_count>0 --and a.year='31-Mar-2021' and aa.year='31-Mar-2021' 

----------------------------------------------------------------------------
select * from [Honda_Repository].[dbo].[Assets_with_low_criticality_and_high_pm_hrs1]

select * from [Assets_with_low_criticality_and_high_pm_hrs1]


drop table [dbo].[Assets_with_high_criticality_bot_no_pm_wo],[dbo].[Assets_with_low_criticality_and_high_pm_hrs],[dbo].[AX_Asset_Metric_Facts],
[dbo].[AX_Asset_Saving],[dbo].[AX_Segment_Metric_Facts],[dbo].[Segment_Objects]

drop table [dbo].[AX_SegmentMasterBK]



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


---------------------------------------------

select AX_Priority,count(assetnum)cnt from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]              -------NONPM Dash, NUll include bk- 6
where [NONPM(YES/NO)]='NO' and labhrs is null --<= 30  and labhrs <= 300	
group by  AX_Priority


select AX_Priority,count(assetnum)cnt from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]              -------PM Dash, NUll include bk- 6
where [PM(YES/NO)]='NO' and 
labhrs > 0 and labhrs <=20	
group by  AX_Priority


drop table [dbo].[Segment_Objects]


select * from [dbo].[AX_Asset_Master] where Effective_Currentflag='Y'
select * from [dbo].[AX_Asset_Metric_Facts]
select * from  [dbo].[AX_Segment_Metric_Facts]
select * from [dbo].[AX_Asset_Saving]
select * from [dbo].[Client_Workorder] where year='31-Dec-2021'
select * from  [dbo].[Assets_with_high_criticality_bot_no_pm_wo]
select * from  [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
select * from  [dbo].[Segment_Objects]

select * from  [dbo].[relatedrecord_demo]

---------------------------------------------------------

select top 3 * from [dbo].[Assetmaster$]

select * into [dbo].[Assets_with_high_criticality_bot_no_pm_wo1]
from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]
where 1=2

select * into [dbo].[Assets_with_low_criticality_and_high_pm_hrs1]
from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
where 1=2

update a
set a.hnarisk=b.hnarisk
from [dbo].[Assetmaster_March] a
left join
[dbo].[Assetmaster$] b
on a.AssetNum=b.assetnum



select * from [dbo].[Asset_AEP]
where year='31-Mar-2021' 

delete [Assets_with_high_criticality_bot_no_pm_wo]
where year='28-Feb-2021'

select * from [Assets_with_high_criticality_bot_no_pm_wo]
where year='28-Feb-2021'

delete [Assets_with_low_criticality_and_high_pm_hrs]
where year='28-Feb-2021'

select * from [Assets_with_low_criticality_and_high_pm_hrs]
where year='28-Feb-2021'

--------------------------------------------------


select * from Assets_with_high_criticality_bot_no_pm_wo where year in ('28-Feb-2021')

select * from Assets_with_low_criticality_and_high_pm_hrs where year in ('28-Feb-2021')

select * from [dbo].[Segment_Objects]
where Effective_Currentflag is null

select * from [dbo].[AX_Segment_Metric_Facts]
where year='28-Feb-2021'
order by Asset_Master_Group_Details_ID desc

select * from [dbo].[SegmentMaster]

select * from [dbo].[AX_Segment_Metric_Facts] where year='28-Feb-2021'

select * from [dbo].[AX_Asset_Metric_Facts] where year='28-Feb-2021'

select * from [dbo].[AX_Segment_Metric_Facts] s
inner join [dbo].[Segment_Objects] so
on s.[Asset_Master_Group_Details_ID]=so.[Family_id]
where s.year='28-Feb-2021' and so.Effective_Currentflag='Y'


select * from [dbo].[AX_Asset_Metric_Facts] s
left join [dbo].[Segment_Objects] so
on s.CMMS_Asset_ID=so.assetnum
where s.year='28-Feb-2021' and Effective_Currentflag='Y'

select * from [dbo].[AX_Asset_Metric_Facts] s
where not exists(select * from [dbo].[Segment_Objects] so
where s.CMMS_Asset_ID=so.assetnum) and  s.year='28-Feb-2021' 


select * from [Segment_Objects_v1] where assetnum in('A224996','A224911')

select * from [dbo].[ax_asset_saving]

select * from [dbo].[AX_Segment_Metric_Facts]

select * from [dbo].[AX_Asset_Metric_Facts]

select * from  [dbo].[AX_Asset_Master]

select * from [dbo].[Segment_Objects]

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]

select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]

select * from [dbo].[workorder]




select * from [dbo].[Work_mgmt_BacklogData_Detail]  

  
where  Weeknum='2020-02' and      AgeBacklog='< 30 Days Open'   ----BAcklog Detail Table

select * from [dbo].[Work_mgmt_fact_Details]					-----Workorder Detail Table (Include WO mgmt, Monthly summary, Relibilty Dash. Metric)

select * from [dbo].[Work_mgmt_weekly_fact]					------Workmgmt Dash Fact Data

select * from [dbo].[Work_mgmt_weekly_fact_Detail]			--------Workmgmt Act_vs_Estimated Metric Data

select * from [dbo].[BACKLOG_DATA]
order by 1 desc

select * from [dbo].[Material_Data]

select * from [dbo].[Material_April_Data]
where [order]='201040129435'

select top 1 * from [dbo].[WorkorderData_20_21]


select top 1 * from [dbo].[WO_APRIL_DATA]

select * from [dbo].[FEB_2021_Backlog]


[dbo].[workorder]  --[dbo].[AX_Segment_Metric_Facts]

select * into [Honda_Staging].[dbo].[Client_Workorder_May1]
from [dbo].[Client_Workorder]

select * into [Honda_Repository].[dbo].[SegmentMaster]
from  

insert into [Honda_Repository_V1].[dbo].[Client_Workorder1]
select * from [Client_Workorder_Aug]

select * from [Honda_Repository].[dbo].[Client_Workorder]
where year='30-Nov-2021' ---[dbo].[SegmentMaster_June]

insert into [Honda_Repository].[dbo].[Client_Workorder]
SELECT [WONUM]
      ,[PARENT]
      ,[STATUS]
      ,[STATUSDATE]
      ,[WORKTYPE]
      ,[DESCRIPTION]
      ,[ASSETNUM]
      ,[LOCATION]
      ,[JPNUM]
      ,[FAILDATE]
      ,[CHANGEDATE]
      ,[ESTDUR]
      ,[ESTLABHRS]
      ,[ESTMATCOST]
      ,[ESTLABCOST]
      ,[ESTTOOLCOST]
      ,[PMNUM]
      ,[ACTLABHRS]
      ,[ACTMATCOST]
      ,[ACTLABCOST]
      ,[HASCHILDREN]
      ,[REPORTEDBY]
      ,[HISTORYFLAG]
      ,[WOPRIORITY]
      ,[TARGCOMPDATE]
      ,[TARGSTARTDATE]
      ,[REPORTDATE]
      ,[DOWNTIME]
      ,[ACTSTART]
      ,[ACTFINISH]
      ,[SCHEDSTART]
      ,[SCHEDFINISH]
      ,[CREWID]
      ,[FAILURECODE]
      ,[SITEID]
      ,[CLASSSTRUCTUREID]
      ,[F37]
      ,[Year]
      ,[SPARECOST]
      ,[LABORCOST]
      ,[IsReview]
      ,[DEV_WORKTYPE]
	  ,cmdowntime
  FROM [dbo].[Client_Workorder_Nov]


insert into [Honda_Repository].[dbo].[Client_Workorder]
	SELECT [WONUM]
      ,[PARENT]
      ,[WO_STATUS] [STATUS]
      ,[STATUSDATE]
      ,[WORKTYPE]
      ,[WODESCRIPTION] [DESCRIPTION]
      ,[ASSETNUM]
      ,[LOCATION]
      ,[JPNUM]
      ,null [FAILDATE]
      ,null [CHANGEDATE]
      ,[ESTLABHRS] [ESTDUR]
      ,[ESTLABHRS]
      ,[ESTMATCOST]
      ,[ESTLABCOST]
      ,null [ESTTOOLCOST]
      ,[PMNUM]
      ,[ACTLABHRS]
      ,[ACTMATCOST]
      ,[ACTLABCOST]
      ,[HASCHILDREN]
      ,[REPORTEDBY]
      ,[HISTORYFLAG]
      ,[WOPRIORITY]
      ,[TARGCOMPDATE]
      ,[TARGSTARTDATE]
      ,[REPORTDATE]
      ,[DOWNTIME]
      ,[ACTSTART]
      ,[ACTFINISH]
      ,[SCHEDSTART]
      ,[SCHEDFINISH]
      ,null [CREWID]
      ,null [FAILURECODE]
      ,[SITEID]
      ,[CLASSSTRUCTUREID]
      ,null [F37]
      , [Year]
      ,actmatcost [SPARECOST]
      ,actlabcost [LABORCOST]
      ,null [IsReview]
      ,[ax_worktype] [DEV_WORKTYPE]
	,[CMDowntime]
	,[PMDowntime]
	,[RMDowntime]
	,[NONPMDowntime]
  FROM [dbo].[WORKORDER]
  where  year='30-Nov-2021' --actfinish>='2020-07-01' and actfinish<='2021-06-30'  and STATUS='CLOSE' and istask=0
  )a


select * from [Honda_Repository].[dbo].[Client_Workorder]
where --ACTFINISH >='2020-08-01 00:00:00.000' and  ACTFINISH <='2020-08-31 00:00:00.000' and 
year='30-Nov-2021'

delete [Honda_Repository].[dbo].[Client_Workorder]
where ACTFINISH > '2020-08-31 00:00:00.000' and year='31-Jul-2021'


update [Honda_Repository].[dbo].[Client_Workorder]
set year='30-Nov-2021'
where actfinish>'2020-12-01 00:00:00.000' and 
year='31-Oct-2021'

select min(actfinish),max(actfinish)
from [Honda_Repository].[dbo].[Client_Workorder]
where year='30-Nov-2021'


delete [Honda_Repository].[dbo].[Client_Workorder]
where year='30-Nov-2021'

insert into [Honda_Repository].[dbo].[Client_Workorder]
select * from workorder 
where year='30-Nov-2021'


-----------

select * into [Honda_Repository].[dbo].[AX_Asset_Master]
from 
--drop table
--[Honda_Repository].

[dbo].[AX_Asset_Master_Nov]

--drop table [Honda_Repository].[dbo].[AX_Asset_Master]





[Honda_Repository]





