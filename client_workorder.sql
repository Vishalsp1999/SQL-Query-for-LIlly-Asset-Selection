--Select * into Client_workorder_29_08 from Client_workorder where 1=2--truncate table Client_workorder_29_08--insert into Client_workorder_29_08SELECT  b.[Work Order] [WONUM]      ,[Parent WO] [PARENT]      ,[Status][STATUS]      ,null[STATUSDATE]      ,b.[Work Type][WORKTYPE]      ,[Work Order Description][DESCRIPTION]      ,[Asset][ASSETNUM]      ,[Location][LOCATION]      ,[Job Plan][JPNUM]      ,null [FAILDATE]      ,null [CHANGEDATE]      ,[Duration][ESTDUR]      ,sum(b.quantity*b.[regular hours]) [ESTLABHRS]      ,null [ESTMATCOST]      ,null [ESTLABCOST]      ,null [ESTTOOLCOST]      ,b.[PM][PMNUM]      ,b.[WO Actual Labor Hr Qty][ACTLABHRS]      ,b.[WO Actual Material Cost][ACTMATCOST]      ,(b.[WO Actual Labor Hr Qty]*90)[ACTLABCOST]      ,null[HASCHILDREN]      ,[Reported By Name][REPORTEDBY]      ,null [HISTORYFLAG]      ,[WO Priority][WOPRIORITY]      ,[Target Finish Date][TARGCOMPDATE]      ,[Target Start Date][TARGSTARTDATE]      ,b.[Reported Date][REPORTDATE]      ,null[DOWNTIME]      ,[Actual Start][ACTSTART]      ,b.[Actual Finish][ACTFINISH]      ,[Scheduled Start][SCHEDSTART]      ,[Scheduled Finish][SCHEDFINISH]      ,[Crew][CREWID]      ,null[FAILURECODE]      ,b.[Site][SITEID]      ,null[CLASSSTRUCTUREID]      ,null [F37]      ,'31-Mar-2022' [Year]      ,b.[WO Actual Material Cost] [SPARECOST]      ,(b.[WO Actual Labor Hr Qty] * 90)[LABORCOST]      ,null [IsReview]      ,k.Dev_worktype      ,null [CMDowntime]      ,null [PMDowntime]      ,null [RMDowntime]      ,null [NONPPMDowntime]      ,null [LDTEXT]	  ,null  FROM [dbo].[Asset Analytix WorkOrder table with plan labor_All_Demo] b--where status='close' --and site='PRD' and [Actual Finish]>= '2020-04-01'and [Actual Finish] <='2022-03-31' join(-- select site,worktype,count(*)WOCount --from (select a.Site,a.[Work Order] [Work Order],[Work Type],[Actual Finish], b.refwo,a.[Reported Date],min(startdate)startdate,DATEDIFF(hour,[Reported Date],min(startdate)) HrsWithin,a.PM,case when [Work Type] in('PDM','PM','PMCAL','PMSN') and a.PM is not null then 'PM'	 when [Work Type] in('MA') then 'RM'	 when [Work Type] in('RPM','RPDM','MA','MI','SD') then 'CM'		 when DATEDIFF(hour,[Reported Date],min(startdate)) < 72 then 'RM'	 when DATEDIFF(hour,[Reported Date],min(startdate)) > 72 then 'CM' 	 else 'OTH'end dev_worktypefrom [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table_all]  aleft join [Lilly_PMO].dbo.Client_Labtrans_ALL bon a.[Work Order]=b.refwo and a.Site=b.SITEIDwhere a.Status='close' and --a.Site='PRD' and b.SITEID='PRD' --and a.PM is  null--and a.[Reported Date] >='2021-03-31'and a.[Reported Date] <'2022-04-01'-- and  a.[Actual Finish] >='2017-04-01 00:00:00:000'and a.[Actual Finish] <='2022-03-31 23:59:59:999'--and  [Work Type] not in('PDM','PM','PMCAL','PMSN')and crew in ('INUT','INUP','INRN','INAFM1','INAFM3','INAFM4','INRMT1','INRMOD','INDC1','INRS','INAFM2','INDB','INPN')group by a.Site,a.[Work Order] , b.refwo,a.[Reported Date],[Work Type],[Actual Finish],a.PM  --)v----where v.PM is null and worktype='PM'----where v.[work order] in ('18190827','18487761','18881416','19234610','19539001','19845323','20164241','20399363','20399418','20399461','20399504','20399527','20399540','20399554','20399591','20399606','20399630','18487743','18487782','18487805','18487823','18492449','18726368','19281714','19351355','19679029','19845728','19845752','19845768','19845790','20044434','20399381','20399398','20399478','20399578')--group by site,worktype )k on b.[Work Order]=k.[Work Order] and b.Site=k.Sitegroup by b.[Work Order]       ,[Parent WO]      ,[Status]     ,b.[Work Type]      ,[Work Order Description]      ,[Asset]      ,[Location]      ,[Job Plan]      ,[Duration]      ,b.[PM]      ,b.[WO Actual Labor Hr Qty]      ,b.[WO Actual Material Cost]      ,(b.[WO Actual Labor Hr Qty]*90)      ,[Reported By Name]      ,[WO Priority]      ,[Target Finish Date]      ,[Target Start Date]      ,b.[Reported Date]      ,[Actual Start]      ,b.[Actual Finish]      ,[Scheduled Start]      ,[Scheduled Finish]      ,[Crew]      ,b.[Site]      ,b.[WO Actual Material Cost]       ,(b.[WO Actual Labor Hr Qty] * 90)      ,k.Dev_worktype	  Select * from [dbo].[Client_workorder_29_08]--Select DOWNTIME from client_workorder where downtime is not nullSelect ([Actual Finish]) from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table_all] where [Actual Finish] >='2017-04-01 00:00:00:000'and [Actual Finish] <='2022-03-31 23:59:59:999'and status='close' and  crew in ('INUT','INUP','INRN','INAFM1','INAFM3','INAFM4','INRMT1','INRMOD','INDC1','INRS','INAFM2','INDB','INPN')Select * from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder Labor table v2]Select a.craft,b.Craft,a.quantity,b.[Regular Hours],a.[Regular Hours] from [Lilly_Repository_25-08].[dbo].[Asset Analytix WorkOrder table with plan labor_All_Demo]a left join [Lilly_Straging].[dbo].[Asset Analytix WorkOrder Labor table v2] b on a.[work order]=b.[Work Order]and a.site=b.Site