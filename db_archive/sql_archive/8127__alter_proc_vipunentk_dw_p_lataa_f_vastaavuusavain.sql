USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_vastaavuusavain]    Script Date: 3.10.2023 8:09:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/

ALTER   procedure  [dbo].[p_lataa_f_vastaavuusavain] as

DECLARE @loppuVuosi INT
DECLARE @alkuVuosi INT
DECLARE @koulutusVuosi INT
SET @alkuVuosi = 2020 
SET @loppuVuosi = (SELECT MAX(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_toimialoittain])
SET @koulutusVuosi = (SELECT MAX(vuosi) FROM (
	SELECT MAX(tilastointivuosi) as vuosi FROM VipunenTK.[dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] UNION ALL
	SELECT MAX(tilastointivuosi) as vuosi FROM VipunenTK.[dbo].[f_OTV_2_9_Korkeakoulututkinnot] where aineisto <> 'E') f)


TRUNCATE TABLE VipunenTK.dbo.f_vastaavuusavain

DROP TABLE IF EXISTS VipunenTK.dbo.temp_koulutukset

WHILE @alkuVuosi <= @loppuVuosi
BEGIN
	SELECT * INTO VipunenTK.dbo.temp_koulutukset FROM (
		SELECT DISTINCT
			d4.iscfi2013_koodi,
			CASE
				WHEN d4.Koulutusaste_taso2_koodi IN (-1) THEN -1
				WHEN d4.Koulutusaste_taso2_koodi IN (31) THEN 1
				WHEN d4.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 2
				WHEN d4.Koulutusaste_taso2_koodi IN (62,71) THEN 3
				WHEN d4.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 4
			END as Koulutusaste
		FROM VipunenTK.[dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
		WHERE opetushallinnon_koulutus in (-1,1) AND tilv = @koulutusVuosi and f.aloittaneet is not null

		UNION ALL

		SELECT DISTINCT
			d4.iscfi2013_koodi,
			CASE
				WHEN d4.Koulutusaste_taso2_koodi IN (-1) THEN -1
				WHEN d4.Koulutusaste_taso2_koodi IN (31) THEN 1
				WHEN d4.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 2
				WHEN d4.Koulutusaste_taso2_koodi IN (62,71) THEN 3
				WHEN d4.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 4
			END as Koulutusaste
		From VipunenTK.[dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] f
		left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
		where opetushallinnon_koulutus_id <> 2 and tutkinnon_toteuma_id <> 47 and tilastointivuosi = @koulutusVuosi and f.lukumaara is not null

		UNION ALL

		SELECT DISTINCT
			d4.iscfi2013_koodi,
			CASE
				WHEN d4.Koulutusaste_taso2_koodi IN (-1) THEN -1
				WHEN d4.Koulutusaste_taso2_koodi IN (31) THEN 1
				WHEN d4.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 2
				WHEN d4.Koulutusaste_taso2_koodi IN (62,71) THEN 3
				WHEN d4.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 4
			END as Koulutusaste
		From VipunenTK.[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
		left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
		left join VipunenTK.dbo.d_ensisijainen_opintooikeus d8 on d8.id=f.ensisijainen_opintooikeus_id
		left join VipunenTK.dbo.d_koulutustyyppi d9 on d9.id=f.koulutustyyppi_id
		where f.aineisto <> 'E' and d8.ensisijainen_opintooikeus_koodi <>  2 and f.koulutusluokitus not in ('-1', '999999') and tilastointivuosi = @koulutusVuosi and f.aloittaneet is not null

		UNION ALL

		SELECT DISTINCT
			d4.iscfi2013_koodi,
			CASE
				WHEN d4.Koulutusaste_taso2_koodi IN (-1) THEN -1
				WHEN d4.Koulutusaste_taso2_koodi IN (31) THEN 1
				WHEN d4.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 2
				WHEN d4.Koulutusaste_taso2_koodi IN (62,71) THEN 3
				WHEN d4.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 4
			END as Koulutusaste
		FROM VipunenTK.[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
		left join VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusluokitus_id
		where f.aineisto <> 'E' and f.koulutusluokitus not in ('-1', '999999') and tilastointivuosi = @koulutusVuosi and f.lukumaara is not null
	) f	
	
	INSERT INTO VipunenTK.dbo.f_vastaavuusavain
	SELECT
		@alkuVuosi as Tilastovuosi,
		avg(cast(lkm as float)) as lkm,
		[Ammattiryhmä 1. taso],
		[Ammattiryhmä 2. taso],
		CASE
			WHEN f.Koulutusaste = -1 THEN 'Tuntematon'
			WHEN f.Koulutusaste = 1 THEN 'Lukiokoulutus'
			WHEN f.Koulutusaste = 2 THEN 'Ammatillinen koulutus'
			WHEN f.Koulutusaste = 3 THEN 'Ammattikorkeakoulukoulutus'
			WHEN f.Koulutusaste = 4 THEN 'Yliopistokoulutus'
		END as Koulutusaste,
		[Koulutusala, taso 1],
		[Koulutusala, taso 2],
		[Koulutusala, taso 3],
		CASE WHEN t.Koulutusaste is null THEN 0 ELSE 1 END as koulutusta_jarjestetaan,
		f.jarj_koulutusala_taso1,
		f.jarj_koulutusala_taso2,
		f.jarj_koulutusala_taso3,
		f.jarjestys_ammattiryhma1,
		f.jarjestys_ammattiryhma2,
		f.Koulutusaste as jarjestys_koulutusaste
	FROM (
		SELECT 
			[Tilastovuosi] = [tilv],
			SUM([lkm]) as lkm,
			[Ammattiryhmä 1. taso] = d1.mitenna_ammattiryhma1,
      		[Ammattiryhmä 2. taso] = d1.mitenna_ammattiryhma2,
			--[Toimiala 1. taso] = d8.mitenna_toimiala1,
			--[Toimiala 2. taso] = d8.mitenna_toimiala2,
			CASE
				WHEN d4b.Koulutusaste_taso2_koodi IN (-1) THEN -1
				WHEN d4b.Koulutusaste_taso2_koodi IN (31) THEN 1
				WHEN d4b.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 2
				WHEN d4b.Koulutusaste_taso2_koodi IN (62,71) THEN 3
				WHEN d4b.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 4
			END as Koulutusaste,
			[Koulutusala, taso 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013 else d6c.iscfibroad2013 end,
			[Koulutusala, taso 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013 else d6c.iscfinarrow2013 end,
			[Koulutusala, taso 3] = d6c.iscfi2013,
			d6c.iscfi2013_koodi,
			jarj_koulutusala_taso1 = case f.koulutusala_taso3_id when -1 then d6b.jarjestys_iscfibroad2013 else d6c.jarjestys_iscfibroad2013 end,
			jarj_koulutusala_taso2 = case f.koulutusala_taso3_id when -1 then d6b.jarjestys_iscfinarrow2013 else d6c.jarjestys_iscfinarrow2013 end,
			jarj_koulutusala_taso3 = d6c.jarjestys_iscfi2013,
			d1.jarjestys_ammattiryhma1,
			d1.jarjestys_ammattiryhma2
		FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_toimialoittain] f
		LEFT JOIN VipunenTK.dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
		--LEFT JOIN dbo.d_toimiala_tk d2 on d2.id=f.tol2008_id
		LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusaste_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4b on d4b.id=f.koulutusaste_taso2_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6b on d6b.id=f.koulutusala_taso2_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6c on d6c.id=f.koulutusala_taso3_id
		LEFT JOIN VipunenTK.dbo.d_mitenna_toimiala d8 on d8.id=f.mitenna_toimiala_id
		WHERE	d3.ika5v in ('25–29-vuotiaat', '30–34-vuotiaat', '35–39-vuotiaat', '40–44-vuotiaat') AND 
				tilv between @alkuVuosi -2 AND @alkuVuosi AND
				d4b.Koulutusaste_taso2_koodi IN (-1,31,32,33,41,51,61,62,71,3,72,73,81,82)
		GROUP BY tilv,d1.mitenna_ammattiryhma1, d1.mitenna_ammattiryhma2,
		CASE
			WHEN d4b.Koulutusaste_taso2_koodi IN (-1) THEN -1
			WHEN d4b.Koulutusaste_taso2_koodi IN (31) THEN 1
			WHEN d4b.Koulutusaste_taso2_koodi IN (32,33,41,51,61) THEN 2
			WHEN d4b.Koulutusaste_taso2_koodi IN (62,71) THEN 3
			WHEN d4b.Koulutusaste_taso2_koodi IN (63,72,73,81,82) THEN 4
		END,
		case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013 else d6c.iscfibroad2013 end,
		case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013 else d6c.iscfinarrow2013 end,
		d6c.iscfi2013,
		d6c.iscfi2013_koodi,
		case f.koulutusala_taso3_id when -1 then d6b.jarjestys_iscfibroad2013 else d6c.jarjestys_iscfibroad2013 end,
		case f.koulutusala_taso3_id when -1 then d6b.jarjestys_iscfinarrow2013 else d6c.jarjestys_iscfinarrow2013 end,
		d6c.jarjestys_iscfi2013,
		d1.jarjestys_ammattiryhma1,
		d1.jarjestys_ammattiryhma2
	) f
	LEFT JOIN VipunenTK.dbo.temp_koulutukset t on t.iscfi2013_koodi = f.iscfi2013_koodi and t.Koulutusaste = f.Koulutusaste
	GROUP BY 
	[Ammattiryhmä 1. taso],[Ammattiryhmä 2. taso],
	CASE
		WHEN f.Koulutusaste = -1 THEN 'Tuntematon'
		WHEN f.Koulutusaste = 1 THEN 'Lukiokoulutus'
		WHEN f.Koulutusaste = 2 THEN 'Ammatillinen koulutus'
		WHEN f.Koulutusaste = 3 THEN 'Ammattikorkeakoulukoulutus'
		WHEN f.Koulutusaste = 4 THEN 'Yliopistokoulutus'
	END,
	[Koulutusala, taso 1],[Koulutusala, taso 2],[Koulutusala, taso 3], CASE WHEN t.Koulutusaste is null THEN 0 ELSE 1 END,
	f.jarj_koulutusala_taso1,f.jarj_koulutusala_taso2,f.jarj_koulutusala_taso3,f.jarjestys_ammattiryhma1, f.jarjestys_ammattiryhma2,f.Koulutusaste

	SET @alkuVuosi = @alkuVuosi + 1

END

DROP TABLE IF EXISTS VipunenTK.dbo.temp_koulutukset


GO

USE [ANTERO]