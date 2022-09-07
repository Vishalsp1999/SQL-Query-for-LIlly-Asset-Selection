select * from [dbo].[Asset Analytix Locations table] where Parent='MC0078'
and Site='DAF'



CREATE INDEX idx_Location
ON [Analytix Locations_1] (Site, Location)


Select site,location,parent into  [Analytix Locations_1] from[dbo].[Asset Analytix Locations table]

 ;WITH CTE AS    (      select site,location,--DESCRIPTION,	  parent--,       -- CAST(ISNULL(location + '\' ,'')   AS VARCHAR(4000)) AS Hierarchy_path       from [dbo].[Analytix Locations_1]       WHERE  PARENT is  null and site='PRD'      UNION ALL             select t.site,t.location,--t.DESCRIPTION,			 t.PARENT--,            -- CAST(ISNULL(d.Hierarchy_path   ,'')  + t.location AS VARCHAR(4000))       from [dbo].[Analytix Locations_1] t            INNER JOIN CTE  AS d            ON t.PARENT = d.location     )    SELECT  site,location,--DESCRIPTION,	parent --,       --Hierarchy_pathinto [dbo].[Client_Lochierarchy_PRD2]    from CTE cselect * from  Client_Lochierarchy_ALL 