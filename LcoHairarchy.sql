select * from [dbo].[Asset Analytix Locations table] where Parent='MC0078'
and Site='DAF'



CREATE INDEX idx_Location
ON [Analytix Locations_1] (Site, Location)


Select site,location,parent into  [Analytix Locations_1] from[dbo].[Asset Analytix Locations table]

