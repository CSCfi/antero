USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_perusopetus_ainevalinnat]    Script Date: 4.10.2023 17:35:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_koski_perusopetus_ainevalinnat] AS

DROP TABLE IF EXISTS dw.f_koski_perusopetus_ainevalinnat

SELECT 
	[Lukuvuosi]
	,[oppija_oid]
	,[opiskeluoikeus_oid]
	,[paatason_suoritus_id]
	,[vuosiluokka]
	,[vuosiluokan_suorituskieli]
	,[toimipiste_oid]
	,[oppilaitos_oid]
	,[koulutustoimija_oid]
	,[sukupuoli]
	,[ika]
	,[aidinkieli]
	,[kansalaisuus]
	,[osasuoritus_id]
	,[aine_koodisto]
	,[aine]
	,[aineen_oppimaara_koodisto]
	,[aineen_oppimaara]
	,[aineen_suorituskieli]
	,[aineen_arvosana]
	,[aineen_arviointi_hyvaksytty]
	,[koulutusmoduuli_pakollinen]
	,[koulutusmoduuli_paikallinen]
	,[koulutusmoduuli_laajuus_arvo]
	,[kielet_lkm]

	--id
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d5.id,-1)
	,d_kieli_vuosiluokan_suorituskieli_id = COALESCE(d6.id, -1)
	,d_kieli_aineen_suorituskieli_id = COALESCE(d6b.id, -1)
	,d_vuosiluokka_id = COALESCE(d9.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarjestaja_id = COALESCE(d13.id,-1)
	,d_alueluokitus_oppilaitos_id = COALESCE(d14.id,-1)
	,d_alueluokitus_jarj_id = COALESCE(d15.id,-1)
	,d_oppiaine_ja_oppimaara_aine_id = COALESCE(d16.id,-1)
	,d_oppiaine_ja_oppimaara_maara_id = COALESCE(d17.id,-1)
	,d_opintojenlaajuusyksikko_id = COALESCE(d18.id,-1)

INTO dw.f_koski_perusopetus_ainevalinnat
FROM VipunenTK_SA.dbo.v_sa_TK_Koski_perusopetus_ainevalinnat v
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = v.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = v.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = v.ika
LEFT JOIN dw.d_maatjavaltiot2 d5 ON d5.maatjavaltiot2_koodi = v.kansalaisuus
LEFT JOIN dw.d_kieli d6 ON d6.kieli_koodi = v.vuosiluokan_suorituskieli
LEFT JOIN dw.d_kieli d6b ON d6b.kieli_koodi = v.aineen_suorituskieli
LEFT JOIN dw.d_vuosiluokka_tai_koulutus d9 ON d9.koodi = v.vuosiluokka
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.organisaatio_oid = v.toimipiste_oid
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = v.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = v.koulutustoimija_oid
LEFT JOIN dw.d_alueluokitus d14 on d14.alueluokitus_avain = ('kunta_' + d12.kunta_koodi) 
LEFT JOIN dw.d_alueluokitus d15 on d15.alueluokitus_avain = ('kunta_' + d13.kunta_koodi) 
LEFT JOIN dw.d_perusopetus_oppiaine_ja_oppimaara d16 on d16.koodi = aine AND d16.koodisto = aine_koodisto
LEFT JOIN dw.d_perusopetus_oppiaine_ja_oppimaara d17 on d17.koodi = aineen_oppimaara AND d17.koodisto = aineen_oppimaara_koodisto
LEFT JOIN dw.d_opintojenlaajuusyksikko d18 on d18.koodiarvo = koulutusmoduuli_laajuus_yksikko

GO
