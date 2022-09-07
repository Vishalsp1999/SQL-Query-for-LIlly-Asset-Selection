----------------------------------------JOBMATERIAL_NULL-------------------------------------------------------------------------------

SELECT * INTO [Lily_Repository].DBO.[Client_JOBMATERIAL_NULL]
FROM [Client_JOBMATERIAL]

----------------
INSERT INTO [dbo].[Client_JOBMATERIAL]
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
  FROM [Lilly_Straging].[dbo].[Asset Analytix Job Plan Item table Org Null_32_6671277316663670427] jt left join
  [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table] jp 
on jt.[Job Plan]=jp.[Job Plan]
    left join [Lily_Repository].[dbo].[Client_JOBPLAN_NULL] p on jt.[Job Plan]=p.jpnum
  where ---jt.site='prd' and 
  jt.status='active'
  group by jt.[Item],jt.[Item Quantity],jt.[Job Plan],p.jobplanid,jt.[Task],jt.[Organization],jt.[Site]

GO

------------------------------------------------------------[Client_JOBPLAN_NULL]-----------------------------------------------------------------------------------------

USE [Lily_Repository]
GO

insert into [dbo].[Client_JOBPLAN_NULL]
SELECT DISTINCT [Job Plan] [JPNUM]
      ,[Job Plan Description] [DESCRIPTION]
      ,NULL AS [JPDURATION]
         ,null[LABORCODE]
        ,null[DOWNTIME]
      ,[Supervisor][SUPERVISOR]
        ,null[CALENDAR]
        ,null[PRIORITY]
      ,[Crew][CREWID]
      ,[Organization][ORGID]
      ,[Site][SITEID]
      ,[Owner][OWNER]
       -- ,null[JOBPLANID]
      ,null [PERSONGROUP]
      ,null [OWNERGROUP]
      ,null [LANGCODE]
      ,[Status][STATUS]
      ,null [INTERRUPTIBLE]
      ,null [HASLD]
      ,null [CLASSSTRUCTUREID]
      ,null [TEMPLATETYPE]
      ,null [SUSPENDFLOW]
      ,null [FLOWCONTROLLED]
      ,null [FLOWACTION]
      ,null [FLOWACTIONASSIST]
      ,null [LAUNCHENTRYNAME]
      ,null [ROWSTAMP]
      ,null [ASSIGNEDOWNERGROUP]
      ,null [HASNESTEDJP]
      ,null [MODELID]
      ,null [PLUSCCHANGEBY]
      ,null [PLUSCCHANGEDATE]
      ,null [PLUSCREVCOM]
      ,MAX([Revision]) [PLUSCREVNUM]
      ,null [PLUSCSTATUSDATE]
      ,null [INCTASKSINSCHED]
      ,null [STCONOFFSET]
      ,null [FNCONOFFSET]
      ,null [AMCREW]
      ,null [CREWWORKGROUP]
      ,null [REQASSTDWNTIME]
      ,null [APPTREQUIRED]
      ,null [AOS]
      ,null [AMS]
      ,null [LOS]
      ,null [LMS]
      ,null [REPAIRLOCFLAG]
      ,null [HNAASSETCLASS]
      ,null [HNADEPT]
      ,null [HNAJPAUTHOR]
      ,null [HNAJPTEMPLATE]
      ,null [HNAMANUFACTURER]
      ,null [HNAORIGJPNUM]
      ,null [HNAOWNER]
      ,null [HNAJUSTIFYPRIORITY]
      ,null [INSPFORMNUM]
      ,null [INTSHIFT]
      ,null [HNAJPGRAD]
      ,null [WOSTATUS]
    FROM [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table] 
  where 
  [job plan] in (select distinct [Job Plan] from 
  [Lilly_Straging].[dbo].[Asset Analytix Job Plan WhereUsed table SITE NULL]
  where site is null )AND 
  STATUS='active' AND site is null
  GROUP BY 
   [Job Plan]
      ,[Job Plan Description] 
      ,[Supervisor]
      ,[Crew]
      ,[Organization]
      ,[Site]
      ,[Owner],[Status]



  select * from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan ORG level table]
  WHERE  [Job Plan]='3830'
  --STATUS='active' AND site is null
[dbo].[dboAsset Analytix Job Plan ORG level table]
  select * from [Lily_Repository].[dbo].[Client_JOBPLAN_PRD]

--------------------------
UPDATE A
	SET A.JPDURATION=B.DURATION
	--SELECT * 
	FROM [Client_JOBPLAN_NULL] A
	 LEFT JOIN 
[Lilly_Straging].[dbo].[Asset Analytix Job Plan table with duration added ACTIVE] B
ON A.JPNUM=B.[Job Plan] AND A.DESCRIPTION=B.[Job Plan Description]
WHERE SITE IS NULL  AND B.[JOB PLAN] IS NULL AND  [JOB PLAN]='3830'

------------------------------------------------Client_TASK_LongDescription_NULL------------------------------------------------------------------------

USE [Lilly_PMO]
GO
--------TRUNCATE TABLE [Lily_Repository].DBO.[Client_TASK_LongDescription_NULL]
INSERT INTO [Lily_Repository].DBO.[Client_TASK_LongDescription_NULL]
SELECT DISTINCT [Job Plan][JPNUM]
      ,[Job Plan Task][JPTASK]
      ,[DESCRIPTION]
      ,[JobPlnTsk Long Des# (1K Charaters)][LDTEXT]
      ,NULL[JOBTASKID]
  FROM [Lilly_Straging].[dbo].[Asset Analytix Job Plan Task table ACTIVE SITE NULL] A
  WHERE A.[Job Plan Task] IS NOT NULL
 -- JOIN [Lily_Repository].DBO.CLI


-- UPDATE A
-- SET A.[JOBTASKID]=B.[JOBTASKID]
--  --SELECT * 
--  FROM [Lily_Repository].DBO.[Client_TASK_LongDescription_NULL] A
--LEFT JOIN [Lily_Repository].[dbo].[Client_JOBTASK_NULL] B
-- ON A.JPNUM=B.JPNUM AND A.JPTASK=B.JPTASK


 SELECT * FROM [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan ORG level table]
   WHERE [JOB PLAN]='3830'

  with cte as
  (select JPNUM,JPTASK,row_number() over (partition by JPNUM,JPTASK order by JPNUM,JPTASK,DESCRIPTION)rn
  from  [Lily_Repository].DBO.[Client_TASK_LongDescription_NULL]
  )

  select * from cte where rn<>1

GO

---------------------------------------------------------Client_JOBTASK_NULL---------------------------------------------------------------------------------------

UPDATE A
SET A.[JOBTASKID]=B.[JOBTASKID]
SELECT * 
FROM [Lily_Repository].DBO.[Client_TASK_LongDescription_NULL] A
LEFT JOIN [Lily_Repository].[dbo].[UPDATE A
SET A.[JOBTASKID]=B.[JOBTASKID]

SELECT * 
FROM [Lily_Repository].DBO.[Client_TASK_LongDescription_NULL] A
LEFT JOIN [Lily_Repository].[dbo].[Client_JOBTASK_NULL] B
ON A.JPNUM=B.JPNUM AND A.JPTASK=B.JPTASK] B
--ON A.JPNUM=B.JPNUM AND A.JPTASK=B.JPTASK

------------------------------------------------------JPASSETSPLINKID------------------------------------------------------------------------------------------
SELECT distinct--[JPASSETSPLINKID]      [Job Plan][JPNUM]      ,null[SAFETYPLANID]      ,null[ITEMNUM]      ,[Asset Number][ASSETNUM]      ,[Location Code][LOCATION]      ,null[ISDEFAULTASSETSP]      ,null[WOREQWHENPURCH]      ,null[WOTYPEWHENPURCH]      ,[Organization][ORGID]      ,[Site][SITEID]      ,null[ITEMSETID]      ,[JOBPLANID] [JOBPLANID]      ,[ROWSTAMP][ROWSTAMP]      ,[PLUSCREVNUM][PLUSCJPREVNUM]  FROM [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan WhereUsed table] a  join [Lilly_PMO].[dbo].[Client_JOBPLAN] b on a.[Job Plan]=b.jpnum --and a.Site=b.SITEID  where a.[Asset Number] is not null--------------------------------------------------[Client_JOBTASK]----------------------------------------------------------------------------------------------USE [Lily_Repository]
GO
select * into [Lily_Repository].[Client_JOBTASK]
--insert into [Lily_Repository].[dbo].[Client_JOBTASK_DAF]
SELECT  [Job Plan][JPNUM]
      ,[Job Plan Task][JPTASK]
      ,[Description][DESCRIPTION]
      ,[Duration][TASKDURATION]
      ,null[JO1]
      ,null[JO2]
      ,null[JO3]
      ,null[JO4]
      ,null[JO5]
      ,null[JO6]
      ,null[JO7]
      ,null[JO8]
      ,[Organization][ORGID]
      ,[Site][SITEID]
      ,null[TASKSEQUENCE]
      ,null[METERNAME]
      ,null[JOBTASKID]
      --,null[JOBPLANID]
      ,null[LANGCODE]
      ,null[HASLD]
      ,null[NESTEDJPNUM]
      ,null[CLASSSTRUCTUREID]
      ,null[NESTEDJOBPLANID]
      ,null[OWNER]
      ,null[OWNERGROUP]
      ,null[FLOWACTION]
      ,null[FLOWCONTROLLED]
      ,null[SUSPENDFLOW]
      ,null[FLOWACTIONASSIST]
      ,null[LAUNCHENTRYNAME]
      ,null[PREDECESSORTASKS]
      ,null[ROWSTAMP]
      ,null[ASSIGNEDOWNERGROUP]
      ,null[CONDITIONNUM]
      ,[Revision][PLUSCJPREVNUM]
      ,null[PLUSCREVSTATUS]
      ,null[PLUSCNESTEDJPREVNUM]
      ,null[APPTREQUIRED]
      ,null[INCTASKSINSCHED]
      ,null[CREWWORKGROUP]
      ,null[HNAACTIVITY]
      ,null[INSPFORMNUM]
      ,null[INTSHIFT]
      ,null[INTERRUPTIBLE]
  FROM [Lilly_Straging].[dbo].[Asset Analytix Job Plan Task table] 
  where Site is null and Status='active'

GO

select distinct Status from [Lilly_Straging].[dbo].[Asset Analytix Job Plan Task table]
select * from  [dbo].[Client_Locations_DAF]

--truncate table [dbo].[Client_JOBTASK_]