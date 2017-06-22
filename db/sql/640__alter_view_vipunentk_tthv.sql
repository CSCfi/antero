USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tieteen_ja_teknologian_henkilovoimavarat_K5_5]    Script Date: 22.6.2017 12:06:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_f_tab_tieteen_ja_teknologian_henkilovoimavarat_K5_5] AS

-- Select * from VipunenTK..v_f_tab_tieteen_ja_teknologian_henkilovoimavarat_K5_5

SELECT --top 100000 --testausta
	  --Mittarit
       [lkm]

	  --Aika
	  ,[Tilastovuosi]
	  ,'Tutkinnon suorittamisesta kulunut aika' = d14.koulutuksesta_kulunut_aika
	  ,'Tutkinnon suorittamisesta kulunut aika 5v' = d14.koulutuksesta_kulunut_aika_5v
	  ,'Tutkinnon suorittamisesta kulunut aika TTHV' = d14.koulutuksesta_kulunut_aika_tthv

	  --Henkilö
	  ,d3.sukupuoli AS 'Sukupuoli'
	  ,d4.ika AS 'Ikäryhmä'
	  ,d1.maa AS 'Syntymävaltio'
	  ,d1.maanosa AS 'Syntymävaltio (maanosa)'
	  ,'Syntymävaltio (Suomi maanosa)' = Cast(
		Case when d1.maa_koodi='246' then d1.maa --Suomi 
			 when d1.maanosa = 'Muut' then 'Tuntematon'
			 else d1.maanosa end as nvarchar(50))
	  ,d2.maa AS 'Kansalaisuus (maa)'
	  ,d2.maanosa AS 'Kansalaisuus (maanosa)'
	  ,'Kansalaisuus (Suomi maanosa)' = Cast(
		Case when d2.maa_koodi='246' then d2.maa --Suomi 
			 when d2.maanosa = 'Muut' then 'Tuntematon'
			 else d2.maanosa end as nvarchar(50))
	  ,d2.etamaa AS 'ETA-maan kansalainen'
	  ,d2.eumaa AS 'EU-maan kansalainen'
	  ,d5.maakunta AS 'Asuinmaakunta'
	  ,'Ammattiluokitus taso 1' = d8.ammattiluokitus_2010_paataso
	  ,'Ammattiluokitus taso 2' = d8.ammattiluokitus_2010_2_taso
	  ,'Ammattiluokitus taso 3' = d8.ammattiluokitus_2010_3_taso
	  ,'Ammattiluokitus2001 taso1' = d8_2001_1.ammattiluokitus_2001
	  ,'Ammattiluokitus2001 taso2' = d8_2001_2.ammattiluokitus_2001
	  ,'Pääasiallinen toiminta' = d15.paaasiallinen_toiminta_versio3
	  ,'Pääasiallinen toiminta TTHV' = d15.paaasiallinen_toiminta_versio3_TTHV

	  --Koulutus
      ,d6.koulutus AS 'Koulutusnimike'
	  ,d6.opintoala2002 AS 'Opintoala (02 luokitus)'
	  ,d6.opintoala1995 AS 'Koulutusala (95 luok.)'
	  ,d6.koulutusala2002 AS 'Koulutusala (02 luok.)'
	  ,'Koulutusala, taso 1' = d6.iscfibroad2013
	  ,'Koulutusala, taso 2' = d6.iscfinarrow2013
	  ,'Koulutusala, taso 3' = d6.iscfi2013
	  ,'Koulutusaste, taso 1' = d6.iscle2011
	  ,'Koulutusaste, taso 2' = d6.Koulutusaste_taso2
      ,[tutkinnon_suoritusvuosi] AS 'Tutkinnon suoritusvuosi'
	  ,'OKM ohjauksen ala' = d6.OKM_ohjauksen_ala
	  ,d7.maakunta AS 'Tutkinnon suoritusmaakunta'

	  --Tieteenala
	  ,'Tieteenala TTHV' = d13.tieteenala2010
	  ,'Päätieteenala TTHV' = d13.paatieteenala2010

	  --Työnantaja
	  ,d9.maakunta AS 'Työpaikan sijaintimaakunta'
	  ,d10.toimiala_tthv AS 'Toimialaluokitus TTHV, taso 2'
	  ,d20.toimiala_tthv AS 'Toimialaluokitus TTHV, taso 2 edellinen vuosi'
	  ,d10.paatoimiala_tthv AS 'Toimialaluokitus TTHV, taso 1'
	  ,d20.paatoimiala_tthv AS 'Toimialaluokitus TTHV, taso 1 edellinen vuosi'
	  ,d22.toimiala_tthv1_sama_kuin_ed_vuonna AS 'Muuttunut toimiala TTHV 1'
	  ,d23.toimiala_tthv2_sama_kuin_ed_vuonna AS 'Muuttunut toimiala TTHV 2'
	  ,d11.tyonantajasektori2 AS 'Työnantajasektori'
	  ,d17.tyonantajasektori2 AS 'Työnantajasektori edellinen vuosi'
	  ,d18.tyonantajasektori2 AS 'Työnantajasektori TTHV'
	  ,d19.tyonantajasektori2 AS 'Työnantajasektori TTHV edellinen vuosi'
	  ,d21.tyonantajasektori_sama_kuin_ed_vuonna AS 'Muuttunut työnantajasektori'
      ,d12.asuinmaakunta_sama_kuin_tyopaikan AS 'Asuimaakunta sama vai eri kuin työpaikan sijaintimaakunta'
	  ,d16.yrityksen_koko AS 'Yrityksen koko'
	  ,d24.kylla_ei AS 'Työnantaja vaihtunut'

	  --Ruotsi
	  ,'Statistikår' = [Tilastovuosi]
	  ,'Tid som förflutit sedan examen avlagts' = d14.koulutuksesta_kulunut_aika_SV
	  ,'Tid som förflutit sedan examen avlagts 5år' = d14.koulutuksesta_kulunut_aika_5v_SV
	  ,'Tid som förflutit sedan examen avlagts TTHV' = d14.koulutuksesta_kulunut_aika_tthv_SV
	  ,d3.sukupuoli_SV AS 'Kön'
	  ,d4.ika_SV AS 'Åldersgrupp'
	  ,d1.maa_SV AS 'Födelseland'
	  ,d1.maanosa_SV AS 'Födelseland (världsdel)'
	  ,'Födelseland (Finland världsdel)' = Cast(
		Case when d1.maa_koodi='246' then d1.maa_SV --Suomi 
			 else d1.maanosa_SV end as nvarchar(50))
	  ,d2.maa_SV AS 'Medborgarskap (land)'
	  ,d2.maanosa_SV AS 'Medborgarskap (världsdel)'
	  ,'Medborgarskap (Finland världsdel)' = Cast(
		Case when d2.maa_koodi='246' then d2.maa_SV --Suomi 
			 when d2.maanosa_SV = 'Övrig' then 'Information saknas'
			 else d2.maanosa_SV end as nvarchar(50))
	  ,d2.etamaa_SV AS 'Medborgare i ett EES-land'
	  ,d2.eumaa_SV AS 'Medborgare i ett EU-land'
	  ,d5.maakunta_SV AS 'Bostadslandskap'
	  --,d8.ammattiluokitus_2010_paataso_SV as 'Yrkesgrupp 1'
	  --,d8.ammattiluokitus_2010_2_taso_SV as 'Yrkesgrupp 2'
	  --,d8.ammattiluokitus_2010_3_taso_SV as 'Yrkesgrupp 3'
	  ,'Yrkesgrupp 1' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_paataso_SV else coalesce(d8_2001_1.ammattiluokitus_2001_SV, d8_2001_tuntematon.ammattiluokitus_2001_SV) end
	  ,'Yrkesgrupp 2' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_2_taso_SV else coalesce(d8_2001_2.ammattiluokitus_2001_SV, d8_2001_tuntematon.ammattiluokitus_2001_SV) end
	  ,'Yrkesgrupp 3' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_3_taso_SV else coalesce(d8_2001_3.ammattiluokitus_2001_SV, d8_2001_tuntematon.ammattiluokitus_2001_SV) end
	  ,'Huvudsaklig verksamhet' = d15.paaasiallinen_toiminta_versio3_SV
	  ,'Huvudsaklig verksamhet TTHV' = d15.paaasiallinen_toiminta_versio3_TTHV_SV
      ,d6.koulutus_SV AS 'Utbildningsbenämning'
	  ,d6.opintoala2002_SV AS 'Studieområde (2002)'
	  ,d6.opintoala1995_SV AS 'Utbildningsområde (1995)'
	  ,d6.koulutusala2002_SV AS 'Utbildningsområde (2002)'
	  ,'Utbildn.område, nivå 1' = d6.iscfibroad2013_SV
	  ,'Utbildn.område, nivå 2' = d6.iscfinarrow2013_SV
	  ,'Utbildn.område, nivå 3' = d6.iscfi2013_SV
	  ,'Utbildn.nivå, nivå 1' = d6.iscle2011_SV
	  ,'Utbildn.nivå, nivå 2' = d6.Koulutusaste_taso2_SV
	  ,'SV OKM ohjauksen ala' = d6.OKM_ohjauksen_ala_SV
      ,[tutkinnon_suoritusvuosi] AS 'År då utbildningen avlagts'
	  ,d7.maakunta_SV AS 'Landskap där examen avlagts'
	  ,'Vetenskapsgren (2010)' = d13.tieteenala2010_SV
	  ,'Huvudvetenskapsgren (2010)' = d13.paatieteenala2010_SV
	  ,d9.maakunta_SV AS 'Arbetsplatsens landskap'
	  ,d10.toimiala_tthv_SV AS 'Bransch TTHV, nivå 2'
	  ,d10.paatoimiala_tthv_SV AS 'Bransch TTHV, nivå 1'
	  ,d11.tyonantajasektori2_SV AS 'Arbetsgivarens sektor'
      ,d12.asuinmaakunta_sama_kuin_tyopaikan_SV AS 'SV Asuimaakunta sama vai eri kuin työpaikan sijaintimaakunta'

	  --Englanti
	  ,'Statistical year ' = [Tilastovuosi]
	  ,'Time since attaining the qualification' = d14.koulutuksesta_kulunut_aika_EN
	  ,'Time since attaining the qualification 5yr' = d14.koulutuksesta_kulunut_aika_5v_EN
	  ,'Time since attaining the qualification TTHV' = d14.koulutuksesta_kulunut_aika_tthv_EN
	  ,d3.sukupuoli_EN AS 'Gender'
	  ,d4.ika_EN AS 'Age group'
	  ,d1.maa_EN AS 'Country of birth'
	  ,d1.maanosa_EN AS 'Country of birth (continent)'
	  ,'Country of birth (Finland continent)' = Cast(
		Case when d1.maa_koodi='246' then d1.maa_EN --Suomi 
			 else d1.maanosa_EN end as nvarchar(50))
	  ,d2.maa_EN AS 'Nationality (country)'
	  ,d2.maanosa_EN AS 'Nationality (continent)'
	  ,'Nationality (Finland continent)' = Cast(
		Case when d2.maa_koodi='246' then d2.maa_EN --Suomi 
			 when d2.maanosa_EN = 'Other' then 'Missing data'
			 else d2.maanosa_EN end as nvarchar(50))
	  ,d2.etamaa_EN AS 'Citizen of EEA nation'
	  ,d2.eumaa_EN AS 'Citizen of EU nation'
	  ,d5.maakunta_EN AS 'Region of residence '
	  --,d8.ammattiluokitus_2010_paataso_EN as 'Profession group 1'
	  --,d8.ammattiluokitus_2010_2_taso_EN as 'Profession group 2'
	  --,d8.ammattiluokitus_2010_3_taso_EN as 'Profession group 3'
	  ,'Profession group 1' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_paataso_EN else coalesce(d8_2001_1.ammattiluokitus_2001_EN, d8_2001_tuntematon.ammattiluokitus_2001_EN) end
	  ,'Profession group 2' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_2_taso_EN else coalesce(d8_2001_2.ammattiluokitus_2001_EN, d8_2001_tuntematon.ammattiluokitus_2001_EN) end
	  ,'Profession group 3' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_3_taso_EN else coalesce(d8_2001_3.ammattiluokitus_2001_EN, d8_2001_tuntematon.ammattiluokitus_2001_EN) end
	  ,'Main type of activity' = d15.paaasiallinen_toiminta_versio3_EN
	  ,'Main type of activity TTHV' = d15.paaasiallinen_toiminta_versio3_TTHV_EN
      ,d6.koulutus_EN AS 'Name of education'
	  ,d6.opintoala2002_EN AS 'Subfield of education (2002)'
	  ,d6.opintoala1995_EN AS 'Field of education (1995)'
	  ,d6.koulutusala2002_EN AS 'Field of education (2002)'
	  ,'Field of ed. tier 1' = d6.iscfibroad2013_EN
	  ,'Field of ed. tier 2' = d6.iscfinarrow2013_EN
	  ,'Field of ed. tier 3' = d6.iscfi2013_EN
	  ,'Level of ed. tier 1' = d6.iscle2011_EN
	  ,'Level of ed. tier 2' = d6.Koulutusaste_taso2_EN
  	  ,'EN OKM ohjauksen ala' = d6.OKM_ohjauksen_ala_EN
      ,[tutkinnon_suoritusvuosi] AS 'Graduation year'
	  ,d7.maakunta_EN AS 'Region of degree/qualification'
	  ,'Discipline (2010)' = d13.tieteenala2010_EN
	  ,'Main discipline (2010)' = d13.paatieteenala2010_EN
	  ,d9.maakunta_EN AS 'Region where the job is located'
	  ,d10.toimiala_tthv_EN AS 'Industry TTHV, level 2'
	  ,d10.paatoimiala_tthv_EN AS 'Industry TTHV, level 1'
	  ,d11.tyonantajasektori2_EN AS 'Employer sector'
      ,d12.asuinmaakunta_sama_kuin_tyopaikan_EN AS 'EN Asuimaakunta sama vai eri kuin työpaikan sijaintimaakunta'

	  --Koodit
	  ,[Koodit Syntymävaltio] = d1.maa_koodi
	  ,[Koodit Kansalaisuus (maa)] = d2.maa_koodi
	  ,[Koodit Asuinmaakunta] = d5.maakunta_koodi
	  --,[Koodit Ammattiluokitus taso 1] = d8.ammattiluokitus_2010_paataso_koodi
	  --,[Koodit Ammattiluokitus taso 2] = d8.ammattiluokitus_2010_2_taso_koodi
	  --,[Koodit Ammattiluokitus taso 3] = d8.ammattiluokitus_2010_3_taso_koodi
	  ,'Koodit Ammattiluokitus taso 1' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_paataso_koodi else coalesce(d8_2001_1.ammattiluokitus_2001_koodi, d8_2001_tuntematon.ammattiluokitus_2001_koodi) end
	  ,'Koodit Ammattiluokitus taso 2' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_2_taso_koodi else coalesce(d8_2001_2.ammattiluokitus_2001_koodi, d8_2001_tuntematon.ammattiluokitus_2001_koodi) end
	  ,'Koodit Ammattiluokitus taso 3' = case when f.tilastovuosi >= '2011' then d8.ammattiluokitus_2010_3_taso_koodi else coalesce(d8_2001_3.ammattiluokitus_2001_koodi, d8_2001_tuntematon.ammattiluokitus_2001_koodi) end
	  ,[Koodit Pääasiallinen toiminta] = d15.paaasiallinen_toiminta_versio3_avain
	  ,[Koodit Koulutuskoodi] = d6.koulutus_koodi
	  ,[Koodit Opintoala (02 luokitus)] = d6.opintoala2002_koodi
	  ,[Koodit Koulutusala (95 luokitus)] = d6.opintoala1995_koodi
	  ,[Koodit Koulutusala (02 luokitus)] = d6.koulutusala2002_koodi
	  ,[Koodit Koulutusala taso 1] = d6.iscfibroad2013_koodi
	  ,[Koodit Koulutusala taso 2] = d6.iscfinarrow2013_koodi
	  ,[Koodit Koulutusala taso 3] = d6.iscfi2013_koodi
	  ,[Koodit Koulutusaste taso 1] = d6.iscle2011_koodi
	  ,[Koodit Koulutusaste taso 2] = d6.Koulutusaste_taso2_koodi
	  ,[Koodit OKM ohjauksen ala] = d6.OKM_ohjauksen_ala_koodi
	  ,[Koodit Tutkinnon suoritusmaakunta] = d7.maakunta_koodi
	  ,[Koodit Tieteenala TTHV] = d13.tieteenala_avain
	  ,[Koodit Työpaikan maakunta] = d9.maakunta_koodi
	  ,[Koodit Työnantajasektori] = d11.tyonantajasektori2_avain
	  
	  --Järjestys
	  ,jarj_syntymamaa = d1.jarjestys
	  ,jarj_syntymamaanosa = d1.jarjestys_maanosa 
	  ,jarj_syntyma_suomimaanosa = Cast(
		Case when d1.maa_koodi='246' then 0 --Suomi 
			 else d1.jarjestys_maanosa end as smallint)
	  ,jarj_kansalaisuus_maa = d2.jarjestys
	  ,jarj_kansalaisuus_maanosa = d2.jarjestys_maanosa
	  ,jarj_kansalaisuus_suomimaanosa = Cast(
		Case when d2.maa_koodi='246' then 0 --Suomi 
			 else d2.jarjestys_maanosa end as smallint)
	  ,jarj_kansalaisuus_ETA = d2.jarjestys_etamaa
	  ,jarj_kansalaisuus_EU = d2.jarjestys_eumaa
	  ,jarj_sukupuoli = d3.jarjestys
	  ,jarj_ika = d4.jarjestys_ika
	  ,jarj_asuinmaakunta = d5.jarjestys_maakunta
	  ,jarj_koulutus = d6.jarjestys
	  ,jarj_koulutus_SV = Cast(Case when d6.id = -1 then 'ööö1' when d6.id = -2 then 'ööö2' else left(d6.koulutus_SV,10) end as nvarchar(10))
	  ,jarj_koulutus_EN = Cast(Case when d6.id = -1 then 'ööö1' when d6.id = -2 then 'ööö2' else left(d6.koulutus_EN,10) end as nvarchar(10))
	  ,jarj_opintoala2002 = d6.jarjestys_opintoala2002
	  ,jarj_koulutusala1995 = d6.jarjestys_opintoala1995
	  ,jarj_koulutusala2002 = d6.jarjestys_koulutusala2002
	  ,jarj_Koulutusala_taso1 = d6.jarjestys_iscfibroad2013
	  ,jarj_Koulutusala_taso2 = d6.jarjestys_iscfinarrow2013
	  ,jarj_Koulutusala_taso3 = d6.jarjestys_iscfi2013
	  ,jarj_Koulutusaste_taso1 = d6.jarjestys_iscle2011
	  ,jarj_Koulutusaste_taso2 = d6.jarjestys_koulutusaste_taso2
	  ,jarj_okm_ohjauksen_ala = d6.jarjestys_OKM_ohjauksen_ala
 	  ,jarj_tieteenala_tthv = d13.jarjestys_tieteenala2010
	  ,jarj_paatieteenala_tthv = d13.jarjestys_paatieteenala2010
	  ,jarj_tutk_maakunta = d7.jarjestys_maakunta
	  --,jarj_ammattiluokitustaso1 = d8.[jarjestys_ammattiluokitus_2010_paataso]
	  --,jarj_ammattiluokitustaso2 = d8.[jarjestys_ammattiluokitus_2010_taso2]
	  --,jarj_ammattiluokitustaso3 = d8.[jarjestys_ammattiluokitus_2010_taso3]
	  ,jarj_ammattiluokitustaso1 = case when f.tilastovuosi >= '2011' then d8.jarjestys_ammattiluokitus_2010_paataso else coalesce(d8_2001_1.jarjestys, d8_2001_tuntematon.jarjestys) end
	  ,jarj_ammattiluokitustaso2 = case when f.tilastovuosi >= '2011' then d8.jarjestys_ammattiluokitus_2010_taso2 else coalesce(d8_2001_2.jarjestys, d8_2001_tuntematon.jarjestys) end
	  ,jarj_ammattiluokitustaso3 = case when f.tilastovuosi >= '2011' then d8.jarjestys_ammattiluokitus_2010_taso3 else coalesce(d8_2001_3.jarjestys, d8_2001_tuntematon.jarjestys) end
	  ,jarj_paaasiallinen_toiminta_versio3 = d15.[jarjestys_paaasiallinen_toiminta_versio3]
	  ,jarj_paaasiallinen_toiminta_versio3_TTHV = d15.[jarjestys_paaasiallinen_toiminta_versio3_TTHV]
	  ,jarj_tyopaikan_maakunta = d9.jarjestys_maakunta
	  ,jarj_toimiala_tthv = d10.jarjestys_toimiala_tthv
	  ,jarj_paatoimiala_tthv = d10.jarjestys_paatoimiala_tthv
	  ,jarj_tyonantajasektori = d11.jarjestys
	  ,jarj_asuinmaak_sama = d12.jarjestys
	  ,jarj_koulutuksesta_kulunut_aika_1v = d14.jarjestys
	  ,jarj_koulutuksesta_kulunut_aika_5v = d14.jarjestys_5v
	  ,jarj_koulutuksesta_kulunut_aika_tthv = d14.jarjestys_tthv
	  ,d20.jarjestys_toimiala_tthv AS 'jarj Toimialaluokitus TTHV, taso 2 edellinen vuosi'
	  ,d20.jarjestys_paatoimiala_tthv AS 'jarj Toimialaluokitus TTHV, taso 1 edellinen vuosi'
	  ,d22.jarjestys AS 'jarj Muuttunut toimiala TTHV 1'
	  ,d23.jarjestys AS 'jarj Muuttunut toimiala TTHV 2'
	  ,d17.jarjestys AS 'jarj Työnantajasektori edellinen vuosi'
	  ,d18.jarjestys AS 'jarj Työnantajasektori TTHV'
	  ,d19.jarjestys AS 'jarj Työnantajasektori TTHV edellinen vuosi'
	  ,d21.jarjestys AS 'jarj Muuttunut työnantajasektori'
	  ,d16.jarjestys AS 'jarj Yrityksen koko'
	  ,d24.jarjestys AS 'jarj Työnantaja vaihtunut'

	  --Muuta
	  ,'Ikä 25-64v' = case when d4.[ika_avain] in ('ikar5_2', 'ikar5_3', 'ikar5_4', 'ikar5_5') then 'K' else 'E' end


  FROM [VipunenTK].[dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] f
  inner join [VipunenTK].[dbo].d_valtio d1 on d1.id = f.syntymamaa_id
  inner join [VipunenTK].[dbo].d_valtio d2 on d2.id = f.kansalaisuus_valtio_id
  inner join [VipunenTK].[dbo].d_sukupuoli d3 on d3.id = f.sukupuoli_id
  inner join [VipunenTK].[dbo].d_ika d4 on d4.id = f.ika_id
  inner join [VipunenTK].[dbo].d_alueluokitus d5 on d5.id = f.asuinmaakunta_id
  inner join [VipunenTK].[dbo].d_koulutusluokitus d6 on d6.id = f.koulutusluokitus_id
  inner join [VipunenTK].[dbo].d_alueluokitus d7 on d7.id = f.tutkinnon_suoritusmaakunta_id
  inner join [VipunenTK].[dbo].d_ammattiluokitus_2001 d8_2001_3 on d8_2001_3.id = f.ammattiluokitus_2001_id
  left join [VipunenTK].[dbo].d_ammattiluokitus_2001 d8_2001_2 on d8_2001_2.ammattiluokitus_2001_avain = left(d8_2001_3.ammattiluokitus_2001_avain,2) and d8_2001_2.taso = 2
  left join [VipunenTK].[dbo].d_ammattiluokitus_2001 d8_2001_1 on d8_2001_1.ammattiluokitus_2001_avain = left(d8_2001_3.ammattiluokitus_2001_avain,1) and d8_2001_1.taso = 1
  left join [VipunenTK].[dbo].d_ammattiluokitus_2001 d8_2001_tuntematon on d8_2001_tuntematon.ammattiluokitus_2001_avain = '-1'
  inner join [VipunenTK].[dbo].d_ammattiluokitus_2010 d8 on d8.id = f.ammattiluokitus_2010_id
  inner join [VipunenTK].[dbo].d_alueluokitus d9 on d9.id = f.tyopaikan_sijaintimaakunta_id
  inner join [VipunenTK].[dbo].d_toimiala_tthv d10 on d10.id = f.toimialaluokitus_tthv_id
  inner join [VipunenTK].[dbo].d_tyonantajasektori2 d11 on d11.id = f.tyonantajasektori2_id
  inner join [VipunenTK].[dbo].d_asuinmaakunta_sama_kuin_tyopaikan d12 on d12.id = f.asuinmaakunta_sama_kuin_tyopaikan_sijaintikunta_id
  inner join [VipunenTK].[dbo].d_tieteenala d13 on d13.id = f.tieteenala_id
  inner join [VipunenTK].[dbo].d_koulutuksesta_kulunut_aika d14 on d14.id = f.tutkinnosta_kulunut_aika_id
  inner join [VipunenTK].[dbo].d_paaasiallinen_toiminta_versio3 d15 on d15.id = f.paaasiallinen_toiminta_versio3_id
  inner join VipunenTK.dbo.d_yrityksen_koko_tthv d16 on d16.id=f.yrityksen_koko_id
  inner join VipunenTK.dbo.d_tyonantajasektori2 d17 on d17.id=f.tyonantajasektori2_ed_id
  inner join VipunenTK.dbo.d_tyonantajasektori2 d18 on d18.id=f.tyonantajasektori2_tthv_id
  inner join VipunenTK.dbo.d_tyonantajasektori2 d19 on d19.id=f.tyonantajasektori2_ed_tthv_id
  inner join VipunenTK.dbo.d_toimiala_tthv d20 on d20.id=f.toimialaluokitus_ed_tthv_id
  inner join VipunenTK.dbo.d_tyonantajasektori_sama_kuin_ed_vuonna d21 on d21.id=f.tyoantajasektori_sama_kuin_ed_vuonna_id
  inner join VipunenTK.dbo.d_toimiala_tthv1_sama_kuin_ed_vuonna d22 on d22.id=f.toimiala_tthv1_sama_kuin_ed_vuonna_id
  inner join VipunenTK.dbo.d_toimiala_tthv2_sama_kuin_ed_vuonna d23 on d23.id=f.toimiala_tthv2_sama_kuin_ed_vuonna_id
  inner join VipunenTK.dbo.d_kylla_ei d24 on d24.id = f.tyonantaja_vaihtunut_id

USE [ANTERO]




