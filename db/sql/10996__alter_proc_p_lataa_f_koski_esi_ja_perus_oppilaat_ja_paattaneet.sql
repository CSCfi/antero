USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_esi_ja_perus_oppilaat_ja_paattaneet]    Script Date: 30.7.2025 13.07.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_esi_ja_perus_oppilaat_ja_paattaneet] AS

DECLARE @maxTilv int = (select max(vuosi) FROM Koski_SA.dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu)
DECLARE @maxKk int = (select max(kuukausi) FROM Koski_SA.dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu WHERE vuosi = @maxTilv)
DECLARE @kuluvaLvAlku varchar(8) = case when @maxKk > 7 then datefromparts(@maxTilv, 8, 1) else datefromparts(@maxTilv-1, 8, 1) end


--KUUKAUSITTAIN
DROP TABLE IF EXISTS dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain

SELECT 
	[opisk]
	,[tutk]
	,k.[opiskeluoikeus_oid]
	,k.[master_oid]

	--aika
	,k.[vuosi]
	,k.[kuukausi]
	,oo_alkamisajankohta = coalesce(cast(d1b.vuosi as varchar) + '/' + right('0' + cast(d1b.kuukausi as varchar), 2), '-1')
	,oo_alkanut_kuussa_1_0 = 
		case
			when year(k.oo_alkamispaiva) = k.vuosi and month(k.oo_alkamispaiva) = k.kuukausi then 1
			when year(k.oo_alkamispaiva) != k.vuosi or month(k.oo_alkamispaiva) != k.kuukausi then 0
		end

	--hlö
	,k.[aidinkieli]
	,k.[kansalaisuus]
	,[ika]
	,k.[sukupuoli]
	,d14.mannersuomessa AS kotikunta_manner_suomessa
	,oppivelvollinen

	--koulutus (pl. k/e)
	,[suorituksen_tyyppi]
	,[suoritustapa]
	,[suorituskieli]
	,[muu_suorituskieli]
	,[kielikylpykieli]
	,[erityinen_tuki_johdettu]

	--org
	,[toimipiste_oid]
	,[oppilaitos_oid]
	,[koulutustoimija_oid]

	--k/e
	,[vuosiluokkiin_sitoutumaton_opetus]
	,[erityisen_tuen_paatos]
	,[joustava_perusopetus]
	,[koulukoti]
	,[kuljetusetu]
	,[pidennetty_oppivelvollisuus]
	,[sisaoppilaitosmainen_majoitus]
	,[ulkomailla]
	,opiskelee_toiminta_alueittain
	,tuen_paatos
	,aikuisten_alkuvaihe_1_0

	,tilastopaiva_1_0
	,kuluva_lv_1_0 = case when d1.kalenteri_avain >= @kuluvaLvAlku then 1 else 0 end
	,kuutioon_1_0 = 
		case 
			when (opisk = 1 and d1.lukuvuosi not in ('2017/2018', '2018/2019', '2019/2020'))
			  or (tutk = 1 and d1.lukuvuosi not in ('2017/2018', '2018/2019'))
			then 1
			else 0
		end

	--id
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_kalenteri_oo_id = COALESCE(d1b.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d5.id,-1)
	,d_kieli_suorituskieli_id = COALESCE(d6.id, -1)
	,d_kieli_muu_suorituskieli_id = COALESCE(d6b.id, -1)
	,d_kieli_kielikylpykieli_id = COALESCE(d6c.id, -1)
	,d_erityinen_tuki_johdettu_id = COALESCE(d7.id,-1)
	,d_vuosiluokka_id = COALESCE(d9.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)

INTO dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain
	
FROM Koski_SA.dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu k
LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = cast(k.vuosi as varchar) + '-' + right('0' + cast(k.kuukausi as varchar), 2) + '-01'
LEFT JOIN dw.d_kalenteri d1b ON d1b.kalenteri_avain = k.oo_alkamispaiva
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = k.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = k.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = k.ika
LEFT JOIN dw.d_maatjavaltiot2 d5 ON d5.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN dw.d_kieli d6 ON d6.kieli_koodi = k.suorituskieli
LEFT JOIN dw.d_kieli d6b ON d6b.kieli_koodi = k.muu_suorituskieli
LEFT JOIN dw.d_kieli d6c ON d6c.kieli_koodi = k.kielikylpykieli
LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d7 on d7.perusopetuksen_tehostettu_tuki_koodi = k.erityinen_tuki_johdettu
LEFT JOIN dw.d_vuosiluokka_tai_koulutus d9 ON d9.koodi = k.vuosiluokka_tai_koulutus
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.organisaatio_oid = k.toimipiste_oid
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = k.koulutustoimija_oid
LEFT JOIN dw.d_alueluokitus d14 ON k.kotikunta = d14.kunta_koodi


--LUKUVUOSITTAIN
DROP TABLE IF EXISTS dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain

SELECT 	
	opisk
	,tutk
	,master_oid
	,oppilaitos_oid
	,k.suoritustapa

	--aika
	,k.[vuosi]
	,d1.lukuvuosi
	
	--id
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
	,max(tilastopaiva_1_0) as 'tilastopaiva_1_0'
	,max(case when d1.kalenteri_avain >= @kuluvaLvAlku then 1 else 0 end) as 'kuluva_lv_1_0'
	,max(
		case 
			when (opisk = 1 and d1.lukuvuosi not in ('2017/2018', '2018/2019', '2019/2020'))
			  or (tutk = 1 and d1.lukuvuosi not in ('2017/2018', '2018/2019'))
			then 1
			else 0
		end
	) 
	as 'kuutioon_1_0'

INTO dw.f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain

FROM Koski_SA.dbo.esi_ja_perus_oppilaat_ja_paattaneet_valitaulu k 
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
	opisk
	,tutk
	,k.vuosi
	,d1.lukuvuosi
	,oppilaitos_oid
	,master_oid
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
