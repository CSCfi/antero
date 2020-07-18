USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_indikaattorit_opiskelijat_ikäluokka]    Script Date: 18.7.2020 2:56:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















ALTER view [dbo].[v_f_tab_indikaattorit_opiskelijat_ikäluokka] as

SELECT *

FROM (

--Esiopetus (päivähoito)
Select
       Tilastovuosi = f.tilv
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Sektori] = 'Esiopetus'
	  ,[Sukupuoli] = 'Tuntematon'
	  ,[Äidinkieli] = null
	  ,[Opetussuunnitelma] = null
	  ,[Koulutuslaji] = null
	  ,[Järjestämistapa] = null
	  ,[Järjestämismuoto] = null
	  ,[Koulutuksen kieli] = null

	  --Ruotsi
	  ,[Statistikår] = f.tilv
	  ,[Landskap] = d1.maakunta_SV
	  ,[Kön] = 'Okänd'

	  --Englanti
	  ,[Statistical year] = f.tilv
	  ,[Region] = d1.maakunta_EN
	  ,[Gender] = 'Unknown'

	  ,Aloittaneet = sum(convert(int,f.popy))
	  ,[Väestö 6] = null
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = 99
	  ,[Äidinkieli järjestys] = 99
      
FROM [dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto] f
LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.alueluokitus_id
WHERE f.popy <> 0 and d1.maakunta<>'Tuntematon'
GROUP BY tilv,d1.kunta,d1.maakunta,d1.jarjestys_maakunta,d1.maakunta_SV,d1.maakunta_EN

UNION ALL

--Esiopetus (oppilaitokset)
Select
       Tilastovuosi = f.tilastointivuosi
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Sektori] = 'Esiopetus'
	  ,[Sukupuoli] = 'Tuntematon'
	  ,[Äidinkieli] = null
	  ,[Opetussuunnitelma] = null
	  ,[Koulutuslaji] = null
	  ,[Järjestämistapa] = null
	  ,[Järjestämismuoto] = null
	  ,[Koulutuksen kieli] = null

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Landskap] = d1.maakunta_SV
	  ,[Kön] = 'Okänd'

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Region] = d1.maakunta_EN
	  ,[Gender] = 'Unknown'

	  ,Aloittaneet = sum(f.ove)
	  ,[Väestö 6] = null
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = 99
      
FROM [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk] f
LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.oppilaitoksen_sijaintikunta_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
WHERE f.ove is not null and d1.maakunta<>'Tuntematon' and tilastointivuosi<>'2010'
GROUP BY tilastointivuosi,d1.kunta,d1.maakunta,d4.sukupuoli,d1.jarjestys_maakunta,d4.jarjestys,d1.maakunta_SV,d1.maakunta_EN

UNION ALL

--Perusopetus
Select
       Tilastovuosi = f.tilastointivuosi
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Sektori] = 'Perusopetus'
	  ,[Sukupuoli] = d4.sukupuoli
	  ,[Äidinkieli] = null
	  ,[Opetussuunnitelma] = null
	  ,[Koulutuslaji] = null
	  ,[Järjestämistapa] = null
	  ,[Järjestämismuoto] = null
	  ,[Koulutuksen kieli] = null

	  	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Landskap] = d1.maakunta_SV
	  ,[Kön] = d4.sukupuoli_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Region] = d1.maakunta_EN
	  ,[Gender] = d4.sukupuoli_EN

	  ,Aloittaneet = sum(f.ov1)
	  ,[Väestö 6] = null
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = 99
      
FROM [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk] f
LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.oppilaitoksen_sijaintikunta_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d5 on d5.id=f.oppilaitos_id
WHERE aloittaneet is not null and d1.maakunta<>'Tuntematon' and d5.oppilaitostyyppikoodi in (11,12,19)
GROUP BY tilastointivuosi,d1.kunta,d1.maakunta,d4.sukupuoli,d1.jarjestys_maakunta,d4.jarjestys,d1.maakunta_SV,d1.maakunta_EN,d4.sukupuoli_SV,d4.sukupuoli_EN

UNION ALL


--Lukio
SELECT
	   Tilastovuosi = f.tilv
	  ,[Kunta] = d9.kunta--case d6.koulutuksen_jarjestamismuoto when 'Oppilaitosmuotoinen koulutus' then d1.kunta when 'Oppisopimuskoulutus' then d7.kunta else d1.kunta end
	  ,[Maakunta] = d9.maakunta--case d6.koulutuksen_jarjestamismuoto when 'Oppilaitosmuotoinen koulutus' then d1.maakunta when 'Oppisopimuskoulutus' then d7.maakunta else d1.maakunta end
	  ,[Sektori] = d2.koulutussektori
	  ,[Sukupuoli] = d4.sukupuoli
	  ,[Äidinkieli] = d11.aidinkieli_versio1
	  ,[Opetussuunnitelma] = d3.nuorten_aikuisten_koulutus
	  ,[Koulutuslaji] = d8.ammatillisen_koulutuksen_koulutuslaji
	  ,[Järjestämistapa] = d5.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	  ,[Järjestämismuoto] = d6.koulutuksen_jarjestamismuoto
	  ,[Koulutuksen kieli] = null

	  --Ruotsi
	  ,[Statistikår] = f.tilv
	  ,[Landskap] = d9.maakunta_SV
	  ,[Kön] = d4.sukupuoli_SV

	  --Englanti
	  ,[Statistical year] = f.tilv
	  ,[Region] = d9.maakunta_EN
	  ,[Gender] = d4.sukupuoli_EN

	  ,Aloittaneet = sum(f.aloittaneet)
	  ,[Väestö 6] = null
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d9.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = d11.jarjestys

FROM [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
--LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.oppilaitos_kunta_id
LEFT JOIN dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
LEFT JOIN dbo.d_nuorten_aikuisten_koulutus d3 on d3.id=f.nuorten_aikuisten_koulutus_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
LEFT JOIN dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d5 on d5.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
LEFT JOIN dbo.d_koulutuksen_jarjestamismuoto d6 on d6.id=f.koulutuksen_jarjestamismuoto_id
--LEFT JOIN dbo.d_alueluokitus d7 on d7.id=f.yht_koulutuksen_jarjestaja_kunta_id
LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji d8 on d8.id=f.ammatillisen_koulutuksen_koulutuslaji_id
LEFT JOIN dbo.d_alueluokitus d9 on d9.id=koulutuksen_kunta_id
LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d10 on d10.id=f.oppilaitos_id 
LEFT JOIN dbo.d_aidinkieli_versio1 d11 on d11.id=f.aidinkieli_versio1_id
where aloittaneet is not null and d9.maakunta<>'Tuntematon' and d2.koulutussektori='Lukiokoulutus' and d10.oppilaitostyyppikoodi in (15,19,63)
group by tilv,d9.kunta,d9.maakunta,d2.koulutussektori,d3.nuorten_aikuisten_koulutus,d4.sukupuoli,d5.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus,d6.koulutuksen_jarjestamismuoto,
d8.ammatillisen_koulutuksen_koulutuslaji,d9.jarjestys_maakunta,d4.jarjestys,d11.aidinkieli_versio1,d11.jarjestys,d9.maakunta_SV,d9.maakunta_EN,d4.sukupuoli_SV,d4.sukupuoli_EN

UNION ALL

--Ammatillinen
SELECT
	   Tilastovuosi = f.tilv
	  ,[Kunta] = d9.kunta--case d6.koulutuksen_jarjestamismuoto when 'Oppilaitosmuotoinen koulutus' then d1.kunta when 'Oppisopimuskoulutus' then d7.kunta else d1.kunta end
	  ,[Maakunta] = d9.maakunta--case d6.koulutuksen_jarjestamismuoto when 'Oppilaitosmuotoinen koulutus' then d1.maakunta when 'Oppisopimuskoulutus' then d7.maakunta else d1.maakunta end
	  ,[Sektori] = d2.koulutussektori
	  ,[Sukupuoli] = d4.sukupuoli
	  ,[Äidinkieli] = d11.aidinkieli_versio1
	  ,[Opetussuunnitelma] = d3.nuorten_aikuisten_koulutus
	  ,[Koulutuslaji] = d8.ammatillisen_koulutuksen_koulutuslaji
	  ,[Järjestämistapa] = d5.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
	  ,[Järjestämismuoto] = d6.koulutuksen_jarjestamismuoto
	  ,[Koulutuksen kieli] = null

	  --Ruotsi
	  ,[Statistikår] = f.tilv
	  ,[Landskap] = d9.maakunta_SV
	  ,[Kön] = d4.sukupuoli_SV

	  --Englanti
	  ,[Statistical year] = f.tilv
	  ,[Region] = d9.maakunta_EN
	  ,[Gender] = d4.sukupuoli_EN

	  ,Aloittaneet = sum(f.aloittaneet)
	  ,[Väestö 6] = null
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d9.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = d11.jarjestys

FROM [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
--LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.oppilaitos_kunta_id
LEFT JOIN dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
LEFT JOIN dbo.d_nuorten_aikuisten_koulutus d3 on d3.id=f.nuorten_aikuisten_koulutus_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
LEFT JOIN dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d5 on d5.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
LEFT JOIN dbo.d_koulutuksen_jarjestamismuoto d6 on d6.id=f.koulutuksen_jarjestamismuoto_id
--LEFT JOIN dbo.d_alueluokitus d7 on d7.id=f.yht_koulutuksen_jarjestaja_kunta_id
LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji d8 on d8.id=f.ammatillisen_koulutuksen_koulutuslaji_id
LEFT JOIN dbo.d_alueluokitus d9 on d9.id=koulutuksen_kunta_id
LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d10 on d10.id=f.oppilaitos_id
LEFT JOIN dbo.d_aidinkieli_versio1 d11 on d11.id=f.aidinkieli_versio1_id
where aloittaneet is not null and d9.maakunta<>'Tuntematon' and d2.koulutussektori='Ammatillinen koulutus' 
group by tilv,d9.kunta,d9.maakunta,d2.koulutussektori,d3.nuorten_aikuisten_koulutus,d4.sukupuoli,d5.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus,d6.koulutuksen_jarjestamismuoto,
d8.ammatillisen_koulutuksen_koulutuslaji,d9.jarjestys_maakunta,d4.jarjestys,d11.aidinkieli_versio1,d11.jarjestys,d9.maakunta_SV,d9.maakunta_EN,d4.sukupuoli_SV,d4.sukupuoli_EN

UNION ALL

--Korkea-aste
Select
       Tilastovuosi = f.tilastointivuosi
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Sektori] = 'Korkeakoulutus'
	  ,[Sukupuoli] = d4.sukupuoli
	  ,[Äidinkieli] = d10.aidinkieli_versio1
	  ,[Opetussuunnitelma] = null
	  ,[Koulutuslaji] = d8.koulutuslaji_okm
	  ,[Järjestämistapa] = null
	  ,[Järjestämismuoto] = null
	  ,[Koulutuksen kieli] = f.koulutuksen_kieli

	  	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Landskap] = d1.maakunta_SV
	  ,[Kön] = d4.sukupuoli_SV

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Region] = d1.maakunta_EN
	  ,[Gender] = d4.sukupuoli_EN

	  ,Aloittaneet = sum(f.aloittaneet)
	  ,[Väestö 6] = null
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = d10.jarjestys
      
FROM [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.oppilaitos_kunta_id
LEFT JOIN dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
LEFT JOIN dbo.d_opiskelumuoto d6 on d6.id=f.opiskelumuoto_id
LEFT JOIN dbo.d_koulutustyyppi d7 on d7.id=f.koulutustyyppi_id
LEFT JOIN dbo.d_koulutuslaji_okm d8 on d8.id=f.koulutuslaji_OKM_id
LEFT JOIN dbo.d_koulutusluokitus d9 on d9.id=f.koulutusluokitus_id
LEFT JOIN dbo.d_aidinkieli_versio1 d10 on d10.id=f.aidinkieli_versio1_id
where aloittaneet is not null and d1.maakunta<>'Tuntematon' and (d8.koulutuslaji_okm_avain in ('13','14','15','16') or (d8.koulutuslaji_okm_avain = '17' and d9.iscfi2013_koodi in ('0841','0911','0912'))) and aineisto='L'
group by tilastointivuosi,d1.kunta,d1.maakunta,d2.koulutussektori,d4.sukupuoli,d6.opiskelumuoto,d8.koulutuslaji_okm,f.koulutuksen_kieli,d1.jarjestys_maakunta,d4.jarjestys,d10.aidinkieli_versio1,d10.jarjestys,d1.maakunta_SV,d1.maakunta_EN,d4.sukupuoli_SV,d4.sukupuoli_EN

UNION ALL

--Väestötiedot (6v erikseen, jotta sukupuolen voi asettaa tuntemattomaksi)
Select
       Tilastovuosi = f.tilastointivuosi
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Sektori] = null
	  ,[Sukupuoli] = 'Tuntematon'
	  ,[Äidinkieli] = case d5.aidinkieli_versio2 when 'saame' then 'suomi (sis. saame)' when 'suomi' then 'suomi (sis. saame)' else d5.aidinkieli_versio2 end
	  ,[Opetussuunnitelma] = null
	  ,[Koulutuslaji] = null
	  ,[Järjestämistapa] = null
	  ,[Järjestämismuoto] = null
	  ,[Koulutuksen kieli] = null

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Landskap] = d1.maakunta_SV
	  ,[Kön] = 'Okänd'

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Region] = d1.maakunta_EN
	  ,[Gender] = 'Unknown'

	  ,Aloittaneet = null
	  ,[Väestö 6] = ika6_lkm
	  ,[Väestö 7] = null
	  ,[Väestö 16-18] = null
	  ,[Väestö 19-21] = null
	  ,[Väestö 25-64] = null

	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = case d5.aidinkieli_versio2 when 'saame' then 1 when 'suomi' then 1 when 'ruotsi' then 2 when 'muut kielet ja tuntematon' then 3 else 99998 end

      
FROM [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] f
LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.kotikunta_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
LEFT JOIN dbo.d_aidinkieli_versio2 d5 on d5.id=f.aidinkieli_versio2_id
where f.ika6_lkm<>0 and 
d1.maakunta<>'Tuntematon'
/*group by tilastointivuosi,d1.kunta,d1.maakunta,d4.sukupuoli,d1.jarjestys_maakunta,d4.jarjestys,
(case d5.aidinkieli_versio2 when 'saame' then 'suomi (sis. saame)' when 'suomi' then 'suomi (sis. saame)' else d5.aidinkieli_versio2 end),
(case d5.aidinkieli_versio2 when 'saame' then 1 when 'suomi' then 1 when 'ruotsi' then 2 when 'muut kielet ja tuntematon' then 3 else 99998 end)*/

UNION ALL

--Väestötiedot (muut kuin 6v)
Select
       Tilastovuosi = f.tilastointivuosi
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Sektori] = null
	  ,[Sukupuoli] = d4.sukupuoli --case when ika6_lkm>0 then 'Tuntematon' else d4.sukupuoli end --case when d4.sukupuoli='Mies' and sum(ika7_lkm)>0 then 'Pojat' when d4.sukupuoli='Nainen' and sum(ika7_lkm)>0 then 'Tytöt' else d4.sukupuoli end
	  ,[Äidinkieli] = case d5.aidinkieli_versio2 when 'saame' then 'suomi (sis. saame)' when 'suomi' then 'suomi (sis. saame)' else d5.aidinkieli_versio2 end
	  ,[Opetussuunnitelma] = null
	  ,[Koulutuslaji] = null
	  ,[Järjestämistapa] = null
	  ,[Järjestämismuoto] = null
	  ,[Koulutuksen kieli] = null

	  --Ruotsi
	  ,[Statistikår] = f.tilastointivuosi
	  ,[Landskap] = d1.maakunta_SV
	  ,[Kön] = d4.sukupuoli_SV --case when ika6_lkm>0 then 'Okänd' else d4.sukupuoli_SV end

	  --Englanti
	  ,[Statistical year] = f.tilastointivuosi
	  ,[Region] = d1.maakunta_EN
	  ,[Gender] = d4.sukupuoli_EN --case when ika6_lkm>0 then 'Unknown' else d4.sukupuoli_EN end

	  ,Aloittaneet = null
	  ,[Väestö 6] = null
	  ,[Väestö 7] = ika7_lkm
	  ,[Väestö 16-18] = ika16_18_ka
	  ,[Väestö 19-21] = ika19_21_ka
	  ,[Väestö 25-64] = ika25_64_ka

	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Sukupuoli järjestys] = d4.jarjestys
	  ,[Äidinkieli järjestys] = case d5.aidinkieli_versio2 when 'saame' then 1 when 'suomi' then 1 when 'ruotsi' then 2 when 'muut kielet ja tuntematon' then 3 else 99998 end

      
FROM [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] f
LEFT JOIN dbo.d_alueluokitus d1 on d1.id=f.kotikunta_id
LEFT JOIN dbo.d_sukupuoli d4 on d4.id=f.sukupuoli_id
LEFT JOIN dbo.d_aidinkieli_versio2 d5 on d5.id=f.aidinkieli_versio2_id
where (f.ika7_lkm<>0 or f.ika16_18_ka<>0 or ika19_21_ka<>0 or ika25_64_ka<>0) and 
d1.maakunta<>'Tuntematon'
/*group by tilastointivuosi,d1.kunta,d1.maakunta,d4.sukupuoli,d1.jarjestys_maakunta,d4.jarjestys,
(case d5.aidinkieli_versio2 when 'saame' then 'suomi (sis. saame)' when 'suomi' then 'suomi (sis. saame)' else d5.aidinkieli_versio2 end),
(case d5.aidinkieli_versio2 when 'saame' then 1 when 'suomi' then 1 when 'ruotsi' then 2 when 'muut kielet ja tuntematon' then 3 else 99998 end)*/


) k
WHERE k.Tilastovuosi>=2010



GO


USE [ANTERO]