USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_otv_yhteiset]    Script Date: 11.4.2023 13:35:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_tab_otv_yhteiset] AS

--Esi- ja perusopetus
Select 
	 Tilastovuosi = f.tilastointivuosi
	,Sukupuoli = d1.sukupuoli
	,Koulutussektori = d2.koulutussektori
	,Koulutusaste = d4.koulutusaste2002
	,Koulutusala = d4.koulutusala2002
	,Opintoala = d4.opintoala2002
	,Koulutusnimike = d4.koulutus
	,Koulutuslaji = d3.koulutuslaji_okm
	--,[Koulutuksen maakunta] = d6.maakunta
	--,[Kotimaakunta] = null

	,aloittaneet_lkm = f.aloittaneet
	,opiskelijat_lkm = f.opiskelijat
	,tutkinnot_lkm = f.tutkinnot

	--Ruotsi
	,Statistikår = f.tilastointivuosi
	,Kön = d1.sukupuoli_SV
	,Utbildningssektor = d2.koulutussektori_SV
	,Utbildningsnivå = d4.koulutusaste2002_SV
	,Utbildningsområde = d4.koulutusala2002_SV
	,Studieområde = d4.opintoala2002_SV
	,Utbildningsbenämning = d4.koulutus_SV
	,Utbildningsslag = d3.koulutuslaji_okm_SV

	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,Gender = d1.sukupuoli_EN
	,[Sector of education] = d2.koulutussektori_EN
	,[Level of education] = d4.koulutusaste2002_EN
	,[Field of education] = d4.koulutusala2002_EN
	,[Subfield of education] = d4.opintoala2002_EN
	,[Name of education] = d4.koulutus_EN
	,[Form of education and training] = d3.koulutuslaji_okm_EN

	--Järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Koulutussektori jarj] = d2.jarjestys
	,[Koulutusaste jarj] = d4.jarjestys_koulutusaste2002
	,[Koulutusala jarj] = d4.jarjestys_koulutusala2002
	,[Opintoala jarj] = d4.jarjestys_opintoala2002
	,[Koulutuslaji jarj] = d3.jarjestys

	--Isced
	,d4.iscle2011 as "Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d4.iscfibroad2013 as "Koulutusala, taso 1"
	,d4.iscfinarrow2013 as "Koulutusala, taso 2"
	,d4.iscfi2013 as "Koulutusala, taso 3"
	,d4.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d4.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d4.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d4.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d4.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d4.iscle2011_EN as "Level of education, tier 1"
	,d4.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d4.iscfibroad2013_EN as "Field of education, tier 1"
	,d4.iscfinarrow2013_EN as "Field of education, tier 2"
	,d4.iscfi2013_EN as "Field of education, tier 3"
	,d4.jarjestys_iscle2011 as jarj_isced_koulast1
	,d4.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d4.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d4.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d4.jarjestys_iscfi2013 as jarj_isced_koulala3

	--koodit
	,d4.koulutusala2002_koodi as "Koodit Koulutusala 2002"
	,d4.opintoala2002_koodi as "Koodit Opintoala 2002"
	,d4.koulutus_koodi as "Koodit Koulutusnimike"
	,d4.koulutusaste2002_koodi as "Koodit Koulutusaste 2002"
	,d4.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d4.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d4.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d4.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

From [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuslaji_okm d3 on d3.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d5 on d5.id=f.oppilaitos_id
--left join VipunenTK.dbo.d_alueluokitus d6 on d6.id=f.oppilaitoksen_sijaintikunta_id
--left join VipunenTK.dbo.d_alueluokitus d7 on d7.id=f.
where d5.oppilaitoksen_omistajatyyppi <> 'Ahvenanmaan maakunta' 
	and (f.aloittaneet is not null or f.opiskelijat is not null or f.tutkinnot is not null)


UNION ALL


--Lukio ja ammatillinen opiskelijat
Select 
	 Tilastovuosi = f.tilv
	,Sukupuoli = d1.sukupuoli
	,Koulutussektori = d2.koulutussektori
	,Koulutusaste = d4.koulutusaste2002
	,Koulutusala = d4.koulutusala2002
	,Opintoala = d4.opintoala2002
	,Koulutusnimike = d4.koulutus
	,Koulutuslaji = d3.koulutuslaji_okm
	--,[Koulutuksen maakunta] = d6.maakunta
	--,[Kotimaakunta] = d7.maakunta

	,lkm = f.aloittaneet
	,opiskelijat_lkm = f.opiskelijat
	,tutkinnot_lkm = null

	--Ruotsi
	,Statistikår = f.tilv
	,Kön = d1.sukupuoli_SV
	,Utbildningssektor = d2.koulutussektori_SV
	,Utbildningsnivå = d4.koulutusaste2002_SV
	,Utbildningsområde = d4.koulutusala2002_SV
	,Studieområde = d4.opintoala2002_SV
	,Utbildningsbenämning = d4.koulutus_SV
	,Utbildningsslag = d3.koulutuslaji_okm_SV

	--Englanti
	,[Statistical year] = f.tilv
	,Gender = d1.sukupuoli_EN
	,[Sector of education] = d2.koulutussektori_EN
	,[Level of education] = d4.koulutusaste2002_EN
	,[Field of education] = d4.koulutusala2002_EN
	,[Subfield of education] = d4.opintoala2002_EN
	,[Name of education] = d4.koulutus_EN
	,[Form of education and training] = d3.koulutuslaji_okm_EN

	--Järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Koulutussektori jarj] = d2.jarjestys
	,[Koulutusaste jarj] = d4.jarjestys_koulutusaste2002
	,[Koulutusala jarj] = d4.jarjestys_koulutusala2002
	,[Opintoala jarj] = d4.jarjestys_opintoala2002
	,[Koulutuslaji jarj] = d3.jarjestys

	--Isced
	,d4.iscle2011 as "Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d4.iscfibroad2013 as "Koulutusala, taso 1"
	,d4.iscfinarrow2013 as "Koulutusala, taso 2"
	,d4.iscfi2013 as "Koulutusala, taso 3"
	,d4.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d4.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d4.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d4.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d4.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d4.iscle2011_EN as "Level of education, tier 1"
	,d4.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d4.iscfibroad2013_EN as "Field of education, tier 1"
	,d4.iscfinarrow2013_EN as "Field of education, tier 2"
	,d4.iscfi2013_EN as "Field of education, tier 3"
	,d4.jarjestys_iscle2011 as jarj_isced_koulast1
	,d4.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d4.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d4.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d4.jarjestys_iscfi2013 as jarj_isced_koulala3

	--koodit
	,d4.koulutusala2002_koodi as "Koodit Koulutusala 2002"
	,d4.opintoala2002_koodi as "Koodit Opintoala 2002"
	,d4.koulutus_koodi as "Koodit Koulutusnimike"
	,d4.koulutusaste2002_koodi as "Koodit Koulutusaste 2002"
	,d4.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d4.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d4.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d4.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

From [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuslaji_okm d3 on d3.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d5 on d5.id=f.yht_oppilaitos_id
--left join VipunenTK.dbo.d_alueluokitus d6 on d6.id=f.yht_koulutuksen_kunta_id
--left join VipunenTK.dbo.d_alueluokitus d7 on d7.id=f.asuinmaakunta_id

where opetushallinnon_koulutus in (-1,1) and d5.oppilaitoksen_omistajatyyppi <> 'Ahvenanmaan maakunta'


UNION ALL


--Lukio ja ammatillinen tutkinnot
Select 
	 Tilastovuosi = f.tilastointivuosi
	,Sukupuoli = d1.sukupuoli
	,Koulutussektori = d2.koulutussektori
	,Koulutusaste = d4.koulutusaste2002
	,Koulutusala = d4.koulutusala2002
	,Opintoala = d4.opintoala2002
	,Koulutusnimike = d4.koulutus
	,Koulutuslaji = d3.koulutuslaji_okm
	--,[Koulutuksen maakunta] = null
	--,[Kotimaakunta] = null

	,lkm = null
	,opiskelijat_lkm = null
	,tutkinnot_lkm = f.lukumaara

	--Ruotsi
	,Statistikår = f.tilastointivuosi
	,Kön = d1.sukupuoli_SV
	,Utbildningssektor = d2.koulutussektori_SV
	,Utbildningsnivå = d4.koulutusaste2002_SV
	,Utbildningsområde = d4.koulutusala2002_SV
	,Studieområde = d4.opintoala2002_SV
	,Utbildningsbenämning = d4.koulutus_SV
	,Utbildningsslag = d3.koulutuslaji_okm_SV

	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,Gender = d1.sukupuoli_EN
	,[Sector of education] = d2.koulutussektori_EN
	,[Level of education] = d4.koulutusaste2002_EN
	,[Field of education] = d4.koulutusala2002_EN
	,[Subfield of education] = d4.opintoala2002_EN
	,[Name of education] = d4.koulutus_EN
	,[Form of education and training] = d3.koulutuslaji_okm_EN

	 --Järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Koulutussektori jarj] = d2.jarjestys
	,[Koulutusaste jarj] = d4.jarjestys_koulutusaste2002
	,[Koulutusala jarj] = d4.jarjestys_koulutusala2002
	,[Opintoala jarj] = d4.jarjestys_opintoala2002
	,[Koulutuslaji jarj] = d3.jarjestys

	--Isced
	,d4.iscle2011 as "Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d4.iscfibroad2013 as "Koulutusala, taso 1"
	,d4.iscfinarrow2013 as "Koulutusala, taso 2"
	,d4.iscfi2013 as "Koulutusala, taso 3"
	,d4.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d4.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d4.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d4.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d4.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d4.iscle2011_EN as "Level of education, tier 1"
	,d4.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d4.iscfibroad2013_EN as "Field of education, tier 1"
	,d4.iscfinarrow2013_EN as "Field of education, tier 2"
	,d4.iscfi2013_EN as "Field of education, tier 3"
	,d4.jarjestys_iscle2011 as jarj_isced_koulast1
	,d4.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d4.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d4.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d4.jarjestys_iscfi2013 as jarj_isced_koulala3

	--koodit
	,d4.koulutusala2002_koodi as "Koodit Koulutusala 2002"
	,d4.opintoala2002_koodi as "Koodit Opintoala 2002"
	,d4.koulutus_koodi as "Koodit Koulutusnimike"
	,d4.koulutusaste2002_koodi as "Koodit Koulutusaste 2002"
	,d4.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d4.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d4.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d4.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

From [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuslaji_okm d3 on d3.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d5 on d5.id=f.yht_oppilaitos_id

where opetushallinnon_koulutus_id <> 2 and tutkinnon_toteuma_id <> 47 and d5.oppilaitoksen_omistajatyyppi <> 'Ahvenanmaan maakunta'


UNION ALL


--Korkea-aste opiskelijat
Select 
	 Tilastovuosi = f.tilastointivuosi
	,Sukupuoli = d1.sukupuoli
	,Koulutussektori = d2.koulutussektori
	,Koulutusaste = d4.koulutusaste2002
	,Koulutusala = d4.koulutusala2002
	,Opintoala = d4.opintoala2002
	,Koulutusnimike = d4.koulutus
	,Koulutuslaji = d3.koulutuslaji_okm
	--,[Koulutuksen maakunta] = d6.maakunta
	--,[Kotikunta] = d7.maakunta
	
	,lkm = f.aloittaneet
	,opiskelijat_lkm = f.opiskelijat
	,tutkinnot_lkm = null

	--Ruotsi
	,Statistikår = f.tilastointivuosi
	,Kön = d1.sukupuoli_SV
	,Utbildningssektor = d2.koulutussektori_SV
	,Utbildningsnivå = d4.koulutusaste2002_SV
	,Utbildningsområde = d4.koulutusala2002_SV
	,Studieområde = d4.opintoala2002_SV
	,Utbildningsbenämning = d4.koulutus_SV
	,Utbildningsslag = d3.koulutuslaji_okm_SV

	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,Gender = d1.sukupuoli_EN
	,[Sector of education] = d2.koulutussektori_EN
	,[Level of education] = d4.koulutusaste2002_EN
	,[Field of education] = d4.koulutusala2002_EN
	,[Subfield of education] = d4.opintoala2002_EN
	,[Name of education] = d4.koulutus_EN
	,[Form of education and training] = d3.koulutuslaji_okm_EN

	--Järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Koulutussektori jarj] = d2.jarjestys
	,[Koulutusaste jarj] = d4.jarjestys_koulutusaste2002
	,[Koulutusala jarj] = d4.jarjestys_koulutusala2002
	,[Opintoala jarj] = d4.jarjestys_opintoala2002
	,[Koulutuslaji jarj] = d3.jarjestys

	--Isced
	,d4.iscle2011 as "Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d4.iscfibroad2013 as "Koulutusala, taso 1"
	,d4.iscfinarrow2013 as "Koulutusala, taso 2"
	,d4.iscfi2013 as "Koulutusala, taso 3"
	,d4.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d4.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d4.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d4.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d4.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d4.iscle2011_EN as "Level of education, tier 1"
	,d4.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d4.iscfibroad2013_EN as "Field of education, tier 1"
	,d4.iscfinarrow2013_EN as "Field of education, tier 2"
	,d4.iscfi2013_EN as "Field of education, tier 3"
	,d4.jarjestys_iscle2011 as jarj_isced_koulast1
	,d4.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d4.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d4.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d4.jarjestys_iscfi2013 as jarj_isced_koulala3

	--Koodit
	,d4.koulutusala2002_koodi as "Koodit Koulutusala 2002"
	,d4.opintoala2002_koodi as "Koodit Opintoala 2002"
	,d4.koulutus_koodi as "Koodit Koulutusnimike"
	,d4.koulutusaste2002_koodi as "Koodit Koulutusaste 2002"
	,d4.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d4.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d4.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d4.iscfi2013_koodi as "Koodit Koulutusala, taso 3"

From [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuslaji_okm d3 on d3.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
--left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d5 on d5.id=f.oppilaitos_id
--left join VipunenTK.dbo.d_alueluokitus d6 on d6.id=f.koulutuksen_kunta_id
--left join VipunenTK.dbo.d_alueluokitus d7 on d7.id=f.kotikunta1x_id
left join VipunenTK.dbo.d_ensisijainen_opintooikeus d8 on d8.id=f.ensisijainen_opintooikeus_id
left join VipunenTK.dbo.d_koulutustyyppi d9 on d9.id=f.koulutustyyppi_id

where d9.koulutustyyppi_koodi not in ('3','5','7') 
	and f.aineisto <> 'E'
	and d8.ensisijainen_opintooikeus_koodi <>  2
	and f.oppilaitos NOT IN ('02557','10031','02358')
	and erikoislaakarikoulutus_id not in (1,2)
	and f.koulutusluokitus not in ('-1', '999999')


UNION ALL


--Korkea-aste tutkinnot
Select 
	 Tilastovuosi = f.tilastointivuosi
	,Sukupuoli = d1.sukupuoli
	,Koulutussektori = d2.koulutussektori
	,Koulutusaste = d4.koulutusaste2002
	,Koulutusala = d4.koulutusala2002
	,Opintoala = d4.opintoala2002
	,Koulutusnimike = d4.koulutus
	,Koulutuslaji = d3.koulutuslaji_okm
	--,[Koulutuksen maakunta] = null
	--,[Kotikunta] = null

	,lkm = null
	,opiskelijat_lkm = null
	,tutkinnot_lkm = f.lukumaara

	--Ruotsi
	,Statistikår = f.tilastointivuosi
	,Kön = d1.sukupuoli_SV
	,Utbildningssektor = d2.koulutussektori_SV
	,Utbildningsnivå = d4.koulutusaste2002_SV
	,Utbildningsområde = d4.koulutusala2002_SV
	,Studieområde = d4.opintoala2002_SV
	,Utbildningsbenämning = d4.koulutus_SV
	,Utbildningsslag = d3.koulutuslaji_okm_SV

	--Englanti
	,[Statistical year] = f.tilastointivuosi
	,Gender = d1.sukupuoli_EN
	,[Sector of education] = d2.koulutussektori_EN
	,[Level of education] = d4.koulutusaste2002_EN
	,[Field of education] = d4.koulutusala2002_EN
	,[Subfield of education] = d4.opintoala2002_EN
	,[Name of education] = d4.koulutus_EN
	,[Form of education and training] = d3.koulutuslaji_okm_EN

	--Järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Koulutussektori jarj] = d2.jarjestys
	,[Koulutusaste jarj] = d4.jarjestys_koulutusaste2002
	,[Koulutusala jarj] = d4.jarjestys_koulutusala2002
	,[Opintoala jarj] = d4.jarjestys_opintoala2002
	,[Koulutuslaji jarj] = d3.jarjestys

	--Isced
	,d4.iscle2011 as "Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	,d4.iscfibroad2013 as "Koulutusala, taso 1"
	,d4.iscfinarrow2013 as "Koulutusala, taso 2"
	,d4.iscfi2013 as "Koulutusala, taso 3"
	,d4.iscle2011_SV as "Utbildn.nivå, nivå 1"
	,d4.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	,d4.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	,d4.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	,d4.iscfi2013_SV as "Utbildn.område, nivå 3"
	,d4.iscle2011_EN as "Level of education, tier 1"
	,d4.Koulutusaste_taso2_EN as "Level of education, tier 2"
	,d4.iscfibroad2013_EN as "Field of education, tier 1"
	,d4.iscfinarrow2013_EN as "Field of education, tier 2"
	,d4.iscfi2013_EN as "Field of education, tier 3"
	,d4.jarjestys_iscle2011 as jarj_isced_koulast1
	,d4.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
	,d4.jarjestys_iscfibroad2013 as jarj_isced_koulala1
	,d4.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
	,d4.jarjestys_iscfi2013 as jarj_isced_koulala3

	--Koodit
	,d4.koulutusala2002_koodi as "Koodit Koulutusala 2002"
	,d4.opintoala2002_koodi as "Koodit Opintoala 2002"
	,d4.koulutus_koodi as "Koodit Koulutusnimike"
	,d4.koulutusaste2002_koodi as "Koodit Koulutusaste 2002"
	,d4.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	,d4.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	,d4.iscfibroad2013_koodi as "Koodit Koulutusala, taso 1"
	,d4.iscfinarrow2013_koodi as "Koodit Koulutusala, taso 2"
	,d4.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
	
From [dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_koulutussektori d2 on d2.id=f.koulutussektori_id
left join VipunenTK.dbo.d_koulutuslaji_okm d3 on d3.id=f.koulutuslaji_OKM_id
left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
left join VipunenTK.dbo.d_koulutustyyppi d9 on d9.id=f.koulutustyyppi_id

where d9.koulutustyyppi_koodi not in ('3','5','7') 
	and f.aineisto <> 'E'
	and f.oppilaitos NOT IN ('02557','10031','02358')
	and erikoislaakarikoulutus_id not in (1,2)
	and f.koulutusluokitus not in ('-1', '999999')

GO

