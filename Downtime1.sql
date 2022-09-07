		select estdur,actlabhrs,case when(estdur <= actlabhrs) then estdur 
																 when estdur >= actlabhrs then actlabhrs 
																	when estdur = actlabhrs then estdur end 
																 
		from [client_workorder_PRD] a	

		where a.DEV_WORKTYPE in('CM') 

		----------------
		update a
		set a.CMDowntime=b.CMDowntime,
		    a.PMDowntime=b.PMDowntime,
			a.RMDowntime=b.RMDowntime
		from [client_workorder_PRD] a

		
---------------------Update CM,PM,RM Downtime ------------
		
		update a
		set a.CMDowntime=b.CMDowntime,
		    a.PMDowntime=b.PMDowntime,
			a.RMDowntime=b.RMDowntime
		from [client_workorder_PRD] a						
		join
	(
	select wonum,case when dev_worktype='CM' then abs(datediff(hour,coalesce(schedstart,targstartdate,reportdate),ACTFINISH)) end as CMDowntime , 

	case when dev_worktype='PM' then abs(case when datediff(hour,schedstart,schedfinish) > datediff(hour,actstart,actfinish)				
		then datediff(hour,schedstart,schedfinish) else datediff(hour,actstart,actfinish) end) end as PMDowntime ,

	case when dev_worktype='RM' then abs(datediff(hour,reportdate,ACTFINISH))  end as RMDowntime 

		FROM [client_workorder_PRD] --[client_workorder_DAF]
		)b
		on a.wonum=b.wonum



		update  a
		set 
		--a.CMDowntime=
		--			 	case when(estdur <= actlabhrs) then estdur when estdur >= actlabhrs then actlabhrs when estdur = actlabhrs then estdur end 
																 --when estdur >= actlabhrs then actlabhrs 
																	--when estdur = actlabhrs then estdur end 
																-- )  --a.JPduration --,
	a.RMDowntime=
	 case when(estdur <= actlabhrs) then estdur when estdur >= actlabhrs then actlabhrs when estdur = actlabhrs then estdur end  --b.RMDowntime
		
		--select a.JPduration,estdur,actlabhrs,
		--a.pmdowntime=
		--select	
		--coalesce(nullif(a.JPduration,null),(case when(estdur <= actlabhrs) then estdur  when estdur >= actlabhrs then actlabhrs 
		--	when estdur = actlabhrs then estdur end ))  
		from [dbo].[Client_workorder_2204]  a	
		where a.DEV_WORKTYPE in('RM')  --and a.actfinish>='2020-04-01' and a.actfinish<='2022-03-31'
		--and a.JPduration is null
		--and estdur=0 and  actlabhrs=0
	
	
select *--siteid,dev_worktype,count(*) 
from  [dbo].[Client_workorder_2204]  
group by siteid,dev_worktype 



--update a
--set downtime=Rmdowntime
--from  [dbo].[Client_workorder_2204]  a
--where DEV_WORKTYPE in('RM') 

select a.JPduration,estdur,actlabhrs,a.JPduration,case when(estdur <= actlabhrs) then estdur 
																 when estdur >= actlabhrs then actlabhrs 
																	when estdur = actlabhrs then estdur end 
																 
		from [dbo].[Client_workorder_2204] a	

		where a.DEV_WORKTYPE in('CM','RM') and  a.actfinish>='2020-04-01' and a.actfinish<='2022-03-31' and 
		a.JPduration >0


		------------------DAF---
			update  a
		set --a.CMDowntime= coalesce(nullif(estdur,0),actlabhrs) --b.CMDowntime,
		    a.PMDowntime= a.JPduration --,
			--a.RMDowntime=coalesce(nullif(estdur,0),actlabhrs)  --b.RMDowntime
		
		--select estdur,actlabhrs,coalesce(nullif(estdur,0),actlabhrs)
		from [client_workorder_DAF] a	
		where a.DEV_WORKTYPE in('PM') and a.actfinish>='2020-04-01' and a.actfinish<='2022-03-31'
		--and estdur=0 and  actlabhrs=0



		-----------------------------
		
UPDATE [Client_workorder_DAF]
SET NONpPMDowntime=a.NONPMDowntime
from(

select siteid,wonum,ASSETNUM,rmdowntime,cmdowntime,(sum(cmdowntime1) + sum(a.rmdowntime1))NONPMDowntime 
from(
select siteid,wonum,ASSETNUM,rmdowntime,cmdowntime,isnull(sum(rmdowntime),0)cmdowntime1,isnull(sum(cmdowntime),0)rmdowntime1 
--select count(*) 
from  [Client_workorder_DAF] ---[client_workorder_DAF] 
--where year='31-Mar-2021' 
where  dev_worktype in('RM','CM')
group by siteid,wonum,ASSETNUM,rmdowntime,cmdowntime )a
group by siteid,wonum,ASSETNUM,rmdowntime,cmdowntime )a
WHERE --[client_workorder_DAF].ASSETNUM=a.ASSETNUM and 
[Client_workorder_DAF].WONUM=a.WONUM and [Client_workorder_DAF].siteid=a.siteid
--and Year='31-mar-2021'


update [client_workorder_PRD]
set downtime=PMDowntime
where dev_worktype='PM'

update [client_workorder_DAF]
set downtime=PMDowntime
where dev_worktype='PM'

select count(*) from [dbo].[client_workorder_all]

select count(*) from [dbo].[client_workorder_all1]

insert into [dbo].[Client_workorder_All1]
select * from [dbo].[client_workorder_DAF]

delete [Client_workorder_All1]
where --actfinish<'2020-04-01' --and 
actfinish >'2022-03-31'
and siteid='PRD'


actfinish>='2020-04-01' and actfinish <='2022-03-31'


select distinct AssetNum from [dbo].[Asset_Master_DAF]

select distinct status FROM [Lilly_Straging].[dbo].[Asset Analytix Asset table]
  where --status in ('active','Operating') and 
  [site] ='PRD'

  select * from relatedrecord_PRD

    select * from Honda_Staging.dbo.relatedrecord

	select * from [Lilly_Straging].dbo.[Asset Analytix WorkOrder table_all]  where [Has Follow-up Work]='YES' and  [site] ='PRD'

	--update a
	--set a.jpduration=b.JPDURATION
	----select a.*,b.jpnum,b.JPDURATION 
	--from [LILLY_Repository_New].[dbo].[Client_workorder_2204] a
	--join [Lilly_PMO].dbo.Client_JOBPLAN_PRD b
	--on a.jpnum=b.jpnum and a.siteid=b.SITEID
	--where b.JPDURATION is not null 

	select * from  [LILLY_Repository_New].[dbo].[Client_workorder_2204]



	-----------------------------------------

	select site, [work order], sum(quantity*[regular hours]) as estlabhours 
	from [Asset Analytix WorkOrder table with plan labor_All]  a
	group by site, [work order]
	--[dbo].[Asset Analytix WorkOrder table 2020 with plan labor]

	select count(*) 
	from [LILLY_Repository_New].[dbo].[Client_workorder_all1]
	where wonum  not in(select  [work order] --,site, sum(quantity*[regular hours]) as estlabhours 
	from [Asset Analytix WorkOrder table with plan labor_All]  a
	where  crew in ('INUT','INUP','INRN','INAFM1','INAFM3','INAFM4','INRMT1','INRMOD','INDC1','INRS','INAFM2','INDB')
	--group by site, [work order]
	)
	and actfinish >='2020-04-01 00:00:00:000'and actfinish <='2022-03-31 23:59:59:999' 


--select * into [Asset Analytix WorkOrder table with plan labor_All] 
--from [dbo].[Asset Analytix WorkOrder table 2020 with plan labor]

--insert into [Asset Analytix WorkOrder table with plan labor_All] 
--select * from [dbo].[Asset Analytix WorkOrder table 2022 with plan labor]

select * from [dbo].[Client_PM_DAF]
where pmnum='89208'

select * from [dbo].[Client_PMSEQUENCE_DAF]
where pmnum='89208'

select site,count(*) from [Lilly_Straging].[dbo].[Asset Analytix PM Sequence table]
group by site
where [pm nbr]='89208'
