 ---drop table [AX_Segment_Metric_Facts]
select *  into [dbo].[Client_workorder_All]
from [dbo].[client_workorder_DAF] where 1=2



select * from [dbo].[Asset_Master_ALL]

select * into [AX_Segment_Metric_Facts_All]
from [Honda_Repository].[dbo].[AX_Segment_Metric_Facts]
where 1=2

select * from [AX_Segment_Metric_Facts_DAF]


insert INTO [AX_Segment_Metric_Facts_DAF] 
-------------------------------------------------STAGE 4-----------------------------------------------

select null as SegmentGroupID,null as SegmentMasterID, SegmentMasterDescription,null as Level_1,null as Level_2,null as Level_3,
Null as Level_4,
siteid,null as d2, null as d3,assetcount,totallabhrs,totallabcost,totalsparecost,totalcost, 
PM_count as PMcount,pmactlabhrs,pmlaborcost,pmsparecost,pmtotal,b.pmdowntime,b.pmFollowupwo,
case when (((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100) > 0 then ((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100 else 0 end as PM_Index ,
(abs((isnull(z_PMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_PMDowntime,0)*0.30))*100) PM_GBActor_Index,  ---New Update
CM_count,CMactlabhrs,CMlaborcost,CMsparecost,CMTotal,CMDowntime,CMFollowupwo,

case when (((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100) > 0 then ((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100 else 0 end as CM_Index,
(abs((isnull(z_CMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_CMDowntime,0)*0.30))*100) CM_GBActor_Index,cm_follow_pm,
RM_count,RMactlabhrs,RMlaborcost,RMsparecost,RMTotal,RMDowntime,RMFollowupwo,
case when (((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20 +isnull(z_Rm_follow_pm,0)*0.10
))*100) > 0 then ((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20 +isnull(z_Rm_follow_pm,0)*0.10
))*100 else 0 end as RM_Index, 
(abs((isnull( z_RMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_RMDowntime,0)*0.30))*100) RM_GBActor_Index,Rm_follow_pm,
NONPM_COUNT,Nonpmactlabhrs,Nonpmlaborcost,Nonpmsparecost,NonpmTotal,NONPMDowntime,NonpmFollowupwo,
case when (((isnull(z_Nonpmactlabhrs,0)*0.30+isnull(z_Nonpmsparecost,0)*0.40+isnull(z_NonpmFollowupwo,0)*0.20 +isnull(z_NONPM_follow_pm,0)*0.10
))*100) >0 then ((isnull(z_Nonpmactlabhrs,0)*0.30+isnull(z_Nonpmsparecost,0)*0.40+isnull(z_NonpmFollowupwo,0)*0.20 +isnull(z_NONPM_follow_pm,0)*0.10
))*100 else 0 end as Nonpm_Index,
(abs((isnull(z_NONPMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(z_NONPMDowntime,0)*0.30))*100) NONPM_GBActor_Index,
NONPm_follow_pm,

case when ((((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100+
(((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100)
+
((isnull(z_PMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_PMDowntime,0)*0.30))*100)/3) > 0 then(((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100+
(((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100)
+
((isnull(z_PMMTBF,0)*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_PMDowntime,0)*0.30))*100)/3 else 0 end as PMO_Index,
GBPARTSCOST,GBDowntime,MTBM,MTTR,CMMTBF as MTBF,
availablehrs,
null as total_saving, null saving_index,null as Cumulative, updated_on as Year,

 z_PM_count,z_PMlabhrs, z_PMlabcost, z_PMsparecost ,z_PMTotal ,z_PMMTBF,PMMTBF,z_PMDowntime ,z_PMFollowupwo ,

 z_CMACTlabhrs,z_CMlabcost,z_CMsparecost ,z_CMDowntime,z_CMFollowupwo , z_CMMTBF,-- z_CM_count,z_CMTotal,z_cm_follow_pm,
 z_RMACTlabhrs, z_RMlabcost,z_RMsparecost z_RMTotal ,z_RM_count,z_RMDowntime,z_RMFollowupwo ,  z_RMMTBF,RMMTBF, --z_Rm_follow_pm,
 z_NONPMDowntime,z_NONPMMTBF,NONPMMTBF, Z_GBDowntime,z_GBPARTSCOST, Z_Assetcount


from(
----------------------------------------------  STAG 3   ------------------------------------------------

select a.Family SegmentMasterDescription,a.siteid siteid,a.assetcount assetcount,a.totallabhrs totallabhrs,a.totallabcost totallabcost,a.totalsparecost totalsparecost,a.totalcost totalcost,a.pmactlabhrs pmactlabhrs,pmlaborcost pmlaborcost,pmsparecost pmsparecost,a.pmdowntime pmdowntime,a.pmtotal pmtotal,a.pmFollowupwo pmFollowupwo,
a.CMactlabhrs CMactlabhrs,a.CMlaborcost CMlaborcost,a.CMsparecost CMsparecost,a.CMTotal CMTotal,a.CMFollowupwo CMFollowupwo,
a.RMactlabhrs RMactlabhrs,a.RMlaborcost RMlaborcost,a.RMsparecost RMsparecost,a.RMTotal RMTotal,a.RMFollowupwo RMFollowupwo,
a.Nonpmactlabhrs Nonpmactlabhrs,a.Nonpmlaborcost Nonpmlaborcost,a.Nonpmsparecost Nonpmsparecost,a.NonpmTotal NonpmTotal,a.NonpmFollowupwo NonpmFollowupwo,
--A.RM_count RM_count,
a.cm_follow_pm cm_follow_pm,
a.Rm_follow_pm Rm_follow_pm,
a.NONPm_follow_pm NONPm_follow_pm,

--A.PMDowntime PMDowntime,
A.RMDowntime RMDowntime,
A.CMDowntime CMDowntime,
A.NONPMDowntime NONPMDowntime,


a.PMMTBF PMMTBF ,
a.RMMTBF RMMTBF ,
a.CMMTBF CMMTBF ,
a.NONPMMTBF NONPMMTBF ,

a.GBPARTSCOST GBPARTSCOST,a.GBDowntime GBDowntime,a.availablehrs,a.CM_count,a.RM_count,a.MTBM,a.PM_count,A.NONPM_COUNT,a.MTTR,
max(a.pmactlabhrs)over()maxa,
min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini,
(a.pmactlabhrs-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over())/(max(a.pmactlabhrs)over()-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over() ) z_PMlabhrs,
max(a.pmlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini1,
(a.pmlaborcost-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over())/(max(a.pmlaborcost)over()-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over() ) z_PMlabcost,
max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini2,
(a.pmsparecost-min(case when a.pmsparecost>0 then a.pmsparecost end)over())/(max(a.pmsparecost)over()-min(case when a.pmsparecost>0 then a.pmsparecost end)over() ) z_PMsparecost ,
max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini18,
(a.PM_count-min(case when a.PM_count>0 then a.PM_count end)over())/(max(a.PM_count)over()-min(case when a.PM_count>0 then a.PM_count end)over() ) z_PM_count,
max(a.pmdowntime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
(a.pmdowntime-min(case when a.pmdowntime>0 then a.pmdowntime end)over())/(max(a.pmdowntime)over()-min(case when a.pmdowntime>0 then a.pmdowntime end)over() ) z_PMDowntime ,
max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini4,
(a.pmtotal-min(case when a.pmtotal>0 then a.pmtotal end)over())/(max(a.pmtotal)over()-min(case when a.pmtotal>0 then a.pmtotal end)over() ) z_PMTotal ,
max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.pmFollowupwo-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())/nullif((max(a.pmFollowupwo)over()-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()),(max(a.pmFollowupwo)over()-min (case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())) ) z_PMFollowupwo ,
--0 z_PMFollowupwo,

--------------------------------------------------------CM NEW UPDATE--------------------------------------------------------------------------

--min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini,
(a.CMactlabhrs-min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over())/(max(a.CMactlabhrs)over()-min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over() ) z_CMACTlabhrs,
--max(a.pmlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini1,
(a.CMlaborcost-min(case when a.CMlaborcost>0 then a.CMlaborcost end)over())/(max(a.CMlaborcost)over()-min(case when a.CMlaborcost>0 then a.CMlaborcost end)over() ) z_CMlabcost,
--max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini2,
(a.CMsparecost-min(case when a.CMsparecost>0 then a.CMsparecost end)over())/(max(a.CMsparecost)over()-min(case when a.CMsparecost>0 then a.CMsparecost end)over() ) z_CMsparecost ,
--max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini18,
(a.CM_count-min(case when a.CM_count>0 then a.CM_count end)over())/(max(a.CM_count)over()-min(case when a.CM_count>0 then a.CM_count end)over() ) z_CM_count,
-- z_PM_count,
--max(a.downtime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
(a.CMdowntime-min(case when a.CMdowntime>0 then a.CMdowntime end)over())/(max(a.CMdowntime)over()-min(case when a.CMdowntime>0 then a.CMdowntime end)over() ) z_CMDowntime ,
--max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini4,
(a.CMtotal-min(case when a.CMtotal>0 then a.CMtotal end)over())/(max(a.CMtotal)over()-min(case when a.CMtotal>0 then a.CMtotal end)over() ) z_CMTotal ,
--max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.CMFollowupwo-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over())/nullif((max(a.CMFollowupwo)over()-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over()),(max(a.CMFollowupwo)over()-min (case when a.CMFollowupwo>0 then a.CMFollowupwo end)over())) ) z_CMFollowupwo ,
--0 z_PMFollowupwo,
(a.cm_follow_pm-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())/nullif((max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()),(max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())) z_cm_follow_pm,



---------------------------------------------------------RM NEW UPDATE --------------------------------------------------------

--min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini,
(a.RMactlabhrs-min(case when a.RMactlabhrs>0 then a.RMactlabhrs end)over())/(max(a.RMactlabhrs)over()-min(case when a.RMactlabhrs>0 then a.RMactlabhrs end)over() ) z_RMACTlabhrs,
--max(a.pmlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini1,
(a.RMlaborcost-min(case when a.RMlaborcost>0 then a.RMlaborcost end)over())/(max(a.RMlaborcost)over()-min(case when a.RMlaborcost>0 then a.RMlaborcost end)over() ) z_RMlabcost,
--max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini2,
(a.RMsparecost-min(case when a.RMsparecost>0 then a.RMsparecost end)over())/(max(a.RMsparecost)over()-min(case when a.RMsparecost>0 then a.RMsparecost end)over() ) z_RMsparecost ,
--max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini18,
(a.RM_count-min(case when a.RM_count>0 then a.RM_count end)over())/(max(a.RM_count)over()-min(case when a.RM_count>0 then a.RM_count end)over() ) z_RM_count,
--0 z_PM_count,
--max(a.downtime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
(a.RMdowntime-min(case when a.RMdowntime>0 then a.RMdowntime end)over())/(max(a.RMdowntime)over()-min(case when a.RMdowntime>0 then a.RMdowntime end)over() ) z_RMDowntime ,
--max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini4,
(a.RMtotal-min(case when a.RMtotal>0 then a.RMtotal end)over())/(max(a.RMtotal)over()-min(case when a.RMtotal>0 then a.RMtotal end)over() ) z_RMTotal ,
--max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.RMFollowupwo-min(case when a.RMFollowupwo>0 then a.RMFollowupwo end)over())/nullif((max(a.RMFollowupwo)over()-min(case when a.RMFollowupwo>0 then a.RMFollowupwo end)over()),(max(a.RMFollowupwo)over()-min (case when a.RMFollowupwo>0 then a.RMFollowupwo end)over())) ) z_RMFollowupwo ,
--0 z_PMFollowupwo,

(a.Rm_follow_pm-min(case when a.Rm_follow_pm>0 then a.Rm_follow_pm end)over())/nullif((max(a.Rm_follow_pm)over()-min(case when a.Rm_follow_pm>0 then a.Rm_follow_pm end)over()),(max(a.Rm_follow_pm)over()-min(case when a.Rm_follow_pm>0 then a.Rm_follow_pm end)over())) z_Rm_follow_pm,


------------------------------------------------Nonpm NEW UPDATE-----------------


--min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini,
(a.Nonpmactlabhrs-min(case when a.Nonpmactlabhrs>0 then a.Nonpmactlabhrs end)over())/(max(a.Nonpmactlabhrs)over()-min(case when a.Nonpmactlabhrs>0 then a.Nonpmactlabhrs end)over() ) z_NonpmACTlabhrs,
--max(a.pmlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini1,
(a.Nonpmlaborcost-min(case when a.Nonpmlaborcost>0 then a.Nonpmlaborcost end)over())/(max(a.Nonpmlaborcost)over()-min(case when a.Nonpmlaborcost>0 then a.Nonpmlaborcost end)over() ) z_Nonpmlabcost,
--max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini2,
(a.Nonpmsparecost-min(case when a.Nonpmsparecost>0 then a.Nonpmsparecost end)over())/(max(a.Nonpmsparecost)over()-min(case when a.Nonpmsparecost>0 then a.Nonpmsparecost end)over() ) z_Nonpmsparecost ,
--max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini18,
(a.Nonpm_count-min(case when a.Nonpm_count>0 then a.Nonpm_count end)over())/(max(a.Nonpm_count)over()-min(case when a.Nonpm_count>0 then a.Nonpm_count end)over() ) z_Nonpm_count,
--0 z_PM_count,
--max(a.downtime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
(a.NONPMdowntime-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over())/(max(a.NONPMdowntime)over()-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over() ) z_NONPMDowntime ,
--max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini4,
(a.Nonpmtotal-min(case when a.Nonpmtotal>0 then a.Nonpmtotal end)over())/(max(a.Nonpmtotal)over()-min(case when a.Nonpmtotal>0 then a.Nonpmtotal end)over() ) z_NonpmTotal ,
--max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini5,
--convert(decimal(16,6),(a.NonpmFollowupwo-min(case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over())/nullif((max(a.NonpmFollowupwo)over()-min(case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over()),(max(a.NonpmFollowupwo)over()-min (case when a.NopmFollowupwo>0 then a.NonpmFollowupwo end)over())) ) z_NonpmFollowupwo ,
--0 z_PMFollowupwo,

convert(decimal(16,6),(a.NonpmFollowupwo-min(case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over())/nullif((max(a.NonpmFollowupwo)over()-min(case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over()),(max(a.NonpmFollowupwo)over()-min (case when a.NonpmFollowupwo>0 then a.NonpmFollowupwo end)over())) ) z_NonpmFollowupwo ,

(a.NONPm_follow_pm-min(case when a.NONPm_follow_pm>0 then a.NONPm_follow_pm end)over())/nullif((max(a.NONPm_follow_pm)over()-min(case when a.NONPm_follow_pm>0 then a.NONPm_follow_pm end)over()),(max(a.NONPm_follow_pm)over()-min(case when a.NONPm_follow_pm>0 then a.NONPm_follow_pm end)over())) z_NONPm_follow_pm,


--max(a.cm_follow_pm)over()maxa9,min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()mini9,
--(a.cm_follow_pm-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())/nullif((max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()),(max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())) z_cm_follow_pm,


--max(a.mtbf)over()maxa10,min(case when a.mtbf>0 then a.mtbf end)over()mini10,
--(max(a.mtbf)over()-a.mtbf)/(max(a.mtbf)over()-min(case when a.mtbf>0 then a.mtbf end)over() ) z_MTBF,
cast((max(a.RMmtbf)over() - a.RMMTBF) as float)/cast((max(a.RMMTBF)over()-min(case when a.RMMTBF>0 then a.RMMTBF end)over() ) as float) z_RMMTBF, -----New Update
cast((max(a.PMmtbf)over() - a.PMMTBF) as float)/cast((max(a.PMMTBF)over()-min(case when a.PMMTBF>0 then a.PMMTBF end)over() ) as float) z_PMMTBF, -----New Update
cast((max(a.CMmtbf)over() - a.CMMTBF) as float)/cast((max(a.CMMTBF)over()-min(case when a.CMMTBF>0 then a.CMMTBF end)over() ) as float) z_CMMTBF, -----New Update
cast((max(a.NONPMmtbf)over() - a.NONPMMTBF) as float)/cast((max(a.NONPMMTBF)over()-min(case when a.NONPMMTBF>0 then a.NONPMMTBF end)over() )as float) z_NONPMMTBF, -----New Update


--max(a.GBPARTSCOST)over()maxa11,min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over()mini11,
(a.GBPARTSCOST-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over())/(max(a.GBPARTSCOST)over()-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over() ) z_GBPARTSCOST,
--max(a.GBDowntime)over()maxa12,min(case when a.GBDowntime>0 then a.GBDowntime end)over()mini12,
(a.GBDowntime-min(case when a.GBDowntime>0 then a.GBDowntime end)over())/nullif((max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() ),(max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() )) Z_GBDowntime,
--max(a.assetcount)over()maxa13,min(case when a.assetcount>0 then a.assetcount end)over()mini13,
(a.assetcount-min(case when a.assetcount>0 then a.assetcount end)over())/(max(a.assetcount)over()-min(case when a.assetcount>0 then a.assetcount end)over() ) Z_Assetcount,
a.year updated_on

from(
-----------------------------------------STAGE 2----------------------
select q.* /*,(select qq.pm_downtime 
from(


select CONCAT(ase.[ASSETCLASS],'-',ase.[MANUFACTURER],'-',ase.MakeModel) family,
sum(cast ([DOWNTIME] as float ))pm_downtime 
from [dbo].[Asset_Master] ase left join [dbo].[Downtime_Data] j on ase.assetnum=j.assetnum
where ase.statusid in('ACTIVE','OPERATING') --and ase.year='30-Nov-2020' and j.year='30-Nov-2020'
group by CONCAT(ase.[ASSETCLASS],'-',ase.[MANUFACTURER],'-',ase.MakeModel) )qq 
where qq.family=q.family)pm_downtime */

from(

----------------------------------

select i.Family,i.siteid,sum(assetcount)assetcount,Sum(totallabhrs)totallabhrs,sum(totallabcost)totallabcost,sum(totalsparecost)totalsparecost,sum(totalcost)totalcost,
sum(pmactlabhrs)pmactlabhrs,sum(pmlaborcost)pmlaborcost,sum(pmsparecost)pmsparecost,sum(pmtotal)pmtotal,sum(pmFollowupwo)pmFollowupwo,
sum(CMactlabhrs)CMactlabhrs,sum(CMlaborcost)CMlaborcost,sum(CMsparecost)CMsparecost,sum(CMTotal)CMTotal,sum(CMFollowupwo)CMFollowupwo,
sum(RMactlabhrs)RMactlabhrs,sum(RMlaborcost)RMlaborcost,sum(RMsparecost)RMsparecost,sum(RMTotal)RMTotal,sum(RMFollowupwo)RMFollowupwo,
sum(Nonpmactlabhrs)Nonpmactlabhrs,sum(Nonpmlaborcost)Nonpmlaborcost,sum(Nonpmsparecost)Nonpmsparecost,sum(NonpmTotal)NonpmTotal,sum(NOnpmFollowupwo)NonpmFollowupwo, ----NEW UPDATE 
--(select sum(Cm_follow_pm) from Cm_follow_pm_family bdm  where i.family=bdm.family) cm_follow_pm,


(select sum(cm_follow_pm) from [dbo].[cm_follow_pm_family] bdm where i.FAMILY=bdm.FAMILY) CM_follow_pm,
(select sum(rm_follow_pm) from [dbo].[Rm_follow_pm_family] bdm where i.FAMILY=bdm.FAMILY) RM_follow_pm,
(select sum(nonpm_follow_pm) from [dbo].[NONPM_follow_pm_family] bdm where i.FAMILY=bdm.FAMILY) NONPM_follow_pm,

SUM(RMDowntime) RMDowntime,
SUM(PMDowntime) PMDowntime,
SUM(CMDowntime) CMDowntime,
SUM(NOnpmDowntime) NONPMDowntime,

---case when (cast((sum(availablehrs) - (SUM(RMDowntime)/60)) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float)) >0 then cast((sum(availablehrs) - (SUM(RMDowntime)/60)) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float) else 0 end as RMMTBF,    --////new update
--case when (cast((sum(availablehrs) - (SUM(PMDowntime)/60)) as float)/cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float)) >0 then  cast((sum(availablehrs) - (SUM(PMDowntime)/60)) as float)/cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float) else 0 end as PMMTBF, ----NEW UPDATE
--case when (cast((sum(availablehrs) - (SUM(CMDowntime)/60)) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end )  as float)) >0 then cast((sum(availablehrs) - (SUM(CMDowntime)/60)) as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end )  as float) else 0 end as CMMTBF,    ----NEW UPDATE 
--case when (cast((sum(availablehrs) - (SUM(nonpmdowntime)/60))as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float)) >0 then cast((sum(availablehrs) - (SUM(nonpmdowntime)/60))as float)/ cast((case when sum(RM_count)=0 then 1 else sum(RM_count) end ) as float) else 0 end as NONPMMTBF,  ---///new update
isnull((sum(availablehrs))/nullif(sum(NONPM_COUNT),0),sum(availablehrs)) CMMTBF,
0 as RMMTBF, 
0 as PMMTBF,
0 as NONPMMTBF,

sum(GBPARTSCOST)GBPARTSCOST,sum(GBDowntime)GBDowntime
,year,
sum(PM_count) PM_count,
sum(CM_count)CM_count,
--sum(RM_count)RM_count,
sum(NONPM_COUNT)NONPM_COUNT,
sum(availablehrs)availablehrs,
cast(sum(availablehrs)as float)/ cast((case when sum(wocount)=0 then 1 else sum(wocount) end )as float) MTBM,
--(sum(availablehrs)/nullif(sum(wocount),0))/60 MTBM,
 --isnull((sum(availablehrs))/nullif(sum(NONPM_COUNT),0),sum(availablehrs)) CMMTBF,
cast(SUM(NonpmDowntime) as float)/ nullif(cast(sum(CM_count) as float),0) MTTR,    --////new update
sum(RM_count) RM_count,
--sum(PRJ_count) PRJ_count,
sum(OTH_count) OTH_count
--SUM(ADM_COUNT) ADM_COUNT
--sum(RM_count) +SUM(CM_count)Nonpm_count


from

(

-------------------------------------------STAGE 1-----------------------------

select --CONCAT(aa.failureclass,'-',aa.[MANUFACTURER]) as Family,
	CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel])  as Family,
aa.[SITEID] as siteid,
count(distinct aa.[ASSETNUM])assetcount,
sum(case when  w.DEV_worktype in('PM','CM','RM')then w.[ACTLABHRS] end) totallabhrs,
sum(case when  w.DEV_worktype in('PM','CM','RM')then w. [ACTLABCOST]end)totallabcost,
sum(case when  w.DEV_worktype in('PM','CM','RM')then w. [ACTMATCOST]end)totalsparecost,
sum(isnull(case when  w.DEV_worktype in('PM','CM','RM')then w.[ACTMATCOST] end,0))+sum(isnull(case when  w.DEV_worktype in('PM','CM','RM')then w.[ACTLABCOST] end,0))totalcost,
count(case when  w.DEV_worktype in('PM','CM','RM')then w.[WONUM] end)wocount,
count(case when  w.DEV_worktype in('RM','CM')then w.[WONUM] end)mtbm_wocount,  -------NEW UPDATE
sum(case when w.DEV_worktype='PM' then w.[ACTLABHRS] end) pmactlabhrs ,
sum(case when w.DEV_worktype='PM' then w.[ACTLABCOST] end) pmlaborcost ,
sum(case when w.DEV_worktype='PM' then w.[ACTMATCOST] end) pmsparecost,
--sum(case when w.reportedby='MAXADMIN' and w.jpnum is not null then j.PMDowntime end) pmdowntime,
count(case when w.DEV_worktype='PM' then w. [WONUM]end) PM_count,
count(case when w.DEV_worktype='CM' then w.[WONUM] end) CM_count,
count(case when w.DEV_worktype IN('CM','RM') then w. [WONUM]end) NONPM_COUNT ,
count(case when w.DEV_worktype='RM' then w. [WONUM]end) RM_count,
count(case when w.DEV_worktype='OTH' then w. [WONUM]end) OTH_count,
--count(case when w.DEV_worktype='PRJ' then w. [WONUM]end) PRJ_count,
--count(case when w.DEV_worktype='ADM' then w. [WONUM]end) ADM_count,
--(select sum(availablehrs) from location_meter_reading lm where left(aa.location,4)=lm.location and lm.Readingdate>='11/01/2019' and lm.Readingdate<'11/01/2020') availablehrs,
--sum(pmdowntime)pmdowntime,


---------------- -------------------- CM,PM,RM DOWNTIME--------------------------------------------

sum(W.CMDowntime) as CMDowntime , 
sum(W.PMDowntime) as PMDowntime ,
sum( W.RMDowntime) as RMDowntime,
sum(w.NONPPMDowntime) as NonpmDowntime,


(sum(case when w.DEV_worktype='PM' then isnull(w.[ACTLABCOST],0) end) + sum(case when w.DEV_worktype='PM' then isnull(w.[ACTMATCOST],0) end) )pmTotal,
--count(case when w.DEV_worktype='PM' then r.[RELATEDRECKEY] end) 
0 pmFollowupwo,

sum(case when w.DEV_worktype='CM' then w.[ACTLABHRS] end) CMactlabhrs ,
sum(case when w.DEV_worktype='CM' then w.[ACTLABCOST] end) CMlaborcost ,
sum(case when w.DEV_worktype=('CM') then w.[ACTMATCOST] end) CMsparecost,

sum(case when w.DEV_worktype='RM' then w.[ACTLABHRS] end) RMactlabhrs ,     ----New update
sum(case when w.DEV_worktype='RM' then w.[ACTLABCOST] end) RMlaborcost ,    ----New update
sum(case when w.DEV_worktype=('RM') then w.[ACTMATCOST] end) RMsparecost,   ----New update

sum(case when w.DEV_worktype IN ('RM','CM' )then w.[ACTLABHRS] end) Nonpmactlabhrs ,     ----New update
sum(case when w.DEV_worktype IN ('RM','CM' )then w.[ACTLABCOST] end) Nonpmlaborcost ,    ----New update
sum(case when w.DEV_worktype IN ('RM','CM') then w.[ACTMATCOST] end) Nonpmsparecost,   ----New update

(sum(case when w.DEV_worktype IN ('CM','RM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.DEV_worktype IN ('CM','RM') then isnull(w.[ACTMATCOST],0) end) )NonpmTotal,
--count(case when w.DEV_worktype IN ('CM','RM') then r.[RELATEDRECKEY] end) 
0 NonpmFollowupwo,
/*
sum(CMDowntime)CMDowntime, ----NEW UPDATE
sum(PMDowntime)PMDowntime, ----NEW UPDATE
sum(RMDowntime)RMDowntime, ----NEW UPDATE
sum(RMDowntime)+Sum(CMDowntime) NonpmDowntime,*/

2080 as availablehrs,

(sum(case when w.DEV_worktype=('CM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.DEV_worktype='CM' then isnull(w.[ACTMATCOST],0) end) )CMTotal,
--count(case when w.DEV_worktype=('CM') then r.[RELATEDRECKEY] end) 
0 CMFollowupwo,

(sum(case when w.DEV_worktype=('RM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.DEV_worktype='RM' then isnull(w.[ACTMATCOST],0) end) )RMTotal,
--count(case when w.DEV_worktype=('RM') then r.[RELATEDRECKEY] end) 
0 RMFollowupwo,


--(select sum(bdm_follow_pm) from bdm_follow_pm bdm where v.asset=bdm.assetnum) as
0 cm_follow_pm,
0 Rm_follow_pm,
0 NONPm_follow_pm,
--sum(mc.tbf) tbf,[ASSETNUM]
--sum(mc.bdmwo)bdmwo,
sum(case when w.DEV_worktype='RM' then w.[ACTMATCOST] end) GBPARTSCOST,
sum(case when w.DEV_worktype='RM' then w.[DOWNTIME] /60 end) GBDowntime,
'31-Mar-2022' as year

from [dbo].[Asset_Master_DAF] aa
left join (select w.* /*, CASE WHEN w.[WORKTYPE] in('02') and w.jpnum is not null then 'PM'
	when w.[WORKTYPE] in('01') then 'CM' 
	when w.[WORKTYPE] in('00') then 'RM' 
	--when w.[WORKTYPE] in('ADM') then 'ADM' 
	--when w.[WORKTYPE] in('MM','EP','CP') then 'PRJ' 
	else 'OTH' end 'DEV_worktype'*/ from [dbo].[client_workorder_DAF] w) 
w on aa.assetnum=w.assetnum 
--and w.actfinish>='2020-09-01' and w.actfinish<='2021-08-31' 
--and w.STATUS='CLOSE'--and w.Year='30-Nov-2020'
--left join [dbo].[Downtime_Data] j on j.assetnum=aa.ASSETNUM

---left join (select distinct [RECORDKEY],[RELATETYPE],count(distinct case when r.[RELATETYPE]='FOLLOWUP' then r.[RELATEDRECORD] end)RELATEDRECKEY
---from [dbo].[Relatedrecord_Data] r where[RELATETYPE] ='FOLLOWUP' ---and year='30-Nov-2020' 
---group by[RECORDKEY] ,[RELATETYPE] ) r on r.[RECORDKEY]=w.[WONUM]
--left join cm_follow_pm cm on w.assetnum=cm.assetnum

--where aa.[StatusId] IN('ACTIVE','OPERATING') ---- and aa.year='30-Nov-2020' 
--and w.REPORTDATE>='2020-03-01' and w.REPORTDATE<='2021-03-31' --and w.wonum='M21870910'
GROUP BY CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel]),aa. [SITEID]


--------------------------STAGE1 --------------------------
)i

group by i.Family,i.siteid,year

----------------------- STAGE2 -----------------------------------
)q 

)a
group by a.Family,a.siteid,a.assetcount,a.totallabhrs,totallabcost,totalsparecost,totalcost,
a.pmactlabhrs,a.pmlaborcost,a.pmsparecost,a.pmdowntime,a.pmtotal,a.pmFollowupwo, A.Cmdowntime,Rmdowntime,A.NONPMdowntime,
a.CMactlabhrs,a.CMlaborcost,a.CMsparecost,a.CMTotal,a.CMFollowupwo,a.cm_follow_pm,Rm_follow_pm,NONPm_follow_pm,
a.RMactlabhrs,a.RMlaborcost,a.RMsparecost,a.RMTotal,a.RMFollowupwo,--a.cm_follow_pm,
a.Nonpmactlabhrs,a.Nonpmlaborcost,a.Nonpmsparecost,a.NonpmTotal,a.NonpmFollowupwo,--a.cm_follow_pm,
a.RMMTBF,a.CMMTBF,a.NONPMMTBF,a.PMMTBF,a.Nonpm_count,
a.GBPARTSCOST,a.GBDowntime,a.year,a.availablehrs,a.CM_count,a.RM_count,a.MTBM,a.PM_count,a.MTTR

-----------------------------------------STAGE3---------------------

)b   

)v



---------------------------update asset master groupid----------------------------------

select * from [AX_Segment_Metric_Facts_PRD] order by 2 


update [dbo].[AX_Segment_Metric_Facts_ALL]
set SegmentGroupID=111

insert into [AX_Asset_Saving_All]
select * from [dbo].[AX_Asset_Saving_DAF]
--order by 2 --[Sherwin_Williams_Repository].[dbo].[Client_Workorder]

select * from  [dbo].[AX_Asset_Saving_All] order by 1
where site='DAF'

select * from [dbo].[Client_workorder_All] order by 1

delete  [AX_Asset_Saving_All]
 --------------update [SegmentMasterID] ------------
 update a
 set a. [SegmentMasterID]= b.[SegmentMasterID]
 from [AX_Segment_Metric_Facts_ALL] a
 --where siteid='DAF'
 inner join 
 (
 select row_number() OVER(order by SegmentMasterDescription) [SegmentMasterID] , SegmentMasterDescription 
 from [AX_Segment_Metric_Facts_ALL]  )b
 on a.SegmentMasterDescription=b.SegmentMasterDescription



 ---------Segemnt Object----

 
select * into [dbo].[Segment_Objects_ALL]
from [Honda_Repository].[dbo].[Segment_Objects]
where 1=2

--drop table [dbo].[AX_Asset_Saving]
--truncate table [Segment_Objects1]
select * from [Segment_Objects_ALL]
insert into [dbo].[Segment_Objects_ALL] 

select aa.assetnum,s.SegmentMasterID,
'2022-03-01 00:00:00.000' [Effective_Startdate],
'9999-12-31 00:00:00.000' [Effective_Enddate],
'Y' [Effective_Currentflag],
'BI Team' [Updated_BY],
getdate() [Updated_On],
'BI Team' [Inserted_By],
getdate() [Inserted_On]
from [dbo].[Asset_Master_ALL] aa
left join [dbo].[AX_Segment_Metric_Facts_All] s
on CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURER],'-',aa.[MakeModel])= s.SegmentMasterDescription and aa.SiteId=s.siteid
where aa.[Effective_Currentflag]='Y'



select * from [Segment_Objects_ALL]

select count(*) from [dbo].[AX_Asset_Metric_Facts_ALL] --33559
select count(*) from [Segment_Objects_PRD]--41114

select count(*) from [Segment_Objects_ALL]--85362
select * from [dbo].[Asset_Master_ALL] where siteid not in ('PRD')




--where aa.assetnum  not in('RL-BXM-098','RL-1234') and aa.sid=2
--where aa.StatusId in('OPERATING','ACTIVE')
--where not exists(select Asset_Master_Group_Details_ID from [dbo].[AX_Segment_Metric_Facts]  so where so.Asset_Master_Group_Details_ID=s.Asset_Master_Group_Details_ID)