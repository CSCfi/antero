USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ulkomaalaistaustaiset]    Script Date: 10.2.2025 8.45.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_tab_ulkomaalaistaustaiset] AS
SELECT [aloittaneet] AS aloit2
	  ,[opiskelijat] AS opisk2
	  ,[tutkinnot] AS tutk2
	  ,[aloittaneet_ulkomaalaistausta_kielen_mukaan]
	  ,[opiskelijat_ulkomaalaistausta_kielen_mukaan]
	  ,[tutkinnot_ulkomaalaistausta_kielen_mukaan]
	  ,[aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
	  ,[opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
	  ,[tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan]
	  ,[aloittaneet_ulkomaalaiset]
	  ,[opiskelijat_ulkomaalaiset]
	  ,[tutkinnot_ulkomaalaiset]
	  ,[aloittaneet_ulkomailla_syntyneet]
	  ,[opiskelijat_ulkomailla_syntyneet]
	  ,[tutkinnot_ulkomailla_syntyneet]
	  ,[tilastovuosi] AS Tilastovuosi
	  ,d1.aineisto AS Aineisto
	  ,d2.opintoala2002 AS [Opintoala]
	  ,d2b.iscfinarrow2013 as [Koulutusala, taso 2]
	  ,d2b.iscfibroad2013 as [Koulutusala, taso 1]
	  ,d2.opintoala1995 AS [Koulutusala (95 luokitus)]
	  ,d2.koulutusala2002 AS [Koulutusala (02 luokitus)]
	  ,d2.koulutusaste2002 AS [Koulutusaste]
	  ,d3.koulutusryhma AS Koulutuslaji
	  ,d4.maassaolo AS Maassaolo
	  ,d5.opetushallinnon_koulutus AS Hallinnonala
	  ,[syntymavuosi] AS Syntymävuosi
	  ,[suomeen_muuttamisvuosi] AS [Suomeen muuttamisvuosi]
	  ,[tutkinnon_aloittamisvuosi] AS [Aloitusvuosi]
	  ,[suoritusaika] AS Suoritusaika
	  ,d6.kieli AS Opetuskieli
	  ,d7.tutkinnon_toteuma AS [Koko tutkinto/tutkinnon osa]
	  ,d8.kunta AS [Koulutuksen kunta]
	  ,d8.maakunta AS [Koulutuksen maakunta]
	  ,d8.ely AS [Koulutuksen ELY-alue]
	  ,d8.avi AS [Koulutuksen AVI-alue]
	  ,d8b.kunta AS [Asuinkunta]
	  ,d8b.maakunta AS [Asuinmaakunta]
	  ,d8b.ely AS [Asuinalueen ELY]
	  ,d8b.avi AS [Asuinalueen AVI]
	  ,d8c.asuinkunta_sama_vai_eri_kuin_aiemmin AS [Asuinkunta sama/eri kuin aikaisemmin]
	  ,d8d.edeltavan_vuoden_asuinpaikka AS [Edeltävän vuoden asuinpaikka]
	  ,d9.sukupuoli AS Sukupuoli
	  ,d10.hetu_ok AS [Henkilötunnuksen oikeellisuus]
	  ,d11.ika AS [Ikä]
	  ,d11.ika5v [Ikäryhmä]
	  ,d13.opiskelijan_olo AS [Kirjoillaolo (syys)]
	  ,d16.maa AS [Kansalaisuus (maa)]
	  ,d16.maanosa AS [Kansalaisuus (maanosa)]
	  ,d16.etamaa AS [ETA-maan kansalainen]
	  ,d16.eumaa AS [EU-maan kansalainen]
	  ,d18.maa AS [Syntymävaltio]
	  ,d18.maanosa AS [Syntymävaltio (maanosa)]
	  ,d18b.maa AS [Äidin syntymävaltio]
	  ,d18b.maanosa AS [Äidin syntymävaltio (maanosa)]
	  ,d18c.maa AS [Isän syntymävaltio]
	  ,d18c.maanosa AS [Isän syntymävaltio (maanosa)]
	  ,d19.maahantulo_ja_opiskelun_aloittaminen AS [Maahantulo ja toisen asteen koul. aloittaminen]
	  ,d20.maahantulo_ja_opiskelun_aloittaminen AS [Maahantulo ja korkeakoul. aloittaminen]
	  ,d21.aidinkieli_versio1 AS [Äidinkieli]
	  ,d21b.aidinkieli_versio2 AS [Äidinkieli (tarkennus)]
	  ,d21c.kieli AS [Äidinkieli (maa)]
	  ,d22.koulutussektori AS [Koulutussektori]
	  ,d1.aineisto_koodi
	  ,d2.jarjestys_opintoala2002 AS jarj_opintoala
	  ,d2.jarjestys_koulutusala2002
	  ,d2b.jarjestys_iscfinarrow2013 as [jarj_koulutusala_taso_2]
	  ,d2b.jarjestys_iscfibroad2013 as [jarj_koulutusala_taso_1]
	  ,d2.jarjestys_opintoala1995
	  ,d2.jarjestys_koulutusaste2002
	  ,d3.jarjestys AS jarj_koullaji
	  ,d4.jarjestys AS jarj_maassaolo
	  ,d5.jarjestys AS jarj_hallinnonala
	  ,d6.jarjestys AS jarj_opetuskieli
	  ,d7.tutkinnon_toteuma_koodi
	  ,d7.jarjestys AS jarj_kokotutkinto
	  ,d8.jarjestys_maakunta
	  ,d8.jarjestys_ely
	  ,d8.jarjestys_avi
	  ,d8b.jarjestys as jarj_kunta
	  ,d8b.jarjestys_maakunta as jarj_asmaak
	  ,d8b.jarjestys_ely as jarj_ely
	  ,d8b.jarjestys_avi as jarj_avi
	  ,d8c.jarjestys as jarj_askuntasamaeri
	  ,d8d.jarjestys as jarj_edvuodenasuinpaikka
	  ,d9.jarjestys AS jarj_sukupuoli
	  ,d10.jarjestys as jarj_hetuok
	  ,d11.jarjestys_ika5v
	  ,d13.jarjestys AS jarj_kirjsyys
	  ,d16.jarjestys AS jarj_maa
	  ,d16.jarjestys_maanosa
	  ,d16.jarjestys_etamaa
	  ,d16.jarjestys_eumaa
	  ,d18.jarjestys AS jarj_syntvaltio
	  ,d18.jarjestys_maanosa AS jarj_syntmaanosa
	  ,d18b.jarjestys AS jarj_syntvaltioai
	  ,d18b.jarjestys_maanosa AS jarj_syntmaanosaai
	  ,d18c.jarjestys AS jarj_syntvaltiois
	  ,d18c.jarjestys_maanosa AS jarj_syntmaanosais
	  ,d19.jarjestys AS jarj_maahantulotoinenaste
	  ,d20.jarjestys AS jarj_maahantulokorkeak
	  ,d21.jarjestys AS jarj_aidinkieli
	  ,d21b.jarjestys AS jarj_aidinkieli2
	  ,d21c.jarjestys AS jarj_aidinkieli4
	  ,d22.jarjestys AS jarj_koulsektori
	  ,d2.koulutusaste2002_koodi
	  ,jarjestys_suoritusaika =
			CASE 
				WHEN suoritusaika = 'Tuntematon' or suoritusaika IS NULL THEN 999
				ELSE cast(suoritusaika AS int)
			END


FROM            vipunentk.dbo.f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk
	JOIN d_aineisto d1 on d1.id = [aineisto_id]
	JOIN d_koulutusluokitus d2 on d2.id = [koulutusluokitus_id]
	JOIN d_koulutusluokitus d2b on d2b.id = koulutusala_taso2_id
	JOIN d_koulutusryhma d3 on d3.id = [koulutusryhma_id]
	JOIN d_maassaolo d4 on d4.id = [maassaolo_id]
	JOIN d_opetushallinnon_koulutus d5 on d5.id = [opetushallinnon_koulutus_id]
	JOIN d_kieli d6 on d6.id = [koulutuksen_opetuskieli_id]
	JOIN d_tutkinnon_toteuma d7 on d7.id = [tutkinnon_toteuma_id]
	JOIN d_alueluokitus d8 on d8.id = [koulutuksen_sijaintikunta_id]
	JOIN d_alueluokitus d8b on d8b.id = [kotikunta_id]
	JOIN d_asuinkunta_sama_vai_eri_kuin_aiemmin d8c on d8c.id = [asuinkunta_sama_vai_eri_kuin_aiemmin_id]
	JOIN d_edeltavan_vuoden_asuinpaikka d8d on d8d.id = [edeltavan_vuoden_asuinpaikka_id]
	JOIN d_sukupuoli d9 on d9.id = [sukupuoli_id]
	JOIN d_hetu_ok d10 on d10.id = [henkilotunnuksen_oikeellisuus_id]
	JOIN d_ika d11 on d11.id = [ika_id]
	JOIN d_opiskelijan_olo d13 on d13.id = [opiskelijan_olo_id]
	JOIN d_valtio d16 on d16.id = [kansalaisuus_id]
	JOIN d_valtio d18 on d18.id = [syntymamaa_id]
	JOIN d_valtio d18b on d18b.id = [aidin_syntymamaa_id]
	JOIN d_valtio d18c on d18c.id = [isan_syntymamaa_id]
	JOIN d_maahantulo_ja_opiskelun_aloittaminen d19 on d19.id = [maahantulo_ja_toisen_asteen_koul_aloittaminen_id]
	JOIN d_maahantulo_ja_opiskelun_aloittaminen d20 on d20.id = [maahantulo_ja_korkeakoulutuksen_aloittaminen_id]
	JOIN d_aidinkieli_versio1 d21 on d21.id = [aidinkieli_versio1_id]
	JOIN d_aidinkieli_versio2 d21b on d21b.id = [aidinkieli_versio2_id]
	JOIN d_kieli d21c on d21c.id = [aidinkieli_versio4_id]
	JOIN d_koulutussektori d22 on d22.id = [koulutussektori_id]
--WHERE d1.aineisto_koodi = 'L' AND [tilastovuosi] <> '2009'

GO

USE [ANTERO]