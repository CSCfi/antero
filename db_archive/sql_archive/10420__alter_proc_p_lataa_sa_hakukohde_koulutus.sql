USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakukohde_koulutus]    Script Date: 27.11.2024 8:39:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[p_lataa_sa_hakukohde_koulutus] AS

DROP INDEX IF EXISTS [NC_hakukohde_koulutus] ON [sa].[sa_hakukohde_koulutus]

--temp_hakukohteet
DROP TABLE IF EXISTS ANTERO.sa.temp_hakukohteet
SELECT * INTO ANTERO.sa.temp_hakukohteet FROM (
	SELECT s.hakukohdeOid FROM ANTERO.sa.sa_kouta_hakukohteet s
	LEFT JOIN ANTERO.sa.sa_kouta_haku s2 on s.hakuOid = s2.hakuOid
	WHERE coalesce(s2.alkamisvuosi, s.koulutuksenAlkamisvuosi) is not null
	UNION 
	SELECT oid as hakukohdeOid FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]
) f
OPTION (MAXDOP 1)

--temp_hakukohde_koulutus
DROP TABLE IF EXISTS ANTERO.sa.temp_hakukohde_koulutus
SELECT DISTINCT
	f.hakukohde_oid,
	f.koulutuksen_alkamisvuosi,
	f.koulutuksen_alkamiskausi,
	f.hakukohdekoulutus_oid,
	hakukohdekoulutus_koodi = k.koulutuskoodi_arvo,
	koulutustyyppi_koodi = k.koulutustyyppi_arvo,
	laajuus_koodi = opintojenLaajuusarvo_arvo,
	pohjakoulutusvaatimus_koodi = coalesce(h.PohjakoulutusvaatimusKoodi, hakukelpoisuusvaatimus),
	f.organisaatio_oid,
	f.hakukohdekoulutus_nro
INTO ANTERO.sa.temp_hakukohde_koulutus
FROM (
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
	GROUP BY 
	oid
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
	,LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut2.value, '"', ''), '[',''),']',''), ', ',','))
	,koulutuksenAlkamisvuosi 
	,substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1)
	,hakukelpoisuusvaatimusUris

) f
LEFT JOIN sa.koulutustarjonta_koulutus k on k.oid = f.hakukohdekoulutus_oid
LEFT JOIN (
	select distinct 
		HakukohdeOID
		,PohjakoulutusvaatimusKoodi
	from sa.sa_odw_hakeneet 
) h on h.HakukohdeOID = f.hakukohde_oid

UNION ALL

SELECT DISTINCT
	s2.hakukohdeOid,
	coalesce(s3.alkamisvuosi, coalesce(s2.koulutuksenAlkamisvuosi, year(s2.koulutuksenAlkamispaivamaara))) as alkamisvuosi,
	coalesce(
	substring(coalesce(s3.alkamiskausiKoodiUri, s2.koulutuksenAlkamiskausiKoodiUri),charindex('_',coalesce(s3.alkamiskausiKoodiUri, s2.koulutuksenAlkamiskausiKoodiUri))+1,1),
	case when MONTH(CAST(LEFT(s2.koulutuksenAlkamispaivamaara, 10) as date)) < 8 then 'k' else 's' end) as kausi,
	s.koulutusOid,
	[koulutuksetKoodi],
	s4.koulutustyyppi_koodi,
	[opintojenLaajuusKoodi],
	COALESCE(h.PohjakoulutusvaatimusKoodi, case when s2.pohjakoulutusvaatimusKoodiUrit like '%_yo%' and s2.pohjakoulutusvaatimusKoodiUrit like '%_pk%' then 'PK/YO'
		when pilkotut.value like '%_pk%' then 'PK'
		when pilkotut.value like '%_yo%' then 'YO'
		when pilkotut.value like '%_er%' then 'ER'
	end) as hakukelpoisuusvaatimus,
	s2.tarjoaja,
	ROW_NUMBER() OVER(PARTITION BY s2.hakukohdeOid ORDER BY s2.hakukohdeOid, s.koulutusOid, COALESCE(s.koulutuksetKoodi,999999)) as hakukohdekoulutus_nro
FROM ANTERO.sa.sa_kouta_hakukohteet s2 
LEFT JOIN [ANTERO].[sa].[sa_kouta_koulutus] s on s.toteutusOid = s2.toteutusOid
LEFT JOIN ANTERO.sa.sa_kouta_haku s3 on s2.hakuOid = s3.hakuOid
LEFT JOIN ANTERO.dw.d_koulutusluokitus s4 on s.koulutuksetKoodi = s4.koulutusluokitus_koodi
LEFT JOIN (
	select distinct 
		HakukohdeOID
		,PohjakoulutusvaatimusKoodi
	from sa.sa_odw_hakeneet 
) h on h.HakukohdeOID = s2.hakukohdeOid
cross apply string_split(cast(s2.pohjakoulutusvaatimusKoodiUrit as varchar(max)), ',') pilkotut
WHERE coalesce(s3.alkamisvuosi, s2.koulutuksenAlkamisvuosi) is not null
GROUP BY 
s2.hakukohdeOid
,coalesce(
		substring(coalesce(s3.alkamiskausiKoodiUri, s2.koulutuksenAlkamiskausiKoodiUri),charindex('_',coalesce(s3.alkamiskausiKoodiUri, s2.koulutuksenAlkamiskausiKoodiUri))+1,1),
		case when MONTH(CAST(LEFT(s2.koulutuksenAlkamispaivamaara, 10) as date)) < 8 then 'k' else 's' end)
,s.koulutusOid
,[koulutuksetKoodi]
,[opintojenLaajuusKoodi]
,s4.koulutustyyppi_koodi
,coalesce(s3.alkamisvuosi, coalesce(s2.koulutuksenAlkamisvuosi, year(s2.koulutuksenAlkamispaivamaara))) 
,COALESCE(h.PohjakoulutusvaatimusKoodi, case when s2.pohjakoulutusvaatimusKoodiUrit like '%_yo%' and s2.pohjakoulutusvaatimusKoodiUrit like '%_pk%' then 'PK/YO'
			when pilkotut.value like '%_pk%' then 'PK'
			when pilkotut.value like '%_yo%' then 'YO'
			when pilkotut.value like '%_er%' then 'ER'
		end)
,s2.tarjoaja
OPTION (MAXDOP 1)

--varsinainen lataus
MERGE sa.sa_hakukohde_koulutus AS target
USING (
	SELECT DISTINCT
		hakukohde_oid,
		koulutuksen_alkamisvuosi,
		koulutuksen_alkamiskausi,
		hakukohdekoulutus_oid,
		hakukohdekoulutus_koodi,
		koulutustyyppi_koodi,
		laajuus_koodi,
		pohjakoulutusvaatimus_koodi,
		organisaatio_oid,
		hakukohdekoulutus_nro
	FROM ANTERO.sa.temp_hakukohde_koulutus
) AS src
ON target.hakukohde_oid = src.hakukohde_oid 
and target.hakukohdekoulutus_nro = src.hakukohdekoulutus_nro 
and target.pohjakoulutusvaatimus_koodi = src.pohjakoulutusvaatimus_koodi

WHEN MATCHED THEN
	UPDATE SET
		target.koulutuksen_alkamisvuosi = src.koulutuksen_alkamisvuosi,
		target.koulutuksen_alkamiskausi = src.koulutuksen_alkamiskausi,
		target.hakukohdekoulutus_oid = src.hakukohdekoulutus_oid,
		target.hakukohdekoulutus_koodi = src.hakukohdekoulutus_koodi,
		target.koulutustyyppi_koodi = src.koulutustyyppi_koodi,
		target.laajuus_koodi = src.laajuus_koodi,
		target.organisaatio_oid = src.organisaatio_oid

WHEN NOT MATCHED BY TARGET THEN
	INSERT ( 
		hakukohde_oid,
		koulutuksen_alkamisvuosi,
		koulutuksen_alkamiskausi,
		hakukohdekoulutus_oid,
		hakukohdekoulutus_koodi,
		koulutustyyppi_koodi,
		laajuus_koodi,
		pohjakoulutusvaatimus_koodi,
		organisaatio_oid,
		hakukohdekoulutus_nro
	)
	VALUES (
		src.hakukohde_oid,
		src.koulutuksen_alkamisvuosi,
		src.koulutuksen_alkamiskausi,
		src.hakukohdekoulutus_oid,
		src.hakukohdekoulutus_koodi,
		src.koulutustyyppi_koodi,
		src.laajuus_koodi,
		src.pohjakoulutusvaatimus_koodi,
		src.organisaatio_oid,
		src.hakukohdekoulutus_nro
	)

WHEN NOT MATCHED BY SOURCE and target.hakukohde_oid in (SELECT hakukohdeOid FROM ANTERO.sa.temp_hakukohteet) THEN
	DELETE;


DROP TABLE IF EXISTS ANTERO.sa.temp_hakukohde_koulutus
DROP TABLE IF EXISTS ANTERO.sa.temp_hakukohteet

CREATE NONCLUSTERED INDEX [NC_hakukohde_koulutus] ON [sa].[sa_hakukohde_koulutus]
(
	[hakukohdekoulutus_nro] ASC
)
INCLUDE (
	[hakukohde_oid],
	[hakukohdekoulutus_koodi]
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO


