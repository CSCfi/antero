USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_toisen_asteen_aikaisempi_koulutus_ammatillinen]    Script Date: 26.6.2025 10.01.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















ALTER VIEW [dbo].[v_f_tab_toisen_asteen_aikaisempi_koulutus_ammatillinen] AS

Select [Opisk2] = lukumaara,
[Aloitt2] = coalesce(aloittaneet,0)
,[Tilastovuosi] AS Tilastovuosi
,d2.aidinkieli_versio1 AS Äidinkieli
,d3.avi AS "Asuinalueen AVI"
,d3.ely AS "Asuinalueen ELY"
,d3.kielisuhde AS "Asuinkunnan kielisuhde"
,d3.maakunta AS Asuinmaakunta
,d3.kunta AS Asuinkunta
,d4.sukupuoli AS Sukupuoli
,d5.ika AS Ikä
,d51.ika AS "Ikä 15-64"
,d51.ika5v AS "Ikäryhmä 15-64"
,d6.ika5v AS Ikäryhmä
,d7.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS Järjestämistapa
,d8.nuorten_aikuisten_koulutus AS "Nuorten/aikuisten"
,d9.nuorten_aikuisten_koulutus_amm AS "Nuoret/aikuiset"
,d10.lahde AS Lähde
--,d11.opetushallinnon_koulutus AS Hallinnonala
,d11b.hallinnonala AS Hallinnonala
,d12.opiskelijan_olo AS Kirjoillaolo
,d13.rahoituslahde_amm AS Rahoituslähde
,d14.oppilaitostyyppi AS Oppilaitostyyppi
,d15a.opintoala2002 AS "Pohjakoul. opintoala (ammpk)"
,d15b.koulutusala2002 AS "Pohjakoul. koulutusala (ammpk)"
,d15c.koulutusaste2002 AS "Pohjakoul. koulutusaste (ammpk)"
,d15d.opintoala2002 AS "Pohjakoul. opintoala (ammlisä)"
,d15e.koulutusala2002 AS "Pohjakoul. koulutusala (ammlisä)"
,d15f.koulutusaste2002 AS "Pohjakoul. koulutusaste (ammlisä)"
,d15g.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (alempi kk)"
,d15h.koulutusala1995 AS "Pohjakoul. koulutusala95 (alempi kk)"
,d15i.opintoala2002 AS "Pohjakoul. opintoala (alempi kk)"
,d15j.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (alempi kk)"
,d15k.koulutusaste2002 AS "Pohjakoul. koulutusaste (alempi kk)"
,d15l.opintoala1995 AS "Pohjakoul. koul.ala (95 luokitus) (ylempi kk)"
,d15m.koulutusala1995 AS "Pohjakoul. koulutusala95 (ylempi kk)"
,d15n.opintoala2002 AS "Pohjakoul. opintoala (ylempi kk)"
,d15o.koulutusala2002 AS "Pohjakoul. koul.ala (02 luokitus) (ylempi kk)"
,d15p.koulutusaste2002 AS "Pohjakoul. koulutusaste (ylempi kk)"
--uudet isced
,d15q.iscfibroad2013 AS "Pohjakoul. koulutusala, taso 1 (ammpk)"
,d15q.iscfinarrow2013 AS "Pohjakoul. koulutusala, taso 2 (ammpk)"
,d15r.iscle2011 AS "Pohjakoul. koulutusaste, taso 1 (ammpk)"
,d15r.Koulutusaste_taso2 AS "Pohjakoul. koulutusaste, taso 2 (ammpk)"
,d15s.iscfibroad2013 AS "Pohjakoul. koulutusala, taso 1 (ammlisä)"
,d15s.iscfinarrow2013 AS "Pohjakoul. koulutusala, taso 2 (ammlisä)"
,d15t.iscle2011 AS "Pohjakoul. koulutusaste, taso 1 (ammlisä)"
,d15t.Koulutusaste_taso2 AS "Pohjakoul. koulutusaste, taso 2 (ammlisä)"
,d15u.iscfibroad2013 AS "Pohjakoul. koulutusala, taso 1 (alempi kk)"
,d15u.iscfinarrow2013 AS "Pohjakoul. koulutusala, taso 2 (alempi kk)"
,d15v.iscle2011 AS "Pohjakoul. koulutusaste, taso 1 (alempi kk)"
,d15v.Koulutusaste_taso2 AS "Pohjakoul. koulutusaste, taso 2 (alempi kk)"
,d15x.iscfibroad2013 AS "Pohjakoul. koulutusala, taso 1 (ylempi kk)"
,d15x.iscfinarrow2013 AS "Pohjakoul. koulutusala, taso 2 (ylempi kk)"
,d15y.iscle2011 AS "Pohjakoul. koulutusaste, taso 1 (ylempi kk)"
,d15y.Koulutusaste_taso2 AS "Pohjakoul. koulutusaste, taso 2 (ylempi kk)"

,d16a.vuosiselite AS "Pohjakoul. suoritusvuosi (ammlisä)"
,d16b.vuosiselite AS "Pohjakoul. suoritusvuosi (ylempi kk)"
,d16c.vuosiselite AS "Pohjakoul. suoritusvuosi (alempi kk)"
,d16d.vuosiselite AS "Pohjakoul. suoritusvuosi"
,d16e.vuosiselite AS "Pohjakoul. suoritusvuosi (ammpk)"
,d17a.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (ammpk)"
,d17b.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (ammlisä)"
,d17c.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (alempi kk)"
,d17d.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika (ylempi kk)"
,d17e.koulutuksesta_kulunut_aika AS "Pohjakoulutuksesta kulunut aika"
,d18.ammatillisen_koulutuksen_koulutuslaji AS "Tutkintotyyppi"
,d19.opiskelijan_aikaisempi_yleissivistava_koulutus "Opiskelijan aikaisempi yleissivistävä koulutus"
,d20.koulutuksen_jarjestamismuoto as Järjestämismuoto
,d21.koulutusaste2002 as Koulutusaste
,d21.koulutusala2002 as Koulutusala
,d21.opintoala1995 as "Koulutusala (95 luokitus)"
,d21.opintoala2002 as Opintoala
,d21.koulutus as Koulutusnimike
--uudet isced
,d21.iscle2011 as 'Koulutusaste, taso 1'
,d21.Koulutusaste_taso2 as 'Koulutusaste, taso 2'
,d21.iscfibroad2013 as 'Koulutusala, taso 1'
,d21.iscfinarrow2013 as 'Koulutusala, taso 2'
,d21.iscfi2013 as 'Koulutusala, taso 3'

,d22.avi as "Koulutuksen AVI"
,d22.ely as "Koulutuksen ELY"
,d22.maakunta as "Koulutuksen maakunta"
,d22.kielisuhde as "Koulutuksen kunnan kielisuhde"
,d22.kunta as "Koulutuksen kunta"
,d23.vuosiselite as "Kirjoihintulovuosi"
,d24.lukukausiselite as "Kirjoihintulolukukausi"
,d25.aikaisempi_korkein_tutkinto as "Aikaisempi korkein tutkinto"
,d26.vuosiselite as "Viim. tutk. suoritusvuosi"
,d27.koulutuksesta_kulunut_aika as "Viim. tutk. kulunut aika"
,d28.tutkinnon_tavoite as "Opiskelijan tavoite koulutuksessa"

,[aikaisempi_ammpk_tarkempi] as "Aikaisempi amm. peruskoulutus"
,[ammpk_pohjakoulutuksen_tila] as "Aik. amm. peruskoul. tila"
,[aikaisempi_ammpk_nayttotutkintona_tarkempi] as "Aik. amm. pk. näyttötutkintoon johtavana koulutuksena"
,[aikaisempi_ammpk_oppisopimuskoulutuksena_tarkempi] as "Aik. amm. pk. oppisopimuskoulutuksena"
,[aikaisempi_ammlisa_tarkempi] as "Aikaisempi amm. lisäkoulutus"
,[ammlisa_pohjakoulutuksen_tila] as "Aik. amm. lisäkoul. tila"
,[aikaisempi_ammlisa_oppisopimuskoulutuksena_tarkempi] as "Aik. amm. lisäkoul. oppisopimuskoulutuksena"
,[aikaisempi_alempi_kk_tarkempi] as "Aikaisempi alemman kk-asteen koulutus"
,[alempi_kk_pohjakoulutuksen_tila] as "Aik. alempi kk tila"
,[aikaisempi_ylempi_kk_tarkempi] as "Aikaisempi ylemmmän kk-asteen koulutus"
,[ylempi_kk_pohjakoulutuksen_tila] as "Aik. ylempi kk tila"
,[aiemman_tutkinnon_ammpk_opintoala_sama] as "Pohjakoul. op.ala sama (ammpk)"
,[aiemman_tutkinnon_ammpk_koulutusala_sama] as "Pohjakoul. koul.ala sama (ammpk)"
,[aiemman_tutkinnon_ammpk_koulutusaste_sama] as "Pohjakoul. koul.aste sama (ammpk)"
,[aiemman_tutkinnon_ammlisa_opintoala_sama] as "Pohjakoul. op.ala sama (ammlisä)"
,[aiemman_tutkinnon_ammlisa_koulutusala_sama] as "Pohjakoul. koul.ala sama (ammlisä)"
,[aiemman_tutkinnon_ammlisa_koulutusaste_sama] as "Pohjakoul. koul.aste sama (ammlisä)"
,[aiemman_tutkinnon_alempi_kk_opintoala_sama] as "Pohjakoul. op.ala sama (alempi kk)"
,[aiemman_tutkinnon_alempi_kk_koulutusala_sama] as "Pohjakoul. koul.ala sama (alempi kk)"
,[aiemman_tutkinnon_alempi_kk_koulutusaste_sama] as "Pohjakoul. koul.aste sama (alempi kk)"
,[aiemman_tutkinnon_ylempi_kk_opintoala_sama] as "Pohjakoul. op.ala sama (ylempi kk)"
,[aiemman_tutkinnon_ylempi_kk_koulutusala_sama] as "Pohjakoul. koul.ala sama (ylempi kk)"
,[aiemman_tutkinnon_ylempi_kk_koulutusaste_sama] as "Pohjakoul. koul.aste sama (ylempi kk)"
,[aiemman_tutkinnon_opintoala2002_sama] as "Pohjakoul. op.ala sama"
,[aiemman_tutkinnon_koulutusaste2002_sama] as "Pohjakoul. koul.ala sama"
,[aiemman_tutkinnon_koulutusala2002_sama] as "Pohjakoul. koul.aste sama"
,[aiemman_tutkinnon_koulutusala_taso2_sama] as "Pohjakoul. koul.ala taso 2 sama"
,[aiemman_tutkinnon_koulutusaste_taso2_sama] as "Pohjakoul. koul.aste taso 2 sama"
,d2.jarjestys AS jarj_aidinkieli
,d3.jarjestys_avi AS jarj_as_avi
,d3.jarjestys_ely AS jarj_as_ely
,d3.jarjestys_kielisuhde AS jarj_as_kielisuhde
,d3.jarjestys_maakunta AS jarj_as_maakunta
,d3.jarjestys AS jarj_as_kunta
,d5.jarjestys_ika
,d51.jarjestys_ika AS jarj1564_1v
,d51.jarjestys_ika5v AS jarj1564_5v
,d6.jarjestys_ika5v
,d7.jarjestys AS jarj_jarjtapa
,d8.jarjestys AS jarj_nuoraik
,d9.jarjestys AS jarj_nuoraikamm
,d9.nuorten_aikuisten_koulutus_amm_koodi AS nuoraik_koodi
,d10.lahde_koodi
,d11b.jarjestys AS jarj_ophal
,d12.jarjestys AS jarj_kirjolo
,d13.jarjestys AS jarj_rahoitus
,d14.jarjestys_oppilaitostyyppi
,d15a.jarjestys_opintoala2002 AS jarj_ammpk_opala
,d15b.jarjestys_koulutusala2002 AS jarj_ammpk_koulala
,d15c.jarjestys_koulutusaste2002 AS jarj_ammpk_koulaste
,d15d.jarjestys_opintoala2002 AS jarj_ammlisa_opala
,d15e.jarjestys_koulutusala2002 AS jarj_ammlisa_koulala
,d15f.jarjestys_koulutusaste2002 AS jarj_ammlisa_koulaste
,d15g.jarjestys_opintoala1995 AS jarj_alempkk_opala95
,d15h.jarjestys_koulutusala1995 AS jarj_alempkk_koulala95
,d15i.jarjestys_opintoala2002 AS jarj_alempkk_opala
,d15j.jarjestys_koulutusala2002 AS jarj_alempkk_koulala
,d15k.jarjestys_koulutusaste2002 AS jarj_alempkk_koulaste
,d15l.jarjestys_opintoala1995 AS jarj_ylempkk_opala95
,d15m.jarjestys_koulutusala1995 AS jarj_ylempkk_koulala95
,d15n.jarjestys_opintoala2002 AS jarj_ylempkk_opala
,d15o.jarjestys_koulutusala2002 AS jarj_ylempkk_koulala
,d15p.jarjestys_koulutusaste2002 AS jarj_ylempkk_koulaste
--uudet isced
,d15q.jarjestys_iscfibroad2013 AS jarj_ammpk_koulala1
,d15q.jarjestys_iscfinarrow2013 AS jarj_ammpk_koulala2
,d15r.jarjestys_iscle2011 AS jarj_ammpk_koulaste1
,d15r.jarjestys_Koulutusaste_taso2 AS jarj_ammpk_koulaste2
,d15s.jarjestys_iscfibroad2013 AS jarj_ammlisa_koulala1
,d15s.jarjestys_iscfinarrow2013 AS jarj_ammlisa_koulala2
,d15t.jarjestys_iscle2011 AS jarj_ammlisa_koulaste1
,d15t.jarjestys_Koulutusaste_taso2 AS jarj_ammlisa_koulaste2
,d15u.jarjestys_iscfibroad2013 AS jarj_alempkk_koulala1
,d15u.jarjestys_iscfinarrow2013 AS jarj_alempkk_koulala2
,d15v.jarjestys_iscle2011 AS jarj_alempkk_koulaste1
,d15v.jarjestys_Koulutusaste_taso2 AS jarj_alempkk_koulaste2
,d15x.jarjestys_iscfibroad2013 AS jarj_ylempkk_koulala1
,d15x.jarjestys_iscfinarrow2013 AS jarj_ylempkk_koulala2
,d15y.jarjestys_iscle2011 AS jarj_ylempkk_koulaste1
,d15y.jarjestys_Koulutusaste_taso2 AS jarj_ylempkk_koulaste2

,d17a.jarjestys AS jarj_ammpk_kulunutaika
,d17b.jarjestys AS jarj_ammlisa_kulunutaika
,d17c.jarjestys AS jarj_alempi_kulunutaika
,d17d.jarjestys AS jarj_ylempi_kulunutaika
,d17e.jarjestys AS jarj_aiktutk_kulunutaika
,d18.jarjestys as jarj_tutkintotyyppi
,d19.jarjestys as jarj_opiskaikyleis
,d20.jarjestys as jarj_jarjestamismuoto
,d21.jarjestys_koulutusaste2002
,d21.jarjestys_koulutusala2002
,d21.jarjestys_opintoala1995
,d21.jarjestys_opintoala2002
,d21.jarjestys as jarj_koulnimike
,d21.jarjestys_iscle2011
,d21.jarjestys_Koulutusaste_taso2
,d21.jarjestys_iscfibroad2013
,d21.jarjestys_iscfinarrow2013
,d21.jarjestys_iscfi2013
,d22.jarjestys_avi
,d22.jarjestys_ely
,d22.jarjestys_maakunta
,d22.jarjestys_kielisuhde
,d22.jarjestys as jarj_kunta
,d24.jarjestys as jarj_lukukausi
,d25.jarjestys as jarj_aikkorktutkinto
,d27.jarjestys as viimtutk_jarj
,d28.jarjestys as jarj_tavoite_koulutuksessa
FROM dbo.f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan
	JOIN d_aidinkieli_versio1 d2 ON d2.id = aidinkieli_versio1_id
	JOIN d_alueluokitus d3 ON d3.id = opiskelijan_asuinkunta_id
	JOIN d_sukupuoli d4 ON d4.id = sukupuoli_id
	JOIN d_ika d5 ON d5.id = ika1v_id
	JOIN d_ika d51 ON d51.id = ika_14_65_id
	JOIN d_ika d6 ON d6.id = ika5v_id
	JOIN d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d7 ON d7.id = opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
	JOIN d_nuorten_aikuisten_koulutus d8 ON d8.id = nuorten_aikuisten_koulutus_id
	JOIN d_nuorten_aikuisten_koulutus_amm d9 ON d9.id = nuorten_aikuisten_koulutus_amm_id
	JOIN d_lahde d10 ON d10.id = lahde_id
	JOIN d_opetushallinnon_koulutus d11 ON d11.id = opetushallinnon_koulutus_id
	JOIN d_hallinnonala2 d11b on d11b.id = hallinnonala2_id
	JOIN d_opiskelijan_olo d12 ON d12.id = opiskelijan_olo_syys_id
	JOIN d_rahoituslahde_amm d13 ON d13.id = rahoituslahde_id
	JOIN d_oppilaitoksen_taustatiedot d14 ON d14.id = oppilaitoksen_oppilaitostyyppi_id
	JOIN d_koulutusluokitus_historia d15a ON d15a.id = aikaisemman_ammpk_opintoala2002_id
	JOIN d_koulutusluokitus_historia d15b ON d15b.id = aikaisemman_ammpk_koulutusala2002_id
	JOIN d_koulutusluokitus_historia d15c ON d15c.id = aikaisemman_ammpk_koulutusaste2002_id
	JOIN d_koulutusluokitus_historia d15d ON d15d.id = aikaisemman_ammlisa_opintoala2002_id
	JOIN d_koulutusluokitus_historia d15e ON d15e.id = aikaisemman_ammlisa_koulutusala2002_id
	JOIN d_koulutusluokitus_historia d15f ON d15f.id = aikaisemman_ammlisa_koulutusaste2002_id
	JOIN d_koulutusluokitus_historia d15g ON d15g.id = aikaisemman_alemman_kk_opintoala1995_id
	JOIN d_koulutusluokitus_historia d15h ON d15h.id = aikaisemman_alemman_kk_koulutusala1995_id
	JOIN d_koulutusluokitus_historia d15i ON d15i.id = aikaisemman_alemman_kk_opintoala2002_id
	JOIN d_koulutusluokitus_historia d15j ON d15j.id = aikaisemman_alemman_kk_koulutusala2002_id
	JOIN d_koulutusluokitus_historia d15k ON d15k.id = aikaisemman_alemman_kk_koulutusaste2002_id
	JOIN d_koulutusluokitus_historia d15l ON d15l.id = aikasemman_ylemman_kk_opintoala1995_id
	JOIN d_koulutusluokitus_historia d15m ON d15m.id = aikasemman_ylemman_kk_koulutusala1995_id
	JOIN d_koulutusluokitus_historia d15n ON d15n.id = aikasemman_ylemman_kk_opintoala2002_id
	JOIN d_koulutusluokitus_historia d15o ON d15o.id = aikasemman_ylemman_kk_koulutusala2002_id
	JOIN d_koulutusluokitus_historia d15p ON d15p.id = aikasemman_ylemman_kk_koulutusaste2002_id
	JOIN d_koulutusluokitus_historia d15q ON d15q.id = aikaisemman_ammpk_koulutusala_taso2_id
	JOIN d_koulutusluokitus_historia d15r ON d15r.id = aikaisemman_ammpk_koulutusaste_taso2_id
	JOIN d_koulutusluokitus_historia d15s ON d15s.id = aikaisemman_ammlisa_koulutusala_taso2_id
	JOIN d_koulutusluokitus_historia d15t ON d15t.id = aikaisemman_ammlisa_koulutusaste_taso2_id
	JOIN d_koulutusluokitus_historia d15u ON d15u.id = aikaisemman_alemman_kk_koulutusala_taso2_id
	JOIN d_koulutusluokitus_historia d15v ON d15v.id = aikaisemman_alemman_kk_koulutusaste_taso2_id
	JOIN d_koulutusluokitus_historia d15x ON d15x.id = aikasemman_ylemman_kk_koulutusala_taso2_id
	JOIN d_koulutusluokitus_historia d15y ON d15y.id = aikasemman_ylemman_kk_koulutusaste_taso2_id
	JOIN d_kausi d16a ON d16a.kausi_id = aikaisemman_ammlisa_suoritusvuosi_id
	JOIN d_kausi d16b ON d16b.kausi_id = aikaisemman_ylemman_kk_suoritusvuosi_id
	JOIN d_kausi d16c ON d16c.kausi_id = aikaisemman_alemman_kk_suoritusvuosi_id
	JOIN d_kausi d16d ON d16d.kausi_id = viimeisimman_koulutuksen_suorituvuosi_id
	JOIN d_kausi d16e ON d16e.kausi_id = aikaisemman_ammpk_suoritusvuosi_id
	JOIN d_koulutuksesta_kulunut_aika d17a ON d17a.id = aikaisemmasta_koulutuksesta_ammpk_kulunut_aika_id
	JOIN d_koulutuksesta_kulunut_aika d17b ON d17b.id = aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika_id
	JOIN d_koulutuksesta_kulunut_aika d17c ON d17c.id = aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika_id
	JOIN d_koulutuksesta_kulunut_aika d17d ON d17d.id = aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika_id
	JOIN d_koulutuksesta_kulunut_aika d17e ON d17e.id = viimeisimmasta_koulutuksesta_kulunut_aika_id
	JOIN d_ammatillisen_koulutuksen_koulutuslaji d18 ON d18.id = ammatillisen_koulutuksen_koulutuslaji_id
	JOIN d_opiskelijan_aikaisempi_yleissivistava_koulutus d19 ON d19.id = aikaisempi_ylsk_koulutus_id
	JOIN d_koulutuksen_jarjestamismuoto d20 ON d20.id = koulutuksen_jarjestamismuoto_id
	JOIN d_koulutusluokitus d21 ON d21.id = koulutusluokitus_id
	JOIN d_alueluokitus d22 ON d22.id = koulutuksen_kunta_id
	JOIN d_kausi d23 ON d23.kausi_id = kirjoihintulovuosi_id
	JOIN d_kausi d24 ON d24.kausi_id = kirjoihintulolukukausi_id
	JOIN d_aikaisempi_korkein_tutkinto d25 ON d25.id = aikaisempi_korkein_tutkinto_id
	JOIN d_kausi d26 ON d26.kausi_id = viimeisimman_koulutuksen_suorituvuosi_id
	JOIN d_koulutuksesta_kulunut_aika d27 ON d27.id = viimeisimmasta_koulutuksesta_kulunut_aika_id
	JOIN d_tutkinnon_tavoite AS d28 ON d28.id  = koulutuksen_tavoite_id
WHERE d10.lahde_koodi != '21'



GO


