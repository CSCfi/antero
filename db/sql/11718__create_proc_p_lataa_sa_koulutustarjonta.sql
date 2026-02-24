USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_koulutustarjonta]    Script Date: 4.2.2026 8.36.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [sa].[p_lataa_sa_koulutustarjonta] AS


DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta_kielet
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta_kielet2
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta_koulutukset

SELECT DISTINCT
	oid as hakukohde_oid,
	CASE
		WHEN s.value = 'kieli_fi' THEN '1'
		WHEN s.value = 'kieli_sv' THEN '2'
		WHEN s.value = 'kieli_en' THEN '4'
		WHEN s.value = 'kieli_se' THEN '5'
		WHEN s.value is null THEN NULL
		ELSE '9'
	END opetuskieli
INTO ANTERO.sa.temp_koulutustarjonta_kielet
FROM [ANTERO].[sa].[koulutustarjonta_hakukohde] h
CROSS APPLY STRING_SPLIT(REPLACE(REPLACE(REPLACE(opetusKielet,'"',''),'[',''),']',''), ',') s

SELECT 
	k.hakukohde_oid,
	STRING_AGG(k.opetuskieli, '') WITHIN GROUP (ORDER BY k.opetuskieli) as opetuksen_kieli
INTO ANTERO.sa.temp_koulutustarjonta_kielet2
FROM ANTERO.sa.temp_koulutustarjonta_kielet k
GROUP BY k.hakukohde_oid

SELECT DISTINCT
	hk.oid,
	SUBSTRING(
		hk.hakukohdeKoulutusOids, 
		CHARINDEX('"', hk.hakukohdeKoulutusOids, 0) + 1,
		CHARINDEX('"', hk.hakukohdeKoulutusOids, 
			CHARINDEX('"', hk.hakukohdeKoulutusOids, 0) + 1
		) - 
		(CHARINDEX('"', hk.hakukohdeKoulutusOids, 0) + 1)
	) as koulutus_oid_1,
	SUBSTRING(
		hk.tarjoajaoids, 
		CHARINDEX('"', hk.tarjoajaoids, 0) + 1,
		CHARINDEX('"', hk.tarjoajaoids, 
			CHARINDEX('"', hk.tarjoajaoids, 0) + 1
		) - 
		(CHARINDEX('"', hk.tarjoajaoids, 0) + 1)
	) as organisaatio_oid,
	LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(koulutukset.value, '"', ''), '[',''),']',''), ', ',',')) as koulutus_oid
INTO ANTERO.sa.temp_koulutustarjonta_koulutukset
FROM [ANTERO].[sa].[koulutustarjonta_hakukohde] hk
CROSS APPLY string_split(cast(hk.hakukohdekoulutusoids as varchar(max)), ',') koulutukset

SELECT
	hk.hakuOid as haku_oid,
	hk.oid as hakukohde_oid,
	ha.loppuPvm as ensimmainen_hakuaika_paattyy,
	hk.koulutuksenAlkamisvuosi as koulutuksen_alkamisvuosi,
	substring(hk.koulutuksenAlkamiskausiUri,charindex('_',hk.koulutuksenAlkamiskausiUri)+1,1) as koulutuksen_alkamiskausi,
	k.koulutus_oid_1,
	k.koulutus_oid,
	k.organisaatio_oid,
	CASE WHEN hk2.nimi_fi like 'Ammatillinen%' THEN 1 ELSE 0 END as apusarake_kk_ammatillinen,
	h.korkeakouluHaku as kk_haku,
	ok.opetuksen_kieli,
	hk.aloituspaikatLkm,
	hk.ensikertalaistenAloituspaikat
INTO ANTERO.sa.temp_koulutustarjonta
FROM [ANTERO].[sa].[koulutustarjonta_hakukohde] hk 
LEFT JOIN [ANTERO].[sa].[koulutustarjonta_haku] h on h.oid = hk.hakuOid
LEFT JOIN ANTERO.sa.sa_hakukohteet hk2 on hk2.hakukohdeOid = hk.oid
LEFT JOIN ANTERO.sa.temp_koulutustarjonta_koulutukset k on k.oid = hk.oid
LEFT JOIN ANTERO.sa.temp_koulutustarjonta_kielet2 ok on ok.hakukohde_oid = hk.oid
OUTER APPLY (
	SELECT 
		MIN(loppuPvm) as loppuPvm
	FROM ANTERO.sa.sa_hakuajat ha
	WHERE ha.hakuOid = h.oid
) ha
WHERE hk.tila in ('JULKAISTU', 'ARKISTOITU')

DROP TABLE IF EXISTS ANTERO.sa.sa_koulutustarjonta

SELECT DISTINCT
	h.hakukohde_oid,
	h.haku_oid,
	h.koulutuksen_alkamisvuosi,
	h.koulutuksen_alkamiskausi,
	h.kk_haku,
	h.opetuksen_kieli,
	d1b.koulutusluokitus_koodi as koulutus_koodi,
	d1b.opintoala1995_koodi as opintoala1995_koodi,
	d1b.opintoala2002_koodi as opintoala2002_koodi,
	alempi_kk =
		MAX(
			CASE
				WHEN d1a.koulutusastetaso1_koodi = 6 or d1a.koulutusaste2002_koodi in (61,62,63) THEN 1
				ELSE 0
			END
		) OVER (PARTITION BY h.hakukohde_oid),
	ylempi_kk =
		MAX(
			CASE
				WHEN d1a.koulutusastetaso1_koodi = 7 or d1a.koulutusaste2002_koodi in (71,72,73) THEN 1
				ELSE 0
			END
		) OVER (PARTITION BY h.hakukohde_oid),
	jatkotutkinto_kk =
		MAX(
			CASE
				WHEN d1a.koulutusastetaso1_koodi = 8 or d1a.koulutusaste2002_koodi in (81,82) THEN 1
				ELSE 0
			END
		) OVER (PARTITION BY h.hakukohde_oid),
	k.koulutustyyppi_arvo as koulutustyyppi,
	koulutusaste =
		MAX(
			CASE
				WHEN d1a.koulutusastetaso2_koodi in (62,71) or d1a.koulutusaste2002_koodi in (62,71) THEN 2
				WHEN d1a.koulutusastetaso2_koodi in (63,72,73,81,82) or d1a.koulutusaste2002_koodi in (63,72,73,81,82) THEN 1
				ELSE -1
			END
		) OVER (PARTITION BY h.hakukohde_oid),
	h.apusarake_kk_ammatillinen,
	h.ensimmainen_hakuaika_paattyy,
	h.aloituspaikatLkm,
	h.ensikertalaistenAloituspaikat,
	case
		when d5a.organisaatio_avain like 'koulutustoimija_%' then d5a.organisaatio_oid
		when d5b.organisaatio_avain like 'koulutustoimija_%' then d5b.organisaatio_oid
		when d5c.organisaatio_avain like 'koulutustoimija_%' then d5c.organisaatio_oid
		when d5d.organisaatio_avain like 'koulutustoimija_%' then d5d.organisaatio_oid
	end as koulutustoimija_oid,
	case
		when d5a.organisaatio_avain like 'oppilaitos_%' then d5a.organisaatio_oid
		when d5b.organisaatio_avain like 'oppilaitos_%' then d5b.organisaatio_oid
		when d5c.organisaatio_avain like 'oppilaitos_%' then d5c.organisaatio_oid
		when d5d.organisaatio_avain like 'oppilaitos_%' then d5d.organisaatio_oid
	end as oppilaitos_oid,
	case
		when d5a.organisaatio_avain like 'toimipiste_%' then d5a.organisaatio_oid
		when d5b.organisaatio_avain like 'toimipiste_%' then d5b.organisaatio_oid
		when d5c.organisaatio_avain like 'toimipiste_%' then d5c.organisaatio_oid
		when d5d.organisaatio_avain like 'toimipiste_%' then d5d.organisaatio_oid
	end as toimipiste_oid
INTO ANTERO.sa.sa_koulutustarjonta
FROM ANTERO.sa.temp_koulutustarjonta h
LEFT JOIN ANTERO.sa.koulutustarjonta_koulutus k on k.oid = h.koulutus_oid
LEFT JOIN ANTERO.sa.koulutustarjonta_koulutus k2 on k2.oid = h.koulutus_oid_1
LEFT JOIN ANTERO.dw.d_koulutusluokitus d1a on d1a.koulutusluokitus_koodi = k.koulutuskoodi_arvo
LEFT JOIN ANTERO.dw.d_koulutusluokitus d1b on d1b.koulutusluokitus_koodi = k2.koulutuskoodi_arvo
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5a ON d5a.organisaatio_oid = h.organisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b ON d5b.organisaatio_oid = d5a.ylaorganisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5c ON d5c.organisaatio_oid = d5b.ylaorganisaatio_oid
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5d ON d5d.organisaatio_oid = d5c.ylaorganisaatio_oid
	
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta_kielet
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta_kielet2
DROP TABLE IF EXISTS ANTERO.sa.temp_koulutustarjonta_koulutukset