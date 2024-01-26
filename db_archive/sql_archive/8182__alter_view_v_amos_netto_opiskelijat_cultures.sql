USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_netto_opiskelijat_cultures]    Script Date: 9.10.2023 17:37:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_netto_opiskelijat_cultures] AS

--Käytetään raportilla Oppisopimuksen koulutuskorvauksen lisärahoituksen seurantaraportti (Live), sekä vastaavan jäädytetyn raportin pohjana.

SELECT
	[tilastovuosi_fi]
	,[tilastokuukausi_fi]
	,[sukupuoli_fi]
	,[aidinkieli_fi]
	,[ika_fi]
	,[ikaryhma_fi]
	,[kansalaisuus_fi]
	,[kansalaisuus_maanosa_fi]
	,[tutkintotyypin_ryhma_fi]
	,[tutkintotyyppi_fi]
	,[tutkinto_fi]
	,[koulutusala_taso_3_fi]
	,[koulutusala_taso_2_fi]
	,[koulutusala_taso_1_fi]
	,[osaamisala_fi]
	,[suorituskieli_fi]
	,[osa_aikaisuus_fi]
	,[suorituksen_tyyppi_fi]
	,[kustannusryhma_fi]
	,[rahoitusmuoto_fi]
	,[erityisopetus_fi]
	,[majoitus_fi]
	,[oppisopimuskoulutus_fi]
	,[koulutussopimus_fi]
	,[vankilaopetus_fi]
	,[henkilostokoulutus_fi]
	,[tyovoimakoulutus_fi]
	,[oppilaitos_fi]
	--
	,[koulutuksen_jarjestaja_fi] = dx.nimi_amos_spl
	--
	,[toimipiste_fi]
	,[oppilaitoksen_kunta_fi]
	,[oppilaitoksen_maakunta_fi]
	,[oppilaitoksen_avi_fi]
	,[oppilaitoksen_ely_fi]
	,[oppilaitoksen_opetuskieli_fi]
	,v.[oppilaitostyyppi_fi]
	--
	,[koulutuksen_jarjestajan_kunta_fi] = dz.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = dz.maakunta_fi
	,[koulutuksen_jarjestajan_ely_fi] = dz.ely_fi
	,[koulutuksen_jarjestajan_avi_fi] = dz.avi_fi
	--
	--,[koulutuksen_jarjestajan_omistajatyyppi_fi]
	,[oppisopimuksen_suoritusosuus_fi]
	,[koulutussopimuksen_suoritusosuus_fi]
	,[oppisopimus_koulutussopimus_fi]
	,[ika_opiskeluoikeuden_alkamisvuonna_fi]
	,[ika_opiskeluoikeuden_alkamishetkella_fi]
	,[ika_oppisopimusjakson_alkamisvuonna_fi]
	,[ika_oppisopimusjakson_alkamishetkella_fi]
	,[opiskeluoikeuden_alkamisvuosi_fi]
	,[opiskeluoikeuden_alkamiskuukausi_fi]
	,[oppisopimusjakson_alkamisvuosi_fi]
	,[oppisopimusjakson_alkamiskuukausi_fi]
	,[apusarake_oppija_oid]
	,[apusarake_opiskeluoikeus_oid]
	,[apusarake_pv_kk]
	,[apusarake_ryhma]
	,[apusarake_opiskelija]
	,[apusarake_uusi_opiskelija]
	,[apusarake_uusi_opiskelija_rahoitus]
	,[apusarake_opiskelijat_netto]
	,[apusarake_tutkinnon_suorittanut]
	,[apusarake_eronnut_opiskelija]
	,[apusarake_jatkaa_kj]
	,[apusarake_jatkaa_oppilaitos]
	,[apusarake_jatkaa_tutkintotyyppi]
	,[apusarake_jatkaa_ammatillinen]
	,[apusarake_jatkaa_yleissivistava]
	,[apusarake_jatkaa_valmentava]
	,[apusarake_jatkaa_lukio_valmentava]
	,[apusarake_jatkaa_amm_valmentava]
	,[apusarake_jatkaa_muu_ammatillinen]
	,[apusarake_jatkaa_amm_tutkintokoulutus]
	,[apusarake_jatkaa_tutkinto_boo]
	,[apusarake_jatkaa_koulutusala_taso3_boo]
	,[apusarake_jatkaa_koulutusala_taso2_boo]
	,[apusarake_jatkaa_koulutusala_taso1_boo]
	,[apusarake_jatkaa_koulutusmuoto_boo]
	,[apusarake_jatkaa_amm_yleissiv_boo]
	,[apusarake_jatkaa_toinen_aste_boo]
	,[apusarake_jatkaa_koulutusjarjestelma_boo]
	--
	,[koodit_koulutuksen_jarjestaja] = dx.ytunnus_amos_spl
	--
	,[koodit_oppilaitos]
	,[koodit_tutkinto]
	,[koodit_osaamisala]
	,[koodit_oppisopimuskoulutus]
	,[koodit_koulutussopimus]
	,[jarjestys_kustannusryhma]
	,[jarjestys_rahoitusmuoto]
	,[jarjestys_tilastokuukausi]
	,[jarjestys_sukupuoli]
	,[jarjestys_ikaryhma]
	,[jarjestys_ika]
	,[jarjestys_aidinkieli]
	,[jarjestys_kansalaisuus]
	,[jarjestys_kansalaisuus_maanosa]
	,[jarjestys_koulutusala_taso1]
	,[jarjestys_koulutusala_taso2]
	,[jarjestys_koulutusala_taso3]
	,[jarjestys_oppisopimuskoulutus]
	,[jarjestys_koulutussopimus]
	,[jarjestys_vankila]
	,[jarjestys_henkilosto]
	,[jarjestys_tyovoima]
	--
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = dz.jarjestys_maakunta_koodi
	,[jarjestys_koulutuksen_jarjestajan_avi] = dz.jarjestys_avi_koodi
	,[jarjestys_koulutuksen_jarjestajan_ely] = dz.jarjestys_ely_koodi
	--
	--,[jarjestys_koulutuksen_jarjestajan_omistajatyyppi]
	,[jarjestys_oppilaitoksen_maakunta]
	,[jarjestys_oppilaitoksen_ely]
	,[jarjestys_oppilaitoksen_avi]
	,[jarjestys_oppilaitoksen_opetuskieli]
	,[jarjestys_oppilaitostyyppi]
	,[jarjestys_erityisopetus]
	,[jarjestys_majoitus]
	,[jarjestys_tutkintotyypin_ryhma]
	,[jarjestys_tutkintotyyppi]
	,[jarjestys_oppisopimus_koulutussopimus]
	,[jarjestys_ika_opiskeluoikeuden_alkamisvuonna]
	,[jarjestys_ika_opiskeluoikeuden_alkamishetkella]
	,[jarjestys_ika_oppisopimusjakson_alkamisvuonna]
	,[jarjestys_ika_oppisopimusjakson_alkamishetkella]
	,[jarjestys_opiskeluoikeuden_alkamisvuosi]
	,[jarjestys_opiskeluoikeuden_alkamiskuukausi]
	,[jarjestys_oppisopimusjakson_alkamisvuosi]
	,[jarjestys_oppisopimusjakson_alkamiskuukausi]

	,sisaltyy_amos_spl --jäädytysnäkymää varten

FROM [dw].[v_koski_amm_opiskelijat_ja_tutkinnot_cultures] v
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki dx ON dx.ytunnus_avain = v.koodit_koulutuksen_jarjestaja
LEFT JOIN dw.d_organisaatioluokitus dy ON dy.organisaatio_avain = 'koulutustoimija_' + dx.ytunnus_amos_spl
LEFT JOIN dw.d_alueluokitus dz ON dz.kunta_koodi = coalesce(dy.kunta_koodi, '-1')

WHERE [apusarake_ryhma] = 'netto'
AND (@@servername like '%tvipu%' OR [tilastovuosi_fi] > 2019)

GO
