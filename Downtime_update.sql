update  a		set 		a.CMDowntime=				 	case when(estdur <= actlabhrs) then estdur when estdur >= actlabhrs then actlabhrs when estdur = actlabhrs then estdur end 																 --when estdur >= actlabhrs then actlabhrs 																	--when estdur = actlabhrs then estdur end 																-- )  --a.JPduration --,	--a.RMDowntime=	 --case when(estdur <= actlabhrs) then estdur when estdur >= actlabhrs then actlabhrs when estdur = actlabhrs then estdur end  	 --b.RMDowntime				--select a.JPduration,estdur,actlabhrs,		--a.pmdowntime=		--select			--coalesce(nullif(a.JPduration,null),		--(case when(estdur <= actlabhrs) then estdur  when estdur >= actlabhrs then actlabhrs 		--when estdur = actlabhrs then estdur end )--)  		from [dbo].[Client_workorder_DAF]  a			where a.DEV_WORKTYPE in('CM')  --and a.actfinish>='2020-04-01' and a.actfinish<='2022-03-31'		--and a.JPduration is null		--and estdur=0 and  actlabhrs=0select siteid,dev_worktype,count(*) from  [dbo].[Client_workorder_DAF]  group by siteid,dev_worktype 
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