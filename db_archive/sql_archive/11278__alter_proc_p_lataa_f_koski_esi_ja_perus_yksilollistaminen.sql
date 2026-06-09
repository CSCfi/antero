USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_esi_ja_perus_yksilollistaminen] AS

DROP TABLE IF EXISTS dw.f_koski_esi_ja_perus_yksilollistaminen

SELECT
	t1.tilastovuosi

	,t1.opiskeluoikeus_oid
	,t1.paatason_suoritus_id
	,t1.master_oid
	,t2.oppiaineita_yksilollistetty_lkm
	,t2.ei_oppiainesuorituksia
	,t1.opiskelee_toiminta_alueittain

	,d_sukupuoli_id = coalesce(d1.id, -1)
	,d_ika_id = coalesce(d2.id, -1)
	,d_kieli_id = coalesce(d3.id, -1)
	,d_maatjavaltiot2_id = coalesce(d4.id, -1)
	,d_erityinen_tuki_johdettu_id = coalesce(d5.id, -1)
	,d_kytkin_id_erityisen_tuen_paatos = coalesce(d6.id, -1)
	,d_kytkin_id_pidennetty_oppivelvollisuus = coalesce(d7.id, -1)
	,d_kytkin_id_opiskelee_toiminta_alueittain = coalesce(d8.id, -1)

	,d_vuosiluokka_tai_koulutus_id = coalesce(d9.id, -1)
	,d_perusopetus_oppiaine_ja_oppimaara_id_AI_oppimaara = coalesce(d10.id, -1)
	,d_kytkin_id_AI_oppimaara_yksilollistetty = coalesce(d11.id, -1)
	,d_kytkin_id_AI_yksilollistetty = coalesce(d12.id, -1)
	,d_kytkin_id_MA_yksilollistetty = coalesce(d13.id, -1)
	,d_perusopetuksen_oppimaaran_yksilollistaminen_id = coalesce(d14.id, -1)

	,d_organisaatioluokitus_id_oppilaitos = coalesce(d15.id, -1)

INTO dw.f_koski_esi_ja_perus_yksilollistaminen

FROM VipunenTK_SA.dbo.esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara t1
LEFT JOIN VipunenTK_SA.dbo.esi_ja_perus_yksilollistaminen_oppiainesuoritukset t2 ON t2.paatason_suoritus_id = t1.paatason_suoritus_id
LEFT JOIN dw.d_sukupuoli d1 ON d1.sukupuoli_koodi = t1.sukupuoli
LEFT JOIN dw.d_ika d2 ON d2.ika_avain = t1.ika
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = t1.aidinkieli
LEFT JOIN dw.d_maatjavaltiot2 d4 ON d4.maatjavaltiot2_koodi = t1.kansalaisuus
LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d5 ON d5.perusopetuksen_tehostettu_tuki_koodi = t1.erityinen_tuki_johdettu
LEFT JOIN dw.d_kytkin d6 ON d6.kytkin_koodi = t1.erityisen_tuen_paatos
LEFT JOIN dw.d_kytkin d7 ON d7.kytkin_koodi = t1.pidennetty_oppivelvollisuus
LEFT JOIN dw.d_kytkin d8 ON d8.kytkin_koodi = t1.opiskelee_toiminta_alueittain
LEFT JOIN dw.d_vuosiluokka_tai_koulutus d9 ON d9.koodi = t1.vuosiluokka
LEFT JOIN dw.d_perusopetus_oppiaine_ja_oppimaara d10 ON d10.koodisto = 'oppiaineaidinkielijakirjallisuus' AND d10.koodi = t1.AI_oppimaara
LEFT JOIN dw.d_kytkin d11 ON d11.kytkin_koodi = t1.AI_oppimaara_yksilollistetty
LEFT JOIN dw.d_kytkin d12 ON d12.kytkin_koodi = t2.AI_yksilollistetty
LEFT JOIN dw.d_kytkin d13 ON d13.kytkin_koodi = t2.MA_yksilollistetty
LEFT JOIN VipunenTK.dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d14
	ON d14.perusopetuksen_oppimaaran_yksilollistaminen_koodi 
	= 'yks'
		+ case 
			when t1.opiskelee_toiminta_alueittain = 1 then 't'
			when t2.oppiaineita_yksilollistetty_lkm = 1 then '1'
			when t2.oppiaineita_yksilollistetty_lkm between 2 and 3 then '2'
			when t2.oppiaineita_yksilollistetty_lkm > 3 then '4'
			else '0' --Näkymässä erotellaan vielä muista kuin toiminta-alueittain opiskelevista "ei tietoa oppiainesuorituksista" -tapaukset.
		end
LEFT JOIN dw.d_organisaatioluokitus d15 ON d15.organisaatio_oid = t1.oppilaitos_oid

GO
