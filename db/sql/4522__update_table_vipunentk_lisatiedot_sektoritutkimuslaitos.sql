/****** Script for SelectTopNRows command from SSMS  ******/
use VipunenTK_lisatiedot
go

  update [VipunenTK_lisatiedot].[dbo].[sektoritutkimuslaitos]
  set [sektoritutkimuslaitos]='Geologian tutkimuskeskus'
  ,[sektoritutkimuslaitos_SV]='Geologiska forskningscentralen'
  where sektoritutkimuslaitos_lyhenne='GTK'

go
use antero