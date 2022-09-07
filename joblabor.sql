select * into [Lily_Repository].[dbo].[Client_JOBLABOR_Null]
from [Honda_PMO_Asset].[dbo].[Client_JOBLABOR_Feb2022]
where 1=2

select * from [Honda_PMO_Asset].[dbo].[Client_JOBLABOR_Feb2022]
select  * from [Lily_Repository].[dbo].[Client_JOBLABOR_PRD] ------where [jpnum]='10951'

truncate table [Lily_Repository].[dbo].[Client_JOBLABOR_Null]
insert into [Lily_Repository].[dbo].[Client_JOBLABOR_Null]
	SELECT distinct jl.[JPNUM][JPNUM]
		  ,null[LABORCODE]
		  ,sum(jl.[laborhrs_text (hours:minutes)])[LABORHRS]
		  ,null[JL1]
		  ,null[JL2]
		  ,null[JL3]
		  ,null[JL4]
		  ,null[JL5]
		  ,null[JL6]
		  ,null[VENDOR]
		  ,null[JL7]
		  ,null[JL8]
		  ,null[JL9]
		  ,jl.[orgid][ORGID]
		  ,jl.[siteid][SITEID]
		  ,null [JPTASK]
		 -- ,null [JOBLABORID]
		  ,p.jobplanid [JOBPLANID]
		  ,jl.[craft][CRAFT]
		  ,null[SKILLLEVEL]
		  ,null[CONTRACTNUM]
		  ,jl.[quantity][QUANTITY]
		  ,null[ROWSTAMP]
		  ,null[CONDITIONNUM]
		  ,null[PLUSCJPREVNUM]
		  ,null[AMCREW]
		  ,null[AMCREWTYPE]
		  ,null[CREWWORKGROUP]
		  ,null[APPTREQUIRED]
	 -- select -- * --,cast([laborhrs_text (hours:minutes)] as float)-- jpnum ,craft,quantity,sum([laborhrs_text (hours:minutes)])labhrsfrom [dbo].[Asset Analytix Job Plan Labor table_Null_site] jl  join [Lily_Repository].dbo.Client_JOBplan_null p on jl.jpnum=p.JPNUMwhere  jl.status='ACTIVE' and jl.siteid is nullgroup by jl.[JPNUM],jl.[orgid],jl.[siteid],jl.[craft],jl.[quantity],p.jobplanid
select * from [Lily_Repository].[dbo].[Client_JOBLABOR_Null]



select -- * --,cast([laborhrs_text (hours:minutes)] as float) jpnum ,craft,quantity,sum([laborhrs_text (hours:minutes)])labhrsfrom [dbo].[Asset Analytix Job Plan Labor table_Null_site]where jpnum  in (select  jpnum from [Lily_Repository].dbo.Client_JOBplan_null)and status='ACTIVE'group by jpnum ,craft,quantity

	
select * from [Lily_Repository].[dbo].[Client_JOBLABOR_NULL]

select distinct jpnum from [dbo].[Asset Analytix Job Plan Labor table_null_site]
where jpnum in (select JPNUM from [Lily_Repository].[dbo].[Client_JOBPLAN_NULL])
  

 

select * from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table]
select COUNT(JOBPLANID) from [dbo].[Client_JOBPLAN_PRD1]


select * from [Lilly_Straging].[dbo].[dboAsset Analytix Job Plan table]




