select distinct itemnum from [dbo].[Client_ItemMaster_Feb2022]

select distinct itemnum from [dbo].[Client_Item]

select * from [Client_Item] a
join [Client_ItemMaster_Feb2022] b
on a.ITEMNUM=b.itemnum

select * from [Client_Item] 
where itemnum not in(select distinct itemnum from [Client_ItemMaster_Feb2022] )

select * from [dbo].[Client_JOBPLAN]
where jpnum not in(select distinct jpnum from [dbo].[Client_JOBPLAN_Feb2022] )



select top 1* from [dbo].[Client_JOBPLAN]
select top 1* from [dbo].[Client_JOBPLAN_Feb2022]

select * --into [Client_JOBPLAN1]
from [Client_JOBPLAN]
where 1=2
----------------------------
truncate table [Client_JOBPLAN]
insert into [Client_JOBPLAN]
select [JPNUM]
      ,[DESCRIPTION]
      ,[JPDURATION]
      ,[LABORCODE]
      ,[DOWNTIME]
      ,[SUPERVISOR]
      ,[CALENDAR]
      ,[PRIORITY]
      ,[CREWID]
      ,[ORGID]
      ,[SITEID]
      ,[OWNER]
      ,[JOBPLANID]
      ,[PERSONGROUP]
      ,[OWNERGROUP]
      ,[LANGCODE]
      ,[STATUS]
      ,[INTERRUPTIBLE]
      ,[HASLD]
      ,[CLASSSTRUCTUREID]
      ,[TEMPLATETYPE]
      ,[SUSPENDFLOW]
      ,[FLOWCONTROLLED]
      ,[FLOWACTION]
      ,[FLOWACTIONASSIST]
      ,[LAUNCHENTRYNAME]
      ,[ROWSTAMP]
      ,[ASSIGNEDOWNERGROUP]
      ,[HASNESTEDJP]
      ,[MODELID]
      ,[PLUSCCHANGEBY]
      ,[PLUSCCHANGEDATE]
      ,[PLUSCREVCOM]
      ,[PLUSCREVNUM]
      ,[PLUSCSTATUSDATE]
      ,[INCTASKSINSCHED]
      ,[STCONOFFSET]
      ,[FNCONOFFSET]
      ,[AMCREW]
      ,[CREWWORKGROUP]
      ,[REQASSTDWNTIME]
      ,[APPTREQUIRED]
      ,[AOS]
      ,[AMS]
      ,[LOS]
      ,[LMS]
      ,[REPAIRLOCFLAG]
      ,[HNAASSETCLASS]
      ,[HNADEPT]
      ,[HNAJPAUTHOR]
      ,[HNAJPTEMPLATE]
      ,[HNAMANUFACTURER]
      ,[HNAORIGJPNUM]
      ,[HNAOWNER]
      ,[HNAJUSTIFYPRIORITY]
      ,[INSPFORMNUM]
      ,[INTSHIFT]
      ,[HNAJPGRAD]
from [dbo].[Client_JOBPLAN_March2022] --[Client_JOBPLAN_Feb2022]


---------------------------------
select top 1* from [dbo].[Client_PM]
select top 1* from [dbo].[Client_PM_Feb2022]

select * into [Client_PM1]
from [Client_PM]
where 1=2

truncate table [Client_PM]
insert into [Client_PM]
select * from [dbo].[Client_PM_March2022]



--------

select top 1* from [dbo].[Client_JOBLABOR]
select top 1* from [dbo].[Client_JOBLABOR_Feb2022]

select * into [Client_JOBLABOR1]
from [Client_JOBLABOR]
where 1=2


truncate table [Client_JOBLABOR]
insert  into [Client_JOBLABOR]
select * from [dbo].[Client_JOBLABOR_March2022]

---------------------------------------------------------

select top 1* from [dbo].[Client_JOBMATERIAL]
select top 1* from [dbo].[Client_JOBMATERIAL_feb2022]

select * --into [Client_JOBMATERIAL1]
from [Client_JOBMATERIAL]
where 1=2

truncate table [Client_JOBMATERIAL]
insert into [Client_JOBMATERIAL]
select * from [dbo].[Client_JOBMATERIAL_March2022]

-----------------------------------------------------

select top 1* from [dbo].[Client_JOBTASK]
select top 1* from [dbo].[Client_JOBTASK_Feb2022]

select * --into [Client_JOBTASK1]
from [Client_JOBTASK1]
where 1=2

truncate table [Client_JOBTASK]
insert into [Client_JOBTASK]
select * from [dbo].[Client_JOBTASK_March2022]

-----

select * from [dbo].[Client_TASK_LongDescription]
select * from [dbo].[Client_TASK_LongDescription_Feb2022]

select * into [Client_TASK_LongDescription2]
from [Client_TASK_LongDescription]
where 1=2

truncate table  [Client_TASK_LongDescription]
insert into [Client_TASK_LongDescription]
select a.*,null as siteid from [dbo].[Client_TASK_LongDescription_March2022] a


-----------------------------

select * from [dbo].[Client_Locations]
select * from [dbo].[Client_Locations_Feb2022]

select * into  [Client_Locations1]
from [Client_Locations]

insert into [Client_Locations] 
select * from  [dbo].[Client_Locations_March2022]
where location  not in(select distinct location from [dbo].[Client_Locations])

------------

select * from [dbo].[Client_Lochierarchy]
select * from [dbo].[Client_Lochierarchy_Feb2022]

select * from [dbo].[Client_Lochierarchy_Feb2022] 
where location  not in(select distinct location from [dbo].[Client_Lochierarchy])

select * --into  [Client_Lochierarchy1]
from [Client_Lochierarchy]
where 1=2

truncate table [Client_Lochierarchy]
insert into  [Client_Lochierarchy]
select * from [dbo].[Client_Lochierarchy_March2022]

-------------

select * from [dbo].[Client_PMSEQUENCE]
select * from [dbo].[Client_PMSEQUENCE_Feb2022]

select * --into  [Client_PMSEQUENCE1]
from [Client_PMSEQUENCE]
where 1=2

truncate table [Client_PMSEQUENCE]
insert into  [Client_PMSEQUENCE]
select * from [dbo].[Client_PMSEQUENCE_March2022]

---------------

select * from [dbo].[Client_Sparepart]
select * from [dbo].[Client_Sparepart_March2022]

select * into [Client_Sparepart1]
from [Client_Sparepart]


insert into [dbo].[Client_Sparepart]
select * from [dbo].[Client_Sparepart_March2022]

--------------------

select * from [dbo].[Client_Labtrans]
select *  from [dbo].[Client_Labtrans_March2022]

select * into [Client_Labtrans1]
from [Client_Labtrans]

insert into [Client_Labtrans]
select *  from [dbo].[Client_Labtrans_March2022]

------------
select * from [dbo].[Client_Matusetrans]
select *  from [dbo].[Client_Matusetrans_March2022]


select *  from [dbo].[Client_Matusetrans_March2022] b
where itemnum   in(select distinct itemnum from [dbo].[Client_Matusetrans] a )

select * into [Client_Matusetrans1]
from [Client_Matusetrans]

insert into [Client_Matusetrans]
select --*
[ITEMNUM]
      ,[TRANSDATE]
      ,[ACTUALDATE]
      ,[QUANTITY]
      ,[UNITCOST]
      ,[ACTUALCOST]
      ,[PONUM]
      ,[ASSETNUM]
      ,[LINECOST]
      ,[LOCATION]
      ,[ORGID]
      ,[SITEID]
      ,[REFWO]
      ,[matrectransid]
      ,[linetype]
from [dbo].[Client_Matusetrans_March2022]

-------------
select * from [dbo].[Client_Item]

select * from [dbo].[Client_ItemMaster_Feb2022]

select * from [dbo].[Client_ItemMaster_Feb2022] b
where b.itemnum not in(select distinct itemnum from [dbo].[Client_Item] a )
--where a.AVGCOST!=b.AVGCOST


select * from [dbo].[Client_ItemMaster_Feb2022]
where itemnum='901064877'

select * from [dbo].[Client_Item]
where itemnum='901064877'


select * --into [Client_Item1]
from [Client_Item1]

update a
set a.description=b.description,
	a.avgcost=b.avgcost,
	a.issueunit=b.issueunit
 from [Client_Item1] a
 join [Client_ItemMaster_Feb2022] b
on a.itemnum=b.itemnum

insert into [Client_Item1]
select * 
from [dbo].[Client_ItemMaster_Feb2022] 
where itemnum not in(select distinct itemnum from [dbo].[Client_Item1] a)


select * from 
update [Client_Item1]

----

select * --DEV_WORKTYPE,count(*) --into 
from [dbo].[Client_Workorder]
where year='28-Feb-2022' and assetnum='A103284'
group by DEV_WORKTYPE

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo1]

select top 1 * from [dbo].[Client_Workorder1] where wonum='M25969119'
select top 1 * from [dbo].[Client_Workorder] where wonum='M25969119'

SELECT [TARGSTARTDATE],CONVERT(nvarchar(255),[TARGSTARTDATE] , 120)
from 

update [dbo].[Client_Workorder]
set [TARGSTARTDATE1]=CONVERT(nvarchar(255),[TARGSTARTDATE] , 120),
	[TARGCOMPDATE1]=CONVERT(nvarchar(255),[TARGCOMPDATE] , 120),
[SCHEDSTART1]=CONVERT(nvarchar(255),[SCHEDSTART] , 120),
[SCHEDFINISH1]=CONVERT(nvarchar(255),[SCHEDFINISH] , 120)


select * from [dbo].[Client_Workorder]
where year='28-Feb-2022'

--drop table [dbo].[Client_ItemMaster_March2022],[dbo].[Client_ItemMaster_Feb2022],[dbo].[Client_JOBLABOR_March2022],[dbo].[Client_JOBMATERIAL_March2022],
--[dbo].[Client_JOBPLAN_March2022],[dbo].[Client_JOBTASK_March2022],[dbo].[Client_Labtrans_March2022],[dbo].[Client_Locations_March2022],
--[dbo].[Client_Lochierarchy_March2022],[dbo].[Client_Matusetrans_March2022],
--[dbo].[Client_PM_March2022],[dbo].[Client_PMSEQUENCE_March2022]
--,[dbo].[Client_Sparepart_March2022],[dbo].[Client_TASK_LongDescription_March2022],[dbo].[ItemMaster_March2022]