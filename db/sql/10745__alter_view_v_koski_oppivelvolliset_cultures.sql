USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvolliset_cultures]    Script Date: 15.4.2025 9.17.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_koski_oppivelvolliset_cultures] AS

SELECT 

	-- Aikamuuttujat
	 f.[tilastovuosi] as tilastovuosi_fi
	,f.[tilastovuosi] as tilastovuosi_sv
	,CONCAT('1. ', d11.kuukausi_fi, 'ta')  as tilastopaiva_fi
	,CONCAT('1 ', d11.kuukausi_sv)  as tilastopaiva_sv
    ,d11.kuukausi_fi as tilastokuukausi_fi
	,d11.kuukausi_sv as tilastokuukausi_sv

	-- Henkilömuuttujat
	,d1.sukupuoli_fi as sukupuoli_fi
	,d1.sukupuoli_sv as sukupuoli_sv
	,d2.ika_fi as ika_fi
	,d2.ika_sv as ika_sv
	,f.syntymavuosi as syntymavuosi_fi
	,f.syntymavuosi as syntymavuosi_sv

	,d3.kunta_fi as kotikunta_fi
	,d3.kunta_sv as kotikunta_sv
	,d3.maakunta_fi as kotimaakunta_fi
	,d3.maakunta_sv as kotimaakunta_sv
	,d3.hyvinvointialue_fi as kotikunnan_hyvinvointialue_fi
	,d3.hyvinvointialue_sv as kotikunnan_hyvinvointialue_sv
	,d4.kieli_fi as aidinkieli_fi
	,d4.kieli_sv as aidinkieli_sv
	,d4.kieliryhma2_fi as aidinkieli_ryhma_fi
	,d4.kieliryhma2_sv as aidinkieli_ryhma_sv
	,d5.maanosa1_fi as kansalaisuus_fi
	,d5.maanosa1_sv as kansalaisuus_sv

	,d17.selite2_fi AS oppivelvollisen_toiminta_taso_2_fi
	,d17.selite2_sv AS oppivelvollisen_toiminta_taso_2_sv
	,d17.selite_fi AS oppivelvollisen_toiminta_taso_1_fi
	,d17.selite_sv AS oppivelvollisen_toiminta_taso_1_sv
	,d12.kytkin_fi as suorittanut_perusopetuksen_oppimaaran_fi
	,d12.kytkin_sv as suorittanut_perusopetuksen_oppimaaran_sv
	,d13.kytkin_fi as oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_fi
	,d13.kytkin_sv as oppivelvollisuuden_suorittamiseen_kelpaavassa_koulutuksessa_sv

	-- Koulutusmuuttujat
	,d6.koulutusalataso1_fi  as koulutusala_taso_1_fi
	,d6.koulutusalataso1_sv  as koulutusala_taso_1_sv
	,d6.koulutusalataso2_fi as koulutusala_taso_2_fi
	,d6.koulutusalataso2_sv as koulutusala_taso_2_sv
	,d6.koulutusalataso3_fi as koulutusala_taso_3_fi
	,d6.koulutusalataso3_sv as koulutusala_taso_3_sv
	,d6.koulutusastetaso1_fi as koulutusaste_taso_1_fi
	,d6.koulutusastetaso1_sv as koulutusaste_taso_1_sv
	,d6.koulutusastetaso2_fi as koulutusaste_taso_2_fi
	,d6.koulutusastetaso2_sv as koulutusaste_taso_2_sv
	,d19.selite_fi as koulutusmuoto_fi
	,d19.selite_sv as koulutusmuoto_sv
	,d16.selite_fi as suorituksen_tyyppi_fi
	,d16.selite_sv as suorituksen_tyyppi_sv
	,d15.kunta_fi as perusopetuksen_suorituskunta_fi
	,d15.kunta_sv as perusopetuksen_suorituskunta_sv
	,d15.maakunta_fi as perusopetuksen_suoritusmaakunta_fi
	,d15.maakunta_sv as perusopetuksen_suoritusmaakunta_sv
	,replace(cast(d18.vuosi as varchar), '-1', 'Ei perusopetuksen oppimäärää') as perusopetuksen_suoritusvuosi_fi
	,replace(cast(d18.vuosi as varchar), '-1', 'Ingen lärokurs för den grundläggande utbildningen') as perusopetuksen_suoritusvuosi_sv
	,d18.lukukausi_fi as perusopetuksen_suorituskausi_fi
	,d18.lukukausi_sv as perusopetuksen_suorituskausi_sv
	,d20.erityisopetus_ryhma_fi as erityisopetus_fi
	,d20.erityisopetus_ryhma_sv as erityisopetus_sv
	,d21.selite_fi as pidennetty_oppivelvollisuus_fi
	,d21.selite_sv as pidennetty_oppivelvollisuus_sv
	,d22.selite_fi as perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_fi
	,d22.selite_sv as perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus_sv

	-- Organisaatiomuuttujat
	,d7.organisaatio_fi as oppilaitos_fi
	,d7.organisaatio_sv as oppilaitos_sv
	,d7.oppilaitostyyppi_fi as oppilaitostyyppi_fi
	,d7.oppilaitostyyppi_sv as oppilaitostyyppi_sv
	,d9.maakunta_fi as oppilaitoksen_maakunta_fi
	,d9.maakunta_sv as oppilaitoksen_maakunta_sv
	,d9.hyvinvointialue_fi as oppilaitoksen_hyvinvointialue_fi
	,d9.hyvinvointialue_sv as oppilaitoksen_hyvinvointialue_sv
	,d9.kunta_fi as oppilaitoksen_kunta_fi
	,d9.kunta_sv as oppilaitoksen_kunta_sv
	,d7.oppilaitoksenopetuskieli_fi as oppilaitoksen_opetuskieli_fi
	,d7.oppilaitoksenopetuskieli_sv as oppilaitoksen_opetuskieli_sv

	,d8.organisaatio_fi as koulutuksen_jarjestaja_fi
	,d8.organisaatio_sv as koulutuksen_jarjestaja_sv
	,d10.maakunta_fi as koulutuksen_jarjestajan_maakunta_fi
	,d10.maakunta_fi as koulutuksen_jarjestajan_maakunta_sv
	,d10.hyvinvointialue_fi as koulutuksen_jarjestajan_hyvinvointialue_fi
	,d10.hyvinvointialue_sv as koulutuksen_jarjestajan_hyvinvointialue_sv
	,d10.kunta_fi as koulutuksen_jarjestajan_kunta_fi
	,d10.kunta_sv as koulutuksen_jarjestajan_kunta_sv

	-- Apumuuttujat

    ,[master_oid] as apusarake_oppija_oid
	,f.[ajankohta] as apusarake_tiedon_ajankohta

	-- Järjestysmuuttujat

	,d17.jarjestys AS jarjestys_oppivelvollisen_toiminta_taso_1
	,d17.jarjestys2 AS jarjestys_oppivelvollisen_toiminta_taso_2

	,d3.jarjestys_maakunta_koodi as jarjestys_kotimaakunta
	,d3.jarjestys_hyvinvointialue_koodi as jarjestys_kotikunnan_hyvinvointialue
	,d4.jarjestys_kieliryhma2 as jarjestys_aidinkieli_ryhma
	,d6.jarjestys_koulutusalataso1_koodi as jarjestys_koulutusala_taso_1
	,d6.jarjestys_koulutusalataso2_koodi as jarjestys_koulutusala_taso_2
	,d6.jarjestys_koulutusalataso3_koodi as jarjestys_koulutusala_taso_3
	,d6.jarjestys_koulutusastetaso1_koodi as jarjestys_koulutusaste_taso_1
	,d6.jarjestys_koulutusastetaso2_koodi as jarjestys_koulutusaste_taso_2
	,d7.jarjestys_oppilaitostyyppi_koodi as jarjestys_oppilaitostyyppi
	,d9.jarjestys_maakunta_koodi as jarjestys_oppilaitoksen_maakunta
	,d9.jarjestys_kunta_koodi as jarjestys_oppilaitoksen_kunta
	,d9.jarjestys_hyvinvointialue_koodi as jarjestys_oppilaitoksen_hyvinvointialue
	,d7.jarjestys_oppilaitoksenopetuskieli_koodi as jarjestys_oppilaitoksen_opetuskieli
	,d10.jarjestys_maakunta_koodi as jarjestys_koulutuksen_jarjestajan_maakunta
	,d10.jarjestys_kunta_koodi as jarjestys_koulutuksen_jarjestajan_kunta
	,d10.jarjestys_hyvinvointialue_koodi as jarjestys_koulutuksen_jarjestajan_hyvinvointialue
	,d15.jarjestys_kunta_koodi as jarjestys_perusopetuksen_suorituskunta
	,d15.jarjestys_maakunta_koodi as jarjestys_perusopetuksen_suoritusmaakunta
	,f.tilastokuukausi as jarjestys_tilastokuukausi
	,f.tilastokuukausi as jarjestys_tilastopaiva
	,d16.jarjestys as jarjestys_suorituksen_tyyppi 
	,d19.jarjestys as jarjestys_koulutusmuoto
	,d20.jarjestys_erityisopetus_ryhma as jarjestys_erityisopetus
	,d21.jarjestys as jarjestys_pidennetty_oppivelvollisuus
	,d22.jarjestys as jarjestys_perusopetuksen_yksilollistetty_oppimaara_ja_toiminta_alueittain_jarjestetty_opetus
	,3000 - d18.vuosi as jarjestys_perusopetuksen_suoritusvuosi
FROM [ANTERO].[dw].[f_koski_oppivelvolliset] f
LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
LEFT JOIN [ANTERO].[dw].[d_ika] d2 on d2.id = f.d_ika_id 
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d3 on d3.id = f.d_alueluokitus_id 
LEFT JOIN [ANTERO].[dw].[d_kieli] d4 on d4.id = f.d_kieli_id 
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d5 on d5.id = f.d_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d6 on d6.id = f.d_koulutusluokitus_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d7 on d7.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d8 on d8.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d9 on d9.kunta_koodi = d7.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d10 on d10.kunta_koodi = d8.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d11 on d11.kalenteri_avain = f.ajankohta
LEFT JOIN [ANTERO].[dw].[d_kytkin] d12 on d12.id = f.d_kytkin_suorittanut_perusopetuksen_oppimaaran_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d13 on d13.id = f.d_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d14 on d14.id = f.d_organisaatioluokitus_perusopetuksen_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d15 on d15.kunta_koodi = d14.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_koski_suorituksen_tyyppi] d16 on d16.koodi = f.suorituksen_tyyppi
LEFT JOIN [ANTERO].[dw].[d_oppivelvollisen_toiminta] d17 on d17.koodi = f.oppivelvollisen_toiminta
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d18 on d18.id = f.d_kalenteri_perusopetuksen_oppimaara_suoritettu_pvm_id
LEFT JOIN [ANTERO].[dw].[d_koski_koulutusmuoto] d19 on d19.koodi = f.koulutusmuoto
LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d20 on d20.id = f.d_erityisopetus_id
LEFT JOIN [ANTERO].[dw].[d_pidennetty_oppivelvollisuus] d21 on d21.id = f.d_pidennetty_oppivelvollisuus_id
LEFT JOIN [ANTERO].[dw].[d_perusopetuksen_oppimaaran_yksilollistaminen] d22 on d22.id = f.d_perusopetuksen_oppimaaran_yksilollistaminen_id


WHERE ov_kuutioon = 1

GO

USE [ANTERO]