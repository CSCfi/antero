USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_tuva_opiskelijat_kuukausittainen_cultures]    Script Date: 13.3.2023 10:32:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE   VIEW [dw].[v_koski_tuva_opiskelijat_kuukausittainen_cultures] AS

SELECT --top 1000

	-- FI
	-- Aikamuuttujat
	tilastovuosi_fi												= f.[tilastovuosi]
	,tilastokuukausi_fi											= d11.kuukausi_fi
	,opiskeluoikeus_alkanut_tilastokuukauden_aikana_fi			= d14.kytkin_fi
	,opiskeluoikeuden_alkamisvuosi_fi							= d13.vuosi
	,opiskeluoikeuden_alkamiskuukausi_fi						= d13.kuukausi_fi
	,opiskeluoikeuden_alkamisajankohta_fi						= f.oo_alkamisajankohta

	-- Henkil�muuttujat
	,ika_fi														= d2.ikaryhma6_fi
	,sukupuoli_fi												= d1.sukupuoli_fi
	,aidinkieli_ryhma_fi										= d4.kieliryhma1_fi
	,aidinkieli_fi												= d4.kieli_fi
	,kansalaisuus_ryhma_fi										= d3.maanosa1_fi
	,kansalaisuus_maanosa_fi									= d3.maanosa_fi
	,kansalaisuus_tarkka_fi										= d3.maatjavaltiot2_fi

	-- Koulutusmuuttujat
	,lukuvuosi_fi												= d11.lukuvuosi
	,lukukausi_fi												= d11.lukukausi_fi
	,erityisopetus_fi											= d5.erityisopetus_ryhma_fi
	,majoitus_fi												= d10.kytkin_fi
	,suorituskieli_fi											= d12.kieli_fi

	-- Organisaatiomuuttujat
	,oppilaitos_fi												= d7.organisaatio_fi
	,oppilaitoksen_maakunta_fi									= d9.maakunta_fi
	,oppilaitoksen_kunta_fi										= d9.kunta_fi
	,oppilaitoksen_opetuskieli_fi								= d7.oppilaitoksenopetuskieli_fi
	,koulutuksen_jarjestaja_fi									= d6.organisaatio_fi
	,koulutuksen_jarjestajan_yritysmuoto_fi						= d6.koulutuksen_jarjestajan_yritysmuoto
	,rahoitusjarjestelma_fi										= case
																	when f.[tuva_jarjestamislupa] = 'ammatillinen' then 'Ammatillisen koulutuksen rahoitusj�rjestelm� (TUVA)'
																	when f.[tuva_jarjestamislupa] = 'lukio' then 'Lukiokoulutuksen rahoitusj�rjestelm� (TUVA)'
																	when f.[tuva_jarjestamislupa] = 'perusopetus' then 'Perusopetuksen rahoitusj�rjestelm� (TUVA)'
																end
	,toimipiste_fi												= d8.organisaatio_fi
	,oppilaitoksen_avi_fi										= d9.avi_fi
	,oppilaitoksen_ely_fi										= d9.ely_fi

	-- SV
	-- Aikamuuttujat
	,tilastovuosi_sv											= f.[tilastovuosi]
	,tilastokuukausi_sv											= d11.kuukausi_sv
	,opiskeluoikeus_alkanut_tilastokuukauden_aikana_sv			= d14.kytkin_sv
	,opiskeluoikeuden_alkamisvuosi_sv							= d13.vuosi
	,opiskeluoikeuden_alkamiskuukausi_sv						= d13.kuukausi_sv
	,opiskeluoikeuden_alkamisajankohta_sv						= f.oo_alkamisajankohta

	-- Henkil�muuttujat
	,ika_sv 													= d2.ikaryhma6_sv
	,sukupuoli_sv												= d1.sukupuoli_sv
	,aidinkieli_ryhma_sv										= d4.kieliryhma1_sv
	,aidinkieli_sv												= d4.kieli_sv
	,kansalaisuus_ryhma_sv										= d3.maanosa1_sv
	,kansalaisuus_maanosa_sv									= d3.maanosa_sv
	,kansalaisuus_tarkka_sv										= d3.maatjavaltiot2_sv

	-- Koulutusmuuttujat
	,lukuvuosi_sv												= d11.lukuvuosi
	,lukukausi_sv												= d11.lukukausi_sv
	,erityisopetus_sv											= d5.erityisopetus_ryhma_sv
	,majoitus_sv												= d10.kytkin_sv
	,suorituskieli_sv											= d12.kieli_sv

	-- Organisaatiomuuttujat
	,oppilaitos_sv												= d7.organisaatio_sv
	,oppilaitoksen_maakunta_sv									= d9.maakunta_sv
	,oppilaitoksen_kunta_sv										= d9.kunta_sv
	,oppilaitoksen_opetuskieli_sv								= d7.oppilaitoksenopetuskieli_sv
	,koulutuksen_jarjestaja_sv									= d6.organisaatio_sv
	,koulutuksen_jarjestajan_yritysmuoto_sv						= d6.koulutuksen_jarjestajan_yritysmuoto_sv
	,rahoitusjarjestelma_sv										= case
																	when f.[tuva_jarjestamislupa] = 'ammatillinen' then 'Finansieringssystemet f�r yrkesutbildning (Hux)'
																	when f.[tuva_jarjestamislupa] = 'lukio' then 'Finansieringssystemet f�r gymnasieutbildning (Hux)'
																	when f.[tuva_jarjestamislupa] = 'perusopetus' then 'Finansieringssystemet f�r den grundl�ggande utbildningen (Hux)'
																end
	,toimipiste_sv												= d8.organisaatio_sv
	,oppilaitoksen_avi_sv										= d9.avi_sv
	,oppilaitoksen_ely_sv										= d9.ely_sv

	-- Apumuuttujat
	,apusarake_oppija_oid										= f.[oppija_oid]
	,apusarake_opiskeluoikeus_oid								= f.opiskeluoikeus_oid
	,apusarake_tila_20_9										= f.tila_20_9

	-- J�rjestysmuuttujat
	,jarjestys_tilastokuukausi									= d11.kuukausi
	,jarjestys_opiskeluoikeuden_alkamiskuukausi					= d13.kuukausi
	,jarjestys_ika												= d2.jarjestys_ikaryhma6
	,jarjestys_kansalaisuus_ryhma								= case
																	when d3.maanosa1_koodi = '-1' then '99'
																	else d3.maanosa1_koodi
																end
	,jarjestys_aidinkieli_ryhma									= case
																	when d4.kieliryhma1_koodi = '-1' then '99'
																	else d4.kieliryhma1_koodi
																end
	,jarjestys_erityisopetus									= d5.jarjestys_erityisopetus_koodi
	,jarjestys_oppilaitoksen_opetuskieli						= d7.jarjestys_oppilaitoksenopetuskieli_koodi
	,jarjestys_oppilaitoksen_maakunta							= d9.jarjestys_maakunta_koodi
	,jarjestys_oppilaitoksen_kunta								= d9.jarjestys_kunta_koodi

FROM [ANTERO].[dw].[f_koski_tuva_opiskelijat_kuukausittainen] f
LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
LEFT JOIN [ANTERO].[dw].[d_ika] d2 on d2.id = f.d_ika_id
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d3 on d3.id = f.d_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_kieli] d4 on d4.id = f.d_aidinkieli_id
LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d5 on d5.erityisopetus_koodi = f.erityisopetus
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d6 on d6.id = f.d_koulutuksen_jarjestaja_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d7 on d7.id = f.d_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d8 on d8.id = f.d_toimipiste_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d9 on d9.id = f.d_alueluokitus_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d10 on d10.id = f.d_kytkin_majoitus_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d11 on d11.id = d_kalenteri_id
LEFT JOIN [ANTERO].[dw].[d_kieli] d12 on d12.id = f.d_suorituskieli_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d13 ON d13.id = f.d_kalenteri_oo_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d14 ON d14.kytkin_koodi = f.oo_alkanut_kuussa_1_0




GO


