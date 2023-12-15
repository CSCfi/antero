USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_ammattirakenne_ennuste]    Script Date: 15.12.2023 10:48:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ika]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_vuosi]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammatti]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammattirakenne]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammattirakenne_tyolliset]

GO


/****** Script for SelectTopNRows command from SSMS  ******/

ALTER procedure [dbo].[p_lataa_f_ammattirakenne_ennuste] as

DECLARE @min_ika as INT
DECLARE @max_ika as INT
DECLARE @min_vuosi as INT
DECLARE @max_vuosi as INT

SET @min_ika = (SELECT MIN(d3.ika_int) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id)
SET @max_ika = (SELECT MAX(d3.ika_int) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id)
SET @min_vuosi = (SELECT MIN(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f)
SET @max_vuosi = (SELECT MAX(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f)

DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ika]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_vuosi]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammatti]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammattirakenne]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammattirakenne_tyolliset]

TRUNCATE TABLE [VipunenTK].[dbo].[f_ammattirakenne_ennuste]

-- Luodaan taulu, jossa on kaikki ikä-tilastovuosi-ammattiryhmä-toimiala -yhdistelmät

SELECT ika, 1 as i INTO [VipunenTK].[dbo].[temp_ika]
FROM (SELECT TOP (@max_ika) ROW_NUMBER() OVER (ORDER BY [object_id]) as ika
FROM sys.all_columns) f WHERE f.ika >= @min_ika

SELECT vuosi, 1 as i INTO [VipunenTK].[dbo].[temp_vuosi]
FROM (SELECT TOP (@max_vuosi) ROW_NUMBER() OVER (ORDER BY [object_id]) as vuosi
FROM sys.all_columns) f WHERE f.vuosi >= @min_vuosi

SELECT oef_ammatti_id, oef_toimiala_id INTO [VipunenTK].[dbo].[temp_ammatti]
FROM (SELECT DISTINCT oef_ammatti_id, oef_toimiala_id FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v]) f

SELECT DISTINCT d1.id as oef_ammatti_id, d2.id as oef_toimiala_id, t.ika, t2.vuosi 
INTO [VipunenTK].[dbo].[temp_ammattirakenne]
FROM [VipunenTK].[dbo].[temp_ammatti] f
LEFT JOIN [VipunenTK].dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
LEFT JOIN [VipunenTK].dbo.d_oef_toimiala d2 on d2.id=f.oef_toimiala_id
LEFT JOIN [VipunenTK].[dbo].[temp_ika] t on t.i = 1
LEFT JOIN [VipunenTK].[dbo].[temp_vuosi] t2 on t2.i = 1

-- Haetaan lukumäärä tiedot toiseen tauluun

SELECT 
	[tilv],
	f.oef_ammatti_id,
	f.oef_toimiala_id,
	d.ika_int,
	SUM([lkm]) as lkm,
	SUM(CASE WHEN d2.aidinkieli_versio1_koodi = '99' THEN [lkm] ELSE 0 END) as vieraskieliset_lkm
INTO [VipunenTK].[dbo].[temp_ammattirakenne_tyolliset]
FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
LEFT JOIN VipunenTK.dbo.d_ika d on d.id=f.ika_id
LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d2 on d2.id=f.aikielir1_id
GROUP BY [tilv], f.oef_ammatti_id, f.oef_toimiala_id, d.ika_int

-- Yhdistetään taulujen tiedot

INSERT INTO [VipunenTK].[dbo].[f_ammattirakenne_ennuste]
SELECT 
	t1.vuosi as tilv,
	t1.ika,
	t1.oef_ammatti_id,
	t1.oef_toimiala_id,
	COALESCE(t2.lkm,0) as lkm,
	COALESCE(t2.vieraskieliset_lkm,0) as vieraskieliset_lkm
FROM [VipunenTK].[dbo].[temp_ammattirakenne] t1
LEFT JOIN [VipunenTK].[dbo].[temp_ammattirakenne_tyolliset] t2 on t1.ika = t2.ika_int and t1.oef_ammatti_id = t2.oef_ammatti_id and t1.oef_toimiala_id = t2.oef_toimiala_id and t1.vuosi = t2.tilv

DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ika]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_vuosi]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammatti]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammattirakenne]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_ammattirakenne_tyolliset]


GO

USE [ANTERO]