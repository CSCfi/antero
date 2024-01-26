USE [VipunenTK_DW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--exec [dbo].[p_lataa_f_1_23]

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_1_23] AS

DROP TABLE IF EXISTS VipunenTK.dbo.f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet

SELECT 

	[tilv]

	--painotetut (ainakin osa, ennen mahd. ryhmittelyä)
	,[ikar6]
	,d_ikar6_id = coalesce(d1.id, -1)
	,[sp]
	,d_sp_id = coalesce(d2.id, -1)
	,[tilvaskunryh]
	,d_tilvaskunryh_id = coalesce(d3.id, -1)
	,[kaste_t0] --d4

	--haastatteluhetki
	,[soseh]
	,d_soseh_id = coalesce(d5.id, -1)
	,[ptoim1r9h]
	,d_ptoim1r9h_id = coalesce(d6.id, -1)
	,[psaajah]
	,d_psaajah_id = coalesce(d7.id, -1)

	--1/2
	,[tutk]
	,[eitutk]
	,[ammko]
	,[heko]
	,[muuko]

	--lkm
	,[painoaku]

INTO VipunenTK.dbo.f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet 

FROM [VipunenTK_SA].[dbo].[v_sa_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet] t
LEFT JOIN VipunenTK.dbo.d_ika d1 on d1.ika_avain = concat('ikar6_', ikar6)
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 on d2.sukupuoli_koodi = sp
LEFT JOIN VipunenTK.dbo.d_kuntaryhma d3 on d3.kuntaryhma_koodi = tilvaskunryh
--LEFT JOIN VipunenTK.dbo.d_koulutustaso d4 on d4.koulutustaso_koodi = kaste_t0
LEFT JOIN VipunenTK.dbo.d_sosioekonominen_asema d5 on d5.sosioekonominen_asema_koodi = soseh
LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_versio9 d6 on d6.paaasiallinen_toiminta_versio9_koodi = ptoim1r9h
LEFT JOIN VipunenTK.dbo.d_kylla_ei d7 on d7.kylla_ei_koodi = psaajah

