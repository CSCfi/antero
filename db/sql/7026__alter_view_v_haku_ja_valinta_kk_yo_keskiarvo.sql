USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_yo_keskiarvo]    Script Date: 3.2.2023 13:40:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_haku_ja_valinta_kk_yo_keskiarvo] AS

SELECT f.[Henkilö OID], f.koulutuksen_alkamisvuosi, f.d_haku_id, f.Hakukohteet, f2.keskiarvo FROM (
	SELECT DISTINCT CASE WHEN d46.selite_fi in('Hakenut vain ammattikorkeakoulutukseen', 'Hakenut vain yliopistokoulutukseen') THEN d46.selite_fi
			  WHEN d33.koulutussektori_fi = 'Yliopistokoulutus' THEN 'Haki molempiin, yliopisto 1. sijainen kohde'
			  WHEN d33.koulutussektori_fi = 'Ammattikorkeakoulukoulutus' THEN 'Haki molempiin, ammattikorkeakoulu 1. sijainen kohde'
		 END AS Hakukohteet
		,[Henkilö OID] = f.henkilo_oid
		,f.d_haku_id
		,f.koulutuksen_alkamisvuosi
	FROM dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id 
LEFT JOIN dw.d_hakukohde d32 ON d32.id=f.d_hakukohde_ensisijainen_id
LEFT JOIN dw.d_koulutusluokitus d33 ON d33.id=f.d_koulutus_ensisijainen_hakukohde_id
LEFT JOIN dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN dw.d_haku_amk_yo d46 on d46.id=f.d_haku_amk_yo_id
WHERE d44.selite_fi = 'I sykli' AND d46.selite_fi <> 'Tieto puuttuu' and henkilo_oid is not null and d1.visualisoinnit <= cast(getdate() as date)) f
INNER JOIN (SELECT henkiloOID, AVG(CAST(CASE arvosana_kirjain WHEN 'L' THEN 7 WHEN 'E' THEN 6 WHEN 'M' THEN 5 WHEN 'C' THEN 4 WHEN 'B' THEN 3 WHEN 'A' THEN 2 WHEN 'I' THEN 0 END as float)) as keskiarvo
FROM [ANTERO].[dw].[f_haku_ja_valinta_yoarvosanat]
GROUP BY henkiloOID) f2 on f.[Henkilö OID] = f2.henkiloOID

GO

USE [ANTERO]