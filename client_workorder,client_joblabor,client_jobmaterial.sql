use [Lily_Repository]
--------------------------joblabor--------------------------------------

select * into [dbo].[Client_JOBLABOR]  
from [Honda_PMO_Asset].[dbo].[Client_JOBLABOR_Feb2022]
where 1=2

select * from Client_JOBLABOR
select * from [Honda_PMO_Asset].[dbo].[Client_JOBLABOR_feb2022]


---------------------------jobmaterial---------------------------------------
select * into [dbo].Client_JOBMATERIAL_demo
from [Honda_PMO_Asset].[dbo].[Client_JOBMATERIAL_feb2022]
where 1=2

select * from Client_JOBMATERIAL
select * from [Honda_PMO_Asset].[dbo].[Client_JOBMATERIAL_feb2022] ---=---where [status]='active'
select * from  [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan Item table]




----------------------------------workorder-------------------------------------------------------
select * into [dbo].[client_workorder]  
from [Honda_Repository].[dbo].[client_workorder]
where 1=2

select * from client_workorder 
select * from [Honda_Repository].[dbo].[Client_Workorder]


-------------------------------------------------Client_JOBLABOR---------------------------------------------------------------
---insert into [Lily_Repository].[dbo].[Client_JOBLABOR] 
SELECT [jpnum][JPNUM]
      ,null [LABORCODE]
      ,null [LABORHRS]
      ,null [JL1]
      ,null [JL2]
      ,null [JL3]
      ,null [JL4]
      ,null [JL5]
      ,null [JL6]
      ,null [VENDOR]
      ,null [JL7]
      ,null [JL8]
      ,null [JL9]
      ,[ORGID][ORGID]
      ,[siteid][SITEID]
      ,null [JPTASK]
      ,null [JOBLABORID]
      ,null [JOBPLANID]
      ,[craft] [CRAFT]
      ,null [SKILLLEVEL]
      ,null [CONTRACTNUM]
       ,[quantity] [QUANTITY]
      ,null [ROWSTAMP]
      ,null [CONDITIONNUM]
      ,null[PLUSCJPREVNUM]
      ,null [AMCREW]
      ,null [AMCREWTYPE]
      ,null [CREWWORKGROUP]
      ,null [APPTREQUIRED]
  FROM [Lilly_Straging].[dbo].[Asset Analytix Job Plan Labor table_2]

select * from [Lilly_Straging].[dbo].[Asset Analytix Job Plan Labor table_1]

insert into [Lily_Repository].[dbo].[Client_JOBLABOR_PRD] 
	SELECT distinct jl.[JPNUM][JPNUM]		  ,null[LABORCODE]		  ,jl.[laborhrs_text][LABORHRS]		  ,null[JL1]		  ,null[JL2]		  ,null[JL3]		  ,null[JL4]		  ,null[JL5]		  ,null[JL6]		  ,null[VENDOR]		  ,null[JL7]		  ,null[JL8]		  ,null[JL9]		  ,jl.[orgid][ORGID]		  ,jl.[siteid][SITEID]		  ,null [JPTASK]		  ,null [JOBLABORID]		  ,p.jobplanid [JOBPLANID]		  ,jl.[craft][CRAFT]		  ,null[SKILLLEVEL]		  ,null[CONTRACTNUM]		  ,jl.[quantity][QUANTITY]		  ,null[ROWSTAMP]		  ,null[CONDITIONNUM]		  ,null[PLUSCJPREVNUM]		  ,null[AMCREW]		  ,null[AMCREWTYPE]		  ,null[CREWWORKGROUP]		  ,null[APPTREQUIRED]	  FROM [Lilly_Straging].[dbo].[Asset Analytix Job Plan Labor table_all] jl	   left join [dbo].[Client_JOBPLAN_PRD1] p on jl.[Jpnum]=p.jpnum 
	   where jl.siteid='PRD'  
select * from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table]select COUNT(JOBPLANID) from [dbo].[Client_JOBPLAN_PRD1]

-----------------******---------------------------Client_workorder-------------******-----------------------------------*****-------------
------insert into [Lily_Repository].[dbo].[Client_workorder]
SELECT [Work Order] [WONUM]
      ,[Parent WO] [PARENT]
      ,[Status][STATUS]
      ,null[STATUSDATE]
      ,[Work Type][WORKTYPE]
      ,[Work Order Description][DESCRIPTION]
      ,[Asset][ASSETNUM]
      ,[Location][LOCATION]
      ,[Job Plan][JPNUM]
      ,null [FAILDATE]
      ,null [CHANGEDATE]
      ,[Duration][ESTDUR]
      ,null [ESTLABHRS]
      ,null [ESTMATCOST]
      ,null [ESTLABCOST]
      ,null [ESTTOOLCOST]
      ,[PM][PMNUM]
      ,[WO Actual Labor Hr Qty][ACTLABHRS]
      ,[WO Actual Material Cost][ACTMATCOST]
      ,[WO Actual Labor Cost][ACTLABCOST]
      ,null[HASCHILDREN]
      ,[Reported By Name][REPORTEDBY]
      ,null [HISTORYFLAG]
      ,[WO Priority][WOPRIORITY]
      ,[Target Finish Date][TARGCOMPDATE]
      ,[Target Start Date][TARGSTARTDATE]
      ,[Reported Date][REPORTDATE]
      ,null[DOWNTIME]
      ,[Actual Start][ACTSTART]
      ,[Actual Finish][ACTFINISH]
      ,[Scheduled Start][SCHEDSTART]
      ,[Scheduled Finish][SCHEDFINISH]
      ,[Crew][CREWID]
      ,null[FAILURECODE]
      ,[Site][SITEID]
      ,null[CLASSSTRUCTUREID]
      ,null [F37]
      ,null [Year]
      ,null [SPARECOST]
      ,null [LABORCOST]
      ,null [IsReview]
      ,NULL[DEV_WORKTYPE]
      ,null [CMDowntime]
      ,null [PMDowntime]
      ,null [RMDowntime]
      ,null [NONPPMDowntime]
      ,null [LDTEXT]
  FROM [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table_all]
  where status='close' and site='PRD' and [Actual Finish]>='2017-04-01 00:00:00.000' and [Actual Finish]<='2022-03-31 23:59:59.000'
GO



select min ([Actual Finish]),max([Actual Finish]) from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table_all]
where status='close'and [Actual Finish]>='2017-04-01 00:00:00.000' and [Actual Finish]<='2022-03-31 23:59:59.000'

--------------------------------------------------------------------------------------------------------
select * from [Lilly_Straging].[dbo].[dboAsset Analytix Work Order Types]-------PM,RM,CM,OTH
select [Work Order],[Work Type],[WO Priority],
	  case when [Work Type] in('PDM','PM','PMCAL','PMSN') THEN 'PM'end,
	  case when  [Work Type] in('cal','RPDM','RPM') THEN 'CM'
	     when  [Work Type] in('CM','ENV','MI','SA')AND [WO Priority]=1 THEN 'CM' END ,
		  case when  [Work Type] in('MA') THEN 'RM'
	     when  [Work Type] in('CM','ENV','MI','SA')AND [WO Priority] IN (2,3) THEN 'RM' else 'oth' END [DEV_WORKTYPE]
	  from 
	  [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table_all]


-------------------------********-----------------Client_JOBMATERIAL---------------**********----------------------------------*********------

---------insert into [Lily_Repository].[dbo].[Client_JOBMATERIAL_demo] 

SELECT  distinct null [AMCREW]
      ,null [AMCREWTYPE]
      ,null [CONDITIONCODE]
      ,null [CONDITIONNUM]
      ,null [DIRECTREQ]
      ,null [HOURS]
      ,jt.[Item] [ITEMNUM]
      ,jt.[Item Quantity] [ITEMQTY]
      ,null [ITEMSETID]
      ,null [JM1]
      ,null [JM2]
      ,null [JM3]
      ,null [JM4]
      ,null [JM5]
      ,null [JM6]
      ,null [JOBITEMID]
      ,null [JOBLABORREF]
     ,p.jobplanid [JOBPLANID]
      ,jt.[Job Plan] [JPNUM]
      ,jt.[Task][JPTASK]
      ,null [LINETYPE]
      ,null [LOCATION]
      ,jt.[Organization][ORGID]
      ,MAX(jp.[Revision]) [PLUSCJPREVNUM]
      ,null [RATE]
      ,null [RESERVEREQ]
      ,null [ROWSTAMP]
      ,jt.[Site][SITEID]
      ,null [STORELOCSITE]
      ,null [VENDOR]
  FROM [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan Item table] jt left join
  [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table] jp 
on jt.[Job Plan]=jp.[Job Plan]
    left join [dbo].[Client_JOBPLAN_PRD1] p on jt.[Job Plan]=p.jpnum
  where jt.site='prd' and jt.status='active'
  group by jt.[Item],jt.[Item Quantity],jt.[Job Plan],p.jobplanid,jt.[Task],jt.[Organization],jt.[Site]

GO
----DROP TABLE [Client_JOBMATERIAL_PRD]

select * from [Lily_Repository]. [dbo].[Client_JOBMATERIAL_DAF1]
SELECT  * FROM [Lily_Repository].[dbo].[Client_JOBMATERIAL_PRD1] 
select *from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan Item table]
select *from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table]


select * into [dbo].[Client_JOBMATERIAL]
 from [Honda_PMO_Asset].[dbo].[Client_JOBMATERIAL_feb2022]
where 1=2

select * from Client_JOBMATERIAL
select * from [Honda_PMO_Asset].[dbo].[Client_JOBMATERIAL_feb2022] ---=---where [status]='active'
select * from  [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan Item table]

--------------------------------------------------------------client_joblabor----------------------------------------------------------------------------------------
select * into [Lily_Repository].[dbo].[Client_JOBLABOR_1]
from [Honda_PMO_Asset].[dbo].[Client_JOBLABOR_Feb2022]
where 1=2

select * from [Honda_PMO_Asset].[dbo].[Client_JOBLABOR_Feb2022]
select  * from [Lily_Repository].[dbo].[Client_JOBLABOR_PRD] ------where [jpnum]='10951'


-----insert into [Lily_Repository].[dbo].[Client_JOBLABOR_PRD] 
	SELECT distinct jl.[JPNUM][JPNUM]		  ,null[LABORCODE]		  ,jl.[laborhrs_text][LABORHRS]		  ,null[JL1]		  ,null[JL2]		  ,null[JL3]		  ,null[JL4]		  ,null[JL5]		  ,null[JL6]		  ,null[VENDOR]		  ,null[JL7]		  ,null[JL8]		  ,null[JL9]		  ,jl.[orgid][ORGID]		  ,jl.[siteid][SITEID]		  ,null [JPTASK]		  ,null [JOBLABORID]		  ,p.jobplanid [JOBPLANID]		  ,jl.[craft][CRAFT]		  ,null[SKILLLEVEL]		  ,null[CONTRACTNUM]		  ,jl.[quantity][QUANTITY]		  ,null[ROWSTAMP]		  ,null[CONDITIONNUM]		  ,null[PLUSCJPREVNUM]		  ,null[AMCREW]		  ,null[AMCREWTYPE]		  ,null[CREWWORKGROUP]		  ,null[APPTREQUIRED]	  FROM [Lilly_Straging].[dbo].[Asset Analytix Job Plan Labor table_all] jl	   left join [dbo].[Client_JOBPLAN_PRD1] p on jl.[Jpnum]=p.jpnum 
	   where jl.siteid='PRD'  
  GOselect * from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table]select COUNT(JOBPLANID) from [dbo].[Client_JOBPLAN_PRD1]select * from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table]






 