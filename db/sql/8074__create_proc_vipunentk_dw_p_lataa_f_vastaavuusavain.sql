USE [VipunenTK_DW]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/

CREATE OR ALTER procedure [dbo].[p_lataa_f_vastaavuusavain] as

DECLARE @loppuVuosi INT
DECLARE @alkuVuosi INT
SET @alkuVuosi = 2020 
SET @loppuVuosi = (SELECT MAX(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_toimialoittain])

TRUNCATE TABLE VipunenTK.dbo.f_vastaavuusavain

WHILE @alkuVuosi <= @loppuVuosi
BEGIN
	
	INSERT INTO VipunenTK.dbo.f_vastaavuusavain
	SELECT
		@alkuVuosi as Tilastovuosi,
		avg(cast(lkm as float)) as lkm,
		[Ammattiryhmä 1. taso],
		[Ammattiryhmä 2. taso],
		Koulutusaste,
		[Koulutusala, taso 1],
		[Koulutusala, taso 2],
		[Koulutusala, taso 3]
	FROM (
		SELECT 
			[Tilastovuosi] = [tilv],
			SUM([lkm]) as lkm,
			[Ammattiryhmä 1. taso] = d1.mitenna_ammattiryhma1,
      		[Ammattiryhmä 2. taso] = d1.mitenna_ammattiryhma2,
			--[Toimiala 1. taso] = d8.mitenna_toimiala1,
			--[Toimiala 2. taso] = d8.mitenna_toimiala2,
			CASE
				WHEN d4b.Koulutusaste_taso2_koodi IN (-1) THEN 'Tuntematon'
				WHEN d4b.Koulutusaste_taso2_koodi IN (31) THEN 'Lukiokoulutus'
				WHEN d4b.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 'Ammatillinen koulutus'
				WHEN d4b.Koulutusaste_taso2_koodi IN (62,71) THEN 'Ammattikorkeakoulukoulutus'
				WHEN d4b.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 'Yliopistokoulutus'
			END as Koulutusaste,
			[Koulutusala, taso 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013 else d6c.iscfibroad2013 end,
			[Koulutusala, taso 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013 else d6c.iscfinarrow2013 end,
			[Koulutusala, taso 3] = d6c.iscfi2013
		FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_toimialoittain] f
		LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
		--LEFT JOIN dbo.d_toimiala_tk d2 on d2.id=f.tol2008_id
		LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
		LEFT JOIN dbo.d_koulutusluokitus d4 on d4.id=f.koulutusaste_id
		LEFT JOIN dbo.d_koulutusluokitus d4b on d4b.id=f.koulutusaste_taso2_id
		LEFT JOIN dbo.d_koulutusluokitus d6b on d6b.id=f.koulutusala_taso2_id
		LEFT JOIN dbo.d_koulutusluokitus d6c on d6c.id=f.koulutusala_taso3_id
		LEFT JOIN dbo.d_mitenna_toimiala d8 on d8.id=f.mitenna_toimiala_id
		WHERE	d3.ika5v in ('25–29-vuotiaat', '30–34-vuotiaat', '35–39-vuotiaat', '40–44-vuotiaat') AND 
				tilv between @alkuVuosi -2 AND @alkuVuosi AND
				d4b.Koulutusaste_taso2_koodi IN (-1,31,32,33,41,51,61,62,71,3,72,73,81,82)
		GROUP BY tilv,d1.mitenna_ammattiryhma1, d1.mitenna_ammattiryhma2,
		CASE
			WHEN d4b.Koulutusaste_taso2_koodi IN (-1) THEN 'Tuntematon'
			WHEN d4b.Koulutusaste_taso2_koodi IN (31) THEN 'Lukiokoulutus'
			WHEN d4b.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 'Ammatillinen koulutus'
			WHEN d4b.Koulutusaste_taso2_koodi IN (62,71) THEN 'Ammattikorkeakoulukoulutus'
			WHEN d4b.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 'Yliopistokoulutus'
		END,
		case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013 else d6c.iscfibroad2013 end,
		case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013 else d6c.iscfinarrow2013 end,
		d6c.iscfi2013
	) f
	GROUP BY 
	[Ammattiryhmä 1. taso],[Ammattiryhmä 2. taso],Koulutusaste,[Koulutusala, taso 1],[Koulutusala, taso 2],[Koulutusala, taso 3]

	SET @alkuVuosi = @alkuVuosi + 1

END


GO

USE [ANTERO]