--delete from [AX_Asset_Metric_Facts] where year ='30-Nov-2020'
SELECT * FROM [AX_Asset_Metric_Facts1]

update AX_Segment_Metric_Facts
set Asset_Master_GroupID=102 

drop table [AX_Asset_Metric_Facts]
--------------------------------MainQuery Start---------------------
select * into [AX_Asset_Metric_Facts]
from  [Honda_Repository].dbo.[AX_Asset_Metric_Facts]
where 1=2

select * into [AX_Asset_Metric_Facts_1]
from [AX_Asset_Metric_Facts] where 1=2

insert INTO [dbo].[AX_Asset_Metric_Facts_1] --FROM (
--------------------------STAGE4------------------------------------------------
 select null as [Ax_Asset_id],
 asset as [CMMS_Asset_ID],
 siteid,dept as dept,null as Month_year,wocount,totallabhrs,totallabcost,totalsparecost,totalcost,
 PM_count as pmcount,
pmactlabhrs,pmlaborcost,pmsparecost,pmtotal,b.pmdowntime,pmFollowupwo,
abs(nullif(case when (((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100) > 0 then ((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100 else 0 end,0)) as PM_Index ,
0 as PM_GBActor_Index,	
CM_count,cmactlabhrs,cmlaborcost,cmsparecost,cmtotal,b.cmdowntime, b.cmFollowupwo,
case when (((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100) > 0 then ((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +isnull(z_cm_follow_pm,0)*0.10
))*100 else 0 end as CM_Index,
(abs((isnull(z_CMMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_CMDowntime,0)*0.30))*100 CM_GBActor_Index,	cm_follow_pm,
RM_count,rmactlabhrs,rmlaborcost,rmsparecost,rmtotal,b.rmdowntime,b.rmFollowupwo,
case when (((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20 +isnull(z_Rm_follow_pm,0)*0.10
))*100) > 0 then ((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20 +isnull(z_Rm_follow_pm,0)*0.10
))*100 else 0 end as RM_Index,
0 as RM_GBActor_Index,rm_follow_pm,NONpm_count,NONpmactlabhrs,NONpmlaborcost,NONpmsparecost,NONpmtotal,b.NONpmdowntime,b.NONpmFollowupwo,
case when (((isnull(z_Nonpmactlabhrs,0)*0.30+isnull(z_Nonpmsparecost,0)*0.40+isnull(z_NonpmFollowupwo,0)*0.20 +isnull(z_NONPM_follow_pm,0)*0.10
))*100) >0 then ((isnull(z_Nonpmactlabhrs,0)*0.30+isnull(z_Nonpmsparecost,0)*0.40+isnull(z_NonpmFollowupwo,0)*0.20 +isnull(z_NONPM_follow_pm,0)*0.10
))*100 else 0 end as Nonpm_Index,
0 as NONPM_GBActor_Index, nonpm_follow_pm,
abs(((((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100)+
(((isnull(z_NONpmactlabhrs,0)*0.30+isnull(z_NONpmsparecost,0)*0.20+isnull(z_NONpmFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100)+
(abs((isnull(z_PMMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_GBDowntime,0)*0.30))*100)/3) PMO_Index,
GBPARTSCOST,GBDowntime,MTBM,MTTR,b.CMMTBF as MTBF,availablehrs as Available_Hrs,
updated_on as 'year',
 z_PM_count, z_PMlabhrs,z_PMlabcost,z_PMsparecost, z_PMTotal ,abs(z_PMDowntime)z_PMDowntime,  z_PMFollowupwo,
  b.PMMTBF,z_PMMTBF,z_CMsparecost,abs(z_CMDowntime)z_CMDowntime, z_CMFollowupwo, z_CMMTBF,
  z_RM_count,z_RMlabcost,z_RMsparecost, z_RMTotal ,abs(z_RMDowntime)z_RMDowntime, z_RMFollowupwo,b.RMMTBF ,
   z_RMMTBF,abs(z_NONPMDowntime)z_NONPMDowntime, b.NONPMMTBF,
    Z_GBDowntime, z_GBPARTSCOST

 ---------------------------------------------
 /*
select null as [Ax_Asset_id],asset as [CMMS_Asset_ID],siteid,wocount,totallabhrs,totallabcost,totalsparecost,totalcost,
pmactlabhrs,pmlaborcost,pmsparecost,b.pmdowntime, b.cmdowntime, b.rmdowntime, b.NONPMDowntime,
pmtotal,
PM_count,b.pmFollowupwo,
CMactlabhrs,CMlaborcost,CMsparecost,CMTotal,CMFollowupwo,cm_follow_pm, rm_follow_pm, nonpm_follow_pm,

RMactlabhrs,RMlaborcost,RMsparecost,RMTotal,RMFollowupwo,  -----NEW UPDATE---

NONPMactlabhrs,NONPMlaborcost,NONPMsparecost,NONPMTotal,NONPMFollowupwo,

RMMTBF,CMMTBF, PMMTBF, NONPMMTBF,

/*((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20
+isnull(z_PMDowntime,0)*0.20
+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100 PM_Index ,*/

case when (((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20
+isnull(z_PMDowntime,0)*0.20
+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100) > 0 then ((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20
+isnull(z_PMDowntime,0)*0.20
+isnull(z_PMTotal,0)*0.25+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100 else 0 end as PM_Index , -----NEW UPDATE


/*((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100 CM_Index,*/

CASE WHEN (((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100) > 0 THEN 
((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100 ELSE 0 END AS CM_Index, -----NEW UPDATE

/*((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20+isnull(z_rm_follow_pm,0)*0.10))*100 RM_Index,  ---NEW UPDATE---*/

CASE WHEN (((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20+isnull(z_rm_follow_pm,0)*0.10))*100) > 0 THEN ((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20+isnull(z_rm_follow_pm,0)*0.10))*100 ELSE 0 END AS RM_Index,  ---NEW UPDATE---

/*((isnull(z_NONPMactlabhrs,0)*0.30+isnull(z_NONPMsparecost,0)*0.40+isnull(z_NONPMFollowupwo,0)*0.20+isnull(z_nonpm_follow_pm,0)*0.10))*100 NONPM_Index,  ---NEW UPDATE---*/

CASE WHEN (((isnull(z_NONPMactlabhrs,0)*0.30+isnull(z_NONPMsparecost,0)*0.40+isnull(z_NONPMFollowupwo,0)*0.20+isnull(z_nonpm_follow_pm,0)*0.10))*100) > 0 THEN ((isnull(z_NONPMactlabhrs,0)*0.30+isnull(z_NONPMsparecost,0)*0.40+isnull(z_NONPMFollowupwo,0)*0.20+isnull(z_nonpm_follow_pm,0)*0.10))*100 ELSE 0 END AS NONPM_Index,  ---NEW UPDATE---

/*(((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100) +
(abs((isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100) CM_RM_Index,*/

case when (((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +(abs(isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20)) --+isnull(z_Rm_follow_pm,0)*0.10
))*100) > 0 then ((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.40+isnull(z_CMFollowupwo,0)*0.20 +(abs(isnull(z_RMactlabhrs,0)*0.30+isnull(z_RMsparecost,0)*0.40+isnull(z_RMFollowupwo,0)*0.20)) --+isnull(z_Rm_follow_pm,0)*0.10
))*100 else 0 end as RM_CM_Index,

GBPARTSCOST,GBDowntime,

(abs((isnull(z_RMMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_RMDowntime,0)*0.30))*100 RM_GBActor_Index,			---New Update
(abs((isnull(z_PMMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_PMDowntime,0)*0.30))*100 PM_GBActor_Index,			---New Update
(abs((isnull(z_CMMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_CMDowntime,0)*0.30))*100 CM_GBActor_Index,			---New Update
(abs((isnull(z_nonpmMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_nonpmDowntime,0)*0.30))*100 NONPM_GBActor_Index,	

abs(((((isnull(z_PMlabhrs,0)*0.15+isnull(z_PMsparecost,0)*0.20 
+isnull(z_PMDowntime,0)*0.20+isnull(z_PMTotal,0)*0.25 
+isnull(z_PMFollowupwo,0)*0.05+isnull(z_PM_count,0)*0.15))*100)+ 
(((isnull(z_CMactlabhrs,0)*0.30+isnull(z_CMsparecost,0)*0.20+isnull(z_CMFollowupwo,0)*0.20+isnull(z_cm_follow_pm,0)*0.10))*100)+
(abs((isnull(z_PMMTBF,0))*0.25+isnull(z_GBPARTSCOST,0)*0.45+isnull(Z_PMDowntime,0)*0.30))*100)/3) PMO_Index

,availablehrs,CM_count,RM_COUNT,NONPM_COUNT,
MTBM,MTTR,--PM_count,
 z_RMMTBF,z_PMMTBF,z_CMMTBF,z_NONPMMTBF,z_GBPARTSCOST,Z_GBDowntime,

z_PMlabhrs,z_PMlabcost,z_PMsparecost,z_PM_count, z_PMTotal ,z_PMFollowupwo, z_CMactlabhrs, z_CMsparecost,z_CMFollowupwo, z_cm_follow_pm, z_rm_follow_pm, z_nonpm_follow_pm,
z_RMACTlabhrs,z_RMlabcost,z_RMsparecost,z_RM_count, z_RMTotal ,z_RMFollowupwo,
z_NONPMACTlabhrs,z_NONPMlabcost,z_NONPMsparecost,z_NONPM_count, z_NONPMTotal ,z_NONPMFollowupwo,z_PMDowntime,z_CMDowntime,z_RMDowntime,z_NONPMDowntime,
updated_on  
*/
from(

------------------------------------------------------STAGE3------------------------------------------------------------

select a.asset asset,a.siteid siteid,a.dept dept,
a.wocount wocount,a.totallabhrs totallabhrs,a.totallabcost totallabcost,a.totalsparecost totalsparecost,
a.totalcost totalcost,a.pmactlabhrs pmactlabhrs,
pmlaborcost pmlaborcost,pmsparecost pmsparecost,a.pmdowntime pmdowntime,a.cmdowntime,a.rmdowntime, a.NONPMDowntime,
a.pmtotal pmtotal,a.pmFollowupwo pmFollowupwo,
a.CMactlabhrs CMactlabhrs,a.CMlaborcost CMlaborcost,a.CMsparecost CMsparecost,a.CMTotal CMTotal,a.CMFollowupwo CMFollowupwo,
a.cm_follow_pm cm_follow_pm,
a.rm_follow_pm rm_follow_pm,
a.nonpm_follow_pm nonpm_follow_pm,
a.RMactlabhrs RMactlabhrs,a.RMlaborcost RMlaborcost,a.RMsparecost RMsparecost,a.RMTotal RMTotal,a.RMFollowupwo RMFollowupwo,

a.NONPMactlabhrs NONPMactlabhrs,a.NONPMlaborcost NONPMlaborcost,a.NONPMsparecost NONPMsparecost,a.NONPMTotal NONPMTotal,a.NONPMFollowupwo NONPMFollowupwo,

a.RMMTBF RMMTBF,
a.CMMTBF CMMTBF,
a.PMMTBF PMMTBF,
a.NONPMMTBF NONPMMTBF,

a.GBPARTSCOST GBPARTSCOST,a.GBDowntime GBDowntime,a.availablehrs,
a.CM_count,a.NONPM_count, 
a.MTBM,a.MTTR,a.PM_count,a.RM_count ,

max(a.pmactlabhrs)over()maxa,min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini,
(a.pmactlabhrs-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over())/(max(a.pmactlabhrs)over()-min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over() ) z_PMlabhrs ,
 max(a.pmlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini1,
(a.pmlaborcost-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over())/(max(a.pmlaborcost)over()-min(case when a.pmlaborcost>0 then a.pmlaborcost end)over() ) z_PMlabcost,
max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini2,
(a.pmsparecost-min(case when a.pmsparecost>0 then a.pmsparecost end)over())/(max(a.pmsparecost)over()-min(case when a.pmsparecost>0 then a.pmsparecost end)over() ) z_PMsparecost ,
max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini18,
(a.PM_count-min(case when a.PM_count>0 then a.PM_count end)over())/(max(a.PM_count)over()-min(case when a.PM_count>0 then a.PM_count end)over() ) z_PM_count,
--0 z_PM_count,
--max(a.pmdowntime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
 (a.pmdowntime-min(case when a.pmdowntime>0 then a.pmdowntime end)over())/(max(a.pmdowntime)over()-min(case when a.pmdowntime>0 then a.pmdowntime end)over() ) z_PMDowntime ,
max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini4,
(a.pmtotal-min(case when a.pmtotal>0 then a.pmtotal end)over())/(max(a.pmtotal)over()-min(case when a.pmtotal>0 then a.pmtotal end)over() ) z_PMTotal ,
max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini5,
convert(decimal(16,6),(a.pmFollowupwo-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())/nullif((max(a.pmFollowupwo)over()-min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()),(max(a.pmFollowupwo)over()-min (case when a.pmFollowupwo>0 then a.pmFollowupwo end)over())) ) z_PMFollowupwo ,
--0 z_PMFollowupwo,



max(a.CMactlabhrs)over()maxa6,min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over()mini6,
(a.CMactlabhrs-min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over())/nullif((max(a.CMactlabhrs)over()-min(case when a.CMactlabhrs>0 then a.CMactlabhrs end)over() ),0) z_CMactlabhrs,





max(a.CMsparecost)over()maxa7,min(case when a.CMsparecost>0 then a.CMsparecost end)over()mini7,
(a.CMsparecost-min(case when a.CMsparecost>0 then a.CMsparecost end)over())/(max(a.CMsparecost)over()-min(case when a.CMsparecost>0 then a.CMsparecost end)over() ) z_CMsparecost,
 max(a.CMFollowupwo)over()maxa8,min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over()mini8,
convert(decimal(16,6),(a.CMFollowupwo-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over())/nullif((max(a.CMFollowupwo)over()-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over()),(max(a.CMFollowupwo)over()-min(case when a.CMFollowupwo>0 then a.CMFollowupwo end)over())) ) z_CMFollowupwo ,

max(a.cm_follow_pm)over()maxa9,min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()mini9,
(a.cm_follow_pm-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())/nullif((max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over()),(max(a.cm_follow_pm)over()-min(case when a.cm_follow_pm>0 then a.cm_follow_pm end)over())) z_cm_follow_pm ,

(a.Cmdowntime-min(case when a.Cmdowntime>0 then a.Cmdowntime end)over())/(max(a.Cmdowntime)over()-min(case when a.Cmdowntime>0 then a.Cmdowntime end)over() ) z_CMDowntime ,

---------NEW UPDATE - RM---
--max(a.pmactlabhrs)over()maxa,min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini13,
(a.RMactlabhrs-min(case when a.RMactlabhrs>0 then a.RMactlabhrs end)over())/(max(a.RMactlabhrs)over()-min(case when a.RMactlabhrs>0 then a.RMactlabhrs end)over() ) z_RMactlabhrs,
--max(a.RMlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini14,
(a.Rmlaborcost-min(case when a.Rmlaborcost>0 then a.Rmlaborcost end)over())/(max(a.Rmlaborcost)over()-min(case when a.Rmlaborcost>0 then a.Rmlaborcost end)over() ) z_RMlabcost,
--max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini15,
(a.Rmsparecost-min(case when a.Rmsparecost>0 then a.Rmsparecost end)over())/(max(a.Rmsparecost)over()-min(case when a.Rmsparecost>0 then a.Rmsparecost end)over() ) z_RMsparecost ,
--max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini16,
(a.RM_count-min(case when a.RM_count>0 then a.RM_count end)over())/(max(a.RM_count)over()-min(case when a.RM_count>0 then a.RM_count end)over() ) z_RM_count,
--0 z_PM_count, 
--max(a.pmdowntime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
cast((a.Rmdowntime-min(case when a.Rmdowntime>0 then a.Rmdowntime end)over()) as float)/cast((max(a.Rmdowntime)over()-min(case when a.Rmdowntime>0 then a.Rmdowntime end)over() ) as float) z_RMDowntime ,
--max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini17,
(a.Rmtotal-min(case when a.Rmtotal>0 then a.Rmtotal end)over())/(max(a.Rmtotal)over()-min(case when a.Rmtotal>0 then a.Rmtotal end)over() ) z_RMTotal ,
--max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini18,
convert(decimal(16,6),(a.RmFollowupwo-min(case when a.RmFollowupwo>0 then a.RmFollowupwo end)over())/nullif((max(a.RmFollowupwo)over()-min(case when a.RmFollowupwo>0 then a.RmFollowupwo end)over()),(max(a.RmFollowupwo)over()-min (case when a.RmFollowupwo>0 then a.RmFollowupwo end)over())) ) z_RMFollowupwo ,
--0 z_PMFollowupwo,
(a.rm_follow_pm-min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over())/nullif((max(a.rm_follow_pm)over()-min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over()),(max(a.rm_follow_pm)over()-min(case when a.rm_follow_pm>0 then a.rm_follow_pm end)over())) z_rm_follow_pm,

----new update--NONPM--


--max(a.pmactlabhrs)over()maxa,min(case when a.pmactlabhrs>0 then a.pmactlabhrs end)over()mini13,
(a.NONPMactlabhrs-min(case when a.NONPMactlabhrs>0 then a.NONPMactlabhrs end)over())/(max(a.NONPMactlabhrs)over()-min(case when a.NONPMactlabhrs>0 then a.NONPMactlabhrs end)over() ) z_NONPMactlabhrs,
--max(a.RMlaborcost)over()maxa1,min(case when a.pmlaborcost>0 then a.pmlaborcost end)over()mini14,
(a.NONPMlaborcost-min(case when a.NONPMlaborcost>0 then a.NONPMlaborcost end)over())/(max(a.NONPMlaborcost)over()-min(case when a.NONPMlaborcost>0 then a.NONPMlaborcost end)over() ) z_NONPMlabcost,
--max(a.pmsparecost)over()maxa2,min(case when a.pmsparecost>0 then a.pmsparecost end)over()mini15,
(a.NONPMsparecost-min(case when a.Rmsparecost>0 then a.NONPMsparecost end)over())/(max(a.NONPMsparecost)over()-min(case when a.NONPMsparecost>0 then a.NONPMsparecost end)over() ) z_NONPMsparecost ,
--max(a.PM_count)over()maxa18,min(case when a.PM_count>0 then a.PM_count end)over()mini16,
(a.NONPM_count-min(case when a.NONPM_count>0 then a.NONPM_count end)over())/(max(a.NONPM_count)over()-min(case when a.NONPM_count>0 then a.NONPM_count end)over() ) z_NONPM_count,
--0 z_PM_count, 
--max(a.pmdowntime)over()maxa3,min(case when a.pmdowntime>0 then a.pmdowntime end)over()mini3,
(a.NONPMdowntime-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over())/(max(a.NONPMdowntime)over()-min(case when a.NONPMdowntime>0 then a.NONPMdowntime end)over() ) z_NONPMDowntime ,
--max(a.pmtotal)over()maxa4,min(case when a.pmtotal>0 then a.pmtotal end)over()mini17,
(a.NONPMtotal-min(case when a.NONPMtotal>0 then a.NONPMtotal end)over())/(max(a.NONPMtotal)over()-min(case when a.NONPMtotal>0 then a.Rmtotal end)over() ) z_NONPMTotal ,
--max(a.pmFollowupwo)over()maxa5,min(case when a.pmFollowupwo>0 then a.pmFollowupwo end)over()mini18,
convert(decimal(16,6),(a.NONPMFollowupwo-min(case when a.NONPMFollowupwo>0 then a.NONPMFollowupwo end)over())/nullif((max(a.NONPMFollowupwo)over()-min(case when a.NONPMFollowupwo>0 then a.NONPMFollowupwo end)over()),(max(a.NONPMFollowupwo)over()-min (case when a.NONPMFollowupwo>0 then a.NONPMFollowupwo end)over())) ) z_NONPMFollowupwo ,
--0 z_PMFollowupwo,

(a.nonpm_follow_pm-min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over())/nullif((max(a.nonpm_follow_pm)over()-min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over()),(max(a.nonpm_follow_pm)over()-min(case when a.nonpm_follow_pm>0 then a.nonpm_follow_pm end)over())) z_nonpm_follow_pm ,
--------------

--max(a.mtbf)over()maxa10,min(case when a.mtbf>0 then a.mtbf end)over()mini10,
cast((max(a.RMmtbf)over() - a.RMMTBF) as float)/cast((max(a.RMMTBF)over()-min(case when a.RMMTBF>0 then a.RMMTBF end)over() ) as float) z_RMMTBF, -----New Update
cast((max(a.PMmtbf)over() - a.PMMTBF)as float)/cast((max(a.PMMTBF)over()-min(case when a.PMMTBF>0 then a.PMMTBF end)over() ) as float)z_PMMTBF, -----New Update
cast((max(a.CMmtbf)over() - a.CMMTBF) as float)/cast((max(a.CMMTBF)over()-min(case when a.CMMTBF>0 then a.CMMTBF end)over() ) as float) z_CMMTBF, -----New Update
cast((max(a.NONPMmtbf)over() - a.NONPMMTBF) as float)/cast((max(a.NONPMMTBF)over()-min(case when a.NONPMMTBF>0 then a.NONPMMTBF end)over() )as float) z_NONPMMTBF, -----New Update

max(a.GBPARTSCOST)over()maxa11,min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over()mini11,
(a.GBPARTSCOST-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over())/(max(a.GBPARTSCOST)over()-min(case when a.GBPARTSCOST>0 then a.GBPARTSCOST end)over() ) z_GBPARTSCOST,
max(a.GBDowntime)over()maxa12,min(case when a.GBDowntime>0 then a.GBDowntime end)over()mini12,
(a.GBDowntime-min(case when a.GBDowntime>0 then a.GBDowntime end)over())/nullif((max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() ),(max(a.GBDowntime)over()-min(case when a.GBDowntime>0 then a.GBDowntime end)over() )) Z_GBDowntime,
a.year updated_on


from(select q.*--(select downtime from [dbo].[Downtime_Data] j where j.assetnum=q.asset) pmdowntime 
from(

---------------------------------STAGE2-------------------------

select i.asset,i.siteid,i.dept,
sum(wocount)wocount,Sum(totallabhrs)totallabhrs,sum(totallabcost)totallabcost,sum(totalsparecost)totalsparecost,
sum(totalcost)totalcost,
sum(pmactlabhrs)pmactlabhrs,sum(pmlaborcost)pmlaborcost,sum(pmsparecost)pmsparecost,
sum(pmtotal)pmtotal,sum(pmFollowupwo)pmFollowupwo,
sum(CMactlabhrs)CMactlabhrs,sum(CMlaborcost)CMlaborcost,sum(CMsparecost)CMsparecost,sum(CMTotal)CMTotal,sum(CMFollowupwo)CMFollowupwo,

--sum(cm_follow_pm)cm_follow_pm, 
(select sum(cm_follow_pm) from [dbo].[CM_follow_pm] bdm where i.asset=bdm.assetnum) cm_follow_pm,
(select sum(rm_follow_pm) from [dbo].rm_follow_pm bdm where i.asset=bdm.assetnum) rm_follow_pm,
(select sum(nonpm_follow_pm) from [dbo].nonpm_follow_pm bdm where i.asset=bdm.assetnum) nonpm_follow_pm,

sum(RMactlabhrs)RMactlabhrs,sum(RMlaborcost)RMlaborcost,sum(RMsparecost)RMsparecost,sum(RMTotal)RMTotal,sum(RMFollowupwo)RMFollowupwo,  ----NEW UPDATE

SUM(CMDowntime)CMDowntime,  ----NEW UPDATE
SUM(PMDowntime)PMDowntime,  ----NEW UPDATE
SUM(RMDowntime)RMDowntime,  ----NEW UPDATE
sum(NonpmDowntime) NonpmDowntime, -----New UPDATE 
sum(NONPMactlabhrs)NONPMactlabhrs,sum(NONPMlaborcost)NONPMlaborcost,sum(NONPMsparecost)NONPMsparecost,sum(NONPMTotal)NONPMTotal,sum(NONPMFollowupwo)NONPMFollowupwo,  ----NEW UPDATE
--( isnull((sum(availablehrs) - SUM(GBDowntime))/nullif(sum(CM_count),0),sum(availablehrs)))/60 mtbf,
--(sum(availablehrs)/ case when sum(RM_count)=0 then 1 else sum(RM_count) end )  MTBF,    --////new update

--case when (cast((sum(availablehrs) - (SUM(CMDowntime)/60))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count)  end ) as float)) > 0 then cast((sum(availablehrs) - (SUM(CMDowntime)/60))as float)/ cast((case when (sum(RM_count))=0 then 1 else sum(RM_count)  end ) as float) else 0 end as CMMTBF, 
isnull((sum(availablehrs))/nullif((sum(NON_PM)/3),0),sum(availablehrs)) CMMTBF,
0 as RMMTBF, 
0 as PMMTBF,
0 as NONPMMTBF,

--(sum(availablehrs)/ case when sum(CM_count)=0 then 1 else sum(CM_count) end )  MTBF_CM,
--(sum(availablehrs)/ case when (sum(RM_count) + SUM(CM_count))=0 then 1 else (sum(RM_count) + SUM(CM_count)) end )  MTBF_RM_CM,

sum(GBPARTSCOST)GBPARTSCOST,sum(GBDowntime)GBDowntime,year,
sum(PM_count)PM_count,sum(CM_count)CM_count,
sum(NON_PM)NONPM_count,
sum(availablehrs)availablehrs,
cast(sum(availablehrs)as float)/ cast((case when (sum(wocount)/3)=0 then 1 else sum(wocount)/3 end )as float) MTBM,  --////new update
--(sum(availablehrs)/nullif(sum(wocount),0))/60 MTBM,
cast(SUM(NonpmDowntime) as float)/ cast(sum(CM_count) as float) MTTR,       --////new update

sum(RM_count) RM_count,
sum(PRJ_count) PRJ_count,
sum(OTH_count) OTH_count,
SUM(ADM_COUNT) ADM_COUNT 

from
(
------------------------------------STAGE1----------------------------

select aa.[ASSETNUM] as asset,--left(aa.[SITEID],3) 
aa.[SITEID] as siteid ,-- left( aa.location,5) 
null as [Dept] ,
aa.[LOCATION] as location,
count(case when  w.Dev_worktype in('PM','CM','RM') then w.[WONUM] end)wocount,
count(case when  w.Dev_worktype in('RM','CM') then w.[WONUM] end)mtbm_wocount,
--COUNT(w.[WONUM])wocount,
sum(case when  w.Dev_worktype in('PM','CM','RM') then w.[ACTLABHRS] end) totallabhrs,
sum(case when  w.Dev_worktype in('PM','CM','RM') then w.[ACTLABCOST] end)totallabcost,
sum(case when  w.Dev_worktype in('PM','CM','RM') then w.[ACTMATCOST] end)totalsparecost,
sum(isnull(case when  w.Dev_worktype in('PM','CM','RM') then w.[ACTMATCOST] end,0))+sum(isnull(case when  w.Dev_worktype in('PM','CM','RM') then w.[ACTLABCOST] end,0))totalcost,
sum(case when w.Dev_worktype in('PM') then w.[ACTLABHRS] end) pmactlabhrs ,
sum(case when w.Dev_worktype in('PM') then w.[ACTLABCOST] end) pmlaborcost ,
sum(case when W.Dev_worktype in('PM') then w.[ACTMATCOST] end) pmsparecost,
count(case when w.Dev_worktype in('PM') then w.[WONUM] end) PM_count,
count(case when w.Dev_worktype in('CM') then w.[WONUM] end) CM_count,
count(case when w.Dev_worktype in('CM','RM') then w.[WONUM] end) NON_PM ,

count(case when w.Dev_worktype='RM' then w. [WONUM]end) RM_count,
count(case when w.Dev_worktype='PRJ' then w. [WONUM]end) PRJ_count,
count(case when w.Dev_worktype='OTH' then w. [WONUM]end) OTH_count,
count(case when w.Dev_worktype='ADM' then w. [WONUM]end) ADM_count,

--(select sum(availablehrs) from location_meter_reading lm where left(aa.location,4)=lm.location) availablehrs,
2096 availablehrs, 
--j.Downtime pmdowntime,

sum(W.CMDowntime) as CMDowntime , 
sum(W.PMDowntime) as PMDowntime ,
sum( W.RMDowntime) as RMDowntime,
sum(w.CMDowntime)+sum(w.RMDowntime) as NonpmDowntime,

(sum(case when w.Dev_worktype in('PM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype in('PM') then isnull(w.[ACTMATCOST],0) end) )pmTotal,
--sum(case when w.Dev_worktype in('PM') then r.[RELATEDRECKEY] end) 
0 pmFollowupwo,

sum(case when w.Dev_worktype in('CM') then w.[ACTLABHRS] end) CMactlabhrs , --NONpmactlabhrs
sum(case when w.Dev_worktype in('CM') then w.[ACTLABCOST] end) CMlaborcost ,  --NONpmlaborcost
sum(case when w.Dev_worktype in('CM') then w.[ACTMATCOST] end) CMsparecost,  ----NONpmsparecost


sum(case when w.Dev_worktype in('RM') then w.[ACTLABHRS] end) RMactlabhrs , --NONpmactlabhrs
sum(case when w.Dev_worktype in('RM') then w.[ACTLABCOST] end) RMlaborcost ,  --NONpmlaborcost
sum(case when w.Dev_worktype in('RM') then w.[ACTMATCOST] end) RMsparecost,  ----NONpmsparecost

--new update-----
sum(case when w.Dev_worktype in('RM','CM') then w.[ACTLABHRS] end) NONpmactlabhrs,
sum(case when w.Dev_worktype in('RM','CM') then w.[ACTLABCOST] end) NONpmlaborcost,
sum(case when w.Dev_worktype in('RM','CM') then w.[ACTMATCOST] end) NONpmsparecost,

(sum(case when w.Dev_worktype in('CM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype in('CM') then isnull(w.[ACTMATCOST],0) end) )CMTotal,
--count(case when w.Dev_worktype in('CM') then r.[RELATEDRECKEY] end) 
0 CMFollowupwo,

(sum(case when w.Dev_worktype in('RM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype in('RM') then isnull(w.[ACTMATCOST],0) end) )RMTotal,
--count(case when w.Dev_worktype in('RM') then r.[RELATEDRECKEY] end) 
0 RMFollowupwo,


(sum(case when w.Dev_worktype in('RM','CM') then isnull(w.[ACTLABCOST],0) end) + sum(case when w.Dev_worktype in('RM','CM') then isnull(w.[ACTMATCOST],0) end) )NONPMTotal,
--count(case when w.Dev_worktype in('RM','CM') then r.[RELATEDRECKEY] end)  
0 NONPMFollowupwo,

--sum(case when Dev_worktype='BDM' and lag(Dev_worktype) over(partition by aa.Assetnum order by REPORTDATE desc)='PM' then 1 end)  as
0 cm_follow_pm,
0 rm_follow_pm,
0 nonpm_follow_pm,

count(case when w.Dev_worktype in('CM') then w.[WONUM] end) CMWO,
--count(case when w.Dev_worktype in('RM','CM') then w.[WONUM] end) NONPMWO,
sum(case when w.Dev_worktype in('RM') then w.[ACTMATCOST] end) GBPARTSCOST,
sum(case when w.Dev_worktype in('RM') then W.[DOWNTIME]/60 end)GBDowntime,
'28-Feb-2022' as year

from [dbo].[AX_Asset_Master] aa
left join (select w.* /*, CASE WHEN w.[WORKTYPE] in('02') and w.jpnum is not null then 'PM'
	when w.[WORKTYPE] in('01') then 'CM' 
	when w.[WORKTYPE] in('00') then 'RM' 
	--when w.[WORKTYPE] in('ADM') then 'ADM' 
	--when w.[WORKTYPE] in('MM','EP','CP') then 'PRJ' 
	else 'OTH' end 'Dev_worktype' */ from [dbo].[Client_Workorder] w)
 w on aa.assetnum=w.assetnum --and  w.actfinish>='2020-09-01' and w.actfinish<='2021-08-31'  --and w.STATUS='CLOSE' --and w.Year='30-Nov-2020'
--left join [dbo].[Downtime_Data]  j on j.assetnum=aa.ASSETNUM
--left join (select distinct RECORDKEY,RELATETYPE,count(distinct case when r.relatetype='FOLLOWUP' then r.relatedreckey end)RELATEDRECKEY
--from [dbo].[Relatedrecord_Data] r where RELATETYPE='FOLLOWUP' --and year='30-Dec-2020' 
--group by RECORDKEY,RELATETYPE ) r on r.RECORDKEY=w.wonum
--left join cm_follow_pm cm on w.assetnum=cm.assetnum

--where aa.statusid IN('ACTIVE','OPERATING') 
--and w.REPORTDATE>='2020-03-01' and w.REPORTDATE<='2021-03-31' and w.STATUS='CLOSE'--and aa.year='30-Dec-2020' --and w.REPORTDATE>='2019-07-01' and w.REPRTDATE<='2020-03-31' --and w.wonum='M21870910'
group by aa.[ASSETNUM] ,aa.[SITEID] ,aa.[LOCATION] 

---------------------------STAGE1-------------------------

)i

group by  i.asset,i.siteid,i.year,i.dept

------------------------STAGE2-----------------------
)q

)a --where a.asset='10166'
group by a.asset ,a.siteid ,a.dept ,
a.wocount ,a.totallabhrs ,a.totallabcost ,a.totalsparecost ,
a.totalcost ,a.pmactlabhrs ,
pmlaborcost ,pmsparecost ,a.pmdowntime,a.cmdowntime,a.rmdowntime, a.NONPMDowntime,
a.pmtotal ,a.pmFollowupwo , 
a.CMactlabhrs ,a.CMlaborcost ,a.CMsparecost ,a.CMTotal ,a.CMFollowupwo ,
a.cm_follow_pm , a.rm_follow_pm , a.nonpm_follow_pm ,
a.RMactlabhrs ,a.RMlaborcost ,a.RMsparecost ,a.RMTotal ,a.RMFollowupwo ,  --NEW UPDATE--
a.NONPMactlabhrs ,a.NONPMlaborcost ,a.NONPMsparecost ,a.NONPMTotal ,a.NONPMFollowupwo ,
a.RMmtbf ,a.PMmtbf,a.CMmtbf,a.NONPMMTBF,a.GBPARTSCOST ,a.GBDowntime ,a.availablehrs,
a.CM_count,a.NONPM_count,
a.MTBM,a.MTTR,a.PM_count,RM_count,a.year

--------------------------STAGE3---------------------

)b  
)V
  

  

  drop table [dbo].[AX_Asset_Metric_Facts_July]

  select * from [dbo].[CORDOVA_WORKORDER TABLE]
  where status='close' and actfinish>='2020-07-01' and actfinish<='2021-06-30'


  select * from [dbo].[AX_Asset_Master]

  select * from [dbo].[AX_Asset_Metric_Facts1]

------------------------ASSET-View-[bdm_follow_pm]----------------------

 CREATE view [dbo].[NONPM_follow_pm] as

select assetnum,sum(flag) NONPM_follow_pm from(
select a.*,lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc) lag,
case when ax_work_type IN('CM','RM') and lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc)='PM' then 1 end flag from(

--select w.*, case when w.reportedby='MAXADMIN' and w.worktype='PM' and w.jpnum is not null then 'PM'
-- when  w.worktype='CM' then 'CM' else 'NONPM' end 'ax_work_type' from [dbo].[Client_Workorder] w
  select w.*, case when w.reportedby='HIP-SITEADMIN' and w.[WORKTYPE] in('PM','CM','VM','CAL') and w.jpnum is not null then 'PM'
when w.[WORKTYPE] in('CR','RS','NCR') then 'CM' 
when w.[WORKTYPE] in('ER') then 'RM' 
when w.[WORKTYPE] in('ADM') then 'ADM' 
when w.[WORKTYPE] in('MM','EP','CP') then 'PRJ' 
else 'OTH' end 'ax_work_type'  from [dbo].[Client_Workorder] W
 -- where --w.REPORTDATE>='2020-01-01' and w.REPORTDATE<'2020-04-01'  and w.WO_STATUS='CLOSE' and w.year='31-Dec-2020'
   )a --where assetnum='A100838' 
   )s group by assetnum 


-----------Segment-View-[bdm_follow_pm]---------------
SELECT * FROM [NONPM_follow_pm_family]

ALTER view [dbo].[NONPM_follow_pm_family] as
   
   select sum(a.NONPm_follow_pm) NONPm_follow_pm,CONCAT(b.[AssetClass],'-',b.[MANUFACTURERID],'-',b.[MakeModel])Family from
(select assetnum,sum(flag) NONPm_follow_pm from(
select a.*,lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc) lag,
case when ax_work_type IN('RM','cm') and lag(ax_work_type) over(partition by Assetnum order by REPORTDATE desc)='PM' then 1 end flag from(

select w.*, case when w.reportedby='HIP-SITEADMIN' and w.[WORKTYPE] in('PM','CM','VM','CAL') and w.jpnum is not null then 'PM'
when w.[WORKTYPE] in('CR','RS','NCR') then 'CM' 
when w.[WORKTYPE] in('ER') then 'RM' 
when w.[WORKTYPE] in('ADM') then 'ADM' 
when w.[WORKTYPE] in('MM','EP','CP') then 'PRJ' 
else 'OTH' end 'ax_work_type'  from [dbo].[Client_Workorder] W

   )a --where assetnum='A100838' 
   )s group by assetnum 
   
   )a
   join
(select * from [dbo].[Asset_Master] where statusid IN('ACTIVE','OPERATING'))b
on b.assetnum=a.assetnum
group by CONCAT(b.[AssetClass],'-',b.[MANUFACTURERID],'-',b.[MakeModel]) 




----------------Segment_object-----

insert into [Segment_Objects_V1](assetnum,family_id)



select * into [Segment_Objects_V1] from
(
select aa.assetnum,s. from [dbo].[AX_Asset_Master] aa
left join [dbo].[AX_Segment_Metric_Facts1] s
on CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURER],'-',aa.[MakeModel])= s.Asset_Master_Group_Details_Desc
--where aa.StatusId in('OPERATING','ACTIVE')
--where not exists(select Asset_Master_Group_Details_ID from [dbo].[AX_Segment_Metric_Facts]  so where so.Asset_Master_Group_Details_ID=s.Asset_Master_Group_Details_ID)
)a



-------


select wonum,case when ax_worktype='CM' then (case when datediff(hour,coalesce(schedstart,targstartdate,reportdate),ACTFINISH) > 0 
	then datediff(hour,coalesce(schedstart,targstartdate,reportdate),ACTFINISH) else 0 end) end as CM_duration , 
	case when ax_worktype='PM' then (case when (case when datediff(hour,schedstart,schedfinish) > datediff(hour,actstart,actfinish)
							
		then datediff(hour,schedstart,schedfinish) else datediff(hour,actstart,actfinish) end) > 0 
									then (case when datediff(hour,schedstart,schedfinish) > datediff(hour,actstart,actfinish)
										then datediff(hour,schedstart,schedfinish) else datediff(hour,actstart,actfinish) end)
									else 0 end) end as PM_duration ,
	case when ax_worktype='RM' then datediff(hour,reportdate,ACTFINISH) end as RM_duration 
from [dbo].[Client_Workorder]
order by 2 desc



----Min-------


select wonum,case when ax_worktype='CM' then (case when datediff(MINUTE,coalesce(schedstart,targstartdate,reportdate),ACTFINISH) > 0 
	then datediff(MINUTE,coalesce(schedstart,targstartdate,reportdate),ACTFINISH) else 0 end) end as CM_duration , 
	case when ax_worktype='PM' then (case when (case when datediff(MINUTE,schedstart,schedfinish) > datediff(MINUTE,actstart,actfinish)
							
		then datediff(MINUTE,schedstart,schedfinish) else datediff(MINUTE,actstart,actfinish) end) > 0 
									then (case when datediff(MINUTE,schedstart,schedfinish) > datediff(MINUTE,actstart,actfinish)
										then datediff(MINUTE,schedstart,schedfinish) else datediff(MINUTE,actstart,actfinish) end)
									else 0 end) end as PM_duration ,
	case when ax_worktype='RM' then datediff(MINUTE,reportdate,ACTFINISH) end as RM_duration 
from [dbo].[Client_Workorder] 




















s

select * into [Segment_Objects] 
from [Honda_Repository].dbo.[Segment_Objects]
 where 1=2

 select * from [Segment_Objects]
---------

insert into [Segment_Objects]
select [assetnum]
      ,[SegmentMasterID]
      --,getdate() [Updated_On]
      --,getdate() [Inserted_On]
      ,'2022-02-01' [Effective_Startdate]
      ,'9999-12-31'[Effective_Enddate]
      ,'Y' [Effective_Currentflag]
      ,'BI Team' [Updated_BY]
	  ,getdate() [Updated_On]
      ,'BI Team' [Inserted_By]
	  ,getdate() [Inserted_On]
      --,'Santa Monica Dataset'[Siteid]
      --,null [Orgid]
from [dbo].[AX_Asset_Master] aa
left join [dbo].[AX_Segment_Metric_Facts] s
on CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURER],'-',aa.[MakeModel])= s.[SegmentMasterDescription]
where aa.StatusId in('ACTIVE')
--where not exists(select Asset_Master_Group_Details_ID from [dbo].[AX_Segment_Metric_Facts]  so where so.Asset_Master_Group_Details_ID=s.Asset_Master_Group_Details_ID)
)a







-------------Testing------

select distinct aa.assetnum from [AX_Asset_Master] aa
left join [CORDOVA_WORKORDER TABLE] w
on w.assetnum=aa.assetnum 
where w.REPORTDATE>='2020-03-01' and w.REPORTDATE<'2021-04-01' and --w.STATUS='CLOSE'
w.STATUS='CLOSE'
and 
w.ax_worktype in('PM','CM','RM') and aa.statusid IN('ACTIVE','OPERATING')
order by 2 desc

-----------
select * from [dbo].[workorder]
where worktype='PM'
 and ax_worktype='CM'




 select count(*) from [CORDOVA_WORKORDER TABLE] w
 where w.REPORTDATE>='2020-03-01' and w.REPORTDATE<='2021-03-31' and w.STATUS='CLOSE'


 select * from [dbo].[AX_Asset_Master]

 select sum(nonpmfollowupwo) from [dbo].[AX_Asset_Metric_Facts]

select sum(nonpmfollowupwo) from [dbo].[AX_Segment_Metric_Facts]



select * from [dbo].[AX_Asset_Saving] 

select * from [dbo].[Segment_Objects]

select * from 

select * into [Cordova_Repository_1].[dbo].[CORDOVA_WORKORDER TABLE]
from [dbo].[CORDOVA_WORKORDER TABLE]


select * into [Cordova_Repository_1].[dbo].[AX_Asset_Saving]
from [dbo].[AX_Asset_Saving]



where year='28-FEB-2021'

select distinct CONCAT(aa.[ASSETCLASS],'-',aa.[MANUFACTURERID],'-',aa.[makemodel]) from [dbo].[AX_Asset_Master] aa


select * from [dbo].[AX_Asset_Metric_Facts]

select distinct count(aa.assetnum), 
CONCAT(aa.[ASSETCLASS],'-',aa.[MANUFACTURERID],'-',aa.[makemodel]) as Family
from [dbo].[AX_Asset_Master] aa
where  
 aa.StatusId in ('ACTIVE','OPERATING')
group by CONCAT(aa.[ASSETCLASS],'-',aa.[MANUFACTURERID],'-',aa.[makemodel])



select --distinct aa.assetnum,--count(wonum), 
distinct CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel]) as Family
from [dbo].[AX_Asset_Master] aa
 --left join [dbo].[CORDOVA_WORKORDER TABLE] c
--on aa.assetnum=c.assetnum
where aa.StatusId in ('ACTIVE','OPERATING')
--------and c.ax_worktype in('PM','CM',)
 and c.STATUS='CLOSE' and c.REPORTDATE>='2020-03-01' and c.REPORTDATE<='2021-03-31' 
group by CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERID],'-',aa.[MakeModel])




----------
Update s
  set s.Family_id=m.Asset_Master_Group_Details_id
  from [dbo].[AX_Asset_Saving] as s 
  left join[Cordova_Repository_1].[dbo].AX_Segment_Metric_Facts as m 
 on s.Asset_Family=m.Asset_Master_Group_Details_Desc





--
