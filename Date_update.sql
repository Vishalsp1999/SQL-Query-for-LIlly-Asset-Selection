
update a
  set a.TARGSTARTDATE= c.TARGSTARTDATE
  -- select  *
  from   [dbo].Client_Workorder a
   join

  (select wonum,siteid,cast(TARGSTARTDATE as nvarchar(max))TARGSTARTDATE from(
  select  wonum,siteid,cast(TARGSTARTDATE as datetime2(7))TARGSTARTDATE from(
  select wonum,siteid,cast(TARGSTARTDATE as datetime)TARGSTARTDATE 
  FROM  Client_Workorder --where SITEID='AEP' and year='30-Jun-2022' 
 
  )a)b)c
  on a.wonum=c.WONUM and a.SITEID=c.SITEID

  TARGSTARTDATE
  TARGCOMPDATE
  SCHEDSTART
  SCHEDFINISH


   Select * FROM  Client_Workorder


