USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset]    Script Date: 30.6.2023 18:41:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_yhteiset] AS

Select f.id
,[henkiloiden_lkm]
,[lu_henkiloiden_lkm]
,[amm_henkiloiden_lkm]
,[opist_henkiloiden_lkm]
,[ammka_henkiloiden_lkm]
,[amk_henkiloiden_lkm]
,[akk_henkiloiden_lkm]
,[ylamklkm_henkiloiden_lkm]
,[ykk_henkiloiden_lkm]
,[laaker_henkiloiden_lkm]
,[lis_henkiloiden_lkm]
,[toht_henkiloiden_lkm]
,[Myohemman_yliopistotutkinnon_suorittaneiden_lkm] as myoh_yliop_lkm
,[Myohemman_yo_jatkotutkinnon_suorittaneiden_lkm] as myoh_yo_jatko_lkm
,[Myohemman_opisto_tai_ammatillisen_korkea_asteen_tutkinnon_suorittaneiden_lkm] as myoh_opisto_ammkork_lkm
,[Myohemman_korkeakoulututkinnon_suorittaneiden_lkm] as myoh_kork_lkm
,[Myohemman_toisen_asteen_tutkinnon_suorittaneiden_lkm] as myoh_toinenaste_lkm
,[Myohemman_ammatillisen_tutkinnon_ryhma1_suorittaneiden_lkm] as myoh_ammryhma1_lkm
,[Myohemman_ammatillisen_tutkinnon_ryhma2_suorittaneiden_lkm] as myoh_ammryhma2_lkm
,[Myohemman_ammatillisen_tutkinnon_ryhma3_suorittaneiden_lkm] as myoh_ammryhma3_lkm
,cast([Tilastovuosi] as int) as Tilastovuosi
,d1.tarkastelujakso AS Tarkastelujakso
,d2.aidinkieli_versio1 AS Äidinkieli
,d3.koulutus as Koulutusnimike
,d4.sukupuoli AS Sukupuoli
,cast([suorv] as int) as "Tutkinnon suoritusvuosi"
,d5.lukukausiselite as "Tutkinnon suorituslukukausi"
,ISNULL(NULLIF([alvv],''),'Tuntematon') as "Aloitusvuosi"
,d6.lukukausiselite as "Aloituslukukausi"
,[syntv] as "Syntymävuosi"
,ISNULL(NULLIF([lusuorv],''),'Tuntematon') as "Yo-tutkinnon suoritusvuosi"
,ISNULL(NULLIF([ammsuorv],''),'Tuntematon') as "Amm. tutkinnon suoritusvuosi"
,ISNULL(NULLIF([opistsuorv],''),'Tuntematon') as "Opistoast. tutkinnon suoritusvuosi"
,ISNULL(NULLIF([ammkasuorv],''),'Tuntematon') as "Amm. kork.asteen tutk. suoritusvuosi"
,ISNULL(NULLIF([amksuorv],''),'Tuntematon') as "Amk-tutkinnon suoritusvuosi"
,ISNULL(NULLIF([akksuorv],''),'Tuntematon') as "Alemman kk-tutk. suoritusvuosi"
,ISNULL(NULLIF([ylamksuorv],''),'Tuntematon') as "Ylemmän amk-tutk. suoritusvuosi"
,ISNULL(NULLIF([ykksuorv],''),'Tuntematon')  as "Ylemmän kk-tutk. suoritusvuosi"
,ISNULL(NULLIF([laakersuorv],''),'Tuntematon') as "Lääk. erikois.tutk. suoritusvuosi"
,ISNULL(NULLIF([lissuorv],''),'Tuntematon')  as "Lisensiaatin tutk. suoritusvuosi"
,ISNULL(NULLIF([tohtsuorv],''),'Tuntematon') as "Tohtorin tutk. suorituvuosi"
,d7.oppisopimuskoulutus as "Oppisopimuskoulutus"
,d8.ammatillisen_koulutuksen_koulutuslaji as "Tutkintotyyppi"
,d9.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus as "Järjestämistapa"
,d10.nuorten_aikuisten_koulutus_amm as "Nuorten/aikuisten koulutus"
,d11.ika as Ikä
,d11.ika5v as Ikäryhmä
,d12.koulutus as "Yo-tutkinnon koulutusnimike"
,d13.tutkinto_suoritettu as "Myöh. suoritettu yo-tutkinto"
,d14.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (yo)"
,d141.nuorten_aikuisten_koulutus_amm as "Nuorten/aikuisten koulutus (yo)"
,d15.koulutus as "Amm. tutkinnon koulutusnimike"
,d16.tutkinto_suoritettu as "Myöh. suoritettu amm. tutkinto"
,d17.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (amm)"
,d171.ammatillisen_koulutuksen_koulutuslaji as "Amm. tutkinnon tutkintotyyppi"
,d172.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus as "Amm. tutkinnon järjestämistapa"
,d173.oppisopimuskoulutus as "Amm. tutkinto oppisopimuskoul."
,d173ish.selite_fi as "Amm. tutkinnon koulutus- ja oppisopimusjaksot"
,d174.tutkintojen_maara as "Amm. tutkintojen määrä"
,d175.ammatillisen_koulutuksen_luokittelu_4_7_4_8 as "Amm. koulutuksen ryhmät"
,d18.koulutus as "Opistoast. tutkinnon koulutusnimike"
,d19.tutkinto_suoritettu as "Myöh. suoritettu opistoast. tutkinto"
,d20.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (opisto)"
,d21.koulutus as "Amm. kork.asteen tutk. koulutusnimike"
,d22.tutkinto_suoritettu as "Myöh. suoritettu amm. kork.asteen tutkinto"
,d23.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (ammka)"
,d24.koulutus as "Amk-tutkinnon koulutusnimike"
,d25.tutkinto_suoritettu as "Myöh. suoritettu amk-tutkinto"
,d26.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (amk)"
,d261.tutkintojen_maara as "Amk-tutkintojen määrä"
,d262.aikuisopiskelija as "Nuorten/aikuisten koulutus (amk)"
,d27.koulutus as "Alemman kk-tutk. koulutusnimike"
,d28.tutkinto_suoritettu as "Myöh. suoritettu alempi kk-tutkinto"
,d29.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (alempi kk)"
,d291.tutkintojen_maara as "Alempien kk-tutkintojen määrä"
,d30.koulutus as "Ylemmän amk-tutk. koulutusnimike"
,d31.tutkinto_suoritettu as "Myöh. suoritettu ylempi amk-tutkinto"
,d32.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (ylempi amk)"
,d33.koulutus as "Ylemmän kk-tutk. koulutusnimike"
,d34.tutkinto_suoritettu as "Myöh. suoritettu ylempi kk-tutkinto"
,d35.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (ylempi kk)"
,d351.tutkintojen_maara as "Ylempien kk-tutkintojen määrä"
,d36.koulutus as "Lääk. erikois.tutk. koulutusnimike"
,d37.tutkinto_suoritettu as "Myöh. suoritettu lääk. erikois.tutk."
,d38.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (lääk. erik.)"
,d39.koulutus as "Lisensiaatin tutk. koulutusnimike"
,d40.tutkinto_suoritettu as "Myöh. suoritettu lisensiaatin tutk."
,d41.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (lis.)"
,d42.koulutus as "Tohtorin tutk. koulutusnimike"
,d43.tutkinto_suoritettu as "Myöh. suoritettu tohtorin tutk."
,d44.koulutuksesta_kulunut_aika as "Kulunut aika alkup. tutkinnosta (toht.)"
,d45.tutkinto_suoritettu as "Myöh. suoritettu yliopistotutkinto"
,d46.tutkinto_suoritettu as "Myöh. suoritettu yo-jatkotutkinto"
,d47.tutkinto_suoritettu as "Myöh. suoritettu opistoast. tai amm. kork.ast. tutkinto"
,d48.tutkinto_suoritettu as "Myöh. suoritettu korkeakoulututkinto"
,d49.tutkinto_suoritettu as "Myöh. suoritettu toisen asteen tutkinto"
,d50.tutkinto_suoritettu as "Myöh. suoritettu amm. tutkinto (ryhmä 1)"
,d51.tutkinto_suoritettu as "Myöh. suoritettu amm. tutkinto (ryhmä 2)"
,d52.tutkinto_suoritettu as "Myöh. suoritettu amm. tutkinto (ryhmä 3)"

,d666.tutkinto_suoritettu_ulkomailla as "Tutk. suor. ulkomailla"
,'Myöh. '+d666_lu.tutkinto_suoritettu_ulkomailla+' (yo)' as "Myöh. tutk. suor. ulkomailla (yo)"
,'Myöh. '+d666_amm.tutkinto_suoritettu_ulkomailla+' (amm)' as "Myöh. tutk. suor. ulkomailla (amm)"
,'Myöh. '+d666_opist.tutkinto_suoritettu_ulkomailla+' (opisto)' as "Myöh. tutk. suor. ulkomailla (opisto)"
,'Myöh. '+d666_ammka.tutkinto_suoritettu_ulkomailla+' (ammka)' as "Myöh. tutk. suor. ulkomailla (ammka)"
,'Myöh. '+d666_amk.tutkinto_suoritettu_ulkomailla+' (amk)' as "Myöh. tutk. suor. ulkomailla (amk)"
,'Myöh. '+d666_akk.tutkinto_suoritettu_ulkomailla+' (alempi kk)' as "Myöh. tutk. suor. ulkomailla (alempi kk)"
,'Myöh. '+d666_ylamk.tutkinto_suoritettu_ulkomailla+' (ylempi amk)' as "Myöh. tutk. suor. ulkomailla (ylempi amk)"
,'Myöh. '+d666_ykk.tutkinto_suoritettu_ulkomailla+' (ylempi kk)' as "Myöh. tutk. suor. ulkomailla (ylempi kk)"
,'Myöh. '+d666_laaker.tutkinto_suoritettu_ulkomailla+' (lääk. erik.)' as "Myöh. tutk. suor. ulkomailla (lääk. erik.)"
,'Myöh. '+d666_lis.tutkinto_suoritettu_ulkomailla+' (lis.)' as "Myöh. tutk. suor. ulkomailla (lis.)"
,'Myöh. '+d666_toht.tutkinto_suoritettu_ulkomailla+' (toht.)' as "Myöh. tutk. suor. ulkomailla (toht.)"

,d101.sama_koulutusala as "Yo-tutkinto samalla koul.alalla 1"
,d102.sama_koulutusala as "Amm. tutk. samalla koul.alalla 1"
,d103.sama_koulutusala as "Opistoast. tutk. samalla koul.alalla 1"
,d104.sama_koulutusala as "Amm. ka. tutk. samalla koul.alalla 1"
,d105.sama_koulutusala as "Amk-tutkinto samalla koul.alalla 1"
,d106.sama_koulutusala as "Alempi kk-tutk. samalla koul.alalla 1"
,d107.sama_koulutusala as "Ylempi amk-tutk. samalla koul.alalla 1"
,d108.sama_koulutusala as "Ylempi kk-tutk. samalla koul.alalla 1"
,d109.sama_koulutusala as "Laak. erik.tutk. samalla koul.alalla 1"
,d110.sama_koulutusala as "Lis. tutkinto samalla koul.alalla 1"
,d111.sama_koulutusala as "Toht. tutkinto samalla koul.alalla 1"
,d112.sama_koulutusala as "Yliopistotutk. samalla koul.alalla 1"
,d113.sama_koulutusala as "Yo-jatkotutk. samalla koul.alalla 1"
,d114.sama_koulutusala as "Opisto/amm.ka. tutk. samalla koul.alalla 1"
,d115.sama_koulutusala as "Korkeak.tutk. samalla koul.alalla 1"
,d116.sama_koulutusala as "Toisen asteen tutk. samalla koul.alalla 1"
,d117.sama_koulutusala as "Yo-tutkinto samalla koul.alalla 2"
,d118.sama_koulutusala as "Amm. tutk. samalla koul.alalla 2"
,d119.sama_koulutusala as "Opistoast. tutk. samalla koul.alalla 2"
,d120.sama_koulutusala as "Amm. ka. tutk. samalla koul.alalla 2"
,d121.sama_koulutusala as "Amk-tutkinto samalla koul.alalla 2"
,d122.sama_koulutusala as "Alempi kk-tutk. samalla koul.alalla 2"
,d123.sama_koulutusala as "Ylempi amk-tutk. samalla koul.alalla 2"
,d124.sama_koulutusala as "Ylempi kk-tutk. samalla koul.alalla 2"
,d125.sama_koulutusala as "Laak. erik.tutk. samalla koul.alalla 2"
,d126.sama_koulutusala as "Lis. tutkinto samalla koul.alalla 2"
,d127.sama_koulutusala as "Toht. tutkinto samalla koul.alalla 2"
,d128.sama_koulutusala as "Yliopistotutk. samalla koul.alalla 2"
,d129.sama_koulutusala as "Yo-jatkotutk. samalla koul.alalla 2"
,d130.sama_koulutusala as "Opisto/amm.ka. tutk. samalla koul.alalla 2"
,d131.sama_koulutusala as "Korkeak.tutk. samalla koul.alalla 2"
,d132.sama_koulutusala as "Toisen asteen tutk. samalla koul.alalla 2"
--jarjestysmuuttujat
,d1.jarjestys AS jarj_tarkastelujakso
,d2.jarjestys AS jarj_aidinkieli
,d3.jarjestys as jarj_koulnimike
,d7.jarjestys as jarj_oppis
,d8.jarjestys as jarj_tutktyyppi
,d9.jarjestys as jarj_jarjtapa
,d10.jarjestys as jarj_nuoretaikuisetamm
,d11.jarjestys_ika as jarj_ika
,d11.jarjestys_ika5v as jarj_ika5v
,d12.jarjestys as jarj_lukio_koulnimike
,d13.jarjestys as jarj_lukio_myohtutk
,d14.jarjestys as jarj_lukio_kulunutaika
,d141.jarjestys as jarj_lukio_nuoretaikuiset
,d15.jarjestys as jarj_amm_koulnimike
,d16.jarjestys as jarj_amm_myohtutk
,d17.jarjestys as jarj_amm_kulunutaika
,d171.jarjestys as jarj_amm_tutktyyppi
,d172.jarjestys as jarj_amm_jarjtapa
,d173.jarjestys as jarj_amm_oppis
,d173ish.jarjestys_koodi as jarj_amm_sopimusjaksot
,d174.jarjestys as jarj_amm_tutkmaara
,d175.jarjestys as jarj_amm_ryhma
,d18.jarjestys as jarj_opisto_koulnimike
,d19.jarjestys as jarj_opisto_myohtutk
,d20.jarjestys as jarj_opisto_kulunutaika
,d21.jarjestys as jarj_amm_kork_aste_koulnimike
,d22.jarjestys as jarj_amm_kork_aste_myohtutk
,d23.jarjestys as jarj_amm_kork_aste_kulunutaika
,d24.jarjestys as jarj_amk_koulnimike
,d25.jarjestys as jarj_amk_myohtutk
,d26.jarjestys as jarj_amk_kulunutaika
,d261.jarjestys as jarj_amk_tutkmaara
,d262.jarjestys as jarj_amk_nuoraik
,d27.jarjestys as jarj_alempi_kk_koulnimike
,d28.jarjestys as jarj_alempi_kk_myohtutk
,d29.jarjestys as jarj_alempi_kk_kulunutaika
,d291.jarjestys as jarj_alempi_kk_tutkmaara
,d30.jarjestys as jarj_ylempi_amk_koulnimike
,d31.jarjestys as jarj_ylempi_amk_myohtutk
,d32.jarjestys as jarj_ylempi_amk_kulunutaika
,d33.jarjestys as jarj_ylempi_kk_koulnimike
,d34.jarjestys as jarj_ylempi_kk_myohtutk
,d35.jarjestys as jarj_ylempi_kk_kulunutaika
,d351.jarjestys as jarj_ylempi_kk_tutkmaara
,d36.jarjestys as jarj_laak_erik_koulnimike
,d37.jarjestys as jarj_laak_erik_myohtutk
,d38.jarjestys as jarj_laak_erik_kulunutaika
,d39.jarjestys as jarj_lis_koulnimike
,d40.jarjestys as jarj_lis_myohtutk
,d41.jarjestys as jarj_lis_kulunutaika
,d42.jarjestys as jarj_toht_koulnimike
,d43.jarjestys as jarj_toht_myohtutk
,d44.jarjestys as jarj_toht_kulunutaika
,d45.jarjestys as jarj_yliopisto_myohtutk
,d46.jarjestys as jarj_yojatko_myohtutk
,d47.jarjestys as jarj_opist_myohtutk
,d48.jarjestys as jarj_korkeakoulu_myohtutk
,d49.jarjestys as jarj_toinenaste_myohtutk
,d50.jarjestys as jarj_ammryhma1_myohtutk
,d51.jarjestys as jarj_ammryhma2_myohtutk
,d52.jarjestys as jarj_ammryhma3_myohtutk
,d666.jarjestys as jarj_ulkom
,d666_lu.jarjestys as jarj_luulkom
,d666_amm.jarjestys as jarj_ammulkom
,d666_opist.jarjestys as jarj_opistulkom
,d666_ammka.jarjestys as jarj_ammkaulkom
,d666_amk.jarjestys as jarj_amkulkom
,d666_akk.jarjestys as jarj_akkulkom
,d666_ylamk.jarjestys as jarj_ylamkulkom
,d666_ykk.jarjestys as jarj_ykkulkom
,d666_laaker.jarjestys as jarj_laakerulkom
,d666_lis.jarjestys as jarj_lisulkom
,d666_toht.jarjestys as jarj_tohtulkom
,d101.jarjestys as jarj_samaiscbroad_lu
,d102.jarjestys as jarj_samaiscbroad_amm
,d103.jarjestys as jarj_samaiscbroad_opisto
,d104.jarjestys as jarj_samaiscbroad_ammka
,d105.jarjestys as jarj_samaiscbroad_amk
,d106.jarjestys as jarj_samaiscbroad_alempikk
,d107.jarjestys as jarj_samaiscbroad_ylempiamk
,d108.jarjestys as jarj_samaiscbroad_ylempikk
,d109.jarjestys as jarj_samaiscbroad_laak
,d110.jarjestys as jarj_samaiscbroad_lis
,d111.jarjestys as jarj_samaiscbroad_toht
,d112.jarjestys as jarj_samaiscbroad_yliopisto
,d113.jarjestys as jarj_samaiscbroad_yojatko
,d114.jarjestys as jarj_samaiscbroad_opistoammka
,d115.jarjestys as jarj_samaiscbroad_korkeak
,d116.jarjestys as jarj_samaiscbroad_toinenaste
,d117.jarjestys as jarj_samaiscnarrow_lu
,d118.jarjestys as jarj_samaiscnarrow_amm
,d119.jarjestys as jarj_samaiscnarrow_opisto
,d120.jarjestys as jarj_samaiscnarrow_ammka
,d121.jarjestys as jarj_samaiscnarrow_amk
,d122.jarjestys as jarj_samaiscnarrow_alempikk
,d123.jarjestys as jarj_samaiscnarrow_ylempiamk
,d124.jarjestys as jarj_samaiscnarrow_ylempikk
,d125.jarjestys as jarj_samaiscnarrow_laak
,d126.jarjestys as jarj_samaiscnarrow_lis
,d127.jarjestys as jarj_samaiscnarrow_toht
,d128.jarjestys as jarj_samaiscnarrow_yliopisto
,d129.jarjestys as jarj_samaiscnarrow_yojatko
,d130.jarjestys as jarj_samaiscnarrow_opistoammka
,d131.jarjestys as jarj_samaiscnarrow_korkeak
,d132.jarjestys as jarj_samaiscnarrow_toinenaste
--koodimuuttujat
,d3.koulutus_koodi as "Koodit Koulutusnimike"
,d12.koulutus_koodi as "Koodit Yo-tutkinnon koulutusnimike"
,d15.koulutus_koodi as "Koodit Amm. tutkinnon koulutusnimike"
,d18.koulutus_koodi as "Koodit Opistoast. tutkinnon koulutusnimike"
,d21.koulutus_koodi as "Koodit Amm. kork.asteen tutk. koulutusnimike"
,d24.koulutus_koodi as "Koodit Amk-tutkinnon koulutusnimike"
,d27.koulutus_koodi as "Koodit Alemman kk-tutk. koulutusnimike"
,d30.koulutus_koodi as "Koodit Ylemmän amk-tutk. koulutusnimike"
,d33.koulutus_koodi as "Koodit Ylemmän kk-tutk. koulutusnimike"
,d36.koulutus_koodi as "Koodit Lääk. erikois.tutk. koulutusnimike"
,d39.koulutus_koodi as "Koodit Lisensiaatin tutk. koulutusnimike"
,d42.koulutus_koodi as "Koodit Tohtorin tutk. koulutusnimike"
,rivinumero
--isced
,d3.iscle2011 as "Koulutusaste, taso 1"
,d3.Koulutusaste_taso2 as "Koulutusaste, taso 2"
,d3.iscfibroad2013 as "Koulutusala, taso 1"
,d3.iscfinarrow2013 as "Koulutusala, taso 2"
,d3.iscfi2013 as "Koulutusala, taso 3"
,d3.OKM_ohjauksen_ala as "OKM ohjauksen ala"
,d3.jarjestys_iscle2011 as jarj_isced_koulast1
,d3.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d3.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d3.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d3.jarjestys_iscfi2013 as jarj_isced_koulala3
,d3.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1
,d3.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
,d3.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
,d3.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
,d3.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
,d3.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
,d3.OKM_ohjauksen_ala_koodi as "Koodit OKM ohjauksen ala"
,d12.iscfi2013 as "Yo-tutkinnon koulutusala 3"
,d15.iscfibroad2013 as "Amm. tutkinnon koulutusala 1"
,d15.iscfinarrow2013 as "Amm. tutkinnon koulutusala 2"
,d15.iscfi2013 as "Amm. tutkinnon koulutusala 3"
,d18.iscfibroad2013 as "Opistoast. tutkinnon koulutusala 1"
,d18.iscfinarrow2013 as "Opistoast. tutkinnon koulutusala 2"
,d18.iscfi2013 as "Opistoast. tutkinnon koulutusala 3"
,d21.iscfibroad2013 as "Amm. kork.asteen tutk. koulutusala 1"
,d21.iscfinarrow2013 as "Amm. kork.asteen tutk. koulutusala 2"
,d21.iscfi2013 as "Amm. kork.asteen tutk. koulutusala 3"
,d24.iscfibroad2013 as "Amk-tutkinnon koulutusala 1"
,d24.OKM_ohjauksen_ala as "Amk-tutkinnon OKM ohjauksen ala"
,d24.iscfinarrow2013 as "Amk-tutkinnon koulutusala 2"
,d24.iscfi2013 as "Amk-tutkinnon koulutusala 3"
,d27.iscfibroad2013 as "Alemman kk-tutk. koulutusala 1"
,d27.OKM_ohjauksen_ala as "Alemman kk-tutk. OKM ohjauksen ala"
,d27.iscfinarrow2013 as "Alemman kk-tutk. koulutusala 2"
,d27.iscfi2013 as "Alemman kk-tutk. koulutusala 3"
,d30.iscfibroad2013 as "Ylemmän amk-tutk. koulutusala 1"
,d30.OKM_ohjauksen_ala as "Ylemmän amk-tutk. OKM ohjauksen ala"
,d30.iscfinarrow2013 as "Ylemmän amk-tutk. koulutusala 2"
,d30.iscfi2013 as "Ylemmän amk-tutk. koulutusala 3"
,d33.iscfibroad2013 as "Ylemmän kk-tutk. koulutusala 1"
,d33.OKM_ohjauksen_ala as "Ylemmän kk-tutk. OKM ohjauksen ala"
,d33.iscfinarrow2013 as "Ylemmän kk-tutk. koulutusala 2"
,d33.iscfi2013 as "Ylemmän kk-tutk. koulutusala 3"
,d36.iscfi2013 as "Lääk. erikois.tutk. koulutusala 3"
,d39.iscfibroad2013 as "Lisensiaatin tutk. koulutusala 1"
,d39.OKM_ohjauksen_ala as "Lisensiaatin tutk. OKM ohjauksen ala"
,d39.iscfinarrow2013 as "Lisensiaatin tutk. koulutusala 2"
,d39.iscfi2013 as "Lisensiaatin tutk. koulutusala 3"
,d42.iscfibroad2013 as "Tohtorin tutk. koulutusala 1"
,d42.OKM_ohjauksen_ala as "Tohtorin tutk. OKM ohjauksen ala"
,d42.iscfinarrow2013 as "Tohtorin tutk. koulutusala 2"
,d42.iscfi2013 as "Tohtorin tutk. koulutusala 3"
,d12.jarjestys_iscfi2013 as jarj_lukio_iscfi2013
,d15.jarjestys_iscfibroad2013 as jarj_amm_iscfibroad2013
,d15.jarjestys_iscfinarrow2013 as jarj_amm_iscfinarrow2013
,d15.jarjestys_iscfi2013 as jarj_amm_iscfi2013
,d18.jarjestys_iscfibroad2013 as jarj_opisto_iscfibroad2013
,d18.jarjestys_iscfinarrow2013 as jarj_opisto_iscfinarrow2013
,d18.jarjestys_iscfi2013 as jarj_opisto_iscfi2013
,d21.jarjestys_iscfibroad2013 as jarj_amm_kork_aste_iscfibroad2013
,d21.jarjestys_iscfinarrow2013 as jarj_amm_kork_aste_iscfinarrow2013
,d21.jarjestys_iscfi2013 as jarj_amm_kork_aste_iscfi2013
,d24.jarjestys_iscfibroad2013 as jarj_amk_iscfibroad2013
,d24.jarjestys_OKM_ohjauksen_ala as jarj_amk_OKM_ohjauksen_ala
,d24.jarjestys_iscfinarrow2013 as jarj_amk_iscfinarrow2013
,d24.jarjestys_iscfi2013 as jarj_amk_iscfi2013
,d27.jarjestys_iscfibroad2013 as jarj_alempi_kk_iscfibroad2013
,d27.jarjestys_OKM_ohjauksen_ala as jarj_alempi_kk_OKM_ohjauksen_ala
,d27.jarjestys_iscfinarrow2013 as jarj_alempi_kk_iscfinarrow2013
,d27.jarjestys_iscfi2013 as jarj_alempi_kk_iscfi2013
,d30.jarjestys_iscfibroad2013 as jarj_ylempi_amk_iscfibroad2013
,d30.jarjestys_OKM_ohjauksen_ala as jarj_ylempi_amk_OKM_ohjauksen_ala
,d30.jarjestys_iscfinarrow2013 as jarj_ylempi_amk_iscfinarrow2013
,d30.jarjestys_iscfi2013 as jarj_ylempi_amk_iscfi2013
,d33.jarjestys_iscfibroad2013 as jarj_ylempi_kk_iscfibroad2013
,d33.jarjestys_OKM_ohjauksen_ala as jarj_ylempi_kk_OKM_ohjauksen_ala
,d33.jarjestys_iscfinarrow2013 as jarj_ylempi_kk_iscfinarrow2013
,d33.jarjestys_iscfi2013 as jarj_ylempi_kk_iscfi2013
,d36.jarjestys_iscfi2013 as jarj_laak_erik_iscfi2013
,d39.jarjestys_iscfibroad2013 as jarj_lis_iscfibroad2013
,d39.jarjestys_OKM_ohjauksen_ala as jarj_lis_OKM_ohjauksen_ala
,d39.jarjestys_iscfinarrow2013 as jarj_lis_iscfinarrow2013
,d39.jarjestys_iscfi2013 as jarj_lis_iscfi2013
,d42.jarjestys_iscfibroad2013 as jarj_toht_iscfibroad2013
,d42.jarjestys_OKM_ohjauksen_ala as jarj_toht_OKM_ohjauksen_ala
,d42.jarjestys_iscfinarrow2013 as jarj_toht_iscfinarrow2013
,d42.jarjestys_iscfi2013 as jarj_toht_iscfi2013
,d12.iscfi2013_koodi as "Koodit Yo-tutkinnon koulutusala 3"
,d15.iscfibroad2013_koodi as "Koodit Amm. tutkinnon koulutusala 1"
,d15.iscfinarrow2013_koodi as "Koodit Amm. tutkinnon koulutusala 2"
,d15.iscfi2013_koodi as "Koodit Amm. tutkinnon koulutusala 3"
,d18.iscfibroad2013_koodi as "Koodit Opistoast. tutkinnon koulutusala 1"
,d18.iscfinarrow2013_koodi as "Koodit Opistoast. tutkinnon koulutusala 2"
,d18.iscfi2013_koodi as "Koodit Opistoast. tutkinnon koulutusala 3"
,d21.iscfibroad2013_koodi as "Koodit Amm. kork.asteen tutk. koulutusala 1"
,d21.iscfinarrow2013_koodi as "Koodit Amm. kork.asteen tutk. koulutusala 2"
,d21.iscfi2013_koodi as "Koodit Amm. kork.asteen tutk. koulutusala 3"
,d24.iscfibroad2013_koodi as "Koodit Amk-tutkinnon koulutusala 1"
,d24.OKM_ohjauksen_ala_koodi as "Koodit Amk-tutkinnon OKM ohjauksen ala"
,d24.iscfinarrow2013_koodi as "Koodit Amk-tutkinnon koulutusala 2"
,d24.iscfi2013_koodi as "Koodit Amk-tutkinnon koulutusala 3"
,d27.iscfibroad2013_koodi as "Koodit Alemman kk-tutk. koulutusala 1"
,d27.OKM_ohjauksen_ala_koodi as "Koodit Alemman kk-tutk. OKM ohjauksen ala"
,d27.iscfinarrow2013_koodi as "Koodit Alemman kk-tutk. koulutusala 2"
,d27.iscfi2013_koodi as "Koodit Alemman kk-tutk. koulutusala 3"
,d30.iscfibroad2013_koodi as "Koodit Ylemmän amk-tutk. koulutusala 1"
,d30.OKM_ohjauksen_ala_koodi as "Koodit Ylemmän amk-tutk. OKM ohjauksen ala"
,d30.iscfinarrow2013_koodi as "Koodit Ylemmän amk-tutk. koulutusala 2"
,d30.iscfi2013_koodi as "Koodit Ylemmän amk-tutk. koulutusala 3"
,d33.iscfibroad2013_koodi as "Koodit Ylemmän kk-tutk. koulutusala 1"
,d33.OKM_ohjauksen_ala_koodi as "Koodit Ylemmän kk-tutk. OKM ohjauksen ala"
,d33.iscfinarrow2013_koodi as "Koodit Ylemmän kk-tutk. koulutusala 2"
,d33.iscfi2013_koodi as "Koodit Ylemmän kk-tutk. koulutusala 3"
,d36.iscfi2013_koodi as "Koodit Lääk. erikois.tutk. koulutusala 3"
,d39.iscfibroad2013_koodi as "Koodit Lisensiaatin tutk. koulutusala 1"
,d39.OKM_ohjauksen_ala_koodi as "Koodit Lisensiaatin tutk. OKM ohjauksen ala"
,d39.iscfinarrow2013_koodi as "Koodit Lisensiaatin tutk. koulutusala 2"
,d39.iscfi2013_koodi as "Koodit Lisensiaatin tutk. koulutusala 3"
,d42.iscfibroad2013_koodi as "Koodit Tohtorin tutk. koulutusala 1"
,d42.OKM_ohjauksen_ala_koodi as "Koodit Tohtorin tutk. OKM ohjauksen ala"
,d42.iscfinarrow2013_koodi as "Koodit Tohtorin tutk. koulutusala 2"
,d42.iscfi2013_koodi as "Koodit Tohtorin tutk. koulutusala 3"

FROM dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 f
	LEFT JOIN d_tarkastelujakso d1 ON d1.id = tarkastelujakso_id
	LEFT JOIN d_aidinkieli_versio1 d2 ON d2.id = aidinkieli_id
	LEFT JOIN d_koulutusluokitus d3 ON d3.id = koulutusluokitus_id
	LEFT JOIN d_sukupuoli d4 ON d4.id = sukupuoli_id
	LEFT JOIN d_kausi d5 ON d5.kausi_id = suorituskausi_id
	LEFT JOIN d_kausi d6 ON d6.kausi_id = aloituskausi_id
	LEFT JOIN d_oppisopimuskoulutus d7 ON d7.id = oppisopimuskoulutus_id
	LEFT JOIN d_ammatillisen_koulutuksen_koulutuslaji d8 ON d8.id = ammatillisen_koulutuksen_koulutuslaji_id
	LEFT JOIN d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d9 ON d9.id = opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	LEFT JOIN d_nuorten_aikuisten_koulutus_amm d10 ON d10.id = nuorten_aikuisten_koulutus_amm_id
	LEFT JOIN d_ika d11 ON d11.id = ika_id
	LEFT JOIN d_koulutusluokitus d12 ON d12.id = lu_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d13 ON d13.id = lu_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d14 ON d14.id = lu_ika_id
	LEFT JOIN d_nuorten_aikuisten_koulutus_amm d141 ON d141.id = lu_nuorten_aikuisten_koulutus_amm_id
	LEFT JOIN d_koulutusluokitus d15 ON d15.id = amm_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d16 ON d16.id = amm_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d17 ON d17.id = amm_ika_id
	LEFT JOIN d_ammatillisen_koulutuksen_koulutuslaji d171 ON d171.id = ammtutklaja_id
	LEFT JOIN d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d172 ON d172.id = ammtutktav_id
	LEFT JOIN d_oppisopimuskoulutus d173 ON d173.id = ammoppis_id
	LEFT JOIN d_amm_sopimusjaksot d173ish ON d173ish.id = amm_sopimusjaksot_id 
	LEFT JOIN d_tutkintojen_maara d174 ON d174.id = ammlkm_id
	LEFT JOIN d_ammatillinen_koulutus_luokittelu d175 on d175.id = ammatillinen_koulutus_ryhma_id
	LEFT JOIN d_koulutusluokitus d18 ON d18.id = opist_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d19 ON d19.id = opist_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d20 ON d20.id = opist_ika_id
	LEFT JOIN d_koulutusluokitus d21 ON d21.id = ammka_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d22 ON d22.id = ammka_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d23 ON d23.id = ammka_ika_id
	LEFT JOIN d_koulutusluokitus d24 ON d24.id = amk_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d25 ON d25.id = amk_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d26 ON d26.id = amk_ika_id
	LEFT JOIN d_tutkintojen_maara d261 ON d261.id = amklkm_id
	LEFT JOIN d_aikuisopiskelija d262 ON d262.id = amkaikoul_id
	LEFT JOIN d_koulutusluokitus d27 ON d27.id = akk_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d28 ON d28.id = akk_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d29 ON d29.id = akk_ika_id
	LEFT JOIN d_tutkintojen_maara d291 ON d291.id = akklkm_id
	LEFT JOIN d_koulutusluokitus d30 ON d30.id = ylamk_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d31 ON d31.id = ylamk_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d32 ON d32.id = ylamk_ika_id
	LEFT JOIN d_koulutusluokitus d33 ON d33.id = ykk_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d34 ON d34.id = ykk_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d35 ON d35.id = ykk_ika_id
	LEFT JOIN d_tutkintojen_maara d351 ON d351.id = ykklkm_id
	LEFT JOIN d_koulutusluokitus d36 ON d36.id = laaker_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d37 ON d37.id = laaker_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d38 ON d38.id = laaker_ika_id
	LEFT JOIN d_koulutusluokitus d39 ON d39.id = lis_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d40 ON d40.id = lis_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d41 ON d41.id = lis_ika_id
	LEFT JOIN d_koulutusluokitus d42 ON d42.id = toht_myohempi_koulutusluokitus_id
	LEFT JOIN d_tutkinto_suoritettu d43 ON d43.id = toht_myohempi_tutkinto_suoritettu_id
	LEFT JOIN d_koulutuksesta_kulunut_aika d44 ON d44.id = toht_ika_id
	LEFT JOIN d_tutkinto_suoritettu d45 ON d45.id = yliopistotutkinto_myohempi_suoritettu_id
	LEFT JOIN d_tutkinto_suoritettu d46 ON d46.id = yo_jatkotutkinto_myohempi_suoritettu_id
	LEFT JOIN d_tutkinto_suoritettu d47 ON d47.id = opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu_id
	LEFT JOIN d_tutkinto_suoritettu d48 ON d48.id = korkeakoulututkinto_myohempi_suoritettu_id
	LEFT JOIN d_tutkinto_suoritettu d49 ON d49.id = toisen_asteen_tutkinto_myohempi_suoritettu_id
	LEFT JOIN d_tutkinto_suoritettu d50 ON d50.id = ammatillisen_tutkinto_myohempi_suoritettu_ryhma1_id
	LEFT JOIN d_tutkinto_suoritettu d51 ON d51.id = ammatillisen_tutkinto_myohempi_suoritettu_ryhma2_id
	LEFT JOIN d_tutkinto_suoritettu d52 ON d52.id = ammatillisen_tutkinto_myohempi_suoritettu_ryhma3_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666 ON d666.id = ulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_lu ON d666_lu.id = luulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_amm ON d666_amm.id = ammulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_opist ON d666_opist.id = opistulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_ammka ON d666_ammka.id = ammkaulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_amk ON d666_amk.id = amkulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_akk ON d666_akk.id = akkulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_ylamk ON d666_ylamk.id = ylamkulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_ykk ON d666_ykk.id = ykkulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_laaker ON d666_laaker.id = laakerulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_lis ON d666_lis.id = lisulkom_id
	LEFT JOIN d_tutkinto_suoritettu_ulkomailla d666_toht ON d666_toht.id = tohtulkom_id
	LEFT JOIN d_sama_koulutusala d101 ON d101.id = lu_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d102 ON d102.id = amm_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d103 ON d103.id = opist_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d104 ON d104.id = ammka_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d105 ON d105.id = akk_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d106 ON d106.id = amk_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d107 ON d107.id = ylamk_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d108 ON d108.id = ykk_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d109 ON d109.id = laaker_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d110 ON d110.id = lis_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d111 ON d111.id = toht_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d112 ON d112.id = yliopistotutkinto_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d113 ON d113.id = yo_jatkotutkinto_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d114 ON d114.id = opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d115 ON d115.id = korkeakoulututkinto_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d116 ON d116.id = toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_id
	LEFT JOIN d_sama_koulutusala d117 ON d117.id = lu_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d118 ON d118.id = amm_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d119 ON d119.id = opist_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d120 ON d120.id = ammka_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d121 ON d121.id = akk_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d122 ON d122.id = amk_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d123 ON d123.id = ylamk_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d124 ON d124.id = ykk_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d125 ON d125.id = laaker_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d126 ON d126.id = lis_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d127 ON d127.id = toht_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d128 ON d128.id = yliopistotutkinto_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d129 ON d129.id = yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d130 ON d130.id = opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d131 ON d131.id = korkeakoulututkinto_sama_myohempi_iscfinarrow2013_id
	LEFT JOIN d_sama_koulutusala d132 ON d132.id = toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id


GO


