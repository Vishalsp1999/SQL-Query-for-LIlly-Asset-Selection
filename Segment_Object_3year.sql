select * from [LILLY_Repository_New].[dbo].[AX_Segment_Metric_Facts_All]
where siteid='prd' and SegmentMasterDescription='ANAL0001-AGILENT TECHNOLOGIES-6890N'
select * from [dbo].[AX_Segment_Metric_Facts]  where SegmentMasterDescription='ANAL0001-AGILENT TECHNOLOGIES-6890N'

select * from  [dbo].[AX_Segment_Metric_Facts]

CREATE TABLE [dbo].[Segment_Objects](
	[assetnum] [nvarchar](255) NULL,
	[SegmentMasterID] [int] NULL,
	[Effective_Startdate] [varchar](23) NOT NULL,
	[Effective_Enddate] [varchar](23) NOT NULL,
	[Effective_Currentflag] [varchar](1) NOT NULL,
	[Updated_BY] [varchar](7) NOT NULL,
	[Updated_On] [datetime] NOT NULL,
	[Inserted_By] [varchar](7) NOT NULL,
	[Inserted_On] [datetime] NOT NULL,
	[Siteid] [nvarchar](255) NULL
) ON [PRIMARY]



insert into [dbo].[Segment_Objects] 
select aa.assetnum,
s.SegmentMasterID [SegmentMasterID],
'2022-03-01 00:00:00.000' [Effective_Startdate],
'9999-12-31 00:00:00.000' [Effective_Enddate],
'Y' [Effective_Currentflag],
'BI Team' [Updated_BY],
getdate() [Updated_On],
'BI Team' [Inserted_By],
getdate() [Inserted_On],
'DAF' [siteid]
from [dbo].[PMO_3410012_DAF] aa
left join [dbo].[AX_Segment_Metric_Facts] s
on CONCAT(aa.[AssetClass],'-',aa.[MANUFACTURERid],'-',aa.[MakeModel])= s.SegmentMasterDescription and aa.SiteId=s.siteid
where aa.isflag in(1,2) and s.siteid='DAF'--and s.siteid='daf' -----[Effective_Currentflag]='Y'



