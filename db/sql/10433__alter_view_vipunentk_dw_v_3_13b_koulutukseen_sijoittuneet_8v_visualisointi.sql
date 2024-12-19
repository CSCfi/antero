USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_3_13b_koulutukseen_sijoittuneet_8v_visualisointi]    Script Date: 19.12.2024 13.59.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










/****** Script for SelectTopNRows command from SSMS  ******/

ALTER VIEW [dbo].[v_3_13b_koulutukseen_sijoittuneet_8v_visualisointi] AS

SELECT
	tilv as Tilastovuosi,
	CASE	
		WHEN lahde = '0_0' THEN '9. luokan päättäneet'
		ELSE
			CONCAT(
			CASE
				WHEN LEFT(lahde,1) = '1' THEN 'Yliopistokoulutus'
				WHEN LEFT(lahde,1) = '2' THEN 'Ammattikorkeakoulukoulutus'
				WHEN LEFT(lahde,1) = '3' THEN 'Lukiokoulutus'
				WHEN LEFT(lahde,1) = '4' THEN 'Ammatillinen koulutus'
				WHEN LEFT(lahde,1) = '5' THEN 'Ei opiskele (opiskellut korkeakoulussa)'
				ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
			END,
			CASE
				WHEN RIGHT(lahde,1) = '1' THEN ' (1 vuosi)'
				ELSE ' (' + RIGHT(lahde,1) + ' vuotta)'
			END)
	END as 'Lähde',
	CONCAT(
		CASE
			WHEN LEFT(kohde,1) = '1' THEN 'Yliopistokoulutus'
			WHEN LEFT(kohde,1) = '2' THEN 'Ammattikorkeakoulukoulutus'
			WHEN LEFT(kohde,1) = '3' THEN 'Lukiokoulutus'
			WHEN LEFT(kohde,1) = '4' THEN 'Ammatillinen koulutus'
			WHEN LEFT(kohde,1) = '5' THEN 'Ei opiskele (opiskellut korkeakoulussa)'
			ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
		END,
		CASE
			WHEN RIGHT(kohde,1) = '1' THEN ' (1 vuosi)'
			ELSE ' (' + RIGHT(kohde,1) + ' vuotta)'
	END) as 'Kohde',
	CASE
		WHEN tilanne_0 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_0 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_0 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_0 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_0 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (0 vuotta)',
	CASE
		WHEN tilanne_1 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_1 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_1 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_1 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_1 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (1 vuosi)',
	CASE
		WHEN tilanne_2 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_2 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_2 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_2 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_2 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (2 vuotta)',
	CASE
		WHEN tilanne_3 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_3 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_3 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_3 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_3 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (3 vuotta)',
	CASE
		WHEN tilanne_4 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_4 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_4 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_4 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_4 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (4 vuotta)',
	CASE
		WHEN tilanne_5 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_5 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_5 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_5 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_5 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (5 vuotta)',
	CASE
		WHEN tilanne_6 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_6 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_6 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_6 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_6 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (6 vuotta)',
	CASE
		WHEN tilanne_7 = 1 THEN 'Yliopistokoulutus'
		WHEN tilanne_7 = 2 THEN 'Ammattikorkeakoulukoulutus'
		WHEN tilanne_7 = 3 THEN 'Lukiokoulutus'
		WHEN tilanne_7 = 4 THEN 'Ammatillinen koulutus'
		WHEN tilanne_7 = 5 THEN 'Ei opiskele (opiskellut korkeakoulussa)'
		ELSE 'Ei opiskele (ei ole opiskellut korkeakoulussa)'
	END as 'Tilanne (7 vuotta)',
	tilanne_0 as tilanne_0_jarj,
	tilanne_1 as tilanne_1_jarj,
	tilanne_2 as tilanne_2_jarj,
	tilanne_3 as tilanne_3_jarj,
	tilanne_4 as tilanne_4_jarj,
	tilanne_5 as tilanne_5_jarj,
	tilanne_6 as tilanne_6_jarj,
	tilanne_7 as tilanne_7_jarj,

	COALESCE(d1.sukupuoli, 'Tieto puuttuu') as Sukupuoli,
	COALESCE(d2.maakunta, 'Tieto puuttuu') as 'Kotimaakunta (9. luokan päättöhetkellä)',
	d2.jarjestys_maakunta,
	CASE
		WHEN jaksot = 8 THEN '0-7'
		WHEN jaksot = 5 THEN '0-3 & 7'
		WHEN jaksot = 4 THEN '0-2 & 7'
	END as 'Tarkastelujaksot',

	s.lkm

FROM VipunenTK_DW.dbo.sa_K3_13b_Perusk_paattaneet_visualisointi_lopullinen s
LEFT JOIN VipunenTK_DW.dbo.d_sukupuoli d1 on d1.sukupuoli_koodi = s.sp
LEFT JOIN VipunenTK.dbo.d_alueluokitus d2 on d2.kunta_koodi = s.tutkaskun
GO


