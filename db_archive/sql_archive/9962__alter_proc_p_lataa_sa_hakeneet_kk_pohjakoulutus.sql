USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]    Script Date: 8.7.2024 16:26:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus] as

DROP INDEX IF EXISTS [NC_sa_hakeneet_kk_pohjakoulutus] ON [sa].[sa_hakeneet_kk_pohjakoulutus]

truncate table sa.sa_hakeneet_kk_pohjakoulutus 

insert into sa.sa_hakeneet_kk_pohjakoulutus 
(
	hakemusoid
	,max_ToisenAsteenKoulutuksenSuoritusvuosi
)
select 
	HakemusOid
	,max(ToisenAsteenKoulutuksenSuoritusvuosi) as max_ToisenAsteenKoulutuksenSuoritusvuosi
from ANTERO.sa.sa_odw_hakeneet
where PohjakoulutusKKLomakeKoodi in (
	'pohjakoulutus_am'
	,'pohjakoulutus_amp'
	,'pohjakoulutus_amt'
	,'pohjakoulutus_ulk'
	,'pohjakoulutus_yo'
	,'pohjakoulutus_yo_ammatillinen'
	,'pohjakoulutus_yo_kansainvalinen_suomessa'
	,'pohjakoulutus_yo_ulkomainen'
)
group by HakemusOid


CREATE NONCLUSTERED INDEX [NC_sa_hakeneet_kk_pohjakoulutus] ON [sa].[sa_hakeneet_kk_pohjakoulutus]
(
	[hakemusoid] ASC
)
INCLUDE ([max_ToisenAsteenKoulutuksenSuoritusvuosi]) 
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [PRIMARY]

GO
