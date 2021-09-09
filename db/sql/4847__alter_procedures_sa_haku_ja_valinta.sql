USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_koulutus]    Script Date: 9.9.2021 18:16:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_sa_hakukohde_koulutus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]    Script Date: 9.9.2021 18:16:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]    Script Date: 9.9.2021 18:16:59 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]    Script Date: 9.9.2021 18:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakeneet_kk_hakutoiveet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_hakutoiveet] AS' 
END
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
	where f.koulutusaste in ('1','2') 
	
	
	
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
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]    Script Date: 9.9.2021 18:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutus] AS' 
END
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
'pohjakoulutus_yo_ulkomainen'
,'pohjakoulutus_amt'
,'pohjakoulutus_yo_kansainvalinen_suomessa'
,'pohjakoulutus_yo_ammatillinen'
,'pohjakoulutus_yo'
,'pohjakoulutus_am'
,'pohjakoulutus_ulk'
)
group by HakemusOid


CREATE NONCLUSTERED INDEX [NC_sa_hakeneet_kk_pohjakoulutus] ON [sa].[sa_hakeneet_kk_pohjakoulutus]
(
	[hakemusoid] ASC
)
INCLUDE ( 	[max_ToisenAsteenKoulutuksenSuoritusvuosi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]




GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_koulutus]    Script Date: 9.9.2021 18:16:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_sa_hakukohde_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_sa_hakukohde_koulutus] AS' 
END
GO


ALTER PROCEDURE [sa].[p_lataa_sa_hakukohde_koulutus] AS


DROP INDEX IF EXISTS [NC_hakukohde_koulutus] ON [sa].[sa_hakukohde_koulutus]


TRUNCATE TABLE [sa].[sa_hakukohde_koulutus]

INSERT INTO [sa].[sa_hakukohde_koulutus]
(
hakukohde_oid
,koulutuksen_alkamisvuosi
,koulutuksen_alkamiskausi
,hakukohdekoulutus_oid
,hakukohdekoulutus_koodi
,koulutustyyppi_koodi
,laajuus_koodi
,pohjakoulutusvaatimus_koodi
,organisaatio_oid
,hakukohdekoulutus_nro

)

SELECT 
	f.hakukohde_oid
	,f.koulutuksen_alkamisvuosi
	,f.koulutuksen_alkamiskausi
	,f.hakukohdekoulutus_oid
	,hakukohdekoulutus_koodi = k.koulutuskoodi_arvo
	,koulutustyyppi_koodi = k.koulutustyyppi_arvo
	,laajuus_koodi = opintojenLaajuusarvo_arvo
	,pohjakoulutusvaatimus_koodi = coalesce(h.PohjakoulutusvaatimusKoodi, hakukelpoisuusvaatimus)
	,f.organisaatio_oid
	,f.hakukohdekoulutus_nro
	
FROM

(
	SELECT distinct
		oid as hakukohde_oid
		,koulutuksenAlkamisvuosi as koulutuksen_alkamisvuosi
		,case
			when hakukelpoisuusvaatimusUris like '%_1%' or  hakukelpoisuusvaatimusUris like '%_2%' or hakukelpoisuusvaatimusUris like '%_5%' then 'PK'
			when hakukelpoisuusvaatimusUris like '%_3%' or  hakukelpoisuusvaatimusUris like '%_4%' then 'YO'
		end as hakukelpoisuusvaatimus
		,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1) as koulutuksen_alkamiskausi
		,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')) as hakukohdekoulutus_oid
		,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',',')) as organisaatio_oid
		,ROW_NUMBER() OVER(PARTITION BY oid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as hakukohdekoulutus_nro
	FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]

	cross apply string_split(cast(hakukohdekoulutusoids as varchar(max)), ',') pilkotut
	cross apply string_split(cast(tarjoajaOids as varchar(max)), ',') pilkotut2

	group by 
	oid
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',','))
	,koulutuksenAlkamisvuosi 
	,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1)
	,hakukelpoisuusvaatimusUris

) f

left join sa.koulutustarjonta_koulutus k on k.oid = f.hakukohdekoulutus_oid
left join (
	select distinct 
		HakukohdeOID
		,PohjakoulutusvaatimusKoodi
	from sa.sa_odw_hakeneet 
) h on h.HakukohdeOID = f.hakukohde_oid
 



CREATE NONCLUSTERED INDEX [NC_hakukohde_koulutus] ON [sa].[sa_hakukohde_koulutus]
(
	[hakukohdekoulutus_nro] ASC
)
INCLUDE ( 	[hakukohde_oid],
	[hakukohdekoulutus_koodi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

