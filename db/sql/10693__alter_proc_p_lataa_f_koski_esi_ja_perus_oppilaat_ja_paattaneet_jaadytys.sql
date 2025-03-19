USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_esi_ja_perus_oppilaat_ja_paattaneet_jaadytys] AS

--lukuvuosittain
DROP TABLE IF EXISTS dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain_jaadytys

SELECT 
	opisk
	,tutk
	,oppija_oid
	,oppilaitos_oid
	,oppilaitos_kotipaikka

	--aika
	,k.[vuosi]
	,d1.lukuvuosi
	,tilastopaiva_1_0

	--k/e
	,max(vuosiluokkiin_sitoutumaton_opetus) as 'vuosiluokkiin_sitoutumaton_opetus'
	,max(erityisen_tuen_paatos) as 'erityisen_tuen_paatos'
	,max(joustava_perusopetus) as 'joustava_perusopetus'
	,max(koulukoti) as 'koulukoti'
	,max(kuljetusetu) as 'kuljetusetu'
	,max(majoitusetu) as 'majoitusetu'
	,max(pidennetty_oppivelvollisuus) as 'pidennetty_oppivelvollisuus'
	,max(sisaoppilaitosmainen_majoitus) as 'sisaoppilaitosmainen_majoitus'
	,max(ulkomailla) as 'ulkomailla'
	,max(case when d1c.lukuvuosi = d1.lukuvuosi then 1 else 0 end) as 'jaa_luokalle'

	,max(aikuisten_alkuvaihe_1_0) as 'aikuisten_alkuvaihe_1_0'
	
	--id
	,k.suoritustapa
	,d_kausi_id = COALESCE(d1b.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d5.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d6.id, -1)
	,d_kieli_muu_suorituskieli_id = COALESCE(d6b.id, -1)
	,d_kieli_kielikylpykieli_id = COALESCE(d6c.id, -1)
	,d_vuosiluokka_id = COALESCE(d9.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)

INTO dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain_jaadytys

FROM Koski_SA.dbo.v_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu_jaadytys k
LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = cast(k.vuosi as varchar) + '-' + right('0' + cast(k.kuukausi as varchar), 2) + '-01'
LEFT JOIN dw.d_kausi d1b ON d1b.koodi = (case when k.kuukausi < 8 then 'K' else 'S' end)
LEFT JOIN dw.d_kalenteri d1c ON k.jaa_luokalle = 1 and d1c.kalenteri_avain = k.vahvistus_paiva
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN dw.d_maatjavaltiot2 d5 ON d5.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN dw.d_kieli d6 ON d6.kieli_koodi = k.suorituskieli
LEFT JOIN dw.d_kieli d6b ON d6b.kieli_koodi = k.muu_suorituskieli
LEFT JOIN dw.d_kieli d6c ON d6c.kieli_koodi = k.kielikylpykieli
LEFT JOIN dw.d_vuosiluokka_tai_koulutus d9 ON d9.koodi = k.vuosiluokka_tai_koulutus
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.organisaatio_oid = k.toimipiste_oid
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = k.koulutustoimija_oid

GROUP BY 
	k.vuosi
	,tilastopaiva_1_0
	,oppilaitos_oid
	,oppilaitos_kotipaikka
	,oppija_oid
	,opisk
	,tutk
	,d1.lukuvuosi
	,suoritustapa
	,COALESCE(d1b.id,-1)
	,COALESCE(d2.id,-1)
	,COALESCE(d3.id,-1)
	,COALESCE(d4.id,-1)
	,COALESCE(d5.id,-1)
	,COALESCE(d6.id,-1)
	,COALESCE(d6b.id,-1)
	,COALESCE(d6c.id,-1)
	,COALESCE(d9.id,-1)
	,COALESCE(d11.id,-1)
	,COALESCE(d12.id,-1)
	,COALESCE(d13.id,-1)
	
GO
