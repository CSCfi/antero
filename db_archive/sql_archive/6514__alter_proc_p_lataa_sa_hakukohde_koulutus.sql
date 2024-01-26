USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_koulutus]    Script Date: 30.9.2022 12:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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

SELECT DISTINCT
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
			when hakukelpoisuusvaatimusUris like '%ta_1%' or  hakukelpoisuusvaatimusUris like '%ta_2%' or hakukelpoisuusvaatimusUris like '%ta_5%' then 'PK'
			when hakukelpoisuusvaatimusUris like '%ta_3%' or  hakukelpoisuusvaatimusUris like '%ta_4%' then 'YO'
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

UNION ALL
 
SELECT DISTINCT
	   s2.hakukohdeOid
	  ,coalesce(s3.alkamisvuosi, coalesce(s2.koulutuksenAlkamisvuosi, s.alkamisvuosi)) as alkamisvuosi
	  ,substring(coalesce(s3.alkamiskausiKoodiUri, coalesce(s2.koulutuksenAlkamiskausiKoodiUri, s.alkamiskausiKoodiUri)),charindex('_',coalesce(s3.alkamiskausiKoodiUri, coalesce(s2.koulutuksenAlkamiskausiKoodiUri, s.alkamiskausiKoodiUri)))+1,1) as kausi  
      ,s.koulutusOid
	  ,[koulutuksetKoodi]
	  ,s4.koulutustyyppi_koodi
      ,[opintojenLaajuusKoodi]
	  ,COALESCE(h.PohjakoulutusvaatimusKoodi, case when s2.pohjakoulutusvaatimusKoodiUrit like '%_yo%' and s2.pohjakoulutusvaatimusKoodiUrit like '%_pk%' then 'PK/YO'
			when pilkotut.value like '%_pk%' then 'PK'
			when pilkotut.value like '%_yo%' then 'YO'
			when pilkotut.value like '%_er%' then 'ER'
	   end) as hakukelpoisuusvaatimus
      ,s2.tarjoaja
	  ,ROW_NUMBER() OVER(PARTITION BY s2.hakukohdeOid ORDER BY s2.hakukohdeOid, s.koulutusOid) as hakukohdekoulutus_nro
FROM [ANTERO].[sa].[sa_kouta_koulutus] s
LEFT JOIN ANTERO.sa.sa_kouta_hakukohteet s2 on s.toteutusOid = s2.toteutusOid
LEFT JOIN ANTERO.sa.sa_kouta_haku s3 on s2.hakuOid = s3.hakuOid
LEFT JOIN ANTERO.dw.d_koulutusluokitus s4 on s.koulutuksetKoodi = s4.koulutusluokitus_koodi
left join (
	select distinct 
		HakukohdeOID
		,PohjakoulutusvaatimusKoodi
	from sa.sa_odw_hakeneet 
) h on h.HakukohdeOID = s2.hakukohdeOid
cross apply string_split(cast(s2.pohjakoulutusvaatimusKoodiUrit as varchar(max)), ',') pilkotut
WHERE coalesce(s3.alkamisvuosi, coalesce(s2.koulutuksenAlkamisvuosi, s.alkamisvuosi)) is not null
GROUP BY 
s2.hakukohdeOid
,substring(coalesce(s3.alkamiskausiKoodiUri, coalesce(s2.koulutuksenAlkamiskausiKoodiUri, s.alkamiskausiKoodiUri)),charindex('_',coalesce(s3.alkamiskausiKoodiUri, coalesce(s2.koulutuksenAlkamiskausiKoodiUri, s.alkamiskausiKoodiUri)))+1,1)
,s.koulutusOid
,[koulutuksetKoodi]
,[opintojenLaajuusKoodi]
,s4.koulutustyyppi_koodi
,coalesce(s3.alkamisvuosi, coalesce(s2.koulutuksenAlkamisvuosi, s.alkamisvuosi))
,COALESCE(h.PohjakoulutusvaatimusKoodi, case when s2.pohjakoulutusvaatimusKoodiUrit like '%_yo%' and s2.pohjakoulutusvaatimusKoodiUrit like '%_pk%' then 'PK/YO'
			when pilkotut.value like '%_pk%' then 'PK'
			when pilkotut.value like '%_yo%' then 'YO'
			when pilkotut.value like '%_er%' then 'ER'
	   end)
,s2.tarjoaja


CREATE NONCLUSTERED INDEX [NC_hakukohde_koulutus] ON [sa].[sa_hakukohde_koulutus]
(
	[hakukohdekoulutus_nro] ASC
)
INCLUDE ( 	[hakukohde_oid],
	[hakukohdekoulutus_koodi]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

USE [ANTERO]