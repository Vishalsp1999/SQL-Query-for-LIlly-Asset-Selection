Select * from client_workorder where SITEID='DAF'

Select * from PMO_3410012 where SiteId='DAF'

where wonum='19493450'


 b.[WO Actual Material Cost] [SPARECOST]      (b.[WO Actual Labor Hr Qty] * 90)[LABORCOST]

	  Select [Work Order],[WO Actual Labor Hr Qty] from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder table with plan labor_All]
19493450 --13


Select sum(PMDowntime)pm,sum(RMDowntime)rm,sum(CMDowntime)cm from client_workorder where SITEID='PRD'

Select sum(PMDowntime)pm,sum(RMDowntime)rm,sum(CMDowntime)cm from AX_Asset_Metric_Facts  where SITEID='PRD'
Select sum(PMDowntime)pm,sum(RMDowntime)rm,sum(CMDowntime)cm from AX_Segment_Metric_Facts  where SITEID='PRD'


Select downtime from Client_Workorder 
where DEV_WORKTYPE in ('Cm','RM')

--update Client_Workorder
--set downtime=PMDowntime
--where DEV_WORKTYPE='PM' and PMDowntime is not null

--update Client_Workorder
--set downtime=RMDowntime
--where DEV_WORKTYPE='RM' and RMDowntime is not null

--update Client_Workorder
--set downtime=CMDowntime
--where DEV_WORKTYPE='CM' and CMDowntime is not null


--update a
--Set a.downtime=b.downtime
--from Client_Workorder a left join 
--Client_Workorder_26_08 b on a.WONUM=b.WONUM and a.SITEID=b.SITEID