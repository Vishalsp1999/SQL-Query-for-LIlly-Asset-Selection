update  a
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