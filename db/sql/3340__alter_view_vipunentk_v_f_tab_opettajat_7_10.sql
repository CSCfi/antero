USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_opettajat_7_10]    Script Date: 21.2.2020 18:54:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER view [dbo].[v_f_tab_opettajat_7_10] as

Select
      [Tilastovuosi] = f.tilastointivuosi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
      ,[Opettajan pääasiallinen koulutusaste] = d5.koulutusaste

      ,[Toiminta: erityisopetus] = d3.kylla_ei
      ,[Toiminta: opinto-ohjaus] = d6.kylla_ei
      ,[Toiminta: VALMA] = d7.kylla_ei
      ,[Toiminta: TELMA] = d8.kylla_ei 
      --,[Maahanmuuttajien valmistava koulutus] = d9.kylla_ei
      --,[Ammatilliseen peruskoulutukseen valmistava koulutus] = d10.kylla_ei 
      --,[Kotitalousopetus] = d11.kylla_ei	  

      --,[Ei muodollista opettajan kelpoisuutta] = d17.kylla_ei
	  ,[Kelpoisuus tehtävään] = case d17.kylla_ei when 'Kyllä' then 'Ei' when 'Ei' then 'Kyllä' else d17.kylla_ei end	  
	  ,[Kelpoisuus tehtävään, tyyppi] = d39.kelpoisuus

      ,[Puuttuva kelpoisuustekijä: tutkinto tai oppimäärä] = d18.kylla_ei
      ,[Puuttuva kelpoisuustekijä: pedagogiset opinnot] = d19.kylla_ei
      ,[Puuttuva kelpoisuustekijä: vaadittava työkokemus] = d20.kylla_ei 
      --,[Puuttuva kelpoisuustekijä: muu tai ei tietoa] = d21.kylla_ei

      ,[Kelpoisuus: ammatilliset tutkinnon osat] = d12.kylla_ei 
      ,[Kelpoisuus: yhteiset tutkinnon osat] = d13.kylla_ei
      ,[Kelpoisuus: opinto-ohjaaja] = d14.kylla_ei 
      ,[Kelpoisuus: erityisopettaja] = d15.kylla_ei
      ,[Kelpoisuus: valmentava koulutus] = d38.kylla_ei 
      ,[Kelpoisuus: muu (esim. vapaa sivistyö)] = d16.kylla_ei --kuutiossa sivistyö -> sivistystyö

	  ,[Muu kelpoisuus] = d40.kylla_ei
	  ,[Muu kelpoisuus: ammatilliset tutkinnon osat] = d41.kylla_ei 
      ,[Muu kelpoisuus: yhteiset tutkinnon osat] = d42.kylla_ei
      ,[Muu kelpoisuus: opinto-ohjaaja] = d43.kylla_ei 
      ,[Muu kelpoisuus: erityisopettaja] = d44.kylla_ei
      ,[Muu kelpoisuus: valmentava koulutus] = d45.kylla_ei 
      ,[Muu kelpoisuus: muu (esim. vapaa sivistyö)] = d46.kylla_ei --kuutiossa sivistyö -> sivistystyö

	  ,[Opettajan eniten opettama ala] = case 
											when tilastointivuosi >= 2019
											then (case d24.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d24.iscfibroad2013 end)
											else (case d24.koulutusala2002 when 'Yleissivistävä koulutus' then 'Ammattitaitoa täydentävät tutkinnon osat (yhteiset opinnot)' else d24.koulutusala2002 end)											
										 end
      ,[Opettajan eniten opettama aine] = d25.aine
	  ,[Opettajan toiseksi eniten opettama ala] = case 
													when tilastointivuosi >= 2019
													then (case d24b.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d24b.iscfibroad2013 end)
													else (case d24b.koulutusala2002 when 'Yleissivistävä koulutus' then 'Ammattitaitoa täydentävät tutkinnon osat (yhteiset opinnot)' else d24b.koulutusala2002 end)											
												 end
      ,[Opettajan toiseksi eniten opettama aine] = d25b.aine
	  ,[Opettajan kolmanneksi eniten opettama ala] = case 
														when tilastointivuosi >= 2019
														then (case d24c.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Yhteiset tutkinnon osat' else d24c.iscfibroad2013 end)
														else (case d24c.koulutusala2002 when 'Yleissivistävä koulutus' then 'Ammattitaitoa täydentävät tutkinnon osat (yhteiset opinnot)' else d24c.koulutusala2002 end)											
													 end
      ,[Opettajan kolmanneksi eniten opettama aine] = d25c.aine
	  ,[Työsuhteen luonne] = d35.tyosuhteen_luonne
	  ,[Koko-/osa-aikainen] = d36.koko_osa_aikainen
	  ,[Osa-aikaisuuden syy] = d37.syy
      --,[Opettajan koulutus] = d26.koulutus
      --,[a_oppil] 
      --,[Koulutuksen järjestäjän koko (ei oppisopimus)] = d27.koko
      --,[Koulutuksen järjestäjän koko (oppisopimus)] = d28.koko
      --,[Koulutuksen järjestäjän kieli] = d29.kieli
      --,[Koulutuksen järjestäjän maakunta] = d30.maakunta
      ,[Oppilaitoksen maakunta] = d31.maakunta
	  ,[Tehtävätyyppi] = d32.tehtavatyyppi
	  ,[Ikäryhmä] = d33.ika5v
	  ,[Sukupuoli] = d34.sukupuoli

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
      ,[Huvudsaklig utbildningsform] = d5.koulutusaste_SV
	  ,[Lärarens huvudsakliga utb.område] = case 
												when tilastointivuosi >= 2019
												then (case d24.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Gemensammma examensdelar' else d24.iscfibroad2013_SV end)
												else (case d24.koulutusala2002 when 'Yleissivistävä koulutus' then 'Examensdelar som kompletterar yrkeskompetensen (gemensammma studier)' else d24.koulutusala2002_SV end) 
											end
      ,[Lärarens huvudsakliga ämne] = d25.aine_SV
      ,[Läroanstaltens landskap] = d31.maakunta_SV
	  ,[Uppgiftstyp] = d32.tehtavatyyppi_SV
	  ,[Åldersgrupp] = d33.ika5v_SV
	  ,[Kön] = d34.sukupuoli_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Language of the institution] = d1.opetuskieli_EN
      ,[Teacher's primary level] = d5.koulutusaste_EN
	  ,[Teacher's primary field] = case 
										when tilastointivuosi >= 2019
										then (case d24.iscfibroad2013 when 'Yleissivistävä koulutus' then 'Core subjects' else d24.iscfibroad2013_EN end)
										else (case d24.koulutusala2002 when 'Yleissivistävä koulutus' then 'Core subjects' else d24.koulutusala2002_EN end) 
									end
      ,[Teacher's primary subject] = d25.aine_EN
      ,[Region of the institution] = d31.maakunta_EN
	  ,[Type of task] = d32.tehtavatyyppi_EN
	  ,[Age group] = d33.ika5v_EN
	  ,[Gender] = d34.sukupuoli_EN

	  --koodit
	  ,[Koodit Oppil. maakunta] = d31.maakunta_koodi
      
 
	  --järjestyskentät
	  ,[Opetuskieli järjestys]= d1.jarjestys
	  ,[Opettajan koulutusaste järjestys] = d5.jarjestys
	  ,[Kelpoisuuden järjestys] = d39.jarjestys
	  ,[Opettajan ala järjestys] = coalesce(nullif(d24.jarjestys_iscfibroad2013, '998'), '99'+d24.jarjestys_koulutusala2002)
	  ,[Opettajan aine järjestys] = d25.jarjestys
	  ,[Opettajan ala järjestys2] = coalesce(nullif(d24b.jarjestys_iscfibroad2013, '998'), '99'+d24b.jarjestys_koulutusala2002)
	  ,[Opettajan aine järjestys2] = d25b.jarjestys
	  ,[Opettajan ala järjestys3] = coalesce(nullif(d24c.jarjestys_iscfibroad2013, '998'), '99'+d24c.jarjestys_koulutusala2002)
	  ,[Opettajan aine järjestys3] = d25c.jarjestys
	  --,[Koul järj koko ei oppis järjestys] = d27.jarjestys
	  --,[Koul järj koko oppis järjestys] = d28.jarjestys
	  --,[Koul järj kieli järjestys] = d29.jarjestys
	  --,[Koul järj maakunta järjestys] = d30.jarjestys_maakunta
	  ,[Oppilaitoksen maakunta järjestys] = d31.jarjestys_maakunta
	  ,[Tehtävätyyppi järjestys] = d32.jarjestys
	  ,[Ikä järjestys] = d33.jarjestys_ika5v
	  ,[Sukupuoli järjestys] = d34.jarjestys
	  ,[työsuhteen luonne järjestys] = d35.jarjestys
	  

      
FROM [dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus] f
LEFT JOIN dbo.d_opetuskieli2 d1 on d1.id=f.oppilaitoksen_kieli_id
LEFT JOIN dbo.d_kylla_ei d3 on d3.id=f.erityisopetus
LEFT JOIN dbo.d_opettajat_koulutusaste_amm d5 on d5.id=pääasiallinen_koulutusaste_id
LEFT JOIN dbo.d_kylla_ei d6 on d6.id=f.opinto_ohjaus
LEFT JOIN dbo.d_kylla_ei d7 on d7.id=f.valma
LEFT JOIN dbo.d_kylla_ei d8 on d8.id=f.telma
LEFT JOIN dbo.d_kylla_ei d9 on d9.id=f.mamu
LEFT JOIN dbo.d_kylla_ei d10 on d10.id=f.ammpk_valmistava
LEFT JOIN dbo.d_kylla_ei d11 on d11.id=f.kotitalousopetus
LEFT JOIN dbo.d_kylla_ei d12 on d12.id=f.kelp_amm
LEFT JOIN dbo.d_kylla_ei d13 on d13.id=f.kelp_yht
LEFT JOIN dbo.d_kylla_ei d14 on d14.id=f.kelp_opo
LEFT JOIN dbo.d_kylla_ei d15 on d15.id=f.kelp_erope
LEFT JOIN dbo.d_kylla_ei d16 on d16.id=f.kelp_muu
LEFT JOIN dbo.d_kylla_ei d17 on d17.id=f.eikelp_tehtavaan
LEFT JOIN dbo.d_kylla_ei d18 on d18.id=f.eikelp_paa
LEFT JOIN dbo.d_kylla_ei d19 on d19.id=f.eikelp_pedag
LEFT JOIN dbo.d_kylla_ei d20 on d20.id=f.eikelp_tyokok
LEFT JOIN dbo.d_kylla_ei d21 on d21.id=f.eikelp_tieto_puuttuu
--LEFT JOIN dbo.d_kylla_ei d22 on d22.id=f.kelp_kaikki
LEFT JOIN dbo.d_koulutusluokitus d24 on d24.id=f.opettajan_eniten_opettama_ala_id
LEFT JOIN dbo.d_koulutusluokitus d24b on d24b.id=f.opettajan_toiseksi_eniten_opettama_ala_id
LEFT JOIN dbo.d_koulutusluokitus d24c on d24c.id=f.opettajan_kolmanneksi_eniten_opettama_ala_id
LEFT JOIN dbo.d_opettajat_aine_amm d25 on d25.id=f.opettajan_eniten_opettama_aine_id
LEFT JOIN dbo.d_opettajat_aine_amm d25b on d25b.id=f.opettajan_toiseksi_eniten_opettama_aine_id
LEFT JOIN dbo.d_opettajat_aine_amm d25c on d25c.id=f.opettajan_kolmanneksi_eniten_opettama_aine_id
--LEFT JOIN dbo.d_koulutusluokitus d26 on d26.id=f.opettajan_koulutus_id
--LEFT JOIN dbo.d_koulutuksen_jarjestajan_koko d27 on d27.id=f.koul_jarj_koko_ei_oppis_id
--LEFT JOIN dbo.d_koulutuksen_jarjestajan_koko d28 on d28.id=f.koul_jarj_koko_oppis_id
--LEFT JOIN dbo.d_kieli2 d29 on d29.id=f.koul_jarj_kieli_id
--LEFT JOIN dbo.d_alueluokitus d30 on d30.id=f.koul_jarj_maakunta_id
LEFT JOIN dbo.d_alueluokitus d31 on d31.id=f.oppilaitoksen_maakunta_id
LEFT JOIN dbo.d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa d32 on d32.id=f.tehtavatyyppi_ammatillisessa_id
LEFT JOIN dbo.d_ika d33 on d33.id=f.ika_id
LEFT JOIN dbo.d_sukupuoli d34 on d34.id=f.sukupuoli_id
LEFT JOIN dbo.d_opettajat_tyosuhteen_luonne d35 on d35.id=f.tyosuhteen_luonne_id
LEFT JOIN dbo.d_opettajat_koko_osa_aikainen d36 on d36.id=f.koko_osa_aikainen_id
LEFT JOIN dbo.d_opettajat_osa_aikaisuuden_syy d37 on d37.id=f.osa_aikaisuuden_syy_id

LEFT JOIN dbo.d_kylla_ei d38 on d38.id=f.kelp_valm
LEFT JOIN dbo.d_opettajat_kelpoisuus_amm d39 on d39.id=f.kelp_tehtavaan_tyyppi
LEFT JOIN dbo.d_kylla_ei d40 on d40.id=f.muukelp
LEFT JOIN dbo.d_kylla_ei d41 on d41.id=f.muukelp_amm
LEFT JOIN dbo.d_kylla_ei d42 on d42.id=f.muukelp_yht
LEFT JOIN dbo.d_kylla_ei d43 on d43.id=f.muukelp_opo
LEFT JOIN dbo.d_kylla_ei d44 on d44.id=f.muukelp_erope
LEFT JOIN dbo.d_kylla_ei d45 on d45.id=f.muukelp_valm
LEFT JOIN dbo.d_kylla_ei d46 on d46.id=f.muukelp_muu

--where f.tilastointivuosi >= 2013




















GO


USE [ANTERO]