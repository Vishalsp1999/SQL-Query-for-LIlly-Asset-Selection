
--select * from [Cordova_Repository_New].[dbo].[Client_Locations]

--insert into [Cordova_Repository_New].[dbo].[Client_Locations]
--SELECT [location]
--      ,[description]
--      ,[type]
--      ,[controlacc]
--      ,[glaccount]
--      ,[purchvaracc]
--      ,[invoicevaracc]
--      ,[curvaracc]
--      ,[shrinkageacc]
--      ,[invcostadjacc]
--      ,[receiptvaracc]
--      ,[changeby]
--      ,[changedate]
--      ,[disabled]
--      ,[oldcontrolacc]
--      ,[oldshrinkageacc]
--      ,[oldinvcostadjacc]
--      ,[classstructureid]
--      ,[gisparam1]
--      ,[gisparam2]
--      ,[gisparam3]
--      ,[sourcesysid]
--      ,[ownersysid]
--      ,[externalrefid]
--      ,[sendersysid]
--      ,[siteid]
--      ,[orgid]
--      ,[intlabrec]
--      ,[isdefault]
--      ,[shiptoaddresscode]
--      ,[shiptolaborcode]
--      ,[billtoaddresscode]
--      ,[billtolaborcode]
--      ,[status]
--      ,[serviceaddresscode]
--      ,[locationsid]
--      ,[useinpopr]
--      ,[toolcontrolacc]
--      ,[langcode]
--      ,[hasld]
--      ,[autowogen]
--      ,[statusdate]
--      ,[zmfacilitycode]
--      ,[zmstructure]
--      ,[zmprodwc]
--      ,[zmshiptoaddr]
--      ,[zmshiptodest]
--      ,[zmggsmreqstr]
--      ,[row_insert_datetime]
--      ,[row_update_datetime]
--      ,[servername]
--      ,[databasename]
--      ,[origcode]
--      ,[DataCode]
--      ,[INVOWNER]
--      ,[ISREPAIRFACILITY]
--      ,[PLUSCDUEDATE]
--      ,[PLUSCLOOP]
--      ,[PLUSCPMEXTDATE]
--      ,[SADDRESSCODE]
--      ,[bimimportsrc]
--      ,[bimroomname]
--      ,[bimusage]
--      ,[estendoflife]
--      ,[expectedlife]
--      ,[expectedlifedate]
--      ,[health]
--      ,[installdate]
--      ,[modelid]
--      ,[replacecost]
--      ,[DEVICEID]
--      ,[DEVICETYPE]
--      ,[REORDFROMSTORE]
--      ,[REORDFROMSTORESITEID]
--      ,[STOREROOMPARENT]
--  FROM [Cordova_Staging].[dbo].[CORDOVA_LOCATIONS TABLE_MAR2022]
--where status in('Active','Operating')

---------------------------------------------------------------------------------


--select * from [Cordova_Repository_New].[dbo].[Client_Labtrans]

--insert into [Cordova_Repository_New].[dbo].[Client_Labtrans]
--SELECT [TRANSDATE]
--      ,[LABORCODE]
--      ,[CRAFT]
--      ,[PAYRATE]
--      ,[ASSETNUM]
--      ,[REGULARHRS]
--      ,[ENTERBY]
--      ,[ENTERDATE]
--      ,[STARTDATE]
--      ,[STARTTIME]
--      ,[FINISHDATE]
--      ,[FINISHTIME]
--      ,[TRANSTYPE]
--      ,[OUTSIDE]
--      ,[MEMO]
--      ,[ROLLUP]
--      ,[GLDEBITACCT]
--      ,[LINECOST]
--      ,[GLCREDITACCT]
--      ,[FINANCIALPERIOD]
--      ,[PONUM]
--      ,[POLINENUM]
--      ,[LOCATION]
--      ,[GENAPPRSERVRECEIPT]
--      ,[PAYMENTTRANSDATE]
--      ,[EXCHANGERATE2]
--      ,[LINECOST2]
--      ,[LABTRANSID]
--      ,[SERVRECTRANSID]
--      ,[SOURCESYSID]
--      ,[OWNERSYSID]
--      ,[EXTERNALREFID]
--      ,[SENDERSYSID]
--      ,[FINCNTRLID]
--      ,[ORGID]
--      ,[SITEID]
--      ,[REFWO]
--      ,[ENTEREDASTASK]
--      ,[TICKETID]
--      ,[TICKETCLASS]
--      ,[CONTRACTNUM]
--      ,[SKILLLEVEL]
--      ,[TIMERSTATUS]
--      ,[INVOICENUM]
--      ,[INVOICELINENUM]
--      ,[REVISIONNUM]
--      ,[PREMIUMPAYCODE]
--      ,[PREMIUMPAYHOURS]
--      ,[PREMIUMPAYRATE]
--      ,[VENDOR]
--      ,[PREMIUMPAYRATETYPE]
--      ,[POREVISIONNUM]
--      ,[STARTDATETIME]
--      ,[FINISHDATETIME]
--      ,[CREWWORKGROUP]
--      ,[AMCREW]
--      ,[AMCREWTYPE]
--      ,[POSITION]
--      ,null[ROWSTAMP]
--  FROM [Cordova_Staging].[dbo].[CORDOVA_WORKORDER_LABTRANS TABLE_MAR2022]

--select * from Client_labtrance a left join 
--Client_Workorder b on a.refwo=b.refwonum

----------------------------------------------------------------------------------

--  select * from [Cordova_Repository_New].[dbo].[Client_Matusetrans] 

--insert into [Cordova_Repository_New].[dbo].[Client_Matusetrans]
--SELECT [ITEMNUM]
--      ,[STORELOC]
--      ,[TRANSDATE]
--      ,[ACTUALDATE]
--      ,[QUANTITY]
--      ,[CURBAL]
--      ,[PHYSCNT]
--      ,[UNITCOST]
--      ,[ACTUALCOST]
--      ,[PONUM]
--      ,[CONVERSION]
--      ,[ASSETNUM]
--      ,[ENTERBY]
--      ,[IT1]
--      ,[IT2]
--      ,[IT3]
--      ,[IT4]
--      ,[IT5]
--      ,[MEMO]
--      ,[OUTSIDE]
--      ,[ISSUETO]
--      ,[PACKINGSLIPNUM]
--      ,[POLINENUM]
--      ,[ROLLUP]
--      ,[ITIN1]
--      ,[ITIN2]
--      ,[ITIN3]
--      ,[BINNUM]
--      ,[LOTNUM]
--      ,[ISSUETYPE]
--      ,[GLDEBITACCT]
--      ,[GLCREDITACCT]
--      ,[LINECOST]
--      ,[FINANCIALPERIOD]
--      ,[CURRENCYCODE]
--      ,[CURRENCYUNITCOST]
--      ,[ROTASSETNUM]
--      ,[CURRENCYLINECOST]
--      ,[LOCATION]
--      ,[DESCRIPTION]
--      ,[EXCHANGERATE]
--      ,[SPAREPARTADDED]
--      ,[QTYREQUESTED]
--      ,[EXCHANGERATE2]
--      ,[LINECOST2]
--      ,[MRNUM]
--      ,[MRLINENUM]
--      ,[MATUSETRANSID]
--      ,[MATRECTRANSID]
--      ,[IT6]
--      ,[IT7]
--      ,[IT8]
--      ,[IT9]
--      ,[IT10]
--      ,[ITIN4]
--      ,[ITIN5]
--      ,[ITIN6]
--      ,[ITIN7]
--      ,[SOURCESYSID]
--      ,[OWNERSYSID]
--      ,[EXTERNALREFID]
--      ,[SENDERSYSID]
--      ,[FINCNTRLID]
--      ,[ISSUEID]
--      ,[QTYRETURNED]
--      ,[ORGID]
--      ,[SITEID]
--      ,[REFWO]
--      ,[ENTEREDASTASK]
--      ,[LINETYPE]
--      ,[ITEMSETID]
--      ,[CONDITIONCODE]
--      ,[CONDRATE]
--      ,[COMMODITYGROUP]
--      ,[COMMODITY]
--      ,[TOSITEID]
--      ,[LANGCODE]
--      ,[HASLD]
--      ,[POREVISIONNUM]
--      ,[INVUSELINEID]
--      ,[INVUSEID]
--      ,[CONSIGNMENT]
--      ,[CONSINVOICENUM]
--      ,[CONSVENDOR]
--      ,[ISSUEUNIT]
--      ,null[ROWSTAMP]
--      ,null[HNAMATDOCNUM]
--      ,null[HNASAPGL]
--      ,null[HNASAPRESLINENUM]
--      ,null[HNASAPRESNUM]
--      ,null[HNAWPITEMID]
--      ,[WPITEMID]
--      ,[INVPICKLISTID]
--      ,[INVUSELINESPLITID]
--   FROM [Cordova_Staging].[dbo].[CORDOVA_WORKORDER_MATUSETRANS TABLE_MAR2022]


--   --------------------------------------------------------------------------------





