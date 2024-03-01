USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tyollisten_ammattisiirtymat_cultures]    Script Date: 1.3.2024 14:31:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dbo].[v_f_tab_tyollisten_ammattisiirtymat_cultures] AS

SELECT 
	tilastovuosi_fi = f.tilastovuosi,
	tilastovuosi_en = f.tilastovuosi,
	tilastovuosi_sv = f.tilastovuosi,

	paaasiallinen_toiminta_fi = d6b.paaasiallinen_toiminta_versio9,
	paaasiallinen_toiminta_en = d6b.paaasiallinen_toiminta_versio9_EN,
	paaasiallinen_toiminta_sv = d6b.paaasiallinen_toiminta_versio9_SV,

	paaasiallinen_toiminta_siirtyman_paassa_fi = d6c.paaasiallinen_toiminta_versio9,
	paaasiallinen_toiminta_siirtyman_paassa_en = d6c.paaasiallinen_toiminta_versio9_EN,
	paaasiallinen_toiminta_siirtyman_paassa_sv = d6c.paaasiallinen_toiminta_versio9_SV,
	aidinkieli_fi = d2b.aidinkieli_versio5,
	aidinkieli_en = d2b.aidinkieli_versio5_EN,
	aidinkieli_sv = d2b.aidinkieli_versio5_SV,
	toimiala_fi = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d12.id = -1 THEN 'Toimiala tuntematon'
			else d12.toimiala_2008
		end,
	toimiala_en = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d12.id = -1 THEN 'Industry unknown'
			else d12.toimiala_2008_EN
		end,
	toimiala_sv = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänd'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d12.id = -1 THEN 'Bransch okänd'
			else d12.toimiala_2008_SV
		end,
	toimiala_oef_fi = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d32.id = -1 THEN '39 Toimiala tuntematon'
			else d32.oef_toimiala
		end,
	toimiala_oef_en = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Missing data'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d32.id = -1 THEN '39 Industry unknown'
			else d32.oef_toimiala_EN
		end,
	toimiala_oef_sv = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Information saknas'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d32.id = -1 THEN '39 Okänd'
			else d32.oef_toimiala_SV
		end,
	 toimiala_siirtyman_paassa_fi = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6c.paaasiallinen_toiminta_versio9_koodi = 11 and d13.id = -1 THEN 'Toimiala tuntematon'
			else d13.toimiala_2008
		end,
	toimiala_siirtyman_paassa_en = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			when d6c.paaasiallinen_toiminta_versio9_koodi = 11 and d13.id = -1 THEN 'Industry unknown'
			else d13.toimiala_2008_EN
		end,
	toimiala_siirtyman_paassa_sv = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänd'
			when d6c.paaasiallinen_toiminta_versio9_koodi = 11 and d13.id = -1 THEN 'Bransch okänd'
			else d13.toimiala_2008_SV
		end,
	 toimiala_sama_kuin_tilastovuonna_fi = 
		case 
			when d12.toimiala_2008=d13.toimiala_2008 then 'Toimiala sama kuin tilastovuonna'
			when d12.toimiala_2008<>d13.toimiala_2008 then 'Toimiala eri kuin tilastovuonna'
			else 'Tuntematon'
		end,
	toimiala_sama_kuin_tilastovuonna_en = 
		case 
			when d12.toimiala_2008=d13.toimiala_2008 then 'Industry same as during the statistical year'
			when d12.toimiala_2008<>d13.toimiala_2008 then 'Industry different from statistical year'
			else 'Unknown'
		end,
	toimiala_sama_kuin_tilastovuonna_sv = 
		case 
			when d12.toimiala_2008=d13.toimiala_2008 then 'Bransch samma som under statistikåret'
			when d12.toimiala_2008<>d13.toimiala_2008 then 'Bransch annan än under statistikåret'
			else 'Okänd'
		end,
	koulutusaste_taso_1_fi = d16.iscle2011,
	koulutusaste_taso_1_en = d16.iscle2011_EN,
	koulutusaste_taso_1_sv = d16.iscle2011_SV,
	koulutusaste_taso_2_fi = d16.Koulutusaste_taso2,
	koulutusaste_taso_2_en = d16.Koulutusaste_taso2_EN,
	koulutusaste_taso_2_sv = d16.Koulutusaste_taso2_SV,
	koulutusala_taso_1_fi = d16.iscle2011,
	koulutusala_taso_1_en = d16.iscle2011_EN,
	koulutusala_taso_1_sv = d16.iscle2011_SV,
	koulutusala_taso_2_fi = d20.iscfibroad2013,
	koulutusala_taso_2_en = d20.iscfibroad2013_EN,
	koulutusala_taso_2_sv = d20.iscfibroad2013_SV,
	koulutusaste_taso_1_siirtyman_paassa_fi = case when d17.iscle2011 = 'Tuntematon' then 'Ei uutta tutkintoa' else d17.iscle2011 end,
	koulutusaste_taso_1_siirtyman_paassa_en = case when d17.iscle2011 = 'Tuntematon' then 'No new degree' else d17.iscle2011_EN end,
	koulutusaste_taso_1_siirtyman_paassa_sv = case when d17.iscle2011 = 'Tuntematon' then 'Ingen ny examen' else d17.iscle2011_SV end,
	koulutusaste_taso_2_siirtyman_paassa_fi = case when d17.Koulutusaste_taso2 = 'Tuntematon' then 'Ei uutta tutkintoa' else d17.koulutusaste_taso2 end,
	koulutusaste_taso_2_siirtyman_paassa_en = case when d17.Koulutusaste_taso2 = 'Tuntematon' then 'No new degree' else d17.koulutusaste_taso2_EN end,
	koulutusaste_taso_2_siirtyman_paassa_sv = case when d17.Koulutusaste_taso2 = 'Tuntematon' then 'Ingen ny examen' else d17.koulutusaste_taso2_SV end,
	koulutusala_taso_1_siirtyman_paassa_fi = case when d21.iscfibroad2013 = 'Tuntematon' then 'Ei uutta tutkintoa' else d21.iscfibroad2013 end,
	koulutusala_taso_1_siirtyman_paassa_en = case when d21.iscfibroad2013 = 'Tuntematon' then 'No new degree' else d21.iscfibroad2013_EN end,
	koulutusala_taso_1_siirtyman_paassa_sv = case when d21.iscfibroad2013 = 'Tuntematon' then 'Ingen ny examen' else d21.iscfibroad2013_SV end,
	koulutusala_taso_2_siirtyman_paassa_fi = case when d21.iscfinarrow2013 = 'Tuntematon' then 'Ei uutta tutkintoa' else d21.iscfinarrow2013 end,
	koulutusala_taso_2_siirtyman_paassa_en = case when d21.iscfinarrow2013 = 'Tuntematon' then 'No new degree' else d21.iscfinarrow2013_EN end,
	koulutusala_taso_2_siirtyman_paassa_sv = case when d21.iscfinarrow2013 = 'Tuntematon' then 'Ingen ny examen' else d21.iscfinarrow2013_SV end,
	koulutuslaji_fi = d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa,
	koulutuslaji_en = d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_EN,
	koulutuslaji_sv = d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_SV,
	koulutuslaji_siirtyman_paassa_fi = case when d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa = 'Tuntematon' then 'Ei uutta tutkintoa' else d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa end,
	koulutuslaji_siirtyman_paassa_en = case when d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa = 'Tuntematon' then 'No new degree' else d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa end,
	koulutuslaji_siirtyman_paassa_sv = case when d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa = 'Tuntematon' then 'Ingen ny examen' else d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa end,
	opettajakelpoisuus_fi = d24.kylla_ei,
	opettajakelpoisuus_en = d24.kylla_ei_EN,
	opettajakelpoisuus_sv = d24.kylla_ei_SV,
	opettajakelpoisuus_siirtyman_paassa_fi = d25.kylla_ei,
	opettajakelpoisuus_siirtyman_paassa_en = d25.kylla_ei_EN,
	opettajakelpoisuus_siirtyman_paassa_sv = d25.kylla_ei_SV,
	tyopaikan_sijaintimaakunta_sama_kuin_tilastovuonna_fi = d26.kylla_ei,
	tyopaikan_sijaintimaakunta_sama_kuin_tilastovuonna_en = d26.kylla_ei_EN,
	tyopaikan_sijaintimaakunta_sama_kuin_tilastovuonna_sv = d26.kylla_ei_SV,
	erikoistumiskoulutuksen_amk_koulutusala_taso_1_siirtyman_paassa_fi = d28.iscfibroad2013,
	erikoistumiskoulutuksen_amk_koulutusala_taso_1_siirtyman_paassa_en = d28.iscfibroad2013_EN,
	erikoistumiskoulutuksen_amk_koulutusala_taso_1_siirtyman_paassa_sv = d28.iscfibroad2013_SV,
	erikoistumiskoulutuksen_yo_koulutusala_taso_1_siirtyman_paassa_fi = d29.iscfibroad2013,
	erikoistumiskoulutuksen_yo_koulutusala_taso_1_siirtyman_paassa_en = d29.iscfibroad2013_EN,
	erikoistumiskoulutuksen_yo_koulutusala_taso_1_siirtyman_paassa_sv = d29.iscfibroad2013_SV,
	ikaryhma_fi = d3.ika,
	ikaryhma_en = d3.ika_EN,
	ikaryhma_sv = d3.ika_SV,
	ammattiryhma_taso_1_mitenna_fi =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Ammatti tuntematon'
			else d5.mitenna_ammattiryhma1
		end,
	ammattiryhma_taso_1_mitenna_en =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Occupation unknown'
			else d5.mitenna_ammattiryhma1_EN
		end,
	ammattiryhma_taso_1_mitenna_sv =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Okänt yrke'
			else d5.mitenna_ammattiryhma1_SV
		end,
	ammattiryhma_taso_1_fi =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Ammatti tuntematon'
			else d30.oef_ammattiryhma1
		end,
	ammattiryhma_taso_1_en =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Occupation unknown'
			else d30.oef_ammattiryhma1_EN
		end,
	ammattiryhma_taso_1_sv =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Okänt yrke'
			else d30.oef_ammattiryhma1_SV
		end,
	ammattiryhma_taso_2_mitenna_fi =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Ammatti tuntematon'
			else d5.mitenna_ammattiryhma2
		end,
	ammattiryhma_taso_2_mitenna_en =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Occupation unknown'
			else d5.mitenna_ammattiryhma2_EN
		end,
	ammattiryhma_taso_2_mitenna_sv =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Okänt yrke'
			else d5.mitenna_ammattiryhma2_SV
		end,
	ammattiryhma_taso_2_fi =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Ammatti tuntematon'
			else d30.oef_ammattiryhma2
		end,
	ammattiryhma_taso_2_en =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Occupation unknown'
			else d30.oef_ammattiryhma2_EN
		end,
	ammattiryhma_taso_2_sv =
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Okänt yrke'
			else d30.oef_ammattiryhma2_SV
		end,
	ammattiryhma_taso_1_siirtyman_paassa_mitenna_fi =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d8.mitenna_ammattiryhma1
		end,
	ammattiryhma_taso_1_siirtyman_paassa_mitenna_en =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			else d8.mitenna_ammattiryhma1_EN
		end,
	ammattiryhma_taso_1_siirtyman_paassa_mitenna_sv =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			else d8.mitenna_ammattiryhma1_SV
		end,
	ammattiryhma_taso_1_siirtyman_paassa_fi =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d31.oef_ammattiryhma1
		end,
	ammattiryhma_taso_1_siirtyman_paassa_en =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			else d31.oef_ammattiryhma1_EN
		end,
	ammattiryhma_taso_1_siirtyman_paassa_sv =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			else d31.oef_ammattiryhma1_SV
		end,
	ammattiryhma_taso_2_siirtyman_paassa_mitenna_fi =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d8.mitenna_ammattiryhma2
		end,
	ammattiryhma_taso_2_siirtyman_paassa_mitenna_en =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			else d8.mitenna_ammattiryhma2_EN
		end,
	ammattiryhma_taso_2_siirtyman_paassa_mitenna_sv =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			else d8.mitenna_ammattiryhma2_SV
		end,
	ammattiryhma_taso_2_siirtyman_paassa_fi =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d31.oef_ammattiryhma2
		end,
	ammattiryhma_taso_2_siirtyman_paassa_en =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Not in employment'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Unknown'
			else d31.oef_ammattiryhma2_EN
		end,
	ammattiryhma_taso_2_siirtyman_paassa_sv =
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Inte sysselsatt'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Okänt'
			else d31.oef_ammattiryhma2_SV
		end,
	ammattiryhma_taso_1_sama_kuin_tilastovuonna_fi = case when d30.oef_ammattiryhma1=d31.oef_ammattiryhma1 then 'Ammattiryhmä, taso 1 sama kuin tilastovuonna' else 'Ammattiryhmä, taso 1 eri kuin tilastovuonna' end,
	ammattiryhma_taso_1_sama_kuin_tilastovuonna_en = case when d30.oef_ammattiryhma1=d31.oef_ammattiryhma1 then 'Profession group, level 1 same as during the statistical year' else 'Profession group, level 1 different from statistical year' end,
	ammattiryhma_taso_1_sama_kuin_tilastovuonna_sv = case when d30.oef_ammattiryhma1=d31.oef_ammattiryhma1 then 'Yrkesgrupp, nivå 1 samma som under statistikåret' else 'Yrkesgrupp, nivå 1 annan än under statistikåret' end,
	ammattiryhma_taso_2_sama_kuin_tilastovuonna_fi = case when d30.oef_ammattiryhma2=d31.oef_ammattiryhma2 then 'Ammattiryhmä, taso 2 sama kuin tilastovuonna' else 'Ammattiryhmä, taso 2 eri kuin tilastovuonna' end,
	ammattiryhma_taso_2_sama_kuin_tilastovuonna_en = case when d30.oef_ammattiryhma2=d31.oef_ammattiryhma2 then 'Profession group, level 2 same as during the statistical year' else 'Profession group, level 2 different from statistical year' end,
	ammattiryhma_taso_2_sama_kuin_tilastovuonna_sv = case when d30.oef_ammattiryhma2=d31.oef_ammattiryhma2 then 'Yrkesgrupp, nivå 2 samma som under statistikåret' else 'Yrkesgrupp, nivå 2 annan än under statistikåret' end,
	
	ammattiryhma_taso_1_sama_kuin_tilastovuonna_mitenna_fi = case when d5.mitenna_ammattiryhma1=d8.mitenna_ammattiryhma1 then 'Ammattiryhmä, taso 1 sama kuin tilastovuonna' else 'Ammattiryhmä, taso 1 eri kuin tilastovuonna' end,
	ammattiryhma_taso_1_sama_kuin_tilastovuonna_mitenna_en = case when d5.mitenna_ammattiryhma1=d8.mitenna_ammattiryhma1 then 'Profession group, level 1 same as during the statistical year' else 'Profession group, level 1 different from statistical year' end,
	ammattiryhma_taso_1_sama_kuin_tilastovuonna_mitenna_sv = case when d5.mitenna_ammattiryhma1=d8.mitenna_ammattiryhma1 then 'Yrkesgrupp, nivå 1 samma som under statistikåret' else 'Yrkesgrupp, nivå 1 annan än under statistikåret' end,
	ammattiryhma_taso_2_sama_kuin_tilastovuonna_mitenna_fi = case when d5.mitenna_ammattiryhma2=d8.mitenna_ammattiryhma2 then 'Ammattiryhmä, taso 2 sama kuin tilastovuonna' else 'Ammattiryhmä, taso 2 eri kuin tilastovuonna' end,
	ammattiryhma_taso_2_sama_kuin_tilastovuonna_mitenna_en = case when d5.mitenna_ammattiryhma2=d8.mitenna_ammattiryhma2 then 'Profession group, level 2 same as during the statistical year' else 'Profession group, level 2 different from statistical year' end,
	ammattiryhma_taso_2_sama_kuin_tilastovuonna_mitenna_sv = case when d5.mitenna_ammattiryhma2=d8.mitenna_ammattiryhma2 then 'Yrkesgrupp, nivå 2 samma som under statistikåret' else 'Yrkesgrupp, nivå 2 annan än under statistikåret' end,

	suhteellinen_ajankohta_fi = d9.suhteellinen_ajankohta,
	suhteellinen_ajankohta_en = d9.suhteellinen_ajankohta_EN,
	suhteellinen_ajankohta_sv = d9.suhteellinen_ajankohta_SV,

	apusarake_perusjoukko = d10.perusjoukko_tyolliset,
	apusarake_lkm = f.lkm,
	apusarake_lahde = f.lahde,
	apusarake_ammattiryhma_luokitus =
		case 
			when (d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f.tilastovuosi > 2015) or (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f.tilastovuosi > 2010) then 'oef' 
			else 'mitenna' 
		end,

	jarjestys_ikaryhma = d3.jarjestys_ika5v,
	jarjestys_ammattiryhma_taso_1 = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d30.jarjestys_ammattiryhma1 end,
	jarjestys_ammattiryhma_taso_2 = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d30.jarjestys_ammattiryhma2 end,
	jarjestys_ammattiryhma_taso_1_mitenna = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -2 THEN 'MITENNA99' else d5.jarjestys_ammattiryhma1 end,
	jarjestys_ammattiryhma_taso_2_mitenna = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -2 THEN 'MITENNA99' else d5.jarjestys_ammattiryhma2 end,
	jarjestys_paaasiallinen_toiminta = d6b.jarjestys,
	jarjestys_ammattiryhma_taso_1_siirtyman_paassa = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d31.jarjestys_ammattiryhma1 end,
	jarjestys_ammattiryhma_taso_2_siirtyman_paassa = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d31.jarjestys_ammattiryhma2 end,
	jarjestys_ammattiryhma_taso_1_siirtyman_paassa_mitenna = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d8.jarjestys_ammattiryhma1 end,
	jarjestys_ammattiryhma_taso_2_siirtyman_paassa_mitenna = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d8.jarjestys_ammattiryhma2 end,
	jarjestys_suhteellinen_ajankohta = d9.jarjestys,
	jarjestys_ammattiryhma_taso_1_sama_kuin_tilastovuonna = case when d30.oef_ammattiryhma1=d31.oef_ammattiryhma1 then 1 else 2 end,
	jarjestys_ammattiryhma_taso_2_sama_kuin_tilastovuonna = case when d30.oef_ammattiryhma2=d31.oef_ammattiryhma2 then 1 else 2 end,
	jarjestys_ammattiryhma_taso_1_sama_kuin_tilastovuonna_mitenna = case when d5.mitenna_ammattiryhma1=d8.mitenna_ammattiryhma1 then 1 else 2 end,
	jarjestys_ammattiryhma_taso_2_sama_kuin_tilastovuonna_mitenna = case when d5.mitenna_ammattiryhma2=d8.mitenna_ammattiryhma2 then 1 else 2 end,
	jarjestys_paaasiallinen_toiminta_siirtyman_paassa = d6c.jarjestys,
	jarjestys_aidinkieli = d2b.jarjestys,
	jarjestys_toimiala = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 then 'Ö998' when (d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d12.id = -1) or d12.toimiala_2008 = 'Toimiala tuntematon' then 'Ö997' else d12.toimiala_2008 end,
	jarjestys_toimiala_oef = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 then '99' when (d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d32.id = -1) or d12.toimiala_2008 = 'Toimiala tuntematon' then '39' else d32.jarjestys_oef_toimiala end,
	jarjestys_toimiala_siirtyman_paassa = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 then 'Ö998' when (d6c.paaasiallinen_toiminta_versio9_koodi = 11 and d13.id = -1) or d13.toimiala_2008 = 'Toimiala tuntematon' then 'Ö997' else d13.toimiala_2008 end,
	jarjestys_toimiala_sama_kuin_tilastovuonna =
		case 
			when d12.toimiala_2008=d13.toimiala_2008 then 1
			when d12.toimiala_2008<>d13.toimiala_2008 then 2
			else 9
		end,
	jarjestys_koulutusaste_taso_1 = d16.jarjestys_iscle2011,
	jarjestys_koulutusaste_taso_2 = d16.jarjestys_Koulutusaste_taso2,
	jarjestys_koulutusala_taso_1 = d20.jarjestys_iscfibroad2013,
	jarjestys_koulutusala_taso_2 = d20.jarjestys_iscfinarrow2013,

	jarjestys_koulutusaste_taso_1_siirtyman_paassa = d17.jarjestys_iscle2011,
	jarjestys_koulutusaste_taso_2_siirtyman_paassa = d17.jarjestys_Koulutusaste_taso2,
	jarjestys_koulutusala_taso_1_siirtyman_paassa = d21.jarjestys_iscfibroad2013,
	jarjestys_koulutusala_taso_2_siirtyman_paassa = d21.jarjestys_iscfinarrow2013,
	jarjestys_koulutuslaji = d22.jarjestys,
	jarjestys_koulutuslaji_siirtyman_paassa = d23.jarjestys,
	jarjestys_opettajakelpoisuus = d24.jarjestys,
	jarjestys_opettajakelpoisuus_siirtyman_paassa = d25.jarjestys,
	jarjestys_tyopaikan_sijaintimaakunta_sama_kuin_tilastovuonna = d26.jarjestys,
	jarjestys_erikoistumiskoulutuksen_amk_koulutusala_taso_1_siirtyman_paassa = d28.jarjestys_iscfibroad2013,
	jarjestys_erikoistumiskoulutuksen_yo_koulutusala_taso_1_siirtyman_paassa = d29.jarjestys_iscfibroad2013

FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f
LEFT JOIN dbo.d_aidinkieli_versio5 d2b on d2b.id=f.aidinkieli_versio5_id
LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id	
LEFT JOIN dbo.d_mitenna_ammatti d5 on d5.id=f.mitenna_ammatti_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f.paaasiallinen_toimintar9_id
LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f.paaasiallinen_toimintar9_siirtyman_paassa_id
LEFT JOIN dbo.d_mitenna_ammatti d8 on d8.id=f.mitenna_ammatti_siirtyman_paassa_id
LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f.suhteellinen_ajankohta_id
LEFT JOIN dbo.d_perusjoukko_tyolliset d10 on d10.id=f.perusjoukko_tyolliset_id
LEFT JOIN dbo.d_toimiala_2008 d12 on d12.id=f.toimiala_id
LEFT JOIN dbo.d_toimiala_2008 d13 on d13.id=f.toimiala_siirtyman_paassa_id
LEFT JOIN dbo.d_koulutusluokitus d16 on d16.id=f.koulutusala_taso2_id
LEFT JOIN dbo.d_koulutusluokitus d17 on d17.id=f.koulutusala_taso2_siirtyman_paassa_id
LEFT JOIN dbo.d_koulutusluokitus d18 on d18.id=f.opintoala_id
LEFT JOIN dbo.d_koulutusluokitus d19 on d19.id=f.opintoala_siirtyman_paassa_id
LEFT JOIN dbo.d_koulutusluokitus d20 on d20.id=f.koulutusala_taso2_id
LEFT JOIN dbo.d_koulutusluokitus d21 on d21.id=f.koulutusala_taso2_siirtyman_paassa_id
LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id=f.koulutuslaji_id
LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d23 on d23.id=f.koulutuslaji_siirtyman_paassa_id
LEFT JOIN dbo.d_kylla_ei d24 on d24.id=f.opettajankelpoisuus_id
LEFT JOIN dbo.d_kylla_ei d25 on d25.id=f.opettajankelpoisuus_siirtyman_paassa_id
LEFT JOIN dbo.d_kylla_ei d26 on d26.id=f.tyopaikan_sijaintimaakunta_sama_kylla_ei_id
LEFT JOIN dbo.d_koulutusluokitus d27 on d27.id=f.opintoala_erikoistumiskoulutus_siirtyman_paassa_id
LEFT JOIN dbo.d_koulutusluokitus d28 ON d28.id=f.koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa_id
LEFT JOIN dbo.d_koulutusluokitus d29 ON d29.id=f.koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa_id
LEFT JOIN dbo.d_oef_ammatti d30 on d30.id=f.oef_ammatti_id
LEFT JOIN dbo.d_oef_ammatti d31 on d31.id=f.oef_ammatti_siirtyman_paassa_id
LEFT JOIN dbo.d_oef_toimiala d32 on d32.id = f.oef_toimiala_id
WHERE f.lahde = 'R4.23'

GO

USE [ANTERO]