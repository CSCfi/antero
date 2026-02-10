USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_vastaavuusavain]    Script Date: 10.2.2026 9.59.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/

ALTER   procedure [dbo].[p_lataa_f_vastaavuusavain] as

DECLARE @loppuVuosi INT
DECLARE @alkuVuosi INT
DECLARE @koulutusVuosiTa INT
DECLARE @koulutusVuosiKa INT
SET @alkuVuosi = 2020 
SET @loppuVuosi = (SELECT MAX(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_toimialoittain])
SET @koulutusVuosiTa = (SELECT MAX(tilastointivuosi) as vuosi FROM VipunenTK.[dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot])
SET @koulutusVuosiKa = (SELECT MAX(tilastointivuosi) as vuosi FROM VipunenTK.[dbo].[f_OTV_2_9_Korkeakoulututkinnot] where aineisto <> 'E')


TRUNCATE TABLE VipunenTK.dbo.f_vastaavuusavain

WHILE @alkuVuosi <= @loppuVuosi
BEGIN

	DROP TABLE IF EXISTS VipunenTK.dbo.temp_koulutukset
	
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
		WHERE opetushallinnon_koulutus in (-1,1) AND tilv = @koulutusVuosiTa and f.aloittaneet is not null

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
		where opetushallinnon_koulutus_id <> 2 and tutkinnon_toteuma_id <> 47 and tilastointivuosi = @koulutusVuosiTa and f.lukumaara is not null

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
		where f.aineisto <> 'E' and d8.ensisijainen_opintooikeus_koodi <>  2 and f.koulutusluokitus not in ('-1', '999999') and tilastointivuosi = @koulutusVuosiKa and f.aloittaneet is not null

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
		where f.aineisto <> 'E' and f.koulutusluokitus not in ('-1', '999999') and tilastointivuosi = @koulutusVuosiKa and f.lukumaara is not null
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
			[Ammattiryhmä 1. taso] = d1.oef_ammattiryhma1,
      		[Ammattiryhmä 2. taso] = d1.oef_ammattiryhma2,
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
		LEFT JOIN VipunenTK.dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
		--LEFT JOIN dbo.d_toimiala_tk d2 on d2.id=f.tol2008_id
		LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4 on d4.id=f.koulutusaste_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4b on d4b.id=f.koulutusaste_taso2_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6b on d6b.id=f.koulutusala_taso2_id
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d6c on d6c.id=f.koulutusala_taso3_id
		--LEFT JOIN VipunenTK.dbo.d_oef_toimiala d8 on d8.id=f.oef_toimiala_id
		WHERE	d3.ika5v in ('25–29-vuotiaat', '30–34-vuotiaat', '35–39-vuotiaat', '40–44-vuotiaat') AND 
				tilv between @alkuVuosi -2 AND @alkuVuosi AND
				d4b.Koulutusaste_taso2_koodi IN (-1,31,32,33,41,51,61,62,71,63,72,73,81,82)
		GROUP BY tilv,d1.oef_ammattiryhma1, d1.oef_ammattiryhma2,
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

TRUNCATE TABLE VipunenTK.dbo.f_vastaavuusavain_tutkinnot

INSERT INTO VipunenTK.dbo.f_vastaavuusavain_tutkinnot

SELECT 
	tilastovuosi = f.[tilastointivuosi],
	d16.id as d_koulutusluokitus_id,
	d5.ika_int,
	COALESCE(SUM(case when d16.Koulutusaste_taso2_koodi in (62,63,71,72,73,81,82,91) then lukumaara else 0 end),0) as tutkinnot	
FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
LEFT JOIN [VipunenTK].[dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
LEFT JOIN [VipunenTK].[dbo].d_lahde d10 ON d10.id = f.lahde_id
LEFT JOIN [VipunenTK].[dbo].d_ika d5 ON d5.id = f.ika_id
LEFT JOIN [VipunenTK].[dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
WHERE d10.lahde_koodi in ('-1','41','42','51','52') AND d9.oppilaitoskoodi NOT IN ('02557','10031','02358')
AND coalesce(d9.oppilaitoksen_korvaavakoodi,d9.oppilaitoskoodi) not in ('01029','01569','10102') 
AND f.tilastointivuosi >= 2017 and d5.ika_int BETWEEN 15 and 64
AND ((d7.koulutustyyppi in ('Ammattikorkeakoulututkinto, päivätoteutus', 'Ammattikorkeakoulututkinto, monimuotototeutus') and d16.Koulutusaste_taso2_koodi = '62') or (d16.Koulutusaste_taso2_koodi in ('71','72','81','82') or (d16.iscfi2013_koodi = '0112' and d16.Koulutusaste_taso2_koodi = '63')))
AND f.aineisto = 'L'
GROUP BY [tilastointivuosi], d5.ika_int, d16.id

UNION ALL

SELECT 
	tilastovuosi = f.tilastointivuosi ,
	d16.id as d_koulutusluokitus_id,
	f.ika as ika_int,
	COALESCE(SUM(lukumaara),0)  as tutkinnot
FROM VipunenTK.[dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] f
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
LEFT JOIN VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d27 on d27.id=f.koulutuksen_tavoite_toteuma_id
WHERE d15.ammatillisen_koulutuksen_koulutuslaji in ('ammatillinen perustutkinto', 'ammattitutkinto', 'erikoisammattitutkinto') and f.tilastointivuosi >= 2017 and 
f.ika BETWEEN 15 and 64
AND d27.koulutuksen_tavoite_toteuma = 'Koko tutkinto'
GROUP BY f.tilastointivuosi, d16.id, f.ika