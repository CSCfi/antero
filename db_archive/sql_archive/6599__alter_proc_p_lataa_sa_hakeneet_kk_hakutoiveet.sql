USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]    Script Date: 1.11.2022 8:37:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet] AS


DROP INDEX IF EXISTS [NC_sa_hakeneet_kk_hakutoiveet] ON [sa].[sa_hakeneet_kk_hakutoiveet]


truncate table sa.sa_hakeneet_kk_hakutoiveet 

insert into sa.sa_hakeneet_kk_hakutoiveet 

select 
	hakemusoid
	,MAX([1_koul])	as hakukohdeOID1
	,MAX([1_org])	as organisaatioOID1
	,MAX([2_koul])	as hakukohdeOID2
	,MAX([2_org])	as organisaatioOID2
	,MAX([3_koul])	as hakukohdeOID3
	,MAX([3_org])	as organisaatioOID3
	,MAX([4_koul])	as hakukohdeOID4
	,MAX([4_org])	as organisaatioOID4
	,MAX([5_koul])	as hakukohdeOID5
	,MAX([5_org])	as organisaatioOID5
	,MAX([6_koul])	as hakukohdeOID6
	,MAX([6_org])	as organisaatioOID6

from 
(
	select 
		HakemusOid
		,HakukohdeOID
		,coalesce(OppilaitosOID,KoulutusToimijaOID) as OrganisaatioOID
		,cast(HakutoiveNumero as varchar) + '_koul' as HakutoiveNumeroKoul
		,cast(HakutoiveNumero as varchar) + '_org' as HakutoiveNumeroORG
	from sa.sa_odw_hakeneet f
	left join ANTERO.dw.d_haku d on f.HakuOid = d.haku_oid
	where d.korkeakouluhaku = 1
	
	
	
) as query

PIVOT (MAX(HakukohdeOID) FOR HakutoiveNumeroKoul IN ([1_koul],[2_koul],[3_koul],[4_koul],[5_koul],[6_koul]))
AS PIVOTTABLE
PIVOT (MAX(OrganisaatioOID) FOR HakutoiveNumeroORG IN ([1_org],[2_org],[3_org],[4_org],[5_org],[6_org]))
AS PIVOTTABLE2

GROUP BY HakemusOid


CREATE NONCLUSTERED INDEX [NC_sa_hakeneet_kk_hakutoiveet] ON [sa].[sa_hakeneet_kk_hakutoiveet]
(
	[hakemusoid] ASC
)
INCLUDE ( 	[hakukohdeOID1],
	[organisaatioOID1],
	[hakukohdeOID2],
	[organisaatioOID2],
	[hakukohdeOID3],
	[organisaatioOID3],
	[hakukohdeOID4],
	[organisaatioOID4],
	[hakukohdeOID5],
	[organisaatioOID5],
	[hakukohdeOID6],
	[organisaatioOID6]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

USE [ANTERO]