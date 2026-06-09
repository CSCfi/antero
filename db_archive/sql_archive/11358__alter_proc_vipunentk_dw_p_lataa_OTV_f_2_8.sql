USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_OTV_f_2_8]    Script Date: 5.11.2025 15.35.18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER PROCEDURE [dbo].[p_lataa_OTV_f_2_8] AS

--Lisätty välitaulu 15.1.2015 / CSC Jarmo
--EXECUTE [VipunenTK_DW].[dbo].[p_lataa_OTV_f_2_8]

DECLARE @maxTilastovuosiL nvarchar(6);

 
TRUNCATE TABLE [VipunenTK_DW].[dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet]

INSERT INTO [VipunenTK_DW].[dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet]

SELECT [tilastointivuosi]
      ,[tilv_date]
      ,[aineisto]
      ,[lahde]
      ,f.[oppilaitos]
	  ,oppilaitos_sijaintikuntakoodi_join = d2.sijaintikuntakoodi
	  ,oppilaitos_sijaintikuntakoodi_historia_join = d2h.sijaintikuntakoodi
      ,f.[koulutuksen_jarjestaja]
	  ,koulutuksen_jarjestaja_sijaintikuntakoodi_join = d1.sijaintikuntakoodi
	  ,koulutuksen_jarjestaja_sijaintikuntakoodi_historia_join = d1h.sijaintikuntakoodi
      ,[koulutusluokitus]
      ,[koulutuksen_kunta]
      ,[sukupuoli]
      ,[aidinkieli_versio1x]
      ,[syntymavuosi]
	  ,syntymavuosi_join = case when isnull(syntymavuosi,'') in ('9999','XXXX','') then '-1' else syntymavuosi end
      ,[kotikunta]
      ,[kotikunta1x]
      ,[kotikunta2x]
      ,[kansalaisuus_versio2]
	  ,kvopisk
	  ,suormaa
      ,[kirjoihintulovuosi]
	  ,jarjestys_kirjoihintulovuosi
	  ,kirjoihintulovuosi_join = case when isnull(kirjoihintulovuosi,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi end
      ,[kirjoihintulokausi]
	  ,kirjoihintulokausi_join = case
	  when isnull(kirjoihintulovuosi,'') in ('9999','XXXX','','Tuntematon') then '-1'
	  when isnull(kirjoihintulokausi,'') in ('9','X','') then '-1'
	  else kirjoihintulovuosi+kirjoihintulokausi end
      ,[opiskelijan_olo_tamm]
      ,[opiskelijan_olo_syys]
      ,[rahoituslahde]
      ,[opiskelijan_fte_tieto]
      ,[kirjoihintulovuosi_korkeakoulusektori]
	  ,kirjoihintulovuosi_korkeakoulusektori_join = case when isnull(kirjoihintulovuosi_korkeakoulusektori,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_korkeakoulusektori end
      ,[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva]
	  ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_join = case when isnull(kirjoihintulovuosi_korkeakoulusektori_lasnaoleva,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_korkeakoulusektori_lasnaoleva end
      ,[kirjoihintulovuosi_sektori]
	  ,kirjoihintulovuosi_sektori_join = case when isnull(kirjoihintulovuosi_sektori,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_sektori end
      ,[kirjoihintulovuosi_sektori_lasnaoleva]
	  ,kirjoihintulovuosi_sektori_lasnaoleva_join = case when isnull(kirjoihintulovuosi_sektori_lasnaoleva,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_sektori_lasnaoleva end
      ,[kirjoihintulovuosi_korkeakoulu]
	  ,kirjoihintulovuosi_korkeakoulu_join = case when isnull(kirjoihintulovuosi_korkeakoulu,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_korkeakoulu end
      ,[kirjoihintulovuosi_korkeakoulu_lasnaoleva]
	  ,kirjoihintulovuosi_korkeakoulu_lasnaoleva_join = case when isnull(kirjoihintulovuosi_korkeakoulu_lasnaoleva,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_korkeakoulu_lasnaoleva end
      ,[kirjoihintulovuosi_opintoala]
	  ,kirjoihintulovuosi_opintoala_join = case when isnull(kirjoihintulovuosi_opintoala,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_opintoala end
      ,[kirjoihintulovuosi_opintoala_lasnaoleva]
	  ,kirjoihintulovuosi_opintoala_lasnaoleva_join = case when isnull(kirjoihintulovuosi_opintoala_lasnaoleva,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_opintoala_lasnaoleva end
      ,[lukumaara]
      ,[lkm_op0]
      ,[lkm_op1_14]
      ,[lkm_op15_29]
      ,[lkm_op30_44]
      ,[lkm_op45_59]
      ,[lkm_op60_74]
      ,[lkm_op75_89]
      ,[lkm_op90_104]
      ,[lkm_op105_119]
      ,[lkm_op120_]
      ,[vahintaan_55_op_suorittanut]
      ,[op_edellinen_syksy]
      ,[op_edellinen_kevat]
      ,[op_kertyma_edel_lkv_loppu]
      ,[tutkinto_amk]
      ,[koulutusohjelma_amk]
      ,[suuntautumisvaihtoehto_amk]
      ,[koulutustyyppi]
      ,[koulutuksen_kieli]
      ,[lkm_lasnalk]
      ,[lkm_poissalk]
      ,[op_suoritettavien_laajuus]
      ,[kirjoihintulovuosi_tutkinto]
	  ,kirjoihintulovuosi_tutkinto_join = case when isnull(kirjoihintulovuosi_tutkinto,'') in ('9999','XXXX','') then '-1' else kirjoihintulovuosi_tutkinto end
      ,[kirjoihintulokausi_tutkinto]
	  ,kirjoihintulokausi_tutkinto_join = case
	  when isnull(kirjoihintulovuosi_tutkinto,'') in ('9999','XXXX','') then '-1'
	  when isnull(kirjoihintulokausi_tutkinto,'') in ('9','X','') then '-1'
	  else kirjoihintulovuosi_tutkinto+kirjoihintulokausi_tutkinto end
      ,[ensisijainen_opintooikeus]
      ,[tilauskoulutuksen_sijaintimaa]
      ,[tutkinto_yo]
      ,[koulutusohjelma_yo]
      ,[paaaine_yo]
      ,[yliopisto]
      ,[tiedekunta_yo]
      ,[uusi_vanha_opiskelija]
      ,[tutkintooikeusvuosi]
	  ,tutkintooikeusvuosi_join = case when isnull(tutkintooikeusvuosi,'') in ('9999','XXXX','') then '-1' else tutkintooikeusvuosi end
      ,[opiskelumuoto]
      ,[opettajankelpoisuus]
      ,[avoinvayla]
      ,[tietolahde]
      ,[rivinumero]
      ,[aineistotunnus]
      ,[koulutussektori]
      ,[ika_1v]
      ,[aloittaneet]
      ,[aloittaneet_kirjoihintulovuosi]
      ,[aloittaneet_korkeakoulusektori]
      ,[aloittaneet_korkeakoulusektori_lasnaoleva]
      ,[aloittaneet_sektori]
      ,[aloittaneet_sektori_lasnaoleva]
      ,[aloittaneet_korkeakoulu]
      ,[aloittaneet_korkeakoulu_lasnaoleva]
      ,[aloittaneet_opintoala]
      ,[aloittaneet_opintoala_lasnaoleva]
      ,[opiskelijat]
      ,[opiskelijat_lasna]
      ,[opiskelijat_fte]
	  ,koulutuslaji_OKM_avain
	  ,koulutusryhma_avain
	  ,ikaryhma1_avain
	  ,ikaryhma2_avain
	  ,laak
	  ,ltop
  FROM [VipunenTK_DW].[dbo].[f_2_8_Korkeakouluopiskelijat] f
  LEFT JOIN vipunentk..d_oppilaitoksen_taustatiedot d1
	ON d1.oppilaitos_avain = f.oppilaitos
  --(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = koulutuksen_jarjestaja)
  LEFT JOIN vipunentk..d_oppilaitoksen_taustatiedot_historia d1h
	ON d1h.oppilaitos_avain = f.oppilaitos AND f.tilv_date between d1h.alkaa and d1h.paattyy
  --(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.koulutuksen_jarjestaja AND f.tilv_date between d51h.alkaa and d51h.paattyy)
  LEFT JOIN vipunentk..d_oppilaitoksen_taustatiedot d2
	ON d2.oppilaitos_avain = f.oppilaitos
  --(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos)
  LEFT JOIN vipunentk..d_oppilaitoksen_taustatiedot_historia d2h
	ON d2h.oppilaitos_avain = f.oppilaitos AND f.tilv_date between d2h.alkaa and d2h.paattyy
  --(select sijaintikuntakoodi from vipunentk..d_oppilaitoksen_taustatiedot where oppilaitos_avain = f.oppilaitos AND f.tilv_date between d52h.alkaa and d52h.paattyy)

  where f.tilastointivuosi > '1999' -- vuoden 1999 YO-tiedoissa virheitä, niitä ei haluta vipuseen. AMK puolella ei vuoden 1999 tietoja ole.



SET @maxTilastovuosiL = (select max(tilastointivuosi) from [dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet] WHERE aineisto = 'L')  

TRUNCATE TABLE VipunenTK.dbo.f_OTV_2_8_Korkeakouluopiskelijat;

INSERT INTO VipunenTK.dbo.f_OTV_2_8_Korkeakouluopiskelijat
 
SELECT 
	 f.tilastointivuosi
	,f.tilv_date
	,f.aineisto
	,aineisto_id = coalesce(d1.id,-1)
	,f.lahde
	,lahde_id = coalesce(d2.id,-1)
	,f.oppilaitos
	,oppilaitos_id = coalesce(d3.id,-1)
	,oppilaitos_historia_id = coalesce(d3h.id,-1)
	,f.koulutuksen_jarjestaja
	,koulutuksen_jarjestaja_id = coalesce(d4.id,-1)
	,koulutuksen_jarjestaja_historia_id = coalesce(d4h.id,-1)
	,f.koulutusluokitus
	,koulutusluokitus_id = coalesce(d5.id,-1)
	,koulutusluokitus_historia_id = coalesce(d5h.id,-1)	
	,f.koulutuksen_kunta
	,koulutuksen_kunta_id = coalesce(d6.id,-1)
	,koulutuksen_kunta_historia_id = coalesce(d6h.id,-1)	
	,f.sukupuoli
	,sukupuoli_id = coalesce(d7.id,-1)
	,f.aidinkieli_versio1x
	,aidinkieli_versio1x_id = coalesce(d8.id,-1)
	,f.syntymavuosi
	,syntymavuosi_id = coalesce(d9.kausi_id,'-1')
	,f.kotikunta
	,kotikunta_id = coalesce(d10.id,-1)
	,kotikunta_historia_id = coalesce(d10h.id,-1)
	,f.kotikunta1x
	,kotikunta1x_id = coalesce(d11.id,-1)
	,kotikunta1x_historia_id = coalesce(d11h.id,-1)
	,f.kotikunta2x
	,kotikunta2x_id = coalesce(d12.id,-1)
	,kotikunta2x_historia_id = coalesce(d12h.id,-1)	
	,f.kansalaisuus_versio2
	,kansalaisuus_versio2_id = coalesce(d13.id,-1)
	,kvopisk = f.kvopisk
	,kvopisk_id = coalesce(d65.id,-1)
	,suormaa = f.suormaa
	,suormaa_id =  coalesce(d66.id,-1)
	,f.kirjoihintulovuosi
	,f.jarjestys_kirjoihintulovuosi
	,kirjoihintulovuosi_id = coalesce(d14.kausi_id,'-1')
	,f.kirjoihintulokausi
	,kirjoihintulokausi_id = coalesce(d15.kausi_id,'-1')
	,f.opiskelijan_olo_tamm
	,opiskelijan_olo_tamm_id = coalesce(d16.id,-1)
	,f.opiskelijan_olo_syys
	,opiskelijan_olo_syys_id = coalesce(d17.id,-1)
	,f.rahoituslahde
	,rahoituslahde_id = coalesce(d18.id,-1)
	,f.opiskelijan_fte_tieto
	,opiskelijan_fte_tieto_id = coalesce(d19.id,-1)
	,f.kirjoihintulovuosi_korkeakoulusektori
	,kirjoihintulovuosi_korkeakoulusektori_id = coalesce(d20.kausi_id,'-1')
	,f.kirjoihintulovuosi_korkeakoulusektori_lasnaoleva
	,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id = coalesce(d21.kausi_id,'-1')
	,f.kirjoihintulovuosi_sektori
	,kirjoihintulovuosi_sektori_id = coalesce(d22.kausi_id,'-1')
	,f.kirjoihintulovuosi_sektori_lasnaoleva
	,kirjoihintulovuosi_sektori_lasnaoleva_id = coalesce(d23.kausi_id,'-1')
	,f.kirjoihintulovuosi_korkeakoulu
	,kirjoihintulovuosi_korkeakoulu_id = coalesce(d24.kausi_id,'-1')
	,f.kirjoihintulovuosi_korkeakoulu_lasnaoleva
	,kirjoihintulovuosi_korkeakoulu_lasnaoleva_id = coalesce(d25.kausi_id,'-1')
	,f.kirjoihintulovuosi_opintoala
	,kirjoihintulovuosi_opintoala_id = coalesce(d26.kausi_id,'-1')
	,f.kirjoihintulovuosi_opintoala_lasnaoleva
	,kirjoihintulovuosi_opintoala_lasnaoleva_id = coalesce(d27.kausi_id,'-1')
	,f.lukumaara
	,f.lkm_op0
	,f.lkm_op1_14
	,f.lkm_op15_29
	,f.lkm_op30_44
	,f.lkm_op45_59
	,f.lkm_op60_74
	,f.lkm_op75_89
	,f.lkm_op90_104
	,f.lkm_op105_119
	,f.lkm_op120_
	,f.vahintaan_55_op_suorittanut
	,vahintaan_55_op_suorittanut_id = coalesce(d28.id,-1)
	,f.op_edellinen_syksy
	,f.op_edellinen_kevat
	,f.op_kertyma_edel_lkv_loppu
	,f.tutkinto_amk,tutkinto_amk_id = coalesce(d29.id,-1)
	,f.koulutusohjelma_amk
	,koulutusohjelma_amk_id = coalesce(d30.id,-1)
	,f.suuntautumisvaihtoehto_amk
	,suuntautumisvaihtoehto_amk_id = coalesce(d31.id,-1)
	,f.koulutustyyppi
	,koulutustyyppi_id = coalesce(d32.id,-1)
	,f.koulutuksen_kieli
	,koulutuksen_kieli_id = coalesce(d33.id,-1)
	,f.lkm_lasnalk
	,f.lkm_poissalk
	,f.op_suoritettavien_laajuus
	,f.kirjoihintulovuosi_tutkinto
	,kirjoihintulovuosi_tutkinto_id = coalesce(d34.kausi_id,'-1')
	,f.kirjoihintulokausi_tutkinto
	,kirjoihintulokausi_tutkinto_id = coalesce(d35.kausi_id,'-1')
	,f.ensisijainen_opintooikeus
	,ensisijainen_opintooikeus_id = coalesce(d36.id,-1)
	,f.tilauskoulutuksen_sijaintimaa
	,tilauskoulutuksen_sijaintimaa_id = coalesce(d37.id,-1)
	,f.tutkinto_yo,tutkinto_yo_id = coalesce(d38.id,-1)
	,f.koulutusohjelma_yo
	,f.paaaine_yo
	,f.yliopisto
	,yliopisto_id = coalesce(d41.id,-1)
	,f.tiedekunta_yo
	,tiedekunta_yo_id = coalesce(d42.id,-1)
	,f.uusi_vanha_opiskelija
	,uusi_vanha_opiskelija_id = coalesce(d43.id,-1)
	,f.tutkintooikeusvuosi
	,tutkintooikeusvuosi_id = coalesce(d44.kausi_id,'-1')
	,f.opiskelumuoto
	,opiskelumuoto_id = coalesce(d45.id,-1)
	,f.opettajankelpoisuus
	,opettajankelpoisuus_id = coalesce(d46.id,-1)
	,f.avoinvayla,avoinvayla_id = coalesce(d47.id,-1)
	,f.tietolahde
	,f.rivinumero
	,f.aineistotunnus
	,f.koulutussektori
	,koulutussektori_id = coalesce(d48.id,-1)
	,f.ika_1v
	,ika_id = coalesce(d49.id, -1)
	,f.aloittaneet
	,f.aloittaneet_kirjoihintulovuosi
	,f.aloittaneet_korkeakoulusektori
	,f.aloittaneet_korkeakoulusektori_lasnaoleva
	,f.aloittaneet_sektori
	,f.aloittaneet_sektori_lasnaoleva
	,f.aloittaneet_korkeakoulu
	,f.aloittaneet_korkeakoulu_lasnaoleva
	,f.aloittaneet_opintoala
	,f.aloittaneet_opintoala_lasnaoleva
	,f.opiskelijat
	,f.opiskelijat_lasna
	,f.opiskelijat_fte
	,aineisto_OTV_id = coalesce(d50.id,-1)
    ,koulutuksen_jarjestaja_kunta_id = coalesce(d51.id,-2)
    ,koulutuksen_jarjestaja_kunta_historia_id = coalesce(d51h.id,-2)
    ,oppilaitos_kunta_id = coalesce(d52.id,-2)
    ,oppilaitos_kunta_historia_id = coalesce(d52h.id,-2)
    ,opetushallinnon_koulutus_id = 1
	,koulutuslaji_OKM_id = coalesce(d54.id, -2)
	,koulutusryhma_id = coalesce(d60.id, -1)
	,ikaryhma1_id = coalesce(d49b.id, -1)
	,ikaryhma2_id = coalesce(d49c.id, -1)
	,tieteenala_avain = d61.tieteenala_avain
	,tieteenala_id = coalesce(d62.id, -1)
	,erikoislaakarikoulutus_id = coalesce(d63.id, -1)
	,patevyyteen_tahtaavat_opinnot_id = coalesce(d64.id, -1)
	
--frm
 
FROM VipunenTK_DW.dbo.f_2_8_Korkeakouluopiskelijat_joinavaimet AS f
LEFT JOIN VipunenTK..d_aineisto AS d1 ON d1.aineisto_koodi=f.aineisto AND f.tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_lahde AS d2 ON d2.lahde_koodi=f.lahde AND f.tilv_date between d2.alkaa and d2.paattyy

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.oppilaitos  AND f.tilv_date between d3h.alkaa and d3h.paattyy

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d4 ON d4.oppilaitos_avain=f.koulutuksen_jarjestaja
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d4h ON d4h.oppilaitos_avain=f.koulutuksen_jarjestaja  AND f.tilv_date between d4h.alkaa and d4h.paattyy

LEFT JOIN VipunenTK..d_koulutusluokitus AS d5 ON d5.koulutusluokitus_avain=f.koulutusluokitus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d5h ON d5h.koulutusluokitus_avain=f.koulutusluokitus AND f.tilv_date between d5h.alkaa and d5h.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d6 ON d6.alueluokitus_avain=f.koulutuksen_kunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d6h ON d6h.alueluokitus_avain=f.koulutuksen_kunta AND f.tilv_date between d6h.alkaa and d6h.paattyy

LEFT JOIN VipunenTK..d_sukupuoli AS d7 ON d7.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d7.alkaa and d7.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d8 ON d8.aidinkieli_versio1_koodi=f.aidinkieli_versio1x AND f.tilv_date between d8.alkaa and d8.paattyy
LEFT JOIN VipunenTK..d_kausi AS d9 ON d9.kausi_id = f.syntymavuosi_join

LEFT JOIN VipunenTK..d_alueluokitus AS d10 ON d10.alueluokitus_avain=f.kotikunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d10h ON d10h.alueluokitus_avain=f.kotikunta AND f.tilv_date between d10h.alkaa and d10h.paattyy


LEFT JOIN VipunenTK..d_alueluokitus AS d11 ON d11.alueluokitus_avain=f.kotikunta1x
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d11h ON d11h.alueluokitus_avain=f.kotikunta1x AND f.tilv_date between d11h.alkaa and d11h.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d12 ON d12.alueluokitus_avain=f.kotikunta2x
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d12h ON d12h.alueluokitus_avain=f.kotikunta2x AND f.tilv_date between d12h.alkaa and d12h.paattyy


LEFT JOIN VipunenTK..d_kansalaisuus_versio2 AS d13 ON d13.kansalaisuus_versio2_koodi=f.kansalaisuus_versio2 AND f.tilv_date between d13.alkaa and d13.paattyy
LEFT JOIN VipunenTK..d_kausi AS d14 ON d14.kausi_id	= f.kirjoihintulovuosi_join
LEFT JOIN VipunenTK..d_kausi AS d15 ON d15.kausi_id	= f.kirjoihintulokausi_join

LEFT JOIN VipunenTK..d_opiskelijan_olo_tamm AS d16 ON d16.opiskelijan_olo_tamm_koodi=f.opiskelijan_olo_tamm AND f.tilv_date between d16.alkaa and d16.paattyy
LEFT JOIN VipunenTK..d_opiskelijan_olo AS d17 ON d17.opiskelijan_olo_koodi=f.opiskelijan_olo_syys AND f.tilv_date between d17.alkaa and d17.paattyy
LEFT JOIN VipunenTK..d_rahoituslahde AS d18 ON d18.rahoituslahde_koodi=f.rahoituslahde AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_opiskelijan_fte_tieto AS d19 ON d19.opiskelijan_fte_tieto_koodi=f.opiskelijan_fte_tieto AND f.tilv_date between d19.alkaa and d19.paattyy
LEFT JOIN VipunenTK..d_kausi AS d20 ON d20.kausi_id	= f.kirjoihintulovuosi_korkeakoulusektori_join
LEFT JOIN VipunenTK..d_kausi AS d21 ON d21.kausi_id	= f.kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_join
LEFT JOIN VipunenTK..d_kausi AS d22 ON d22.kausi_id	= f.kirjoihintulovuosi_sektori_join
LEFT JOIN VipunenTK..d_kausi AS d23 ON d23.kausi_id	= f.kirjoihintulovuosi_sektori_lasnaoleva_join
LEFT JOIN VipunenTK..d_kausi AS d24 ON d24.kausi_id	= f.kirjoihintulovuosi_korkeakoulu_join
LEFT JOIN VipunenTK..d_kausi AS d25 ON d25.kausi_id	= f.kirjoihintulovuosi_korkeakoulu_lasnaoleva_join
LEFT JOIN VipunenTK..d_kausi AS d26 ON d26.kausi_id	= f.kirjoihintulovuosi_opintoala_join
LEFT JOIN VipunenTK..d_kausi AS d27 ON d27.kausi_id	= f.kirjoihintulovuosi_opintoala_lasnaoleva_join
LEFT JOIN VipunenTK..d_vahintaan_55_op_suorittanut AS d28 ON d28.vahintaan_55_op_suorittanut_koodi=f.vahintaan_55_op_suorittanut AND f.tilv_date between d28.alkaa and d28.paattyy
LEFT JOIN VipunenTK..d_tutkinto_amk AS d29 ON d29.tutkinto_amk_koodi=f.tutkinto_amk AND f.tilv_date between d29.alkaa and d29.paattyy
LEFT JOIN VipunenTK..d_koulutusohjelma_amk AS d30 ON d30.koulutusohjelma_amk_koodi=f.koulutusohjelma_amk AND f.tilv_date between d30.alkaa and d30.paattyy
LEFT JOIN VipunenTK..d_suuntautumisvaihtoehto_amk AS d31 ON d31.suuntautumisvaihtoehto_amk_koodi=f.suuntautumisvaihtoehto_amk AND f.tilv_date between d31.alkaa and d31.paattyy
LEFT JOIN VipunenTK..d_koulutustyyppi AS d32 ON d32.koulutustyyppi_koodi=f.koulutustyyppi AND f.tilv_date between d32.alkaa and d32.paattyy
LEFT JOIN VipunenTK..d_kieli AS d33 ON d33.kieli_koodi=f.koulutuksen_kieli AND f.tilv_date between d33.alkaa and d33.paattyy
LEFT JOIN VipunenTK..d_kausi AS d34 ON d34.kausi_id	= f.kirjoihintulovuosi_tutkinto_join
LEFT JOIN VipunenTK..d_kausi AS d35 ON d35.kausi_id	= f.kirjoihintulokausi_tutkinto_join

LEFT JOIN VipunenTK..d_ensisijainen_opintooikeus AS d36 ON d36.ensisijainen_opintooikeus_koodi=f.ensisijainen_opintooikeus AND f.tilv_date between d36.alkaa and d36.paattyy
LEFT JOIN VipunenTK..d_tilauskoulutuksen_sijaintimaa AS d37 ON d37.tilauskoulutuksen_sijaintimaa_koodi=f.tilauskoulutuksen_sijaintimaa AND f.tilv_date between d37.alkaa and d37.paattyy
LEFT JOIN VipunenTK..d_tutkinto_yo AS d38 ON d38.tutkinto_yo_koodi=f.tutkinto_yo AND f.tilv_date between d38.alkaa and d38.paattyy


LEFT JOIN VipunenTK..d_yliopisto AS d41 ON d41.yliopisto_koodi=f.yliopisto AND f.tilv_date between d41.alkaa and d41.paattyy
LEFT JOIN VipunenTK..d_tiedekunta_yo AS d42 ON d42.tiedekunta_yo_koodi=f.tiedekunta_yo AND f.tilv_date between d42.alkaa and d42.paattyy
LEFT JOIN VipunenTK..d_uusi_vanha_opiskelija AS d43 ON d43.uusi_vanha_opiskelija_koodi=f.uusi_vanha_opiskelija AND f.tilv_date between d43.alkaa and d43.paattyy
LEFT JOIN VipunenTK..d_kausi AS d44 ON d44.kausi_id	= f.tutkintooikeusvuosi_join
LEFT JOIN VipunenTK..d_opiskelumuoto AS d45 ON d45.opiskelumuoto_koodi=f.opiskelumuoto AND f.tilv_date between d45.alkaa and d45.paattyy
LEFT JOIN VipunenTK..d_opettajankelpoisuus AS d46 ON d46.opettajankelpoisuus_koodi=f.opettajankelpoisuus AND f.tilv_date between d46.alkaa and d46.paattyy
LEFT JOIN VipunenTK..d_avoinvayla AS d47 ON d47.avoinvayla_koodi=f.avoinvayla AND f.tilv_date between d47.alkaa and d47.paattyy
LEFT JOIN VipunenTK..d_koulutussektori AS d48 ON d48.koulutussektori_koodi=f.koulutussektori AND f.tilv_date between d48.alkaa and d48.paattyy

LEFT JOIN VipunenTK..d_ika AS d49 ON d49.ika_avain=f.ika_1v
LEFT JOIN VipunenTK..d_ika AS d49b ON d49b.ika_avain=f.ikaryhma1_avain
LEFT JOIN VipunenTK..d_ika AS d49c ON d49c.ika_avain=f.ikaryhma2_avain

LEFT JOIN VipunenTK..d_aineisto_OTV AS d50 ON d50.aineisto_koodi=f.aineistotunnus AND f.tilv_date between d50.alkaa and d50.paattyy

/* koulutuksen järjestäjän sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d51 ON d51.alueluokitus_avain = f.koulutuksen_jarjestaja_sijaintikuntakoodi_join

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d51h ON d51h.alueluokitus_avain = f.koulutuksen_jarjestaja_sijaintikuntakoodi_historia_join
		AND f.tilv_date between d51h.alkaa and d51h.paattyy

/* oppilaitoksen sijaintikunta */

LEFT JOIN VipunenTK..d_alueluokitus AS d52 ON d52.alueluokitus_avain = f.oppilaitos_sijaintikuntakoodi_join

LEFT JOIN VipunenTK..d_alueluokitus_historia AS d52h ON d52h.alueluokitus_avain = f.oppilaitos_sijaintikuntakoodi_historia_join
		AND f.tilv_date between d52h.alkaa and d52h.paattyy

LEFT JOIN VipunenTK..d_koulutuslaji_okm AS d54 ON d54.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain

LEFT JOIN VipunenTK..d_koulutusryhma AS d60 ON d60.koulutusryhma_koodi = f.koulutusryhma_avain

LEFT JOIN VipunenTK_lisatiedot..koulutuskoodin_tieteenala AS d61 ON d61.koulutuskoodi=f.koulutusluokitus
LEFT JOIN VipunenTK..d_tieteenala AS d62 ON d62.tieteenala_avain=d61.tieteenala_avain

LEFT JOIN VipunenTK..d_erikoislaakarikoulutus d63 ON d63.erikoislaakarikoulutus_koodi=f.laak
LEFT JOIN VipunenTK..d_patevyyteen_tahtaavat_opinnot_amk d64 on d64.patevyyteen_tahtaavat_opinnot_koodi = f.ltop
LEFT JOIN VipunenTK..d_kvopiskelija d65 on d65.kvopiskelija_koodi = f.kvopisk
LEFT JOIN VipunenTK..d_eu_etamaat d66 on d66.eu_etamaat_avain = f.suormaa


WHERE 
d1.aineisto_koodi=
(case 
	when f.tilastointivuosi <= @maxTilastovuosiL then 'L'
	else  'E'
end)
/*
d1.aineisto_koodi=
(case
	 --when NOT EXISTS (SELECT 1 FROM dbo.f_2_8_Korkeakouluopiskelijat o WHERE o.aineisto='L' and o.tilastointivuosi=f.tilastointivuosi) then 'E' 
	 when f.tilastointivuosi = (select max(tilastointivuosi) from VipunenTK_DW.dbo.f_2_8_Korkeakouluopiskelijat) 
	 and not exists (select 1 from VipunenTK_DW.dbo.f_2_8_Korkeakouluopiskelijat where tilastointivuosi = (select max(tilastointivuosi) from VipunenTK_DW.dbo.f_2_8_Korkeakouluopiskelijat) and aineisto = 'L'
	) then 'E' 
	 else 'L' 
	 end	
)
*/

GO


