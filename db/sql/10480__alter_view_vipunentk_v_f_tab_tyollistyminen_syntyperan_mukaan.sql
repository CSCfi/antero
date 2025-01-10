USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tyollistyminen_syntyperan_mukaan]    Script Date: 10.1.2025 10.58.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_f_tab_tyollistyminen_syntyperan_mukaan] as

SELECT --top 1000
	 [Tilastovuosi] = tilv
	,[Sukupuoli] = d1.sukupuoli
	,[Kansalaisuus] = d2.kansalaisuus_versio1
	,[Syntyperä] = d3.syntypera
	,[Asuinmaakunta] = d4.maakunta
	,[Asuinmaakunta (tilastovuosi)] = d4h.maakunta
	,[Tutk. suoritusvuosi] = f.suorv
	,[Tutk. suor.maakunta] = d5.maakunta
	,[Tutk. suor.maakunta (tilastovuosi)] = d5h.maakunta
	,[Koulutusala, taso 1] = d8.iscfibroad2013
	,[Koulutusala, taso 2] = d8.iscfinarrow2013
	,[Koulutusala, taso 3] = d8.iscfi2013
	,[Koulutusaste, taso 1] = d9.iscle2011
	,[Koulutusaste, taso 2] = d9.Koulutusaste_taso2
	,[Oppisopimuskoulutus] = d11.oppisopimuskoulutus
	,[Maassaolo] = d14.maassaolo
	,[Ammattiasema] = d15.ammattiasema

	,lkm
	,sijoittuminen_1v_tutkinnon_jalkeen
	,sijoittuminen_3v_tutkinnon_jalkeen
	,sijoittuminen_5v_tutkinnon_jalkeen
	
	,[Tutkintolaji] = d17.tutkintolaji_tyollistymiseen
	,[Pääasiallinen toiminta] = d18.paaasiallinen_toiminta_ja_maasta_muuttaneet
	,[Pääasiallinen toiminta I] = d19.paaasiallinen_toiminta_okm
	,[Pääasiallinen toiminta II] = d13.paaasiallinen_toiminta_versio2
	,[Koulutussektori] = d23.koulutussektori
	,[Rahoituslähde] = d24.rahoituslahde
	,[Kansainvälinen opiskelija] = d25.kylla_ei

	--koodit
	,[Koodit Asuinmaakunta] = d4.maakunta_koodi
	,[Koodit Tutk. suor.maakunta] = d5.maakunta_koodi
	,[Koodit Koulutusala, taso 1] = d8.iscfibroad2013_koodi
	,[Koodit Koulutusala, taso 2] = d8.iscfinarrow2013_koodi
	,[Koodit Koulutusala, taso 3] = d8.iscfi2013_koodi
	,[Koodit Koulutusaste, taso 1] = d9.iscle2011_koodi
	,[Koodit Koulutusaste, taso 2] = d9.Koulutusaste_taso2_koodi
	,[Koodit Pääasiallinen toiminta II] = d13.paaasiallinen_toiminta_versio2_koodi
	,[Koodit Koulutussektori] = d23.koulutussektori_koodi --piilosuodatin

	--jarjestykset
	,d1.jarjestys as jarjestys_sukupuoli
	,d2.jarjestys as jarjestys_kansalaisuus
	,d3.jarjestys as jarjestys_syntypera
	,d4.jarjestys_maakunta as jarjestys_asuinmaakunta
	,d4h.jarjestys_maakunta as jarjestys_asuinmaakunta_tilastovuosi
	,d5.jarjestys_maakunta as jarjestys_tutk_suor_maakunta
	,d5h.jarjestys_maakunta as jarjestys_tutk_suor_maakunta_tilastovuosi
	,d8.jarjestys_iscfibroad2013
	,d8.jarjestys_iscfinarrow2013
	,d8.jarjestys_iscfi2013
	,[jarjestys_iscle] = d9.jarjestys_iscle2011 --tämä väärä nimi kuutiossa
	,d9.jarjestys_Koulutusaste_taso2
	,d11.jarjestys as jarjestys_oppisopimuskoulutus
	,d14.jarjestys as jarjestys_maassaolo
	,d15.jarjestys as jarjestys_ammattiasema
	,d17.jarjestys as jarjestys_tutkintolaji
	,d18.jarjestys as jarjestys_paaasiallinen_toiminta
	,d19.jarjestys as jarjestys_paaasiallinen_toiminta_i
	,d13.jarjestys as jarjestys_paaasiallinen_toiminta_ii
	,d23.jarjestys as jarjestys_koulutussektori
	,d24.jarjestys as jarjestys_rahoituslahde
	,d25.jarjestys as jarjestys_kansainvalinen_opiskelija

FROM VipunenTK.dbo.f_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan f

LEFT JOIN dbo.d_sukupuoli AS d1 ON d1.id = f.sp_id
LEFT JOIN dbo.d_kansalaisuus_versio1 AS d2 ON d2.id = f.kansalr1_id
LEFT JOIN dbo.d_syntypera AS d3 ON d3.id = f.syntyp2_id
LEFT JOIN dbo.d_alueluokitus AS d4 ON d4.id = f.tilvasmaak_id
LEFT JOIN dbo.d_alueluokitus_historia AS d4h ON d4h.id = f.tilvasmaak_id
LEFT JOIN dbo.d_alueluokitus AS d5 ON d5.id = f.tutkmaak_id
LEFT JOIN dbo.d_alueluokitus_historia AS d5h ON d5h.id = f.tutkmaak_id
LEFT JOIN dbo.d_koulutusluokitus AS d8 ON d8.id = f.iscfi2013_id
LEFT JOIN dbo.d_koulutusluokitus_historia AS d8h ON d8h.id = f.iscfi2013_historia_id
LEFT JOIN dbo.d_koulutusluokitus AS d9 ON d9.id = f.kaste_t2_id
LEFT JOIN dbo.d_koulutusluokitus_historia AS d9h ON d9h.id = f.kaste_t2_historia_id
LEFT JOIN dbo.d_oppisopimuskoulutus AS d11 ON d11.id = f.oppis_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_versio2 AS d13 ON d13.id = f.ptoim1r6_id --ptoim1r6 <-> ptoim1r2 pl. varusmies- & siviilipalvelus
LEFT JOIN dbo.d_maassaolo AS d14 ON d14.id = f.maassaolo_id
LEFT JOIN dbo.d_ammattiasema AS d15 ON d15.id = f.amas_id
LEFT JOIN dbo.d_tutkintolaji_tyollistymiseen AS d17 ON d17.id = f.tutkintolaji_tyollistymiseen_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_ja_maasta_muuttaneet AS d18 ON d18.id = f.paaasiallinen_toiminta_ja_maasta_muuttaneet_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_okm AS d19 ON d19.id = f.paaasiallinen_toiminta_okm_id
LEFT JOIN dbo.d_koulutussektori d23 ON d23.id = f.sektori_id
LEFT JOIN dbo.d_rahoituslahde_versio2 d24 on d24.id=f.rahlahde_v2_id
LEFT JOIN dbo.d_kylla_ei d25 ON d25.id = f.kvopisk_id

WHERE d9.Koulutusaste_taso2_koodi not in ('73','81') --sovittu poistettavan lääk. erik.koulutukset sekä lis. tutkinnot

GO


