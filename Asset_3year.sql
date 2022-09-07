
--select * from  AX_Asset_Metric_Facts1
select * --into [AX_Asset_Metric_Facts1] 
from [Honda_Repository].[dbo].[AX_Asset_Metric_Facts]
--where 1=2 -- AX_Asset_Metric 

--select * into AX_Asset_Metric from (

--truncate table dbo.[AX_Asset_Metric_Facts]

insert into [AX_Asset_Metric_Facts]

select null as [Ax_Asset_id],asset as [CMMS_Asset_ID],siteid,dept,null as Month_year,wocount,totallabhrs,totallabcost,totalsparecost,totalcost,
PM_count,pmactlabhrs,pmlaborcost,pmsparecost,pmtotal,b.pmdowntime,b.pmFollowupwo,

abs(nullif(case when ((((isnull(z_PMlabhrs,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmlabhrs_weightage ')))+(isnull(z_PMsparecost,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmsparecost_weightage')))+(isnull(z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMDowntime_weightage')))+(isnull(z_PMTotal,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMTotal_weightage')))+(isnull(z_PMFollowupwo,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMFollowupwo_weightage')))+(isnull(z_PM_count,0)*(select [dbo].[GetValue_fn] ('PM_Index','PM_count_weightage')))))*100) > 0 then 
(((isnull(z_PMlabhrs,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmlabhrs_weightage ')))+(isnull(z_PMsparecost,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmsparecost_weightage')))+(isnull(z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMDowntime_weightage')))+(isnull(z_PMTotal,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMTotal_weightage')))+(isnull(z_PMFollowupwo,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMFollowupwo_weightage')))+(isnull(z_PM_count,0)*(select [dbo].[GetValue_fn] ('PM_Index','PM_count_weightage')))))*100 else 0 end,0)) as PM_Index ,0 as PM_GBActor_Index

,CM_count,cmactlabhrs,cmlaborcost,cmsparecost,cmtotal,b.cmdowntime, b.cmFollowupwo,

case when ((((isnull(z_CMactlabhrs,0)*(select [dbo].[GetValue_fn]('CM_Index','Cmactlabhrs_weightage ')))+(isnull(z_CMsparecost,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmsparecost_weightage')))+(isnull(z_CMFollowupwo,0)*(select [dbo].[GetValue_fn] ('CM_Index','CMFollowupwo_weightage'))) +(isnull(z_cm_follow_pm,0)*(select [dbo].[GetValue_fn] ('CM_Index','cm_follow_pm_weightage')))))*100) > 0 then 
(((isnull(z_CMactlabhrs,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmactlabhrs_weightage')))+(isnull(z_CMsparecost,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmsparecost_weightage')))+(isnull(z_CMFollowupwo,0)*(select [dbo].[GetValue_fn] ('CM_Index','CMFollowupwo_weightage'))) +(isnull(z_cm_follow_pm,0)*(select [dbo].[GetValue_fn] ('CM_Index','cm_follow_pm_weightage')))))*100 else 0 end as CM_Index,

--(abs(((isnull(z_CMMTBF,0))*(select [dbo].[GetValue_fn] ('CM_GBActor_Index','CMMTBF_weightage')))+(isnull(z_GBPARTSCOST,0)*(select [dbo].[GetValue_fn] ('CM_GBActor_Index','GBPARTSCOST_weightage')))+(isnull(Z_CMDowntime,0)*(select [dbo].[GetValue_fn] ('CM_GBActor_Index','CMDowntime_weightage')))))*100 CM_GBActor_Index,

(abs(((isnull(cast(z_MTBM as NUMERIC(18,2)),0))*(select [dbo].[GetValue_fn] ('GBActorIndex','MTBM_weightage')))+(isnull(cast(z_NONpmsparecost as NUMERIC(18,2)),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','NONpmsparecost_weightage')))+
(isnull(cast(z_nonpmlabcost as NUMERIC(18,2) ),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','nonpmlabcost_weightage')))+(isnull(cast(z_nonpmDowntime as NUMERIC(18,2)),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','nonpmDowntime_weightage')))+
(isnull(cast(z_nonpm_count as NUMERIC(18,2)),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','nonpm_count_weightage')))) ) * 100 CM_GBActor_Index,    

cm_follow_pm,RM_count,rmactlabhrs,rmlaborcost,rmsparecost,rmtotal,b.rmdowntime,b.rmFollowupwo,

case when ((((isnull(z_RMactlabhrs,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmactlabhrs_weightage')))+(isnull(z_RMsparecost,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmsparecost_weightage')))+(isnull(z_RMFollowupwo,0)*(select [dbo].[GetValue_fn] ('RM_Index','RMFollowupwo_weightage'))) +(isnull(z_Rm_follow_pm,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rm_follow_pm_weightage')))))*100) > 0 then 
(((isnull(z_RMactlabhrs,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmactlabhrs_weightage')))+(isnull(z_RMsparecost,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmsparecost_weightage')))+(isnull(z_RMFollowupwo,0)*(select [dbo].[GetValue_fn] ('RM_Index','RMFollowupwo_weightage'))) +(isnull(z_Rm_follow_pm,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rm_follow_pm_weightage')))))*100 else 0 end as RM_Index, 0 as RM_GBActor_Index,rm_follow_pm,NONpm_count,NONpmactlabhrs,NONpmlaborcost,NONpmsparecost,NONpmtotal,b.NONpmdowntime,b.NONpmFollowupwo,

case when ((((isnull(z_Nonpmactlabhrs,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmactlabhrs_weightage')))+(isnull(z_Nonpmsparecost,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmsparecost_weightage')))+(isnull(z_NonpmFollowupwo,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NonpmFollowupwo_weightage'))) +(isnull(z_NONPM_follow_pm,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NONPM_follow_pm_weightage')))))*100) >0 then 
(((isnull(z_Nonpmactlabhrs,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmactlabhrs_weightage')))+(isnull(z_Nonpmsparecost,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmsparecost_weightage')))+(isnull(z_NonpmFollowupwo,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NonpmFollowupwo_weightage'))) +(isnull(z_NONPM_follow_pm,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NONPM_follow_pm_weightage')))))*100 else 0 end as Nonpm_Index,0 as NONPM_GBActor_Index,nonpm_follow_pm,

abs((((((isnull(z_PMlabhrs,0)*(select [dbo].[GetValue_fn] ('PMO_Index','Pmlabhrs_weightage')))+(isnull(z_PMsparecost,0)*(select [dbo].[GetValue_fn] ('PMO_Index','Pmsparecost_weightage')))+(isnull(z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMDowntime_weightage')))+(isnull(z_PMTotal,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMTotal_weightage')))+(isnull(z_PMFollowupwo,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMFollowupwo_weightage')))+(isnull(z_PM_count,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PM_count_weightage')))))*100)+
((((isnull(z_NONpmactlabhrs,0)*(select [dbo].[GetValue_fn] ('PMO_Index','NONpmactlabhrs_weightage')))+(isnull(z_NONpmsparecost,0)*(select [dbo].[GetValue_fn] ('PMO_Index','NONpmsparecost_weightage')))+(isnull(z_NONpmFollowupwo,0)*(select [dbo].[GetValue_fn] ('PMO_Index','NONpmFollowupwo_weightage')))+(isnull(z_cm_follow_pm,0)*(select [dbo].[GetValue_fn] ('PMO_Index','cm_follow_pm_weightage')))))*100)+
(abs(((isnull(z_PMMTBF,0))*(select [dbo].[GetValue_fn] ('PMO_Index','PMMTBF_weightage')))+(isnull(z_GBPARTSCOST,0)*(select [dbo].[GetValue_fn] ('PMO_Index','GBPARTSCOST_weightage')))+(isnull(Z_GBDowntime,0)*(select [dbo].[GetValue_fn] ('PMO_Index','GBDowntime_weightage')))))*100)/3) PMO_Index,

GBPARTSCOST,GBDowntime,
MTBM,MTTR,b.CMMTBF AS MTBF,availablehrs as Available_Hrs,updated_on as 'year'

 ,z_PM_count,z_PMlabhrs,z_PMlabcost,z_PMsparecost, z_PMTotal , abs(z_PMDowntime)z_PMDowntime,z_PMFollowupwo, b.PMMTBF,z_PMMTBF,
  z_CMsparecost,abs(z_CMDowntime)z_CMDowntime,z_CMFollowupwo,z_CMMTBF,
  z_RM_count,z_RMlabcost,z_RMsparecost, z_RMTotal ,abs(z_RMDowntime)z_RMDowntime,z_RMFollowupwo,b.RMMTBF ,z_RMMTBF,abs(z_NONPMDowntime)z_NONPMDowntime,
  b.NONPMMTBF,Z_GBDowntime, z_GBPARTSCOST

from(

select a.asset asset,a.siteid siteid,a.dept dept,a.wocount wocount,a.totallabhrs totallabhrs,a.totallabcost totallabcost,a.totalsparecost totalsparecost,a.totalcost totalcost,
a.pmactlabhrs pmactlabhrs,a.pmlaborcost pmlaborcost,a.pmsparecost pmsparecost,a.pmdowntime pmdowntime,a.pmtotal pmtotal,a.pmFollowupwo pmFollowupwo,
a.rmactlabhrs rmactlabhrs,a.rmlaborcost rmlaborcost,a.rmsparecost rmsparecost,a.rmdowntime rmdowntime,a.rmtotal rmtotal,a.rmFollowupwo rmFollowupwo,
a.cmactlabhrs cmactlabhrs,a.cmlaborcost cmlaborcost,a.cmsparecost cmsparecost,a.cmdowntime cmdowntime,a.cmtotal cmtotal,a.cmFollowupwo cmFollowupwo,
a.NONpmactlabhrs NONpmactlabhrs,a.NONpmlaborcost NONpmlaborcost,a.NONpmsparecost NONpmsparecost,a.Nonpmdowntime,a.NONpmTotal NONpmTotal,a.NONpmFollowupwo NONpmFollowupwo,
a.cm_follow_pm cm_follow_pm, a.rm_follow_pm rm_follow_pm, a.nonpm_follow_pm nonpm_follow_pm,
a.PMMTBF PMMTBF,
a.CMMTBF CMMTBF,
a.RMMTBF RMMTBF,
a.NONPMMTBF NONPMMTBF,

a.GBPARTSCOST GBPARTSCOST,
a.GBDowntime GBDowntime,

a.availablehrs,
a.PM_count,a.CM_count,a.RM_count,a.NONPM_count,
a.mtbm,a.mttr,
----PM
max(a.pmactlabhrs)over()maxa,min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini,
(a.pmactlabhrs-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over())/(max(a.pmactlabhrs)over()-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over() ) z_PMlabhrs,
max(a.pmlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini1,
(a.pmlaborcost-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over())/(max(a.pmlaborcost)over()-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over() ) z_PMlabcost,
max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini2,
(a.pmsparecost-min(case when a.pmsparecost>0 then a.pmsparecost end)over())/(max(a.pmsparecost)over()-min(case when a.pmsparecost>0 then a.pmsparecost end)over() ) z_PMsparecost ,
max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini18,
(a.PM_count-min(case when a.PM_count>0 then a.PM_count end)over())/(max(a.PM_count)over()-min(case when a.PM_count>0 then a.PM_count end)over() ) z_PM_count,
--0 z_PM_count,
max(a.pmdowntime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
(a.pmdowntime-min(case when a.pmdowntime>0 then a.pmdowntime end)over())/(max(a.pmdowntime)over()-min(case when a.pmdowntime>0 then a.pmdowntime end)over() ) z_PMDowntime ,
max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini4,
(a.pmtotal-min(case when a.pmtotal>0 then a.pmtotal end)over())/(max(a.pmtotal)over()-min(case when a.pmtotal>0 then a.pmtotal end)over() ) z_PMTotal ,
max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.pmFollowupwo-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())/nullif((max(a.pmFollowupwo)over()-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()),(max(a.pmFollowupwo)over()-min (case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())) ) z_PMFollowupwo ,
--0 z_PMFollowupwo,
-----CM
--max(a.cmactlabhrs)over()maxa,min(case when a.cmactlabhrs>0 then a.cmactlabhrs end)over()mini,
(a.cmactlabhrs-min(case when a.cmactlabhrs>0 then a.cmactlabhrs end)over())/(max(a.cmactlabhrs)over()-min(case when a.cmactlabhrs>0 then a.cmactlabhrs end)over() ) z_cmactlabhrs,
--max(a.cmlaborcost)over()maxa1,min(case when a.cmlaborcost>0 then a.cmlaborcost end)over()mini1,
(a.cmlaborcost-min(case when a.cmlaborcost>0 then a.cmlaborcost end)over())/(max(a.cmlaborcost)over()-min(case when a.cmlaborcost>0 then a.cmlaborcost end)over() ) z_cmlabcost,
--max(a.cmsparecost)over()maxa2,min(case when a.cmsparecost>0 then a.cmsparecost end)over()mini2,
(a.cmsparecost-min(case when a.cmsparecost>0 then a.cmsparecost end)over())/(max(a.cmsparecost)over()-min(case when a.cmsparecost>0 then a.cmsparecost end)over() ) z_cmsparecost ,
--max(a.cm_count)over()maxa18,min(case when a.cm_count>0 then a.cm_count end)over()mini18,
(a.cm_count-min(case when a.cm_count>0 then a.cm_count end)over())/(max(a.cm_count)over()-min(case when a.cm_count>0 then a.cm_count end)over() ) z_cm_count,
--0 z_cm_count,
--max(a.cmdowntime)over()maxa3,min(case when a.cmdowntime>0 then a.cmdowntime end)over()mini3,
(a.cmdowntime-min(case when a.cmdowntime>0 then a.cmdowntime end)over())/(max(a.cmdowntime)over()-min(case when a.cmdowntime>0 then a.cmdowntime end)over() ) z_cmDowntime ,
--max(a.cmtotal)over()maxa4,min(case when a.cmtotal>0 then a.cmtotal end)over()mini4,
(a.cmtotal-min(case when a.cmtotal>0 then a.cmtotal end)over())/(max(a.cmtotal)over()-min(case when a.cmtotal>0 then a.cmtotal end)over() ) z_cmTotal ,
--max(a.cmFollowupwo)over()maxa5,min(case when a.cmFollowupwo>0 then a.cmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.cmFollowupwo-min(case when a.cmFollowupwo>0 then a.cmFollowupwo end)over())/nullif((max(a.cmFollowupwo)over()-min(case when a.cmFollowupwo>0 then a.cmFollowupwo end)over()),(max(a.cmFollowupwo)over()-min (case when a.cmFollowupwo>0 then a.cmFollowupwo end)over())) ) z_cmFollowupwo ,
--0 z_cmFollowupwo,

--------RM----

--max(a.rmactlabhrs)over()maxa,min(case when a.rmactlabhrs>0 then a.rmactlabhrs end)over()mini,
(a.rmactlabhrs-min(case when a.rmactlabhrs>0 then a.rmactlabhrs end)over())/(max(a.rmactlabhrs)over()-min(case when a.rmactlabhrs>0 then a.rmactlabhrs end)over() ) z_rmactlabhrs,
--max(a.rmlaborcost)over()maxa1,min(case when a.rmlaborcost>0 then a.rmlaborcost end)over()mini1,
(a.rmlaborcost-min(case when a.rmlaborcost>0 then a.rmlaborcost end)over())/(max(a.rmlaborcost)over()-min(case when a.rmlaborcost>0 then a.rmlaborcost end)over() ) z_rmlabcost,
--max(a.rmsparecost)over()maxa2,min(case when a.rmsparecost>0 then a.rmsparecost end)over()mini2,
(a.rmsparecost-min(case when a.rmsparecost>0 then a.rmsparecost end)over())/(max(a.rmsparecost)over()-min(case when a.rmsparecost>0 then a.rmsparecost end)over() ) z_rmsparecost ,
--max(a.rm_count)over()maxa18,min(case when a.rm_count>0 then a.rm_count end)over()mini18,
(a.rm_count-min(case when a.rm_count>0 then a.rm_count end)over())/(max(a.rm_count)over()-min(case when a.rm_count>0 then a.rm_count end)over() ) z_rm_count,
--0 z_rm_count,
--max(a.rmdowntime)over()maxa3,min(case when a.rmdowntime>0 then a.rmdowntime end)over()mini3,
(a.rmdowntime-min(case when a.rmdowntime>0 then a.rmdowntime end)over())/(max(a.rmdowntime)over()-min(case when a.rmdowntime>0 then a.rmdowntime end)over() ) z_rmDowntime ,
--max(a.rmtotal)over()maxa4,min(case when a.rmtotal>0 then a.rmtotal end)over()mini4,
(a.rmtotal-min(case when a.rmtotal>0 then a.rmtotal end)over())/(max(a.rmtotal)over()-min(case when a.rmtotal>0 then a.rmtotal end)over() ) z_rmTotal ,
--max(a.rmFollowupwo)over()maxa5,min(case when a.rmFollowupwo>0 then a.rmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.rmFollowupwo-min(case when a.rmFollowupwo>0 then a.rmFollowupwo end)over())/nullif((max(a.rmFollowupwo)over()-min(case when a.rmFollowupwo>0 then a.rmFollowupwo end)over()),(max(a.rmFollowupwo)over()-min (case when a.rmFollowupwo>0 then a.rmFollowupwo end)over())) ) z_rmFollowupwo ,
--0 z_rmFollowupwo,

----------NONPM---
--max(a.nonpmactlabhrs)over()maxa,min(case when a.nonpmactlabhrs>0 then a.nonpmactlabhrs end)over()mini,
(a.nonpmactlabhrs-min(case when a.nonpmactlabhrs>0 then a.nonpmactlabhrs end)over())/(max(a.nonpmactlabhrs)over()-min(case when a.nonpmactlabhrs>0 then a.nonpmactlabhrs end)over() ) z_nonpmactlabhrs,
--max(a.nonpmlaborcost)over()maxa1,min(case when a.nonpmlaborcost>0 then a.nonpmlaborcost end)over()mini1,
(a.nonpmlaborcost-min(case when a.nonpmlaborcost>0 then a.nonpmlaborcost end)over())/(max(a.nonpmlaborcost)over()-min(case when a.nonpmlaborcost>0 then a.nonpmlaborcost end)over() ) z_nonpmlabcost,
--max(a.nonpmsparecost)over()maxa2,min(case when a.nonpmsparecost>0 then a.nonpmsparecost end)over()mini2,
--(a.nonpmsparecost-min(case when a.nonpmsparecost>0 then a.nonpmsparecost end)over())/(max(a.nonpmsparecost)over()-min(case when a.nonpmsparecost>0 then a.nonpmsparecost end)over() ) z_nonpmsparecost ,
(a.Nonpmsparecost-min( a.Nonpmsparecost)over())/NULLIF((max(a.Nonpmsparecost)over()-min(a.Nonpmsparecost)over()),0 ) z_Nonpmsparecost,
--max(a.nonpm_count)over()maxa18,min(case when a.nonpm_count>0 then a.nonpm_count end)over()mini18,
(a.nonpm_count-min(case when a.nonpm_count>0 then a.nonpm_count end)over())/(max(a.nonpm_count)over()-min(case when a.nonpm_count>0 then a.nonpm_count end)over() ) z_nonpm_count,
--0 z_nonpm_count,
--max(a.nonpmdowntime)over()maxa3,min(case when a.nonpmdowntime>0 then a.nonpmdowntime end)over()mini3,
--(a.nonpmdowntime-min(case when a.nonpmdowntime>0 then a.nonpmdowntime end)over())/(max(a.nonpmdowntime)over()-min(case when a.nonpmdowntime>0 then a.nonpmdowntime end)over() ) z_nonpmDowntime ,
(a.NONPMDowntime-min(a.NONPMDowntime)over())/nullif((max(a.NONPMDowntime)over()-min(a.NONPMDowntime)over() ),0) Z_NONPMDowntime,
--max(a.nonpmtotal)over()maxa4,min(case when a.nonpmtotal>0 then a.nonpmtotal end)over()mini4,
(a.nonpmtotal-min(case when a.nonpmtotal>0 then a.nonpmtotal end)over())/(max(a.nonpmtotal)over()-min(case when a.nonpmtotal>0 then a.nonpmtotal end)over() ) z_nonpmTotal ,
--max(a.nonpmFollowupwo)over()maxa5,min(case when a.nonpmFollowupwo>0 then a.nonpmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.nonpmFollowupwo-min(case when a.nonpmFollowupwo>0 then a.nonpmFollowupwo end)over())/nullif((max(a.nonpmFollowupwo)over()-min(case when a.nonpmFollowupwo>0 then a.nonpmFollowupwo end)over()),(max(a.nonpmFollowupwo)over()-min (case when a.nonpmFollowupwo>0 then a.nonpmFollowupwo end)over())) ) z_nonpmFollowupwo ,
--0 z_nonpmFollowupwo,

------CM FollowPM ,RMfollow PM, NONPN foloow PM------------
max(a.cm_follow_pm)over()maxa9,min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()mini9,
(a.cm_follow_pm-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())/nullif((max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()),(max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())) z_cm_follow_pm,
--max(a.rm_follow_pm)over()maxa9,min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over()mini9,
(a.rm_follow_pm-min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over())/nullif((max(a.rm_follow_pm)over()-min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over()),(max(a.rm_follow_pm)over()-min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over())) z_rm_follow_pm,
--max(a.nonpm_follow_pm)over()maxa9,min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over()mini9,
(a.nonpm_follow_pm-min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over())/nullif((max(a.nonpm_follow_pm)over()-min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over()),(max(a.nonpm_follow_pm)over()-min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over())) z_nonpm_follow_pm,

--------
max(a.pmmtbf)over()maxa10,min(case when a.pmmtbf>0 then a.pmmtbf end)over()mini10,

--cast((max(a.RMmtbf)over() - a.RMMTBF) as float)/cast((max(a.RMMTBF)over()-min(case when a.RMMTBF>0 then a.RMMTBF end)over() ) as float) z_RMMTBF, -----New Update
--cast((max(a.PMmtbf)over() - a.PMMTBF) as float)/cast((max(a.PMMTBF)over()-min(case when a.PMMTBF>0 then a.PMMTBF end)over() ) as float) z_PMMTBF, -----New Update
cast((max(a.CMmtbf)over() - a.CMMTBF) as float)/cast((max(a.CMMTBF)over()-min(case when a.CMMTBF>0 then a.CMMTBF end)over() ) as float) z_CMMTBF, -----New Update
--cast((max(a.NONPMmtbf)over() - a.NONPMMTBF) as float)/cast((max(a.NONPMMTBF)over()-min(case when a.NONPMMTBF>0 then a.NONPMMTBF end)over() )as float) z_NONPMMTBF, -----New Update
0 as z_RMMTBF,
0 as z_PMMTBF,
0 as z_NONPMMTBF,
-------------
max(a.GBPARTSCOST)over()maxa11,min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over()mini11,
(a.GBPARTSCOST-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over())/(max(a.GBPARTSCOST)over()-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over() ) z_GBPARTSCOST,
max(a.GBDowntime)over()maxa12,min(case when a.GBDowntime>0 then a.GBDowntime end)over()mini12,
(a.GBDowntime-min(case when a.GBDowntime>0 then a.GBDowntime end)over())/nullif((max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() ),(max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() )) Z_GBDowntime,
--cast((a.MTBm - min(a.mtbm)over()) as float)/nullif((cast((max(a.MTBm)over()-min(case when a.MTBm>0 then a.MTBm end)over() ) as float)),0) z_MTBM, 
(max(a.mtbm)over() - a.MTBm) /nullif(((max(a.MTBm)over()-min(a.MTBm)over() ) ),0)z_MTBM,
a.year updated_on


from(select q.*--,(select pmdowntime from pmdowntime_aep_new j where j.assetnum=q.asset and year='28-Feb-2021') pmdowntime
 from(
 ----------------------------
select i.asset,i.siteid,i.dept,sum(wocount)wocount,Sum(totallabhrs)totallabhrs,sum(totallabcost)totallabcost,sum(totalsparecost)totalsparecost,sum(totalcost)totalcost,
sum(pmactlabhrs)pmactlabhrs,sum(pmlaborcost)pmlaborcost,sum(pmsparecost)pmsparecost,sum(pmtotal)pmtotal,sum(pmFollowupwo)pmFollowupwo,
sum(cmactlabhrs)cmactlabhrs,sum(cmlaborcost)cmlaborcost,sum(cmsparecost)cmsparecost,sum(cmtotal)cmtotal,sum(cmFollowupwo)cmFollowupwo,
sum(rmactlabhrs)rmactlabhrs,sum(rmlaborcost)rmlaborcost,sum(rmsparecost)rmsparecost,sum(rmtotal)rmtotal,sum(rmFollowupwo)rmFollowupwo,

sum(NONpmactlabhrs)NONpmactlabhrs,sum(NONpmlaborcost)NONpmlaborcost,sum(NONpmsparecost)NONpmsparecost,sum(NONpmTotal)NONpmTotal,sum(NONpmFollowupwo)NONpmFollowupwo,
sum(cm_follow_pm)cm_follow_pm,
sum(rm_follow_pm)rm_follow_pm,
sum(nonpm_follow_pm)nonpm_follow_pm,
--( isnull((sum(availablehrs)-SUM(GBDowntime))/nullif(sum(BDM_count),0),sum(availablehrs)))/60 mtbf,

--case when (cast((sum(availablehrs) - (SUM(RMDowntime)))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count) end )as float))  > 0 then cast((sum(availablehrs) - (SUM(RMDowntime)/60))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count) end )as float) else 0 end as RMMTBF,    --////new update
--case when (cast((sum(availablehrs) - (SUM(PMDowntime)))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count) end ) as float)) > 0 then cast((sum(availablehrs) - (SUM(PMDowntime)/60))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count) end ) as float) else 0 end as PMMTBF, 
--case when (cast((sum(availablehrs) - (SUM(CMDowntime)))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count)  end ) as float)) > 0 then cast((sum(availablehrs) - (SUM(CMDowntime)/60))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count)  end ) as float) else 0 end as CMMTBF, 
--case when (cast((sum(availablehrs) - (SUM(NonpmDowntime)/60))as float)/cast(( case when (sum(RM_count))=0 then 1 else sum(RM_count) end )as float)) > 0 then cast((sum(availablehrs) - (SUM(NonpmDowntime)/60))as float)/cast(( case when (sum(RM_count))=0 then 1 else sum(RM_count) end )as float) else 0 end as NONPMMTBF, 
 isnull((sum(availablehrs))/nullif(sum(NONPM_Count),0),sum(availablehrs)) CMMTBF, -----(RM+CM=wocount)
0 as RMMTBF, 
0 as PMMTBF,
0 as NONPMMTBF,

sum(GBPARTSCOST)GBPARTSCOST, 
sum(GBDowntime)GBDowntime, 
sum(CMDowntime) CMDowntime,  
sum(PMDowntime) PMDowntime, 
sum(RMDowntime) RMDowntime,
sum(Nonpmdowntime) Nonpmdowntime,
year,
sum(PM_count)PM_count,sum(CM_count)CM_count,sum(RM_count)RM_count,sum(NONPM_count)NONPM_count,
sum(availablehrs)availablehrs,
--(sum(availablehrs)/nullif(sum(wocount),0))/60 MTBM,
--cast(sum(availablehrs)as float)/ cast((case when (sum(nonpm_count))=0 then 1 else sum(nonpm_count) end )as float) MTBM,

--SUM(NonpmDowntime)/ cast(sum(rm_count) as float) MTTR

--sum(NonpmDowntime)/nullif(sum(rm_count),0) MTTR

cast(sum(availablehrs)as float)/ nullif((cast((case when (sum(wocount))=0 then 1 else sum(wocount) end )as float)),0) MTBM,    -----(RM+CM+PM-wocnt) --////new update
--(sum(availablehrs)/nullif(sum(wocount),0))/60 MTBM,
cast(SUM(GBDowntime) as float)/ nullif(cast(sum(NONPM_Count) as float),0) MTTR


from

( 
select v.asset,v.siteid,v.dept,v.location ,
 sum(wocount)wocount,Sum(totallabhrs)totallabhrs,sum(totallabcost)totallabcost,sum(totalsparecost)totalsparecost,sum(totalcost)totalcost,
sum(pmactlabhrs)pmactlabhrs,sum(pmlaborcost)pmlaborcost,sum(pmsparecost)pmsparecost,sum(pmtotal)pmtotal,sum(pmFollowupwo)pmFollowupwo,
sum(cmactlabhrs)cmactlabhrs,sum(cmlaborcost)cmlaborcost,sum(cmsparecost)cmsparecost,sum(cmtotal)cmtotal,sum(cmFollowupwo)cmFollowupwo,
sum(rmactlabhrs)rmactlabhrs,sum(rmlaborcost)rmlaborcost,sum(rmsparecost)rmsparecost,sum(rmtotal)rmtotal,sum(rmFollowupwo)rmFollowupwo,
sum(nonpmactlabhrs)nonpmactlabhrs,sum(nonpmlaborcost)nonpmlaborcost,sum(nonpmsparecost)nonpmsparecost,sum(nonpmtotal)nonpmtotal,sum(nonpmFollowupwo)nonpmFollowupwo ,
sum(GBPARTSCOST)GBPARTSCOST,
sum(GBDowntime)GBDowntime,
sum(CMDowntime) CMDowntime, 
sum(PMDowntime) PMDowntime,
sum(RMDowntime) RMDowntime,
sum(Nonpmdowntime) Nonpmdowntime,
year,
sum(PM_count)PM_count,sum(CM_count)CM_count,sum(RM_count)RM_count,sum(NONPM_count)NONPM_count , 
--(select sum(bdm_follow_pm) from #bdm_follow_pm rm where v.asset=rm.assetnum)rm_follow_pm ,

(select sum(cm_follow_pm) from cm_follow_pm bdm where v.asset=bdm.assetnum)cm_follow_pm ,
(select sum(rm_follow_pm) from RM_follow_pm rm where v.asset=rm.assetnum)rm_follow_pm ,
(select sum(nonpm_follow_pm) from nonpm_follow_pm nonpm where v.asset=nonpm.assetnum)nonpm_follow_pm ,

--(select isnull(sum(availablehrs)/60,0) from honda_staging.dbo.location_meter_reading lm 
--where v.location=lm.location and lm.Readingdate>='12/01/2019' and lm.Readingdate<'12/01/2020') 
2080 as availablehrs 
from(

---------------Stage1------------------

select aa.assetnum as asset,aa.SITEID as siteid,aa.DepartmentId dept,--left(aa.location,4) 
null as location,
count(case when  w.Dev_worktype in('PM','CM','RM')then w.wonum end)wocount,
sum(case when  w.Dev_worktype in('PM','CM','RM')then w.ACTLABHRS end) totallabhrs,
sum(case when  w.Dev_worktype in('PM','CM','RM')then w.LABORCOST end)totallabcost,
sum(case when  w.Dev_worktype in('PM','CM','RM')then w.SPARECOST end)totalsparecost,
sum(isnull(case when  w.Dev_worktype in('PM','RM','CM')then w.SPARECOST end,0))+sum(isnull(case when  w.Dev_worktype in('PM','CM','RM')then w.LABORCOST end,0))totalcost,

count(case when w.Dev_worktype='PM' then w.wonum end) PM_count,
sum(case when w.Dev_worktype='PM' then w.ACTLABHRS end) pmactlabhrs ,
sum(case when w.Dev_worktype='PM' then w.LABORCOST end) pmlaborcost ,
sum(case when w.Dev_worktype='PM' then w.sparecost end) pmsparecost,
(sum(case when w.Dev_worktype='PM' then isnull(w.LABORCOST,0) end) + sum(case when w.Dev_worktype='PM' then isnull(w.sparecost,0) end) )pmTotal,
count(case when w.Dev_worktype='PM' then r.RELATEDRECKEY end) pmFollowupwo,


count(case when w.Dev_worktype='RM' then w.wonum end) RM_count,
sum(case when w.Dev_worktype='RM' then w.ACTLABHRS end) RMactlabhrs ,
sum(case when w.Dev_worktype='RM' then w.LABORCOST end) RMlaborcost ,
sum(case when w.Dev_worktype='RM' then w.sparecost end) RMsparecost,
(sum(case when w.Dev_worktype='RM' then isnull(w.LABORCOST,0) end) + sum(case when w.Dev_worktype='RM' then isnull(w.sparecost,0) end) )RMTotal,
count(case when w.Dev_worktype='RM' then r.relatedreckey end) RMFollowupwo,

count(case when w.Dev_worktype='CM' then w.wonum end) CM_count,
sum(case when w.Dev_worktype='CM' then w.ACTLABHRS end) CMactlabhrs ,
sum(case when w.Dev_worktype='CM' then w.LABORCOST end) CMlaborcost ,
sum(case when w.Dev_worktype='CM' then w.sparecost end) CMsparecost,
(sum(case when w.Dev_worktype='CM' then isnull(w.LABORCOST,0) end) + sum(case when w.Dev_worktype='CM' then isnull(w.sparecost,0) end) )CMTotal,
count(case when w.Dev_worktype='CM' then r.relatedreckey end) CMFollowupwo,


count(case when w.Dev_worktype in('RM','CM') then w.wonum end) NONPM_Count ,
sum(case when w.Dev_worktype in('RM','CM') then w.ACTLABHRS end) NONPMactlabhrs ,
sum(case when w.Dev_worktype in('RM','CM') then w.LABORCOST end) NONPMlaborcost ,
sum(case when w.Dev_worktype in('RM','CM') then w.sparecost end) NONPMsparecost,
(sum(case when w.Dev_worktype in('RM','CM') then isnull(w.LABORCOST,0) end) + sum(case when w.Dev_worktype in('RM','CM') then isnull(w.sparecost,0) end) )NONPMTotal,
count(case when w.Dev_worktype in('RM','CM') then r.relatedreckey end) NONPMFollowupwo,
--(select sum(availablehrs) from location_meter_reading lm where left(aa.location,4)=lm.location) availablehrs,
--2080 as availablehrs,
--j.PMDowntime pmdowntime,
--sum(case when Dev_worktype='BDM' and lag(Dev_worktype) over(partition by aa.Assetnum order by REPORTDATE desc)='PM' then 1 end)  as
0 cm_follow_pm,
--count(case when w.Dev_worktype='BDM' then w.wonum end) BDMWO,
sum(case when w.Dev_worktype='RM' then w.sparecost end) GBPARTSCOST,
sum(case when w.Dev_worktype='RM' then w.downtime end)GBDowntime,
sum(W.CMDowntime) as CMDowntime , 
sum(w.PMDowntime) as PMDowntime ,
sum(W.RMDowntime) as RMDowntime,
sum(w.NONPPMDowntime) as NONPMdowntime, 
'31-Mar-2022' as year 
 from [dbo].[PMO_3410012_DAF]aa
left join dbo.Client_workorder_DAF w on aa.assetnum=w.assetnum --and w.REPORTDATE>='2020-01-01' and w.REPORTDATE<'2020-04-01' and w.WO_STATUS='CLOSE'
and w.Year='31-Mar-2022'
--left join [dbo].[pmdowntime_aep_new] j on j.assetnum=aa.ASSETNUM and j.year='31-Mar-2021'
left join (select distinct RECORDKEY,RELATETYPE,count(distinct case when r.relatetype='FOLLOWUP' then r.relatedreckey end)RELATEDRECKEY
from dbo.relatedrecord_ALL r where RELATETYPE='FOLLOWUP' and year='31-Mar-2022' and r.SITEID='DAF'
group by RECORDKEY,RELATETYPE ) r on r.RECORDKEY=w.wonum
--left join cm_follow_pm cm on w.assetnum=cm.assetnum
--where aa.statusid='A-ACTIVE' --and aa.[Effective_Currentflag]='Y' 
--and aa.year='31-Dec-2020' --and w.REPORTDATE>='2019-07-01' and w.REPRTDATE<='2020-03-31' --and w.wonum='M21870910'
where-- aa.statusid='A-ACTIVE' and
aa.IsFlag in(1,2)
group by aa.assetnum,aa.siteid,aa.DepartmentId --,left(aa.location,4) 
----------------------------------STAGE1----------------

)v group by v.asset,v.siteid,v.dept,v.location,year )i
group by i.asset,i.siteid,i.dept,year)q

)a
group by a.asset,a.siteid,a.dept,a.wocount,a.totallabhrs,totallabcost,totalsparecost,totalcost,
a.pmactlabhrs,a.pmlaborcost,a.pmsparecost,a.pmdowntime,a.pmtotal,a.pmFollowupwo,
a.cmactlabhrs,a.cmlaborcost,a.cmsparecost,a.cmdowntime,a.cmtotal,a.cmFollowupwo,
a.rmactlabhrs,a.rmlaborcost,a.rmsparecost,a.rmdowntime,a.rmtotal,a.rmFollowupwo,
a.NONpmactlabhrs,a.NONpmlaborcost,a.NONpmsparecost,a.Nonpmdowntime,a.NONpmTotal,a.NONpmFollowupwo,
a.cm_follow_pm , a.rm_follow_pm , a.nonpm_follow_pm ,
a.pmmtbf,a.cmmtbf,a.rmmtbf,a.nonpmmtbf,a.GBPARTSCOST,a.GBDowntime,a.year,a.availablehrs,a.RM_count,a.CM_count,a.NONPM_count,a.MTBM,a.MTTR,a.PM_count

)b 




--------------------------------------------
--)v


------------------
select * from #bdm_follow_pm
--------------- #bdm_follow_pm ------------------

create table #bdm_follow_pm (bdm_follow_pm int,assetnum varchar(50))

insert into #bdm_follow_pm (bdm_follow_pm, assetnum)
select sum(flag) bdm_follow_pm, assetnum from(
select a.*,lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc) lag,
case when ax_work_type='RM' and lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc)='PM' then 1 end flag from(
select Assetnum,wonum,ax_work_type,REPORTDATE from 
(select w.*, case when w.worktype='PM' and w.CLASSSTRUCTUREID  
 in ('CS117940','CS117963','CS119504','CS119509','CS119510','CS119512','CS119513','CS119514','CS119518','CS119519') then 'PM'
 when  w.CLASSSTRUCTUREID in ('CS118014') then 'RM'
 when  w.CLASSSTRUCTUREID in ('CS125330','CS117956') then 'CM'
  else 'OTH' end 'ax_work_type' from [Honda_Repository].dbo.Client_Workorder w where 
-- w.ACTFINISH>='2020-11-01' and w.ACTFINISH<='2021-10-31' and
 w.year='31-Jul-2022') w
)a 
)s group by assetnum


-------------
create table #cm_follow_pm (cm_follow_pm int,assetnum varchar(50))

insert into #cm_follow_pm (cm_follow_pm, assetnum)
select sum(flag) cm_follow_pm,assetnum from(
select a.*,lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc) lag,
case when ax_work_type='CM' and lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc)='PM' then 1 end flag from(
select Assetnum,wonum,ax_work_type,REPORTDATE from 
(select w.*, case when w.worktype='PM' and w.CLASSSTRUCTUREID  
 in ('CS117940','CS117963','CS119504','CS119509','CS119510','CS119512','CS119513','CS119514','CS119518','CS119519') then 'PM'
 when  w.CLASSSTRUCTUREID in ('CS118014') then 'RM'
 when  w.CLASSSTRUCTUREID in ('CS125330','CS117956') then 'CM'
  else 'OTH' end 'ax_work_type' from [Honda_Repository].dbo.Client_Workorder w where 
 -- w.ACTFINISH>='2020-11-01' and w.ACTFINISH<='2021-10-31' and 
  w.year='31-Jul-2022') w
 )a 
   )s group by assetnum 

--select * from #cm_follow_pm
   ---------------------------------

create table #nonpm_follow_pm (nonpm_follow_pm int,assetnum varchar(50))

insert into #nonpm_follow_pm (nonpm_follow_pm, assetnum)
  select sum(flag) nonpm_follow_pm, assetnum from(
select a.*,lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc) lag,
case when ax_work_type in('RM','CM') and lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc)='PM' then 1 end flag from(
select Assetnum,wonum,ax_work_type,REPORTDATE from 
(select w.*, case when w.worktype='PM' and w.CLASSSTRUCTUREID  
 in ('CS117940','CS117963','CS119504','CS119509','CS119510','CS119512','CS119513','CS119514','CS119518','CS119519') then 'PM'
 when  w.CLASSSTRUCTUREID in ('CS118014') then 'RM'
 when  w.CLASSSTRUCTUREID in ('CS125330','CS117956') then 'CM'
  else 'OTH' end 'ax_work_type' from [Honda_Repository].dbo.Client_Workorder w where 
 --w.ACTFINISH>='2020-11-01' and w.ACTFINISH<='2021-10-31' and 
 w.year='31-Jul-2022') w
 )a --where assetnum='A100838' 
   )s group by assetnum 


--select * from #nonpm_follow_pm

 ------------------------

-- select * from [dbo].[AX_Asset_Master]

--  select * into [Segment_Objects] from
--(
--select aa.assetnum,s.[SegmentMasterID],
--'2021-04-01 00:00:00.000' Effective_Startdate,
--'9999-12-31 00:00:00.000' Effective_Enddate,
--'Y' Effective_Currentflag,
--'BI Team' Updated_BY,
--getdate() Updated_On,
--'BI Team' Inserted_By,
--getdate() Inserted_On
--from [dbo].[AX_Asset_Master] aa
--left join [dbo].[AX_Segment_Metric_Facts1] s
--on CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel])= s.[SegmentMasterDescription]
--where aa.StatusId in('A-ACTIVE')
----where not exists(select Asset_Master_Group_Details_ID from [dbo].[AX_Segment_Metric_Facts]  so where so.Asset_Master_Group_Details_ID=s.Asset_Master_Group_Details_ID)
--)a

---------------------------------------

--select * from [dbo].[workorder]
--where year='30-June-2021'

--select * into [Honda_Repository].[dbo].Client_Workorder_June
--from [dbo].[Workorder_Jun]

--select * from Client_Workorder_June

--update w
--set w.DEV_WORKTYPE=a.ax_worktype
--from [dbo].[Client_Workorder_June] w
--left join [dbo].[workorder] a
--on w.wonum=a.wonum
--where a.year='30-June-2021'

--select * from [dbo].[Client_Workorder]



--select * from [Workorder_Aug]



--SELECT[z_CMMTBF] FROM [AX_Asset_Metric_Facts_Aug]

