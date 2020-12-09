use [VipunenTK_lisatiedot]
go
/****** Script for SelectTopNRows command from SSMS  ******/

update [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_fakta_proseduuri]
set proseduuri = 'p_lataa_f_aloittaneiden_lapaisy' 
where fakta = 'f_aloittaneiden_lapaisy'

go
use [ANTERO]