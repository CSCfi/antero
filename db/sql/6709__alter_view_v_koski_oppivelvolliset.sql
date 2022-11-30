USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvolliset]    Script Date: 30.11.2022 15:46:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_koski_oppivelvolliset] AS

SELECT --top 1000

	-- Aikamuuttujat
	 f.[tilastovuosi] as Tilastovuosi
	,CONCAT('1. ', d11.kuukausi_fi, 'ta')  as 'Tilastopäivä'
    ,d11.kuukausi_fi as Tilastokuukausi
	,f.[ajankohta] as 'Tiedon ajankohta'

	-- Henkilömuuttujat
	,d1.sukupuoli_fi as Sukupuoli
	,d2.ika_fi as Ikä
	,f.syntymavuosi as Syntymävuosi
	,d3.kunta_fi as Kotikunta
	,d3.maakunta_fi as Kotimaakunta
	,d4.kieli_fi as 'Äidinkieli'
	,d4.kieliryhma1_fi as 'Äidinkieli (ryhmä)'
	,d5.maanosa1_fi as Kansalaisuus

	,d17.selite2_fi AS 'Oppivelvollisen toiminta, taso 2'
	,d17.selite_fi AS 'Oppivelvollisen toiminta, taso 1'
	,d12.kytkin_fi as 'Suorittanut perusopetuksen oppimäärän'
	,d13.kytkin_fi as 'Oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa'

	-- Koulutusmuuttujat
	,d6.koulutusalataso1_fi  as 'Koulutusala, taso 1'
	,d6.koulutusalataso2_fi as 'Koulutusala, taso 2'
	,d6.koulutusalataso3_fi as 'Koulutusala, taso 3'
	,d6.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
	,d6.koulutusastetaso2_fi as 'Koulutusaste, taso 2'
	,d19.selite_fi as Koulutusmuoto
	,d16.selite_fi as 'Suorituksen tyyppi'
	,d15.kunta_fi as 'Perusopetuksen suorituskunta'
	,d15.maakunta_fi as 'Perusopetuksen suoritusmaakunta'
	,replace(cast(d18.vuosi as varchar), '-1', 'Ei perusopetuksen oppimäärää') as 'Perusopetuksen suoritusvuosi'
	,d18.lukukausi_fi as 'Perusopetuksen suorituskausi'

	-- Organisaatiomuuttujat
	,d7.organisaatio_fi as Oppilaitos
	,d7.oppilaitostyyppi_fi as Oppilaitostyyppi
	,d9.maakunta_fi as 'Oppilaitoksen maakunta'
	,d9.kunta_fi as 'Oppilaitoksen kunta'
	,d7.oppilaitoksenopetuskieli_fi as 'Oppilaitoksen opetuskieli'

	,d8.organisaatio_fi as 'Koulutuksen järjestäjä'
	,d10.maakunta_fi as 'Koulutuksen järjestäjän maakunta'
	,d10.kunta_fi as 'Koulutuksen järjestäjän kunta'

	-- Apumuuttujat

    ,[oppija_oid]
	,f.oppivelvollisen_toiminta --hv
	,f.suorituksen_tyyppi --hv

	-- Järjestysmuuttujat

	,d17.jarjestys AS 'Jarjestys Oppivelvollisen toiminta, taso 1'
	,d17.jarjestys2 AS 'Jarjestys Oppivelvollisen toiminta, taso 2'

	,d3.jarjestys_maakunta_koodi as 'Jarjestys Kotimaakunta'
	,d4.jarjestys_kieliryhma1 as 'Jarjestys Äidinkieliryhmä'
	,d6.jarjestys_koulutusalataso1_koodi as 'Jarjestys Koulutusala, taso 1'
	,d6.jarjestys_koulutusalataso2_koodi as 'Jarjestys Koulutusala, taso 2'
	,d6.jarjestys_koulutusalataso3_koodi as 'Jarjestys Koulutusala, taso 3'
	,d6.jarjestys_koulutusastetaso1_koodi as 'Jarjestys Koulutusaste, taso 1'
	,d6.jarjestys_koulutusastetaso2_koodi as 'Jarjestys Koulutusaste, taso 2'
	,d7.jarjestys_oppilaitostyyppi_koodi as 'Jarjestys Oppilaitostyyppi'
	,d9.jarjestys_maakunta_koodi as 'Jarjestys Oppilaitoksen maakunta'
	,d9.jarjestys_kunta_koodi as 'Jarjestys Oppilaitoksen kunta'
	,d7.jarjestys_oppilaitoksenopetuskieli_koodi as 'Jarjestys Oppilaitoksen opetuskieli'
	,d10.jarjestys_maakunta_koodi as 'Jarjestys Koulutuksen järjestäjän maakunta'
	,d10.jarjestys_kunta_koodi as 'Jarjestys Koulutuksen järjestäjän kunta'
	,d15.jarjestys_kunta_koodi as 'Jarjestys Perusopetuksen suorituskunta'
	,d15.jarjestys_maakunta_koodi as 'Jarjestys Perusopetuksen suoritusmaakunta'
	,f.tilastokuukausi as 'Jarjestys Tilastokuukausi'
	,d16.jarjestys as 'Jarjestys Suorituksen tyyppi' 
	,d19.jarjestys as 'Jarjestys Koulutusmuoto'
	,3000 - d18.vuosi as 'Jarjestys Perusopetuksen suoritusvuosi'
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

GO

USE [ANTERO]