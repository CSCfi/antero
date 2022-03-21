USE [ANTERO]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_lukio_opiskelijat_netto]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_netto]    Script Date: 7.12.2020 14:28:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_netto] AS

DROP TABLE IF EXISTS dw.f_koski_lukio_opiskelijat_netto

SELECT
	 tilastovuosi = k.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d20.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,tavoitetutkinto
	,oppimaara
	,koulutus
	,CASE
		WHEN tavoitetutkinto = 'Ylioppilastutkinto' THEN 1
		WHEN tavoitetutkinto = 'Deutsche Internationale Abitur; Reifeprüfung' THEN 2
		WHEN tavoitetutkinto = 'IB-tutkinto (International Baccalaureate)' THEN 3
		WHEN tavoitetutkinto = 'Ei tutkintotavoitetta' THEN 4
		END
		AS jarj_tavoitetutkinto
	,jarj_koulutus
	,CASE WHEN oppimaara = 'Nuorten oppimäärä' THEN 1
		WHEN oppimaara = 'Aikuisten oppimäärä' THEN 2
		WHEN oppimaara = 'Ulkomainen tutkinto' THEN 3
		WHEN oppimaara = 'Aineopiskelija (ei tutkintotavoitetta)' THEN 4
		ELSE 99 END
		AS jarj_oppimaara
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id, d22.id, -1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d21.id, -1)
	,opiskelijat = SUM(ka)
	,loadtime = GETDATE()

INTO dw.f_koski_lukio_opiskelijat_netto
	
FROM (
	
	
	SELECT 
		 vuosi
		,kuukausi
		,sukupuoli
		,aidinkieli
		,ika
		,kansalaisuus
		,majoitus
		,tavoitetutkinto
		,oppimaara
		,koulutus
		,jarj_tavoitetutkinto
		,jarj_koulutus
		,suorituskieli_koodiarvo
		,toimipiste_oid
		,oppilaitos_oid
		,koulutustoimija_oid
		,ka
	FROM Koski_SA.dbo.lukio_opiskelijat_netto_valitaulu sa

) k

LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-01')
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi = k.majoitus
LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid = k.koulutustoimija_oid
LEFT JOIN d_organisaatioluokitus d18 ON d18.organisaatio_oid = k.toimipiste_oid
LEFT JOIN d_maatjavaltiot2 d20 ON d20.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN d_kieli d21 ON d21.kieli_koodi = k.suorituskieli_koodiarvo
LEFT JOIN d_organisaatioluokitus d22 ON d22.organisaatio_oid = d12.ylaorganisaatio_oid

GROUP BY 
k.vuosi
,COALESCE(d1.id,-1)
,COALESCE(d2.id,-1)
,COALESCE(d3.id,-1)
,COALESCE(d4.id,-1)
,COALESCE(d6.id,-1)
,COALESCE(d12.id,-1)
,COALESCE(d13.id, d22.id, -1)
,COALESCE(d18.id,-1)
,COALESCE(d20.id,-1)
,COALESCE(d21.id,-1)
,tavoitetutkinto
,oppimaara
,koulutus
,jarj_tavoitetutkinto
,jarj_koulutus





GO

USE ANTERO
