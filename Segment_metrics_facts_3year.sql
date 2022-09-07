select sum(totallabhrs) from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts] 
--where assetcount=1 and totallabhrs is null

select sum(totallabhrs) from [Honda_Repository].[dbo].AX_Asset_Metric_Facts 

----drop table [dbo].[AX_Segment_Metric_Facts1]
----select * from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts1] where EffectiveCurrentflag='Y'

update [dbo].[AX_Segment_Metric_Facts]
set SegmentGroupID=111 

update a 
 set a. [SegmentMasterID]= b.[SegmentMasterID]
 from [dbo].[AX_Segment_Metric_Facts] a
 inner join 
 (
 select 2792+ row_number() OVER(order by SegmentMasterDescription) [SegmentMasterID] , SegmentMasterDescription 
 from [dbo].[AX_Segment_Metric_Facts] WHERE siteid='DAF')b
 on a.SegmentMasterDescription=b.SegmentMasterDescription
 WHERE siteid='DAF'


--update a
--set a.SegmentMasterID=b.SegmentMasterID
--select * from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts1] a
-- join [Honda_Repository].[dbo].[AX_SegmentMaster] b
--on a.SegmentMasterDescription=b.SegmentMasterDescription
--where b.EffectiveCurrentflag='Y' 

----select * from [Honda_Repository].[dbo].[AX_SegmentMaster]  where EffectiveCurrentflag='Y' 

select * into [AX_Segment_Metric_Facts]
from [AX_Segment_Metric_Facts_1]
where 1=2   

----select * from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts] b where b.EffectiveCurrentflag='Y'

select sum(assetcount) from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts1] where siteid='HCM'
-------------------------Query-----------
--insert INTO [HCM_Repository].[dbo].[AX_Segment_Metric_Facts]

select * from [dbo].[AX_Segment_Metric_Facts] where siteid='DAF'

Delete from  [AX_Segment_Metric_Facts] where siteid='DAF'
insert into [dbo].[AX_Segment_Metric_Facts]
--------------------------------------Stage 4--------------------------
--select * into ASMF from (
select null as [SegmentGroupID], 
null as [SegmentMasterID],
Asset_Master_Group_Details_Desc as [SegmentMasterDescription],
null [Level_1],null [Level_2],null [Level_3],null [Level_4],
siteid,null [d2],null [d3],
assetcount,totallabhrs,totallabcost,totalsparecost,totalcost,PM_count as pmcount, 
pmactlabhrs,pmlaborcost,pmsparecost,pmtotal,b.pmdowntime,b.pmFollowupwo,

case when ((((isnull(z_PMlabhrs,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmlabhrs_weightage')))+(isnull(z_PMsparecost,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmsparecost_weightage')))+(isnull(z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMDowntime_weightage')))+(isnull(z_PMTotal,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMTotal_weightage')))+(isnull(z_PMFollowupwo,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMFollowupwo_weightage')))+(isnull(z_PM_count,0)*(select [dbo].[GetValue_fn] ('PM_Index','PM_count_weightage')))))*100) > 0
then (((isnull(z_PMlabhrs,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmlabhrs_weightage')))+(isnull(z_PMsparecost,0)*(select [dbo].[GetValue_fn] ('PM_Index','Pmsparecost_weightage')))+(isnull(z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMDowntime_weightage')))+(isnull(z_PMTotal,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMTotal_weightage')))+(isnull(z_PMFollowupwo,0)*(select [dbo].[GetValue_fn] ('PM_Index','PMFollowupwo_weightage')))+(isnull(z_PM_count,0)*(select [dbo].[GetValue_fn] ('PM_Index','PM_count_weightage')))))*100 else 0 end as PM_Index ,
0 as PM_GBActor_Index,
CM_count,CMactlabhrs,CMlaborcost,CMsparecost,CMTotal,CMDowntime,CMFollowupwo,

case when ((((isnull(z_CMactlabhrs,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmactlabhrs_weightage')))+(isnull(z_CMsparecost,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmsparecost_weightage')))+(isnull(z_CMFollowupwo,0)*(select [dbo].[GetValue_fn] ('CM_Index','CMFollowupwo_weightage'))) +(isnull(z_cm_follow_pm,0)*(select [dbo].[GetValue_fn] ('CM_Index','cm_follow_pm_weightage')))
))*100) > 0 then (((isnull(z_CMactlabhrs,0)*(
select [dbo].[GetValue_fn] ('CM_Index','Cmactlabhrs_weightage')))+(isnull(z_CMsparecost,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmsparecost_weightage')))+(isnull(z_CMFollowupwo,0)*(select [dbo].[GetValue_fn] ('CM_Index','CMFollowupwo_weightage'))) +(isnull(z_cm_follow_pm,0)*(select [dbo].[GetValue_fn] ('CM_Index','cm_follow_pm_weightage')))
))*100 else 0 end as CM_Index,

--(abs(((isnull(z_CMMTBF,0)*(select [dbo].[GetValue_fn] ('CM_GBActor_Index','CMMTBF_weightage')))+(isnull(z_GBPARTSCOST,0)*(select [dbo].[GetValue_fn] ('CM_GBActor_Index','GBPARTSCOST_weightage')))+(isnull(z_CMDowntime,0)*(select [dbo].[GetValue_fn] ('CM_GBActor_Index','CMDowntime_weightage')))))*100) CM_GBActor_Index,

(abs(((isnull(cast(z_MTBM as NUMERIC(18,2)),0))*(select [dbo].[GetValue_fn] ('GBActorIndex','MTBM_weightage')))+(isnull(cast(z_NONpmsparecost as NUMERIC(18,2)),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','NONpmsparecost_weightage')))+
(isnull(cast(z_nonpmlabcost as NUMERIC(18,2) ),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','nonpmlabcost_weightage')))+(isnull(cast(z_nonpmDowntime as NUMERIC(18,2)),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','nonpmDowntime_weightage')))+
(isnull(cast(z_nonpm_count as NUMERIC(18,2)),0)*(select [dbo].[GetValue_fn] ('GBActorIndex','nonpm_count_weightage')))) ) * 100 CM_GBActor_Index,    


cm_follow_pm,
RM_count,RMactlabhrs,RMlaborcost,RMsparecost,RMTotal,RMDowntime,RMFollowupwo,

case when ((((isnull(z_RMactlabhrs,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmactlabhrs_weightage')))+(isnull(z_RMsparecost,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmsparecost_weightage')))+(isnull(z_RMFollowupwo,0)*(select [dbo].[GetValue_fn] ('RM_Index','RMFollowupwo_weightage'))) +(isnull(z_Rm_follow_pm,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rm_follow_pm_weightage')))
))*100) > 0 then (((isnull(z_RMactlabhrs,0)*(
select [dbo].[GetValue_fn] ('RM_Index','Rmactlabhrs_weightage')))+(isnull(z_RMsparecost,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rmsparecost_weightage')))+(isnull(z_RMFollowupwo,0)*(select [dbo].[GetValue_fn] ('RM_Index','RMFollowupwo_weightage'))) +(isnull(z_Rm_follow_pm,0)*(select [dbo].[GetValue_fn] ('RM_Index','Rm_follow_pm_weightage')))
))*100 else 0 end as RM_Index,  ------New Update
0 as RM_GBActor_Index,Rm_follow_pm,
NONPM_COUNT,Nonpmactlabhrs,Nonpmlaborcost,Nonpmsparecost,NonpmTotal,NONPMDowntime, NonpmFollowupwo,

case when ((((isnull(z_Nonpmactlabhrs,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmactlabhrs_weightage')))+(isnull(z_Nonpmsparecost,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmsparecost_weightage')))+(isnull(z_NonpmFollowupwo,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NonpmFollowupwo_weightage'))) +(isnull(z_NONPM_follow_pm,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NONPM_follow_pm_weightage')))
))*100) >0 then (((isnull(z_Nonpmactlabhrs,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmactlabhrs_weightage')))+(isnull(z_Nonpmsparecost,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','Nonpmsparecost_weightage')))+(isnull(z_NonpmFollowupwo,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NonpmFollowupwo_weightage'))) +(isnull(z_NONPM_follow_pm,0)*(select [dbo].[GetValue_fn] ('Nonpm_Index','NONPM_follow_pm_weightage')))
))*100 else 0 end as Nonpm_Index, -----NEW UPDATE
0 AS NONPM_GBActor_Index, NONPm_follow_pm,

--(abs((((isnull(z_PMlabhrs,0)*(select [dbo].[GetValue_fn] ('PMO_Index','Pmlabhrs_weightage')))+(isnull(z_PMsparecost,0)*(select [dbo].[GetValue_fn] ('PMO_Index','Pmsparecost_weightage')))+(isnull(z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMDowntime_weightage')))+(isnull(z_PMTotal,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMTotal_weightage')))+(isnull(z_PMFollowupwo,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMFollowupwo_weightage')))+(isnull(z_PM_count,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PM_count_weightage')))))*100+
--((((isnull(z_CMactlabhrs,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmactlabhrs_weightage')))+(isnull(z_CMsparecost,0)*(select [dbo].[GetValue_fn] ('CM_Index','Cmsparecost_weightage')))+(isnull(z_CMFollowupwo,0)*(select [dbo].[GetValue_fn] ('CM_Index','CMFollowupwo_weightage'))) +(isnull(z_cm_follow_pm,0)*(select [dbo].[GetValue_fn] ('CM_Index','cm_follow_pm_weightage')))))*100))
--+(abs(((isnull(z_PMMTBF,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMMTBF_weightage')))+(isnull(z_GBPARTSCOST,0)*(select [dbo].[GetValue_fn] ('PMO_Index','GBPARTSCOST_weightage')))+(isnull(Z_PMDowntime,0)*(select [dbo].[GetValue_fn] ('PMO_Index','PMDowntime_weightage')))))*100))/3 PMO_Index,

(abs(((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100+
(((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100))
+(abs((isnull(z_PMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_PMDowntime,0)*0.30))*100))/3 PMO_Index,


GBPARTSCOST,GBDowntime,
MTBM,MTTR,CMMTBF as MTBF, 
availablehrs as available_hrs, 
null as [total_saving],null as [saving_index],null as [cumulative],
updated_on as 'year',

--(abs((isnull( z_RMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_RMDowntime,0)*0.30))*100) RM_GBActor_Index,


--(abs((isnull(z_PMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_PMDowntime,0)*0.30))*100) PM_GBActor_Index,  ---New Update

--(abs((isnull(z_NONPMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_NONPMDowntime,0)*0.30))*100) NONPM_GBActor_Index,

z_PM_count,z_PMlabhrs, z_PMlabcost, z_PMsparecost ,z_PMTotal ,z_PMMTBF,PMMTBF,z_PMDowntime ,z_PMFollowupwo,
 z_CMACTlabhrs,z_CMsparecost ,z_CMDowntime,z_CMFollowupwo,z_CMMTBF,
  z_RMACTlabhrs, z_RMlabcost,z_RMsparecost ,z_RMTotal ,z_RM_count,z_RMDowntime,z_RMFollowupwo ,z_RMMTBF,RMMTBF,
  z_NONPMDowntime,z_NONPMMTBF,NONPMMTBF,
  Z_GBDowntime,
  z_GBPARTSCOST, Z_Assetcount
------------------------------

from(
---------------------------------------- STAGE-3 --------------------------------------

select a.Family Asset_Master_Group_Details_Desc,a.siteid siteid,a.assetcount assetcount,a.totallabhrs totallabhrs,a.totallabcost totallabcost,a.totalsparecost totalsparecost,a.totalcost totalcost,a.pmactlabhrs pmactlabhrs,pmlaborcost pmlaborcost,pmsparecost pmsparecost,a.pmdowntime pmdowntime,a.pmtotal pmtotal,a.pmFollowupwo pmFollowupwo,
a.CMactlabhrs CMactlabhrs,a.CMlaborcost CMlaborcost,a.CMsparecost CMsparecost,a.CMTotal CMTotal,a.CMFollowupwo CMFollowupwo,
a.RMactlabhrs RMactlabhrs,a.RMlaborcost RMlaborcost,a.RMsparecost RMsparecost,a.RMTotal RMTotal,a.RMFollowupwo RMFollowupwo,
a.Nonpmactlabhrs Nonpmactlabhrs,a.Nonpmlaborcost Nonpmlaborcost,a.Nonpmsparecost Nonpmsparecost,a.NonpmTotal NonpmTotal,a.NonpmFollowupwo NonpmFollowupwo,
---A.RM_count RM_count,
a.cm_follow_pm cm_follow_pm,
a.Rm_follow_pm Rm_follow_pm,
a.NONPm_follow_pm NONPm_follow_pm,


---A.PMDowntime PMDowntime,
A.RMDowntime RMDowntime,
A.CMDowntime CMDowntime,
A.NONPMDowntime NONPMDowntime,


a.PMMTBF PMMTBF ,
a.RMMTBF RMMTBF ,
a.CMMTBF CMMTBF ,
a.NONPMMTBF NONPMMTBF ,

a.GBPARTSCOST GBPARTSCOST,a.GBDowntime GBDowntime,a.availablehrs,a.RM_count,a.CM_count,a.NONPM_COUNT,a.MTBM,a.MTTR,a.PM_count,


(a.pmactlabhrs-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over())/(max(a.pmactlabhrs)over()-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over() ) z_PMlabhrs,
(a.pmlaborcost-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over())/(max(a.pmlaborcost)over()-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over() ) z_PMlabcost,
(a.pmsparecost-min(case when a.pmsparecost>0 then a.pmsparecost end)over())/(max(a.pmsparecost)over()-min(case when a.pmsparecost>0 then a.pmsparecost end)over() ) z_PMsparecost ,
(a.PM_count-min(case when a.PM_count>0 then a.PM_count end)over())/(max(a.PM_count)over()-min(case when a.PM_count>0 then a.PM_count end)over() ) z_PM_count,
case when (a.pmdowntime-min(case when a.pmdowntime>0 then a.pmdowntime end)over())/(max(a.pmdowntime)over()-min(case when a.pmdowntime>0 then a.pmdowntime end)over() ) >0 then
(a.pmdowntime-min(case when a.pmdowntime>0 then a.pmdowntime end)over())/(max(a.pmdowntime)over()-min(case when a.pmdowntime>0 then a.pmdowntime end)over() ) else 0 end  z_PMDowntime ,

(a.pmtotal-min(case when a.pmtotal>0 then a.pmtotal end)over())/(max(a.pmtotal)over()-min(case when a.pmtotal>0 then a.pmtotal end)over() ) z_PMTotal ,
convert(decimal(16,6),(a.pmFollowupwo-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())/nullif((max(a.pmFollowupwo)over()-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()),(max(a.pmFollowupwo)over()-min (case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())) ) z_PMFollowupwo ,


-------------------CM NEW UPDATE-----------------------

(a.CMactlabhrs-min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over())/(max(a.CMactlabhrs)over()-min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over() ) z_CMACTlabhrs,
(a.CMlaborcost-min(case when a.CMlaborcost>0 then a.CMlaborcost end)over())/(max(a.CMlaborcost)over()-min(case when a.CMlaborcost>0 then a.CMlaborcost end)over() ) z_CMlabcost,
(a.CMsparecost-min(case when a.CMsparecost>0 then a.CMsparecost end)over())/(max(a.CMsparecost)over()-min(case when a.CMsparecost>0 then a.CMsparecost end)over() ) z_CMsparecost ,
(a.CM_count-min(case when a.CM_count>0 then a.CM_count end)over())/(max(a.CM_count)over()-min(case when a.CM_count>0 then a.CM_count end)over() ) z_CM_count,
(a.CMdowntime-min(case when a.CMdowntime>0 then a.CMdowntime end)over())/(max(a.CMdowntime)over()-min(case when a.CMdowntime>0 then a.CMdowntime end)over() ) z_CMDowntime ,
(a.CMtotal-min(case when a.CMtotal>0 then a.CMtotal end)over())/(max(a.CMtotal)over()-min(case when a.CMtotal>0 then a.CMtotal end)over() ) z_CMTotal ,
convert(decimal(16,6),(a.CMFollowupwo-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over())/nullif((max(a.CMFollowupwo)over()-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over()),(max(a.CMFollowupwo)over()-min (case when a.CMFollowupwo>0 then a.CMFollowupwo end)over())) ) z_CMFollowupwo ,
(a.cm_follow_pm-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())/nullif((max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()),(max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())) z_cm_follow_pm,


----------------RM NEW UPDATE -----------

(a.RMactlabhrs-min(case when a.RMactlabhrs>0 then a.RMactlabhrs end)over())/(max(a.RMactlabhrs)over()-min(case when a.RMactlabhrs>0 then a.RMactlabhrs end)over() ) z_RMACTlabhrs,
(a.RMlaborcost-min(case when a.RMlaborcost>0 then a.RMlaborcost end)over())/(max(a.RMlaborcost)over()-min(case when a.RMlaborcost>0 then a.RMlaborcost end)over() ) z_RMlabcost,
(a.RMsparecost-min(case when a.RMsparecost>0 then a.RMsparecost end)over())/(max(a.RMsparecost)over()-min(case when a.RMsparecost>0 then a.RMsparecost end)over() ) z_RMsparecost ,
(a.RM_count-min(case when a.RM_count>0 then a.RM_count end)over())/(max(a.RM_count)over()-min(case when a.RM_count>0 then a.RM_count end)over() ) z_RM_count,
(a.RMdowntime-min(case when a.RMdowntime>0 then a.RMdowntime end)over())/(max(a.RMdowntime)over()-min(case when a.RMdowntime>0 then a.RMdowntime end)over() ) z_RMDowntime ,
(a.RMtotal-min(case when a.RMtotal>0 then a.RMtotal end)over())/(max(a.RMtotal)over()-min(case when a.RMtotal>0 then a.RMtotal end)over() ) z_RMTotal ,
convert(decimal(16,6),(a.RMFollowupwo-min(case when a.RMFollowupwo>0 then a.RMFollowupwo end)over())/nullif((max(a.RMFollowupwo)over()-min(case when a.RMFollowupwo>0 then a.RMFollowupwo end)over()),(max(a.RMFollowupwo)over()-min (case when a.RMFollowupwo>0 then a.RMFollowupwo end)over())) ) z_RMFollowupwo ,
(a.Rm_follow_pm-min(case when a.Rm_follow_pm>0 then a.Rm_follow_pm end)over())/nullif((max(a.Rm_follow_pm)over()-min(case when a.Rm_follow_pm>0 then a.Rm_follow_pm end)over()),(max(a.Rm_follow_pm)over()-min(case when a.Rm_follow_pm>0 then a.Rm_follow_pm end)over())) z_Rm_follow_pm,


------------------------------------------------Nonpm NEW UPDATE-----------------



(a.Nonpmactlabhrs-min(case when a.Nonpmactlabhrs>0 then a.Nonpmactlabhrs end)over())/(max(a.Nonpmactlabhrs)over()-min(case when a.Nonpmactlabhrs>0 then a.Nonpmactlabhrs end)over() ) z_NonpmACTlabhrs,
(a.Nonpmlaborcost-min(case when a.Nonpmlaborcost>0 then a.Nonpmlaborcost end)over())/(max(a.Nonpmlaborcost)over()-min(case when a.Nonpmlaborcost>0 then a.Nonpmlaborcost end)over() ) z_Nonpmlabcost,
--(a.Nonpmsparecost-min(case when a.Nonpmsparecost>0 then a.Nonpmsparecost end)over())/(max(a.Nonpmsparecost)over()-min(case when a.Nonpmsparecost>0 then a.Nonpmsparecost end)over() ) z_Nonpmsparecost ,
(a.Nonpmsparecost-min( a.Nonpmsparecost)over())/NULLIF((max(a.Nonpmsparecost)over()-min(a.Nonpmsparecost)over()),0 ) z_Nonpmsparecost,

(a.Nonpm_count-min(case when a.Nonpm_count>0 then a.Nonpm_count end)over())/(max(a.Nonpm_count)over()-min(case when a.Nonpm_count>0 then a.Nonpm_count end)over() ) z_Nonpm_count,
--case when (a.NONPMdowntime-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over())/(max(a.NONPMdowntime)over()-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over() ) > 0  then 
--(a.NONPMdowntime-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over())/(max(a.NONPMdowntime)over()-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over() ) else  0 end z_NONPMDowntime ,
(a.NONPMDowntime-min(a.NONPMDowntime)over())/nullif((max(a.NONPMDowntime)over()-min(a.NONPMDowntime)over() ),0) Z_NONPMDowntime,

(a.Nonpmtotal-min(case when a.Nonpmtotal>0 then a.Nonpmtotal end)over())/(max(a.Nonpmtotal)over()-min(case when a.Nonpmtotal>0 then a.Nonpmtotal end)over() ) z_NonpmTotal,
convert(decimal(16,6),(a.NonpmFollowupwo-min(case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over())/nullif((max(a.NonpmFollowupwo)over()-min(case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over()),(max(a.NonpmFollowupwo)over()-min (case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over())) ) z_NonpmFollowupwo ,
(a.NONPm_follow_pm-min(case when a.NONPm_follow_pm>0 then a.NONPm_follow_pm end)over())/nullif((max(a.NONPm_follow_pm)over()-min(case when a.NONPm_follow_pm>0 then a.NONPm_follow_pm end)over()),(max(a.NONPm_follow_pm)over()-min(case when a.NONPm_follow_pm>0 then a.NONPm_follow_pm end)over())) z_NONPm_follow_pm,


--cast((max(a.RMmtbf)over() - a.RMMTBF) as float)/cast((max(a.RMMTBF)over()-min(case when a.RMMTBF>0 then a.RMMTBF end)over() ) as float) z_RMMTBF, -----New Update
--cast((max(a.PMmtbf)over() - a.PMMTBF) as float)/cast((max(a.PMMTBF)over()-min(case when a.PMMTBF>0 then a.PMMTBF end)over() ) as float) z_PMMTBF, -----New Update
cast((max(a.CMmtbf)over() - a.CMMTBF) as float)/cast((max(a.CMMTBF)over()-min(case when a.CMMTBF>0 then a.CMMTBF end)over() ) as float) z_CMMTBF, -----New Update
0 AS z_RMMTBF,
0 as z_PMMTBF,
0 AS z_NONPMMTBF,

--cast((max(a.NONPMmtbf)over() - a.NONPMMTBF) as float)/cast((max(a.NONPMMTBF)over()-min(case when a.NONPMMTBF>0 then a.NONPMMTBF end)over() )as float) z_NONPMMTBF, -----New Update

(a.GBPARTSCOST-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over())/(max(a.GBPARTSCOST)over()-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over() ) z_GBPARTSCOST,
(a.GBDowntime-min(case when a.GBDowntime>0 then a.GBDowntime end)over())/nullif((max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() ),(max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() )) Z_GBDowntime,
(a.assetcount-min(case when a.assetcount>0 then a.assetcount end)over())/(max(a.assetcount)over()-min(case when a.assetcount>0 then a.assetcount end)over() ) Z_Assetcount,
--cast((a.MTBm - min(a.mtbm)over()) as float)/nullif((cast((max(a.MTBm)over()-min(case when a.MTBm>0 then a.MTBm end)over() ) as float)),0) z_MTBM, 
(max(a.mtbm)over() - a.MTBm) /nullif(((max(a.MTBm)over()-min(a.MTBm)over() ) ),0)z_MTBM, 
a.year updated_on


from(
------------------------------------------------

select q.* /*,(select qq.pmdowntime 
from(

select CONCAT(ase.[AssetClass],'-',ase.[MANUFACTURERID],'-',ase.[MakeModel])family,sum(pmdowntime)pmdowntime 
from [dbo].[AssetMaster_Feb] ase left join pmdowntime_aep_new j on ase.assetnum=j.assetnum
where ase.statusid='A-Active' and ase.[Effective_Currentflag]='Y' and j.year='31-mar-2021'
group by CONCAT(ase.[AssetClass],'-',ase.[MANUFACTURERID],'-',ase.[MakeModel]) )qq 
where qq.family=q.family)pmdowntime */

 from(

 ---------------------------------------------------
select i.Family,i.siteid,sum(assetcount)assetcount,Sum(totallabhrs)totallabhrs,sum(totallabcost)totallabcost,sum(totalsparecost)totalsparecost,sum(totalcost)totalcost,
sum(pmactlabhrs)pmactlabhrs,sum(pmlaborcost)pmlaborcost,sum(pmsparecost)pmsparecost,sum(pmtotal)pmtotal,sum(pmFollowupwo)pmFollowupwo,
sum(CMactlabhrs)CMactlabhrs,sum(CMlaborcost)CMlaborcost,sum(CMsparecost)CMsparecost,sum(CMTotal)CMTotal,sum(CMFollowupwo)CMFollowupwo,
sum(RMactlabhrs)RMactlabhrs,sum(RMlaborcost)RMlaborcost,sum(RMsparecost)RMsparecost,sum(RMTotal)RMTotal,sum(RMFollowupwo)RMFollowupwo,
sum(Nonpmactlabhrs)Nonpmactlabhrs,sum(Nonpmlaborcost)Nonpmlaborcost,sum(Nonpmsparecost)Nonpmsparecost,sum(NonpmTotal)NonpmTotal,sum(NOnpmFollowupwo)NonpmFollowupwo, ----NEW UPDATE 
----(select sum(bdm_follow_pm) from bdm_follow_pm_family bdm  where i.family=bdm.family) cm_follow_pm,

(select sum(cm_follow_pm) from cm_follow_pm_family bdm where i.FAMILY=bdm.FAMILY) CM_follow_pm,
(select sum(Rm_follow_pm) from [dbo].[Rm_follow_pm_family] RM where i.FAMILY=Rm.FAMILY) RM_follow_pm,
(select sum(nonpm_follow_pm) from nonpm_follow_pm_family bdm where i.FAMILY=bdm.FAMILY) NONPM_follow_pm,

SUM(RMDowntime) RMDowntime,
SUM(PMDowntime) PMDowntime,
SUM(CMDowntime) CMDowntime,
SUM(NOnpmDowntime) NONPMDowntime,

--case when (cast((sum(availablehrs) - (SUM(RMDowntime))) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float)) >0 then cast((sum(availablehrs) - (SUM(RMDowntime))) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float) else 0 end as RMMTBF,    --////new update
--case when (cast((sum(availablehrs) - (SUM(PMDowntime))) as float)/cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float)) >0 then  cast((sum(availablehrs) - (SUM(PMDowntime))) as float)/cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float) else 0 end as PMMTBF, ----NEW UPDATE
--case when (cast((sum(availablehrs) - (SUM(CMDowntime))) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end )  as float)) >0 then cast((sum(availablehrs) - (SUM(CMDowntime))) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end )  as float) else 0 end as CMMTBF,    ----NEW UPDATE 
--case when (cast((sum(availablehrs) - (SUM(nonpmdowntime)))as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float)) >0 then cast((sum(availablehrs) - (SUM(nonpmdowntime)))as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float) else 0 end as NONPMMTBF,  ---///new update
isnull(sum(availablehrs)/nullif(sum(NONPM_Count),0),sum(availablehrs)) CMMTBF,
 0 RMMTBF,
0 PMMTBF,
0 NONPMMTBF, 
sum(GBPARTSCOST)GBPARTSCOST,sum(GBDowntime)GBDowntime,year,
sum(PM_count) PM_count,
sum(CM_count)CM_count,
sum(RM_count)RM_count,
sum(NONPM_COUNT)NONPM_COUNT,
sum(availablehrs) availablehrs,
--cast(sum(availablehrs)as float)/ cast((case when sum(mtbm_wocount)=0 then 1 else sum(mtbm_wocount) end )as float) MTBM,    ----////new update
cast(sum(availablehrs) as float)/ nullif((cast((case when (sum(wocount))=0 then 1 else sum(wocount) end )as float)),0) MTBM,   ---------// NEW UPDATE 

--(sum(availablehrs)/nullif(sum(wocount),0))/60 MTBM,
 
--cast((SUM(RMDowntime) + SUM(CMDowntime)) as float)/ cast(sum(CM_count) as float) MTTR
--cast(SUM(GBDowntime) as float)/ nullif(cast(sum(CM_count) as float),0) MTTR ---New Update
cast(SUM(GBDowntime) as float)/ nullif(cast(sum(NONPM_Count) as float),0) MTTR 

from
 


(  
--------------------------------------------STAGE-1--------------------

select  CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel]) as Family,aa.SITEID as siteid,
count( distinct aa.Assetnum)assetcount,
sum(case when  w.Dev_worktype in('PM','CM','RM')then w.ACTLABHRS end) totallabhrs,
sum(case when  w.Dev_worktype in('PM','CM','RM')then w.LABORCOST end)totallabcost,
sum(case when  w.Dev_worktype in('PM','CM','RM')then w.SPARECOST end)totalsparecost,
sum(isnull(case when w.Dev_worktype in('PM','RM','CM')then w.SPARECOST end,0))+sum(isnull(case when  w.Dev_worktype in('PM','CM','RM')then w.LABORCOST end,0))totalcost,
count(case when  w.Dev_worktype in('PM','CM','RM')then w.wonum end)wocount,
--count(case when  w.Dev_worktype in('RM','CM')then w.[WONUM] end)mtbm_wocount,  -------NEW UPDATE
--sum(case when w.Dev_worktype='PM' then w.ACTLABHRS end) pmactlabhrs ,
--sum(case when w.Dev_worktype='PM' then w.LABORCOST end) pmlaborcost ,
--sum(case when w.Dev_worktype='PM' then w.sparecost end) pmsparecost,
--sum(case when w.reportedby='MAXADMIN' and w.jpnum is not null then j.PMDowntime end) pmdowntime,
2080 availablehrs,
--(select isnull(sum(availablehrs)/60,0 )from honda_staging.dbo.location_meter_reading lm where left(aa.location,4)=lm.location and lm.Readingdate>='12/01/2019' and lm.Readingdate<'12/01/2020')  availablehrs,
--sum(pmdowntime)pmdowntime,
-------------------------------CM,PM,RM DOWNTIME-----------

sum(case when w.Dev_worktype='PM' then w.[ACTLABHRS] end) PMactlabhrs ,
sum(case when w.Dev_worktype='PM' then w.[ACTLABCOST] end) PMlaborcost ,
sum(case when w.Dev_worktype=('PM') then w.[ACTMATCOST] end) PMsparecost,
(sum(case when w.Dev_worktype='PM' then isnull(w.LABORCOST,0) end) + sum(case when w.Dev_worktype='PM' then isnull(w.sparecost,0) end) )pmTotal,
count(case when w.Dev_worktype='PM' then r.RELATEDRECKEY end) pmFollowupwo,
sum(W.PMDowntime) as PMDowntime ,
count(case when w.Dev_worktype='PM' then w.wonum end) PM_count,

sum(case when w.Dev_worktype='CM' then w.[ACTLABHRS] end) CMactlabhrs ,
sum(case when w.Dev_worktype='CM' then w.[ACTLABCOST] end) CMlaborcost ,
sum(case when w.Dev_worktype=('CM') then w.[ACTMATCOST] end) CMsparecost,
(sum(case when w.Dev_worktype=('CM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype='CM' then isnull(w.[ACTMATCOST],0) end) )CMTotal,
count(case when w.Dev_worktype=('CM') then r.[RELATEDRECKEY] end) CMFollowupwo,
sum(W.CMDowntime) as CMDowntime , 
count(case when w.Dev_worktype='CM' then w.wonum end) CM_count,

sum(case when w.Dev_worktype='RM' then w.[ACTLABHRS] end) RMactlabhrs ,     ----New update
sum(case when w.Dev_worktype='RM' then w.[ACTLABCOST] end) RMlaborcost ,    ----New update
sum(case when w.Dev_worktype=('RM') then w.[ACTMATCOST] end) RMsparecost,   ----New update
(sum(case when w.Dev_worktype=('RM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype='RM' then isnull(w.[ACTMATCOST],0) end) )RMTotal,
count(case when w.Dev_worktype=('RM') then r.[RELATEDRECKEY] end) RMFollowupwo,
sum( W.RMDowntime) as RMDowntime,
count(case when w.Dev_worktype='RM' then w.wonum end) RM_count,

sum(case when w.Dev_worktype IN ('RM','CM' )then w.[ACTLABHRS] end) Nonpmactlabhrs ,     ----New update
sum(case when w.Dev_worktype IN ('RM','CM' )then w.[ACTLABCOST] end) Nonpmlaborcost ,    ----New update
sum(case when w.Dev_worktype IN ('RM','CM') then w.[ACTMATCOST] end) Nonpmsparecost, 
(sum(case when w.Dev_worktype IN ('CM','RM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype IN ('CM','RM') then isnull(w.[ACTMATCOST],0) end) )NonpmTotal,
count(case when w.Dev_worktype IN ('CM','RM') then r.[RELATEDRECKEY] end) NonpmFollowupwo,
sum(w.NONPPMDowntime) as NonpmDowntime,
count(case when w.Dev_worktype IN('CM','RM') then w.wonum end) NONPM_Count ,
--4000 as availablehrs,
--(select sum(bdm_follow_pm) from bdm_follow_pm bdm where v.asset=bdm.assetnum) as
0 cm_follow_pm,
0 Rm_follow_pm,
0 NONPm_follow_pm,

--sum(mc.tbf) tbf,
--sum(mc.bdmwo)bdmwo, 
sum(case when w.Dev_worktype='RM' then w.sparecost end) GBPARTSCOST,
sum(case when w.Dev_worktype='RM' then w.downtime end) GBDowntime,
'31-Mar-2022' as year
from [dbo].[PMO_3410012_DAF] aa
left join [dbo].client_workorder_DAF w on aa.assetnum=w.assetnum --and w.REPORTDATE>='2019-12-01' and w.REPORTDATE<'2020-04-01' and w.WO_STATUS='CLOSE'
and w.year='31-Mar-2022' 
------left join [dbo].[pmdowntime_aep_new] j on j.assetnum=aa.assetnum and j.year='31-Mar-2021'
left join (select CONCAT(ase.[AssetClass],'-',ase.[MANUFACTURERID],'-',ase.[MakeModel]) family,count(w.wonum)bdmwo,datediff(day,min(reportdate),max(reportdate))tbf from 
	[dbo].client_workorder_DAF  w 
		left join [dbo].[PMO_3410012_DAF]  ase on w.assetnum=ase.assetnum
			where --w.CLASSSTRUCTUREID in ('CS118014') and
			w.year='31-Mar-2022' --w.ACTFINISH>='2020-11-01' and w.ACTFINISH<='2021-10-31'
			group by CONCAT(ase.[AssetClass],'-',ase.[MANUFACTURERID],'-',ase.[MakeModel]))mc 
			on mc.family=CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel])
left join (select distinct RECORDKEY,RELATETYPE,count(distinct case when r.relatetype='FOLLOWUP' then r.relatedreckey end)RELATEDRECKEY
from [dbo].[relatedrecord_ALL] r where RELATETYPE='FOLLOWUP' and year='31-Mar-2022' AND SITEID='DAF' group by RECORDKEY,RELATETYPE ) r on r.RECORDKEY=w.wonum
--left join cm_follow_pm cm on w.assetnum=cm.assetnum

where --aa.statusid='A-ACTIVE' and 
aa.isflag in(1,2) --and [Effective_Currentflag]='Y'  --and aa.year='31-Dec-2020' --and w.REPORTDATE>='2019-07-01' and w.REPORTDATE<='2020-03-31' --and w.wonum='M21870910'
group by CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel]),aa.siteid --,left(aa.location,4)

------------------------------------------------------------------------------------


)i

group by i.Family,i.siteid,year --, availablehrs
------------------------ STAGE-2 -----------------
)q

)a
--where a.Family='Building\Doors-RICHARDS-WILCOX INC-99999'
group by a.Family,a.siteid,a.assetcount,a.totallabhrs,totallabcost,totalsparecost,totalcost,
a.pmactlabhrs,a.pmlaborcost,a.pmsparecost,a.pmdowntime,a.pmtotal,a.pmFollowupwo, A.Cmdowntime,Rmdowntime,A.NONPMdowntime,
a.CMactlabhrs,a.CMlaborcost,a.CMsparecost,a.CMTotal,a.CMFollowupwo,a.cm_follow_pm,Rm_follow_pm,NONPm_follow_pm,
a.RMactlabhrs,a.RMlaborcost,a.RMsparecost,a.RMTotal,a.RMFollowupwo,--a.cm_follow_pm,
a.Nonpmactlabhrs,a.Nonpmlaborcost,a.Nonpmsparecost,a.NonpmTotal,a.NonpmFollowupwo,--a.cm_follow_pm,
a.RMMTBF,a.CMMTBF,a.NONPMMTBF,a.PMMTBF,a.Nonpm_count,
a.GBPARTSCOST,a.GBDowntime,a.year,a.availablehrs,a.CM_count,a.RM_count,a.MTBM,a.PM_count,a.MTTR

--------------------------------------------STAGE-3------------------------------------
)b 

)V 


 --select distinct CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel]) as Family
 --from [Honda_Repository].dbo.PMO_3410012 aa
 --where StatusId='A-ACTIVE'

--select distinct CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel]) as Family
--from [Honda_Repository].[dbo].[AX_Asset_Master_Dec]   aa 
--where aa.statusid='A-ACTIVE' and [Effective_Currentflag]='Y' 

--select * from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts1]
--where SegmentMasterID is null
----drop table [dbo].[Segment_Objects_Aug]

--select * from segment_table
--select * from AX_Segment_Metric_Facts_temp
--select * from asset_table
--select * from [dbo].[Asset_Metric_Fact_Demo]
--select * from pmprogram_fact
--select * from testtable

select * from [dbo].[Assets_with_high_criticality_bot_no_pm_wo]
select * from [dbo].[Assets_with_low_criticality_and_high_pm_hrs]
select * from [dbo].[AX_Asset_Metric_Facts]
select * from [dbo].[AX_Asset_Saving]
select * from [dbo].[AX_Segment_Metric_Facts]
select * from [dbo].[Client_Workorder]
select * from [dbo].[PMO_3410012]
select * from [dbo].[Segment_Objects]

--drop table  [dbo].[AX_Asset_Metric_Facts_HCM]

select * from [dbo].[AX_SegmentMaster]

--truncate table [AX_SegmentMaster]
--insert into [AX_SegmentMaster]
select distinct 101 as [SegmentGroupID],  [SegmentMasterID],
null as [SegmentMasterName],--assetnum,
--CONCAT([AssetClass],'-',[MANUFACTURERID],'-',[MakeModel]) as 
[SegmentMasterDescription], 
null as [SegementMasterWhereClause], null as [SegemntMasterGroupByClause], 
Effective_Startdate ='2022-06-01 00:00:00.000',
Effective_Enddate='9999-12-31 00:00:00.000',
Effective_Currentflag='Y',
Updated_BY='BI Team',
Updated_On=getdate(),
Inserted_By='BI Team',
Inserted_On=getdate()
from AX_Segment_Metric_Facts 
--where StatusId='A-Active' and Effective_Currentflag='Y'




---------------------------update asset master groupid----------------------------------

select * from [AX_Segment_Metric_Facts] order by 2 

update [dbo].[AX_Segment_Metric_Facts]
set SegmentGroupID=111


insert into [AX_Asset_Saving]
select * from [dbo].[AX_Asset_Saving_DAF]
--order by 2 --[Sherwin_Williams_Repository].[dbo].[Client_Workorder]

--select * from  [dbo].[AX_Asset_Saving_All] order by 1
--where site='DAF'

select * from [dbo].[Client_workorder_All] order by 1


 --------------update [SegmentMasterID] ------------

 update a
 set a. [SegmentMasterID]= b.[SegmentMasterID]
 ---select * 
 from [AX_Segment_Metric_Facts] a
 --where siteid='DAF'
 inner join 
 (
 select 2792 + row_number() OVER(order by SegmentMasterDescription) [SegmentMasterID] , SegmentMasterDescription 
 from [AX_Segment_Metric_Facts]  where siteid='DAF')b
 on a.SegmentMasterDescription=b.SegmentMasterDescription where siteid='DAF'

select * from [AX_Segment_Metric_Facts] where siteid='PRD'
order by 2

