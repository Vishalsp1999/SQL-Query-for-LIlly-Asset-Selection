 Select PMNUM,ASSETNUM from [dbo].[client_workorder] where --CREWID='INPN'
 wonum ='18997672'

 Select b.* from client_workorder a left join Client_JOBPLAN b on a.JPNUM=b.JPNUM
 where a.wonum ='18997672'

 
Select * from  Client_PM where PMNUM='68387'

Select * from PMO_3410012 where assetnum='K416589'