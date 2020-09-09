USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_OPE]    Script Date: 6.3.2020 12:51:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_OPE] AS



--7.1

truncate table vipunentk.[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]

insert into vipunentk.[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]
 
SELECT tilastointivuosi = f.tilv
      ,tilv_date = f.tilv_date
      ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,oppilaitostyyppi_id = coalesce(d2.id,'-1')
      ,tyosuhde_vakinainen = f.p_tyos1
      ,tyosuhde_maara_aikainen = f.p_tyos2
      ,tyosuhde_viransijainen = f.p_tyos3
	  ,tyosuhde_virkavapaa = f.p_tyos4
      ,tyosuhde_oa_elake = f.p_tyos5
	  ,tyosuhteen_luonne_id = coalesce(d26.id,'-1') 
      ,tehtavatyyppi_perusopetuksessa_id = coalesce(d8.id,'-1')
      ,paaasiallinen_koulutusmuoto_id = coalesce(d9.id,'-1')
      ,kelp_esiopetus = f.p_k1
      ,kelp_luokanopettaja = f.p_k2
      ,kelp_aineenopettaja = f.p_k3
      ,kelp_aineenopettaja_lukio = f.p_k4
      ,kelp_erityisluokan_opettaja = f.p_k5
      ,kelp_erityisopettaja_osa_aikainen = f.p_k6
      ,kelp_oppilaanohjaaja = f.p_k7
      ,kelp_opinto_ohjaaja = f.p_k8
      ,kelp_muu = f.p_k9
      ,kelp_ei = f.p_k10
      ,kelp_kehitysvammaiset = f.p_k11
      ,oman_luokan_aste_id = coalesce(d21.id,'-1')
      ,oman_luokan_oppilasmäärä = f.p_oluom
      ,opettajan_eniten_opettama_aine_id = coalesce(d22.id,'-1')
	  ,opettajan_eniten_opettama_aine_koodi = f.p_aine
      ,sukupuoli_id = coalesce(d23.id,'-1')
      ,maakunta_oppilaitos = f.p_maakunta
      ,kuntaryhmitys_oppilaitos = coalesce(d3.id,'-1')
      ,ika_id = d24.id
	  ,kelp_id = d25.id
	  ,koko_osa_aikainen_id = coalesce(d27.id,'-1')
	  ,osa_aikaisuuden_syy_id = coalesce(d28.id,'-1')
	  ,opettajan_tunnit = f.p_opetus
	  ,resurssiopettajan_osallistuminen_id = coalesce(d29.id,'-1')
	  ,resurssiopettajan_tunnit = f.p_resu2
    
  FROM VipunenTK_DW.dbo.f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.p_okieli
  LEFT JOIN VipunenTK..d_oppilaitostyyppi d2 on d2.oppilaitostyyppi_koodi=f.p_oltyp
  LEFT JOIN VipunenTK..d_kuntaryhma d3 on d3.kuntaryhma_koodi=f.p_okunryh
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_perusopetuksessa d8 on d8.tehtavatyyppi_koodi=p_virka
  LEFT JOIN VipunenTK..d_opettajat_koulutusaste d9 on d9.koulutusaste_koodi=p_aste
  LEFT JOIN VipunenTK..d_opettajat_luokka_aste d21 on d21.luokka_aste_koodi=p_olaste
  LEFT JOIN VipunenTK..d_opettajat_aine d22 on d22.aine_koodi=p_aine
  LEFT JOIN VipunenTK..d_sukupuoli d23 on d23.sukupuoli_koodi=p_sp
  LEFT JOIN VipunenTK..d_ika d24 on d24.ika_avain=p_ika
  LEFT JOIN VipunenTK..d_opettajankelpoisuus2 d25 on d25.opettajankelpoisuus_koodi=p_kelpu
  LEFT JOIN VipunenTK..d_opettajat_tyosuhteen_luonne d26 on d26.tyosuhteen_luonne_koodi=p_tyos
  LEFT JOIN VipunenTK..d_opettajat_koko_osa_aikainen d27 on d27.koko_osa_aikainen_koodi=p_osa1
  LEFT JOIN VipunenTK..d_opettajat_osa_aikaisuuden_syy d28 on d28.syy_koodi=p_osa2
  LEFT JOIN VipunenTK..d_kylla_ei d29 on d29.kylla_ei_koodi=cast(f.p_resu1 as varchar);



--7.2

truncate table vipunentk.[dbo].[f_Opettajat_perusopetus_koulutuksen_jarjestaja_opetusryhmakoot]

insert into vipunentk.[dbo].[f_Opettajat_perusopetus_koulutuksen_jarjestaja_opetusryhmakoot]
 

SELECT tilastointivuosi = f.tilv
      ,tilv_date = f.tilv_date
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,oman_luokan_aste_id = coalesce(d2.id,'-1')
      ,oman_luokan_oppilasmäärä = f.p_oluom
      ,koulutuksen_jarjestajan_koko_id = coalesce(d3.id,'-1')
      ,koulutuksen_jarjestajan_kieli_id = coalesce(d4.id,'-1')
	  ,koulutuksen_jarjestajan_omistajatyyppi = f.p_yomist
      ,koulutuksen_jarjestajan_maakunta = f.p_ymkunta
      ,koulutuksen_jarjestajan_kuntaryhmitys = coalesce(d5.id,'-1')
    
  FROM VipunenTK_DW.[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.p_okieli
  LEFT JOIN VipunenTK..d_opettajat_luokka_aste d2 on d2.luokka_aste_koodi=p_olaste
  LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d3 on d3.koko_koodi=p_yopp19
  LEFT JOIN VipunenTK..d_kieli2 d4 on d4.kieli_koodi=p_ykieli
  LEFT JOIN VipunenTK..d_kuntaryhma d5 on d5.kuntaryhma_koodi=f.p_ykunryh;




--7.3

truncate table vipunentk.[dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]

insert into vipunentk.[dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]
 

SELECT tilastointivuosi = f.tilv
      ,tilv_date = f.tilv_date
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,tehtavatyyppi_perusopetuksessa_id = coalesce(d2.id,'-1')
      ,taydennyskoulutus_osallistuminen = [p_taydjo]
      ,taydennyskoulutus_ei_tietoa = [p_taydeit]
      ,taydennyskoulutus_ei = [p_eitayd]
      ,taydennyskoulutus_tyoaika = [p_tutktyo] 
      ,taydennyskoulutus_oma_aika = [p_tutkoma] 
      ,taydennyskoulutus_kelp_tyoaika = [p_pattyo] 
      ,taydennyskoulutus_kelp_oma_aika = [p_patoma] 
      ,taydennyskoulutus_tantaja_tyoaika = [p_henktyo]
      ,taydennyskoulutus_tantaja_oma_aika = [p_henkoma] 
      ,taydennyskoulutus_muu_tyoaika = [p_muutyo] 
      ,taydennyskoulutus_muu_oma_aika = [p_muuoma] 
      ,asiantuntijavaihto_tyoaika = [p_kanstyo]
      ,asiantuntijavaihto_oma_aika = [p_kansoma] 
      ,koulutussuunnitelma = [p_kehsuu] 
      ,sukupuoli_id = d3.id
      ,maakunta_oppilaitos = [p_maakunta] 
      ,ika_id = d4.id
	  ,kouluttautunut_mentoriksi = coalesce(f.p_mento1,'-1')
	  ,toiminut_mentorina = coalesce(f.p_mento2,'-1')
	  ,ollut_mentoroitavana = coalesce(f.p_mento3,'-1')
	  ,kouluttautunut_tyonohjaajaksi = coalesce(p_tyonoh1,'-1')
	  ,toiminut_tyonohjaajana = coalesce(p_tyonoh2,'-1')
	  ,ollut_tyonohjauksessa = coalesce(p_tyonoh3,'-1')
	  ,opettajan_tunnit = f.p_tunnit
    
  FROM VipunenTK_DW.[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.p_okieli
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_perusopetuksessa d2 on d2.tehtavatyyppi_koodi=p_virka
  LEFT JOIN VipunenTK..d_sukupuoli d3 on d3.sukupuoli_koodi=p_sp
  LEFT JOIN VipunenTK..d_ika d4 on d4.ika_avain=p_ika




--7.4

truncate table vipunentk.[dbo].[f_Opettajat_lukiokoulutus_kelpoisuus_aine]

insert into vipunentk.[dbo].[f_Opettajat_lukiokoulutus_kelpoisuus_aine]
 

SELECT tilastointivuosi = f.tilv
      ,tilv_date = f.tilv_date
      ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,tyosuhde_vakinainen = f.l_tyos1
      ,tyosuhde_maara_aikainen = f.l_tyos2
      ,tyosuhde_viransijainen = f.l_tyos3
	  ,tyosuhde_virkavapaa = f.l_tyos4
      ,tyosuhde_oa_elake = f.l_tyos5
	  ,tyosuhteen_luonne_id = coalesce(d26.id,'-1')
      ,tehtavatyyppi_perusopetuksessa_id = coalesce(d8.id,'-1')
      ,paaasiallinen_koulutusmuoto_id = coalesce(d9.id,'-1')
      ,kelp_esiopetus = f.l_k1
      ,kelp_luokanopettaja = f.l_k2
      ,kelp_aineenopettaja = f.l_k3
      ,kelp_aineenopettaja_lukio = f.l_k4
      ,kelp_erityisluokan_opettaja = f.l_k5
      ,kelp_erityisopettaja_osa_aikainen = f.l_k6
      ,kelp_oppilaanohjaaja = f.l_k7
      ,kelp_opinto_ohjaaja = f.l_k8
      ,kelp_muu = f.l_k9
      ,kelp_ei = f.l_k10
      ,kelp_kehitysvammaiset = f.l_k11
      ,opettajan_eniten_opettama_aine_id = coalesce(d22.id,'-1')
	  ,opettajan_eniten_opettama_aine_koodi = f.l_aine
      ,sukupuoli_id = coalesce(d23.id,'-1')
      ,maakunta_oppilaitos = f.l_maakunta
      ,kuntaryhmitys_oppilaitos = coalesce(d2.id,'-1')
      ,ika_id = d24.id
	  ,kelp_id = d25.id
	  ,koko_osa_aikainen_id = coalesce(d27.id,'-1')
	  ,osa_aikaisuuden_syy_id = coalesce(d28.id,'-1')
    
  FROM VipunenTK_DW.dbo.f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.l_okieli
  LEFT JOIN VipunenTK..d_kuntaryhma d2 on d2.kuntaryhma_koodi=f.l_okunryh
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_lukiokoulutuksessa d8 on d8.tehtavatyyppi_koodi=l_virka
  LEFT JOIN VipunenTK..d_opettajat_koulutusaste d9 on d9.koulutusaste_koodi=l_aste
  LEFT JOIN VipunenTK..d_opettajat_aine d22 on d22.aine_koodi=l_aine
  LEFT JOIN VipunenTK..d_sukupuoli d23 on d23.sukupuoli_koodi=l_sp
  LEFT JOIN VipunenTK..d_ika d24 on d24.ika_avain=l_ika
  LEFT JOIN VipunenTK..d_opettajankelpoisuus2 d25 on d25.opettajankelpoisuus_koodi=l_kelpu
  LEFT JOIN VipunenTK..d_opettajat_tyosuhteen_luonne d26 on d26.tyosuhteen_luonne_koodi=l_tyos
  LEFT JOIN VipunenTK..d_opettajat_koko_osa_aikainen d27 on d27.koko_osa_aikainen_koodi=l_osa1
  LEFT JOIN VipunenTK..d_opettajat_osa_aikaisuuden_syy d28 on d28.syy_koodi=l_osa2



--7.5

truncate table vipunentk.[dbo].[f_Opettajat_lukiokoulutus_koulutuksen_jarjestaja]

insert into vipunentk.[dbo].[f_Opettajat_lukiokoulutus_koulutuksen_jarjestaja]
 

SELECT tilastointivuosi = f.tilv
      ,tilv_date = f.tilv_date
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,koulutuksen_jarjestajan_koko_id = coalesce(d3.id,'-1')
      ,koulutuksen_jarjestajan_kieli_id = coalesce(d4.id,'-1')
	  ,koulutuksen_jarjestajan_omistajatyyppi = f.l_yomist
      ,koulutuksen_jarjestajan_maakunta = f.l_ymkunta
      ,koulutuksen_jarjestajan_kuntaryhmitys = coalesce(d2.id,'-1')
    
  FROM VipunenTK_DW.[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.l_okieli
  LEFT JOIN VipunenTK..d_kuntaryhma d2 on d2.kuntaryhma_koodi=f.l_ykunryh
  LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d3 on d3.koko_koodi=l_yopp21_22
  LEFT JOIN VipunenTK..d_kieli2 d4 on d4.kieli_koodi=l_ykieli



--7.6

truncate table vipunentk.[dbo].[f_Opettajat_lukiokoulutus_osallistuminen_taydennyskoulutukseen]

insert into vipunentk.[dbo].[f_Opettajat_lukiokoulutus_osallistuminen_taydennyskoulutukseen]
 

SELECT tilastointivuosi = f.tilv
      ,tilv_date = f.tilv_date
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,tehtavatyyppi_lukiokoulutuksessa_id = coalesce(d2.id,'-1')
      ,taydennyskoulutus_osallistuminen = [l_taydjo]
      ,taydennyskoulutus_ei_tietoa = [l_taydeit]
      ,taydennyskoulutus_ei = [l_eitayd]
      ,taydennyskoulutus_tyoaika = [l_tutktyo] 
      ,taydennyskoulutus_oma_aika = [l_tutkoma] 
      ,taydennyskoulutus_kelp_tyoaika = [l_pattyo] 
      ,taydennyskoulutus_kelp_oma_aika = [l_patoma] 
      ,taydennyskoulutus_tantaja_tyoaika = [l_henktyo]
      ,taydennyskoulutus_tantaja_oma_aika = [l_henkoma] 
      ,taydennyskoulutus_muu_tyoaika = [l_muutyo] 
      ,taydennyskoulutus_muu_oma_aika = [l_muuoma] 
      ,asiantuntijavaihto_tyoaika = [l_kanstyo]
      ,asiantuntijavaihto_oma_aika = [l_kansoma] 
      ,koulutussuunnitelma = [l_kehsuu] 
      ,sukupuoli_id = d3.id
      ,maakunta_oppilaitos = [l_maakunta] 
      ,ika_id = d4.id
	  ,kouluttautunut_mentoriksi = coalesce(f.l_mento1,'-1')
	  ,toiminut_mentorina = coalesce(f.l_mento2,'-1')
	  ,ollut_mentoroitavana = coalesce(f.l_mento3,'-1')
	  ,kouluttautunut_tyonohjaajaksi = coalesce(l_tyonoh1,'-1')
	  ,toiminut_tyonohjaajana = coalesce(l_tyonoh2,'-1')
	  ,ollut_tyonohjauksessa = coalesce(l_tyonoh3,'-1')
	  ,opettajan_tunnit = f.l_tunnit
    
  FROM VipunenTK_DW.[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.l_okieli
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_lukiokoulutuksessa d2 on d2.tehtavatyyppi_koodi=l_virka
  LEFT JOIN VipunenTK..d_sukupuoli d3 on d3.sukupuoli_koodi=l_sp
  LEFT JOIN VipunenTK..d_ika d4 on d4.ika_avain=l_ika




--7.7

truncate table vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli]

insert into vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli]
 

SELECT tilastointivuosi = [tilv]
      ,tilv_date = [tilv_date]
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,pääasiallinen_koulutusaste_id = coalesce(d2.id,'-1')
      ,erityisopetus = coalesce(d11.id,'-1')
      ,opinto_ohjaus = coalesce(d12.id,'-1')
      ,valma = coalesce(d13.id,'-1')
      ,telma = coalesce(d14.id ,'-1')
      ,mamu = coalesce(d15.id ,'-1')
      ,ammpk_valmistava = coalesce(d16.id ,'-1')
      ,kotitalousopetus = coalesce(d17.id,'-1')
      ,kelp_amm = coalesce(d18.id,'-1')
      ,kelp_yht = coalesce(d19.id ,'-1')
      ,kelp_opo = coalesce(d20.id ,'-1')
      ,kelp_erope = coalesce(d21.id,'-1')
	  ,kelp_valm = coalesce(d42.id,'-1')
      ,kelp_muu = coalesce(d22.id ,'-1')
      ,eikelp_tehtavaan = coalesce(d23.id,'-1')
	  ,kelp_tehtavaan_tyyppi = d43.id
      ,eikelp_paa = coalesce(d24.id,'-1')
      ,eikelp_pedag = coalesce(d25.id,'-1')
      ,eikelp_tyokok = coalesce(d26.id ,'-1')
      ,eikelp_tieto_puuttuu = coalesce(d27.id,'-1') 
	  --,kelp_kaikki = coalesce(d28.id,'-1')
	  ,muukelp = coalesce(d41.id ,'-1')
	  ,muukelp_amm = coalesce(d37.id ,'-1')
	  ,muukelp_yht = coalesce(d38.id ,'-1')
	  ,muukelp_opo = coalesce(d39.id ,'-1')
	  ,muukelp_erope = coalesce(d40.id ,'-1')
	  ,muukelp_valm = coalesce(d35.id ,'-1')
	  ,muukelp_muu = coalesce(d36.id ,'-1')
	  ,opettajan_eniten_opettama_ala_id = coalesce(d3.id,'-1')
      ,opettajan_eniten_opettama_aine_id = coalesce(d4.id,'-1')
      ,opettajan_koulutus_id = coalesce(d5.id,'-1')
      ,koul_jarj_koko = coalesce(d6a.id,'-1')
      ,koul_jarj_koko_ei_oppis_id = coalesce(d6.id,'-1')
      ,koul_jarj_koko_oppis_id = coalesce(d7.id,'-1')
      ,koul_jarj_kieli_id = coalesce(d8.id,'-1')
      ,koul_jarj_maakunta_id = coalesce(d9.id,'-1')
      ,oppilaitoksen_maakunta_id = coalesce(d10.id,'-1')

  
  FROM VipunenTK_DW.[dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.a_okieli
  LEFT JOIN VipunenTK..d_opettajat_koulutusaste_amm d2 on d2.koulutusaste_koodi = f.a_aste and tilv_date between d2.alkaa and d2.paattyy
  LEFT JOIN VipunenTK..d_koulutusluokitus d3 on d3.koulutusluokitus_avain = (case when tilv >= 2019 then 'ISCFIBROAD'+f.a_ala else 'OPMALA'+f.a_ala end)
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4 on d4.aine_koodi = f.a_aine and tilv_date between d4.alkaa and d4.paattyy
  LEFT JOIN VipunenTK..d_koulutusluokitus d5 on d5.koulutusluokitus_avain=f.a_koulk
  LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d6a on d6a.koko_koodi=f.a_oppil
  LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d6 on d6.koko_koodi=f.a_eioppilkm
  LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d7 on d7.koko_koodi=f.a_oppilkm
  LEFT JOIN VipunenTK..d_kieli2 d8 on d8.kieli_koodi=f.a_ykieli
  LEFT JOIN VipunenTK..d_alueluokitus d9 on d9.alueluokitus_avain='MAAK'+f.a_ymkunta
  LEFT JOIN VipunenTK..d_alueluokitus d10 on d10.alueluokitus_avain='MAAK'+f.a_maakunta
  LEFT JOIN VipunenTK..d_kylla_ei d11 on d11.kylla_ei_koodi=f.a_g16
  LEFT JOIN VipunenTK..d_kylla_ei d12 on d12.kylla_ei_koodi=f.a_g17
  LEFT JOIN VipunenTK..d_kylla_ei d13 on d13.kylla_ei_koodi=f.a_g18
  LEFT JOIN VipunenTK..d_kylla_ei d14 on d14.kylla_ei_koodi=f.a_g19
  LEFT JOIN VipunenTK..d_kylla_ei d15 on d15.kylla_ei_koodi=f.a_g20
  LEFT JOIN VipunenTK..d_kylla_ei d16 on d16.kylla_ei_koodi=f.a_g21
  LEFT JOIN VipunenTK..d_kylla_ei d17 on d17.kylla_ei_koodi=f.a_g22
  LEFT JOIN VipunenTK..d_kylla_ei d18 on d18.kylla_ei_koodi=f.a_h6
  LEFT JOIN VipunenTK..d_kylla_ei d19 on d19.kylla_ei_koodi=f.a_h7
  LEFT JOIN VipunenTK..d_kylla_ei d20 on d20.kylla_ei_koodi=f.a_h8
  LEFT JOIN VipunenTK..d_kylla_ei d21 on d21.kylla_ei_koodi=f.a_h9
  LEFT JOIN VipunenTK..d_kylla_ei d22 on d22.kylla_ei_koodi=f.a_h10
  LEFT JOIN VipunenTK..d_kylla_ei d23 on d23.kylla_ei_koodi=f.a_h11
  LEFT JOIN VipunenTK..d_kylla_ei d24 on d24.kylla_ei_koodi=f.a_h1
  LEFT JOIN VipunenTK..d_kylla_ei d25 on d25.kylla_ei_koodi=f.a_h2
  LEFT JOIN VipunenTK..d_kylla_ei d26 on d26.kylla_ei_koodi=f.a_h3
  LEFT JOIN VipunenTK..d_kylla_ei d27 on d27.kylla_ei_koodi=f.a_h4
  --LEFT JOIN VipunenTK..d_kylla_ei d28 on d28.kylla_ei_koodi=f.a_h5
  LEFT JOIN VipunenTK..d_kylla_ei d35 on d35.kylla_ei_koodi=f.a_k5
  LEFT JOIN VipunenTK..d_kylla_ei d36 on d36.kylla_ei_koodi=f.a_k6
  LEFT JOIN VipunenTK..d_kylla_ei d37 on d37.kylla_ei_koodi=f.a_k1
  LEFT JOIN VipunenTK..d_kylla_ei d38 on d38.kylla_ei_koodi=f.a_k2
  LEFT JOIN VipunenTK..d_kylla_ei d39 on d39.kylla_ei_koodi=f.a_k3
  LEFT JOIN VipunenTK..d_kylla_ei d40 on d40.kylla_ei_koodi=f.a_k4
  LEFT JOIN VipunenTK..d_kylla_ei d41 on d41.kylla_ei_koodi=f.a_kelp2
  LEFT JOIN VipunenTK..d_kylla_ei d42 on d42.kylla_ei_koodi=f.a_h10_valm
  LEFT JOIN VipunenTK..d_opettajat_kelpoisuus_amm d43 on d43.kelpoisuus_koodi=f.a_kelpo


  

--7.8

truncate table vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]

insert into vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]
 

SELECT tilastointivuosi = [tilv]
      ,tilv_date = [tilv_date]
      ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,tehtävätyyppi_amm_koulutuksessa_id = coalesce(d2.id,'-1')
      ,pääasiallinen_koulutusaste_id = coalesce(d3.id,'-1')
      ,pääasiallinen_koulutusala_id = coalesce(d4.id,'-1')
      ,taydennyskoulutus_osallistuminen = coalesce(d8.id,'-1')
      ,taydennyskoulutus_ei_tietoa = coalesce(d9.id,'-1')
      ,taydennyskoulutus_ei = coalesce(d10.id,'-1')
      ,taydennyskoulutus_tyoaika = [a_tutktyo] 
      ,taydennyskoulutus_oma_aika = [a_tutkoma] 
      ,taydennyskoulutus_kelp_tyoaika = [a_pattyo] 
      ,taydennyskoulutus_kelp_oma_aika = [a_patoma] 
      ,taydennyskoulutus_tantaja_tyoaika = [a_henktyo]
      ,taydennyskoulutus_tantaja_oma_aika = [a_henkoma] 
      ,taydennyskoulutus_muu_tyoaika = [a_muutyo] 
      ,taydennyskoulutus_muu_oma_aika = [a_muuoma] 
      ,asiantuntijavaihto_tyoaika = [a_kanstyo]
      ,asiantuntijavaihto_oma_aika = [a_kansoma] 
      ,koulutussuunnitelma = coalesce(d11.id,'-1')
      ,tyoelamajakso_lkm = [tyojakp]
      ,tyoelamajakso = coalesce(d12.id,'-1')
      ,tyoelamajakso_ei_tietoa = coalesce(d13.id,'-1')
      ,sukupuoli_id = coalesce(d5.id,'-1')
      ,oppilaitoksen_maakunta_id = coalesce(d6.id,'-1')
      ,ika_id = coalesce(d7.id,'-1')
	  ,kouluttautunut_mentoriksi = coalesce(f.a_mento1,'-1')
	  ,toiminut_mentorina = coalesce(f.a_mento2,'-1')
	  ,ollut_mentoroitavana = coalesce(f.a_mento3,'-1')
	  ,kouluttautunut_tyonohjaajaksi = coalesce(a_tyonoh1,'-1')
	  ,toiminut_tyonohjaajana = coalesce(a_tyonoh2,'-1')
	  ,ollut_tyonohjauksessa = coalesce(a_tyonoh3,'-1')
	  ,osallistunut_tyoelamajaksolle = coalesce(a_tyojak,'-1')
	  ,opiskelijan_ohjaamista = coalesce(a_tyojak1,'-1')
	  ,tyopaikkaohjaajan_kouluttajan_ohjaamista = coalesce(a_tyojak2,'-1')
	  ,opintojen_sisallon_ohjaamista = coalesce(a_tyojak3,'-1')
	  ,oman_osaamisen_kasvattamista = coalesce(a_tyojak4,'-1')
	  ,tyopaikoilla_tapahtuva_tyo = coalesce(a_tyopk,'-1')
	  ,opiskelijan_ohjaamista_tp = coalesce(a_tyopk1,'-1')
	  ,tyopaikkaohjaajan_kouluttajan_ohjaamista_tp = coalesce(a_tyopk2,'-1')
	  ,opintojen_sisallon_ohjaamista_tp = coalesce(a_tyopk3,'-1')
	  ,oman_osaamisen_kasvattamista_tp = coalesce(a_tyopk4,'-1')
	  ,opettajan_tunnit = a_tunnit
	  ,hlokohtaistamisen_tunnit = a_tunnit_amm1
	  ,suunnittelu_ohjaus_tunnit = a_tunnit_amm2
	  ,hallinnolliset_tunnit = a_tunnit_amm3
  
  FROM VipunenTK_DW.[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.a_okieli
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa d2 on d2.tehtavatyyppi_koodi=f.a_virka
  LEFT JOIN VipunenTK..d_opettajat_koulutusaste_amm d3 on d3.koulutusaste_koodi = f.a_aste and tilv_date between d3.alkaa and d3.paattyy
  LEFT JOIN VipunenTK..d_koulutusluokitus d4 on d4.koulutusluokitus_avain = (case when tilv >= 2019 then 'ISCFIBROAD'+f.a_ala108 else 'OPMALA'+f.a_ala108 end)
  LEFT JOIN VipunenTK..d_sukupuoli d5 on d5.sukupuoli_koodi=f.a_sp
  LEFT JOIN VipunenTK..d_alueluokitus d6 on d6.alueluokitus_avain='MAAK'+f.a_maakunta
  LEFT JOIN VipunenTK..d_ika d7 on d7.ika_avain=f.a_ika
  LEFT JOIN VipunenTK..d_kylla_ei d8 on d8.kylla_ei_koodi=f.a_taydjo
  LEFT JOIN VipunenTK..d_kylla_ei d9 on d9.kylla_ei_koodi=f.a_taydeit
  LEFT JOIN VipunenTK..d_kylla_ei d10 on d10.kylla_ei_koodi=f.a_eitayd
  LEFT JOIN VipunenTK..d_kylla_ei d11 on d11.kylla_ei_koodi=f.a_kehsuu
  LEFT JOIN VipunenTK..d_kylla_ei d12 on d12.kylla_ei_koodi=f.eityojak
  LEFT JOIN VipunenTK..d_kylla_ei d13 on d13.kylla_ei_koodi=f.tyojakeit





--7.9

truncate table [VipunenTK].[dbo].[f_Opettajat_vapaa_sivistystyo_osallistuminen_taydennyskoulutukseen]

insert into [VipunenTK].[dbo].[f_Opettajat_vapaa_sivistystyo_osallistuminen_taydennyskoulutukseen]
 

SELECT tilastointivuosi = [tilv]
      ,tilv_date = [tilv_date]
      ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,tehtavatyyppi_vapaassa_sivistystyossa_id = coalesce(d2.id,'-1')
      ,taydennyskoulutus_osallistuminen = coalesce(d8.id,'-1')
      ,taydennyskoulutus_ei_tietoa = coalesce(d9.id,'-1')
      ,taydennyskoulutus_ei = coalesce(d10.id,'-1')
      ,taydennyskoulutus_tyoaika = [v_tutktyo] 
      ,taydennyskoulutus_oma_aika = [v_tutkoma] 
      ,taydennyskoulutus_kelp_tyoaika = [v_pattyo] 
      ,taydennyskoulutus_kelp_oma_aika = [v_patoma] 
      ,taydennyskoulutus_tantaja_tyoaika = [v_henktyo]
      ,taydennyskoulutus_tantaja_oma_aika = [v_henkoma] 
      ,taydennyskoulutus_muu_tyoaika = [v_muutyo] 
      ,taydennyskoulutus_muu_oma_aika = [v_muuoma] 
	  ,asiantuntijavaihto_tyoaika = [v_kanstyo]
	  ,asiantuntijavaihto_oma_aika = [v_kansoma]
      ,koulutussuunnitelma = coalesce(d11.id,'-1')
      ,sukupuoli_id = coalesce(d5.id,'-1')
      ,oppilaitoksen_maakunta_id = coalesce(d6.id,'-1')
      ,ika_id = coalesce(d7.id,'-1')
	  ,kouluttautunut_mentoriksi = coalesce(f.v_mento1,'-1')
	  ,toiminut_mentorina = coalesce(f.v_mento2,'-1')
	  ,ollut_mentoroitavana = coalesce(f.v_mento3,'-1')
	  ,kouluttautunut_tyonohjaajaksi = coalesce(v_tyonoh1,'-1')
	  ,toiminut_tyonohjaajana = coalesce(v_tyonoh2,'-1')
	  ,ollut_tyonohjauksessa = coalesce(v_tyonoh3,'-1')
	  ,opettajan_tunnit = f.v_tunnit
  
  FROM VipunenTK_DW.[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.v_okieli
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa d2 on d2.tehtavatyyppi_koodi=f.v_virka
  LEFT JOIN VipunenTK..d_sukupuoli d5 on d5.sukupuoli_koodi=f.v_sp
  LEFT JOIN VipunenTK..d_alueluokitus d6 on d6.alueluokitus_avain='MAAK'+f.v_maakunta
  LEFT JOIN VipunenTK..d_ika d7 on d7.ika_avain=f.v_ika
  LEFT JOIN VipunenTK..d_kylla_ei d8 on d8.kylla_ei_koodi=f.v_taydjo
  LEFT JOIN VipunenTK..d_kylla_ei d9 on d9.kylla_ei_koodi=f.v_taydeit
  LEFT JOIN VipunenTK..d_kylla_ei d10 on d10.kylla_ei_koodi=f.v_eitayd
  LEFT JOIN VipunenTK..d_kylla_ei d11 on d11.kylla_ei_koodi=f.v_kehsuu


  

--7.10

truncate table vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus]

insert into vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus]
 

SELECT tilastointivuosi = [tilv]
      ,tilv_date = [tilv_date]
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,pääasiallinen_koulutusaste_id = coalesce(d2.id,'-1')
	  ,tyosuhteen_luonne_id = coalesce(d32.id,'-1')
      ,erityisopetus = coalesce(d11.id,'-1')
      ,opinto_ohjaus = coalesce(d12.id,'-1')
      ,valma = coalesce(d13.id,'-1')
      ,telma = coalesce(d14.id ,'-1')
      ,mamu = coalesce(d15.id ,'-1')
      ,ammpk_valmistava = coalesce(d16.id ,'-1')
      ,kotitalousopetus = coalesce(d17.id,'-1')
      ,kelp_amm = coalesce(d18.id,'-1')
      ,kelp_yht = coalesce(d19.id ,'-1')
      ,kelp_opo = coalesce(d20.id ,'-1')
      ,kelp_erope = coalesce(d21.id,'-1')
	  ,kelp_valm = coalesce(d42.id ,'-1')
      ,kelp_muu = coalesce(d22.id ,'-1')
      ,eikelp_tehtavaan = coalesce(d23.id,'-1')	  
	  ,kelp_tehtavaan_tyyppi = d43.id
      ,eikelp_paa = coalesce(d24.id,'-1')
      ,eikelp_pedag = coalesce(d25.id,'-1')
      ,eikelp_tyokok = coalesce(d26.id ,'-1')
      ,eikelp_tieto_puuttuu = coalesce(d27.id,'-1') 
	  --,kelp_kaikki = coalesce(d28.id,'-1') 
	  ,muukelp = coalesce(d41.id ,'-1')
	  ,muukelp_amm = coalesce(d37.id ,'-1')
	  ,muukelp_yht = coalesce(d38.id ,'-1')
	  ,muukelp_opo = coalesce(d39.id ,'-1')
	  ,muukelp_erope = coalesce(d40.id ,'-1')
	  ,muukelp_valm = coalesce(d35.id ,'-1')
	  ,muukelp_muu = coalesce(d36.id ,'-1')
	  ,opettajan_eniten_opettama_ala_id = coalesce(d3.id,'-1')
      ,opettajan_eniten_opettama_aine_id = coalesce(d4.id,'-1')
	  ,opettajan_toiseksi_eniten_opettama_ala_id = coalesce(d3b.id,'-1')
      ,opettajan_toiseksi_eniten_opettama_aine_id = coalesce(d4b.id,'-1')
	  ,opettajan_kolmanneksi_eniten_opettama_ala_id = coalesce(d3c.id,'-1')
      ,opettajan_kolmanneksi_eniten_opettama_aine_id = coalesce(d4c.id,'-1')
    --  ,opettajan_koulutus_id = coalesce(d5.id,'-1')
    -- ,[a_oppil] = null
      --,koul_jarj_koko_ei_oppis_id = coalesce(d6.id,'-1')
      --,koul_jarj_koko_oppis_id = coalesce(d7.id,'-1')
      --,koul_jarj_kieli_id = coalesce(d8.id,'-1')
      --,koul_jarj_maakunta_id = coalesce(d9.id,'-1')
      ,oppilaitoksen_maakunta_id = coalesce(d10.id,'-1')
	  ,tehtavatyyppi_ammatillisessa_id = coalesce(d29.id,'-1')
	  ,sukupuoli_id = coalesce(d30.id,'-1')
	  ,ika_id = coalesce(d31.id,'-1')
	  ,koko_osa_aikainen_id = coalesce(d33.id,'-1')
	  ,osa_aikaisuuden_syy_id = coalesce(d34.id,'-1')
  
  FROM VipunenTK_DW.[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.a_okieli
  LEFT JOIN VipunenTK..d_opettajat_koulutusaste_amm d2 on d2.koulutusaste_koodi = f.a_aste and tilv_date between d2.alkaa and d2.paattyy
  LEFT JOIN VipunenTK..d_koulutusluokitus d3 on d3.koulutusluokitus_avain = (case when tilv >= 2019 then 'ISCFIBROAD'+f.a_ala else 'OPMALA'+f.a_ala end)
  LEFT JOIN VipunenTK..d_koulutusluokitus d3b on d3b.koulutusluokitus_avain = (case when tilv >= 2019 then 'ISCFIBROAD'+f.a_ala2 else 'OPMALA'+f.a_ala2 end)
  LEFT JOIN VipunenTK..d_koulutusluokitus d3c on d3c.koulutusluokitus_avain = (case when tilv >= 2019 then 'ISCFIBROAD'+f.a_ala3 else 'OPMALA'+f.a_ala3 end)
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4 on d4.aine_koodi = f.a_aine and tilv_date between d4.alkaa and d4.paattyy
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4b on d4b.aine_koodi = f.a_aine2 and tilv_date between d4b.alkaa and d4b.paattyy
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4c on d4c.aine_koodi = f.a_aine3 and tilv_date between d4c.alkaa and d4c.paattyy
  --LEFT JOIN VipunenTK..d_koulutusluokitus d5 on d5.koulutusluokitus_avain=f.a_koulk
  --LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d6 on d6.koko_koodi=f.a_eioppilkm
  --LEFT JOIN VipunenTK..d_koulutuksen_jarjestajan_koko d7 on d7.koko_koodi=f.a_oppilkm
  --LEFT JOIN VipunenTK..d_kieli2 d8 on d8.kieli_koodi=f.a_ykieli
  --LEFT JOIN VipunenTK..d_alueluokitus d9 on d9.alueluokitus_avain='MAAK'+f.a_ymkunta
  LEFT JOIN VipunenTK..d_alueluokitus d10 on d10.alueluokitus_avain='MAAK'+f.a_maakunta
  LEFT JOIN VipunenTK..d_kylla_ei d11 on d11.kylla_ei_koodi=f.a_g16
  LEFT JOIN VipunenTK..d_kylla_ei d12 on d12.kylla_ei_koodi=f.a_g17
  LEFT JOIN VipunenTK..d_kylla_ei d13 on d13.kylla_ei_koodi=f.a_g18
  LEFT JOIN VipunenTK..d_kylla_ei d14 on d14.kylla_ei_koodi=f.a_g19
  LEFT JOIN VipunenTK..d_kylla_ei d15 on d15.kylla_ei_koodi=f.a_g20
  LEFT JOIN VipunenTK..d_kylla_ei d16 on d16.kylla_ei_koodi=f.a_g21
  LEFT JOIN VipunenTK..d_kylla_ei d17 on d17.kylla_ei_koodi=f.a_g22
  LEFT JOIN VipunenTK..d_kylla_ei d18 on d18.kylla_ei_koodi=f.a_h6
  LEFT JOIN VipunenTK..d_kylla_ei d19 on d19.kylla_ei_koodi=f.a_h7
  LEFT JOIN VipunenTK..d_kylla_ei d20 on d20.kylla_ei_koodi=f.a_h8
  LEFT JOIN VipunenTK..d_kylla_ei d21 on d21.kylla_ei_koodi=f.a_h9
  LEFT JOIN VipunenTK..d_kylla_ei d22 on d22.kylla_ei_koodi=f.a_h10
  LEFT JOIN VipunenTK..d_kylla_ei d23 on d23.kylla_ei_koodi=f.a_h11
  LEFT JOIN VipunenTK..d_kylla_ei d24 on d24.kylla_ei_koodi=f.a_h1
  LEFT JOIN VipunenTK..d_kylla_ei d25 on d25.kylla_ei_koodi=f.a_h2
  LEFT JOIN VipunenTK..d_kylla_ei d26 on d26.kylla_ei_koodi=f.a_h3
  LEFT JOIN VipunenTK..d_kylla_ei d27 on d27.kylla_ei_koodi=f.a_h4
  --LEFT JOIN VipunenTK..d_kylla_ei d28 on d28.kylla_ei_koodi=f.a_h5
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa d29 on d29.tehtavatyyppi_koodi=f.a_virka
  LEFT JOIN VipunenTK..d_sukupuoli d30 on d30.sukupuoli_koodi=f.a_sp
  LEFT JOIN VipunenTK..d_ika d31 on d31.ika_avain=f.a_ika
  LEFT JOIN VipunenTK..d_opettajat_tyosuhteen_luonne d32 on d32.tyosuhteen_luonne_koodi=a_tyos
  LEFT JOIN VipunenTK..d_opettajat_koko_osa_aikainen d33 on d33.koko_osa_aikainen_koodi=a_osa1
  LEFT JOIN VipunenTK..d_opettajat_osa_aikaisuuden_syy d34 on d34.syy_koodi=a_osa2
  LEFT JOIN VipunenTK..d_kylla_ei d35 on d35.kylla_ei_koodi=f.a_k5
  LEFT JOIN VipunenTK..d_kylla_ei d36 on d36.kylla_ei_koodi=f.a_k6
  LEFT JOIN VipunenTK..d_kylla_ei d37 on d37.kylla_ei_koodi=f.a_k1
  LEFT JOIN VipunenTK..d_kylla_ei d38 on d38.kylla_ei_koodi=f.a_k2
  LEFT JOIN VipunenTK..d_kylla_ei d39 on d39.kylla_ei_koodi=f.a_k3
  LEFT JOIN VipunenTK..d_kylla_ei d40 on d40.kylla_ei_koodi=f.a_k4
  LEFT JOIN VipunenTK..d_kylla_ei d41 on d41.kylla_ei_koodi=f.a_kelp2
  LEFT JOIN VipunenTK..d_kylla_ei d42 on d42.kylla_ei_koodi=f.a_h10_valm
  LEFT JOIN VipunenTK..d_opettajat_kelpoisuus_amm d43 on d43.kelpoisuus_koodi=f.a_kelpo

  


--7.12

truncate table vipunentk.[dbo].[f_Opettajat_vapaa_sivistystyo_kelpoisuus_aine]

insert into vipunentk.[dbo].[f_Opettajat_vapaa_sivistystyo_kelpoisuus_aine]
 

SELECT tilastointivuosi = f.tilv
      ,oppilaitoksen_kieli_id = d1.id
      ,oppilaitostyyppi_id = f.v_oltyp
      ,vakinainen_id = d12.id
      ,maara_aikainen_id = d13.id
      ,viransijainen_id = d14.id
      ,virkavapaalla_id = d15.id
      ,osa_aika_elake_id = d16.id
	  ,tyosuhteen_luonne_id = coalesce(d26.id,'-1')
      ,tehtavatyyppi_id = d29.id
      ,kelpoisuus_kunnossa_id = d18.id
      ,tutkinto_puuttuu_id = d19.id
      ,pedagogiset_opinnot_puuttuu_id = d20.id
      ,puuttuu_kelp_tieto_puuttuu_id = d21.id
      ,opettajan_eniten_opettama_ala_id = d3.id
      ,opettajan_eniten_opettama_aine_id = d4.id
      ,sukupuoli_id = d30.id
      ,oppilaitoksen_maakunta_id = coalesce(d10.id,'-1')
      ,oppilaitoksen_kuntaryhmitys = coalesce(d2.id,'-1')
      ,ika_id = d31.id
	  ,koko_osa_aikainen_id = coalesce(d27.id,'-1')
	  ,osa_aikaisuuden_syy_id = coalesce(d28.id,'-1')

  FROM VipunenTK_DW.[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.v_okieli
  LEFT JOIN VipunenTK..d_kuntaryhma d2 on d2.kuntaryhma_koodi=f.v_okunryh
  LEFT JOIN VipunenTK..d_koulutusluokitus d3 on d3.koulutusluokitus_avain='OPMALA'+f.v_ala1
  LEFT JOIN VipunenTK..d_opettajat_aine_vst d4 on d4.aine_koodi = f.v_aine1 AND f.tilv_date between d4.alkaa and d4.paattyy
  --LEFT JOIN VipunenTK..d_oppilaitostyyppi d5 on d5.oppilaitostyyppi_koodi=f.v_oltyp
  LEFT JOIN VipunenTK..d_alueluokitus d10 on d10.alueluokitus_avain='MAAK'+f.v_maakunta
  LEFT JOIN VipunenTK..d_kylla_ei d12 on d12.kylla_ei_koodi=f.v_tyos1
  LEFT JOIN VipunenTK..d_kylla_ei d13 on d13.kylla_ei_koodi=f.v_tyos2
  LEFT JOIN VipunenTK..d_kylla_ei d14 on d14.kylla_ei_koodi=f.v_tyos3
  LEFT JOIN VipunenTK..d_kylla_ei d15 on d15.kylla_ei_koodi=f.v_tyos4
  LEFT JOIN VipunenTK..d_kylla_ei d16 on d16.kylla_ei_koodi=f.v_tyos5
  LEFT JOIN VipunenTK..d_kylla_ei d18 on d18.kylla_ei_koodi=f.v_h1
  LEFT JOIN VipunenTK..d_kylla_ei d19 on d19.kylla_ei_koodi=f.v_h2
  LEFT JOIN VipunenTK..d_kylla_ei d20 on d20.kylla_ei_koodi=f.v_h3
  LEFT JOIN VipunenTK..d_kylla_ei d21 on d21.kylla_ei_koodi=f.v_h4
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa d29 on d29.tehtavatyyppi_koodi=f.v_virka
  LEFT JOIN VipunenTK..d_sukupuoli d30 on d30.sukupuoli_koodi=f.v_sp
  LEFT JOIN VipunenTK..d_ika d31 on d31.ika_avain=f.v_ika
  LEFT JOIN VipunenTK..d_opettajat_tyosuhteen_luonne d26 on d26.tyosuhteen_luonne_koodi=v_tyos
  LEFT JOIN VipunenTK..d_opettajat_koko_osa_aikainen d27 on d27.koko_osa_aikainen_koodi=v_osa1
  LEFT JOIN VipunenTK..d_opettajat_osa_aikaisuuden_syy d28 on d28.syy_koodi=v_osa2

  


--7.15

truncate table vipunentk.[dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine]

insert into vipunentk.[dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine]

SELECT tilastointivuosi = f.tilv
      ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
	  ,tyosuhteen_luonne_id = coalesce(d26.id,'-1')
      ,tehtavatyyppi_id = coalesce(d29.id,'-1')
      ,kelpoisuus_kunnossa_id = coalesce(d18.id,'-1')
      ,tutkinto_puuttuu_id = d19.id
      ,pedagogiset_opinnot_puuttuu_id = d20.id
      ,paaasiallinen_taso_id = coalesce(d5.id,'-1')
      ,paaasiallinen_ala_id = coalesce(d3.id,'-1')
      ,paaasiallinen_aste_id = coalesce(d4.id,'-1')
      ,sukupuoli_id = d30.id
      ,oppilaitoksen_maakunta_id = coalesce(d10.id,'-1')
      ,oppilaitoksen_kuntaryhmitys = coalesce(d2.id,'-1')
      ,ika_id = d31.id
	  ,koko_osa_aikainen_id = coalesce(d27.id,'-1')
	  ,osa_aikaisuuden_syy_id = coalesce(d28.id,'-1')

  FROM VipunenTK_DW.[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.t_okieli
  LEFT JOIN VipunenTK..d_kuntaryhma d2 on d2.kuntaryhma_koodi=f.t_okunryh
  LEFT JOIN VipunenTK..d_opettajat_ala_tpo d3 on d3.ala_koodi=f.t_ala1 AND f.tilv_date between d3.alkaa and d3.paattyy
  LEFT JOIN VipunenTK..d_opettajat_koulutusaste_tpo d4 on d4.koulutusaste_koodi = f.t_aine1 AND f.tilv_date between d4.alkaa and d4.paattyy --aine1 on aste/muoto
  LEFT JOIN VipunenTK..d_opettajat_opintotaso_tpo d5 on d5.opintotaso_koodi=f.t_otaso AND f.tilv_date between d5.alkaa and d5.paattyy
  LEFT JOIN VipunenTK..d_alueluokitus d10 on d10.alueluokitus_avain='MAAK'+f.t_maakunta
  LEFT JOIN VipunenTK..d_kylla_ei d18 on d18.kylla_ei_koodi=f.t_kelp
  LEFT JOIN VipunenTK..d_kylla_ei d19 on d19.kylla_ei_koodi=f.t_p1
  LEFT JOIN VipunenTK..d_kylla_ei d20 on d20.kylla_ei_koodi=f.t_p2
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa d29 on d29.tehtavatyyppi_koodi=f.t_virka
  LEFT JOIN VipunenTK..d_sukupuoli d30 on d30.sukupuoli_koodi=f.t_sp
  LEFT JOIN VipunenTK..d_ika d31 on d31.ika_avain=f.t_ika
  LEFT JOIN VipunenTK..d_opettajat_tyosuhteen_luonne d26 on d26.tyosuhteen_luonne_koodi=t_tyos
  LEFT JOIN VipunenTK..d_opettajat_koko_osa_aikainen d27 on d27.koko_osa_aikainen_koodi=t_osa1
  LEFT JOIN VipunenTK..d_opettajat_osa_aikaisuuden_syy d28 on d28.syy_koodi=t_osa2
  
  
  
  
--7.17

truncate table [VipunenTK].[dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen]

insert into [VipunenTK].[dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen]
 

SELECT tilastointivuosi = [tilv]
      ,tilv_date = [tilv_date]
      ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,tehtavatyyppi_id = coalesce(d2.id,'-1')
      ,taydennyskoulutus_osallistuminen = coalesce(d8.id,'-1')
	  ,taydennyskoulutus_osaalue = coalesce(d9.id,'-1')
      ,taydennyskoulutus_tyoaika = [t_tutktyo] 
      ,taydennyskoulutus_oma_aika = [t_tutkoma] 
      ,taydennyskoulutus_kelp_tyoaika = [t_pattyo] 
      ,taydennyskoulutus_kelp_oma_aika = [t_patoma] 
      ,taydennyskoulutus_tantaja_tyoaika = [t_henktyo]
      ,taydennyskoulutus_tantaja_oma_aika = [t_henkoma] 
      ,taydennyskoulutus_muu_tyoaika = [t_muutyo] 
      ,taydennyskoulutus_muu_oma_aika = [t_muuoma] 
	  ,asiantuntijavaihto_tyoaika = [t_kanstyo]
	  ,asiantuntijavaihto_oma_aika = [t_kansoma]
      ,koulutussuunnitelma = coalesce(d11.id,'-1')
      ,sukupuoli_id = coalesce(d5.id,'-1')
      ,oppilaitoksen_maakunta_id = coalesce(d6.id,'-1')
      ,ika_id = coalesce(d7.id,'-1')
  
  FROM VipunenTK_DW.[dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.t_okieli
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_taiteen_perusopetuksessa d2 on d2.tehtavatyyppi_koodi=f.t_virka
  LEFT JOIN VipunenTK..d_sukupuoli d5 on d5.sukupuoli_koodi=f.t_sp
  LEFT JOIN VipunenTK..d_alueluokitus d6 on d6.alueluokitus_avain='MAAK'+f.t_maakunta
  LEFT JOIN VipunenTK..d_ika d7 on d7.ika_avain=f.t_ika
  LEFT JOIN VipunenTK..d_kylla_ei d8 on d8.kylla_ei_koodi=f.t_tayd
  LEFT JOIN VipunenTK..d_opettajat_taydennyskoulutus_tpo d9 on d9.osaalue_koodi=f.t_tayd_oa
  LEFT JOIN VipunenTK..d_kylla_ei d11 on d11.kylla_ei_koodi=f.t_kehsuu

  
  

--7.18

truncate table vipunentk.[dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto];

insert into vipunentk.[dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto]
 
SELECT tilastointivuosi = f.tilv
       ,tilv_date = f.tilv_date
       ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
       ,oppilaitostyyppi_id = coalesce(d2.id,'-1')
       ,kuntaryhmitys_oppilaitos_id = coalesce(d3.id,'-1')
       ,maakunta_oppilaitos_id = coalesce(d10.id,'-1')
       ,tehtavatyyppi_perusopetuksessa_id = coalesce(d8.id,'-1')
	   ,kelp_tehtavaan_id = coalesce(d25.id,'-1')
	   ,kelp_tehtavaan = f.p_kelpu
       ,sukupuoli_id = coalesce(d23.id,'-1')
       ,ika_id = d24.id
       ,opettajan_ensin_ilmoitettu_aine_id = d22.id
       ,opettajan_toiseksi_ilmoitettu_opettama_aine_id = d22b.id
       ,opettajan_kolmanneksi_ilmoitettu_opettama_aine_id = d22c.id
    
  FROM VipunenTK_DW.dbo.f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.p_okieli
  LEFT JOIN VipunenTK..d_oppilaitostyyppi d2 on d2.oppilaitostyyppi_koodi=f.p_oltyp
  LEFT JOIN VipunenTK..d_kuntaryhma d3 on d3.kuntaryhma_koodi=f.p_okunryh
  LEFT JOIN VipunenTK..d_alueluokitus d10 on d10.alueluokitus_avain='MAAK'+f.p_maakunta
  LEFT JOIN VipunenTK..d_opettajan_tehtavatyyppi_perusopetuksessa d8 on d8.tehtavatyyppi_koodi=p_virka
  LEFT JOIN VipunenTK..d_opettajat_aine d22 on d22.aine_koodi=p_aine
  LEFT JOIN VipunenTK..d_opettajat_aine d22b on d22b.aine_koodi=p_aine2
  LEFT JOIN VipunenTK..d_opettajat_aine d22c on d22c.aine_koodi=p_aine3
  LEFT JOIN VipunenTK..d_sukupuoli d23 on d23.sukupuoli_koodi=p_sp
  LEFT JOIN VipunenTK..d_ika d24 on d24.ika_avain=p_ika
  LEFT JOIN VipunenTK..d_kylla_ei d25 on d25.kylla_ei_koodi=f.p_kelpu




--7.19

truncate table vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto];

insert into vipunentk.[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto]
 
SELECT tilastointivuosi = [tilv]
      ,tilv_date = [tilv_date]
	  ,oppilaitoksen_kieli_id = coalesce(d1.id,'-1')
      ,oppilaitostyyppi_id = coalesce(d2.id,'-1')
      ,oppilaitoksen_maakunta_id = coalesce(d10.id,'-1')
      ,eikelp_tehtavaan_id = coalesce(d23.id,'-1')
	  ,eikelp_tehtavaan = f.a_h11
	  ,sukupuoli_id = coalesce(d30.id,'-1')
	  ,ika_id = coalesce(d31.id,'-1')
	  ,opettajan_ensin_ilmoitettu_ala_id = d3.id
      ,opettajan_ensin_ilmoitettu_aine_id = d4.id
	  ,opettajan_toiseksi_ilmoitettu_ala_id = d3b.id
      ,opettajan_toiseksi_ilmoitettu_aine_id = d4b.id
	  ,opettajan_kolmanneksi_ilmoitettu_ala_id = d3c.id
      ,opettajan_kolmanneksi_ilmoitettu_aine_id = d4c.id
  
  FROM VipunenTK_DW.[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto] f
  LEFT JOIN VipunenTK..d_opetuskieli2 d1 on d1.opetuskieli_koodi=f.a_okieli
  LEFT JOIN VipunenTK..d_oppilaitostyyppi_amm d2 on d2.oppilaitostyyppi_koodi=f.a_oltyp
  LEFT JOIN VipunenTK..d_koulutusluokitus d3 on d3.koulutusluokitus_avain = 'ISCFIBROAD'+f.a_ala
  LEFT JOIN VipunenTK..d_koulutusluokitus d3b on d3b.koulutusluokitus_avain = 'ISCFIBROAD'+f.a_ala2
  LEFT JOIN VipunenTK..d_koulutusluokitus d3c on d3c.koulutusluokitus_avain = 'ISCFIBROAD'+f.a_ala3
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4 on d4.aine_koodi = f.a_aine and tilv_date between d4.alkaa and d4.paattyy
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4b on d4b.aine_koodi = f.a_aine2 and tilv_date between d4b.alkaa and d4b.paattyy
  LEFT JOIN VipunenTK..d_opettajat_aine_amm d4c on d4c.aine_koodi = f.a_aine3 and tilv_date between d4c.alkaa and d4c.paattyy
  LEFT JOIN VipunenTK..d_alueluokitus d10 on d10.alueluokitus_avain='MAAK'+f.a_maakunta
  LEFT JOIN VipunenTK..d_kylla_ei d23 on d23.kylla_ei_koodi=f.a_h11
  LEFT JOIN VipunenTK..d_sukupuoli d30 on d30.sukupuoli_koodi=f.a_sp
  LEFT JOIN VipunenTK..d_ika d31 on d31.ika_avain=f.a_ika
;
 
GO
USE [ANTERO]