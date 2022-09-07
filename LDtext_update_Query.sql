select * from Client_Workorder where wonum='M13249658'

select * from Client_TASK_LongDescription_HCM

--update a
set a.LDTEXT=b.LDTEXT from
  [LILLY_Repository_New].[dbo].[Client_workorder_2204]a
  left join (
select [Work Order] ,site,
string_agg(CONCAT(cast(Date as datetime),'-',summary,'-',[Work Log Long Description (1K Charaters)]),'-')ldtext
from [Lilly_Straging].[dbo].[Asset Analytix WorkOrder WorkLog table all]
--where [work order]='14124676'
group by [Work Order],Site )b
	on a.wonum=b.[Work Order] and a.SITEID=b.Site


