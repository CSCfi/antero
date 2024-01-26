USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_poistuma_ja_f_poistuma_kertoimet]    Script Date: 19.12.2023 15:02:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/

ALTER procedure [dbo].[p_lataa_f_poistuma_ja_f_poistuma_kertoimet] as

DECLARE @alkuVuosi as int
DECLARE @alkuVuosiB as int
DECLARE @loppuVuosi as int
DECLARE @minVuosi as int
DECLARE @minVuosi2 as int
DECLARE @i as int
SET @alkuVuosi = 2020
SET @loppuVuosi = (SELECT MAX(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v])
SET @minVuosi =
	(CASE 
		WHEN (SELECT MIN(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] WHERE oef_ammatti_id <> -1) > (SELECT MIN(tilv) FROM [VipunenTK].[dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] WHERE oef_ammatti_id <> -1) THEN (SELECT MIN(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] WHERE oef_ammatti_id <> -1)
		ELSE (SELECT MIN(tilv) FROM [VipunenTK].[dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] WHERE oef_ammatti_id <> -1)
	END)


	
TRUNCATE TABLE [VipunenTK].[dbo].[f_poistuma]
TRUNCATE TABLE [VipunenTK].[dbo].[f_poistuma_kertoimet]

WHILE @alkuVuosi <= @loppuVuosi
BEGIN 
	
	SET @i = 3

	DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_tyolliset_5v]
	DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_vuosi] 
	DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]
	DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_kertoimet] 

	-- Työlliset seitsemältä vuodelta ammattiryhmän mukaan

	SELECT  
		tilv,
		d1.oef_ammattiryhma2_koodi,
		d3.ika_int,
		SUM(f.lkm) as tyolliset
	INTO [VipunenTK].[dbo].[temp_tyolliset_5v]
	FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
	LEFT JOIN VipunenTK.dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
	LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
	WHERE tilv BETWEEN @alkuVuosi - 6 and @alkuVuosi and d3.ika_int BETWEEN 1 and 69 and tilv >= @minVuosi
	GROUP BY tilv,d1.oef_ammattiryhma2_koodi,d3.ika_int

	-- Kuolleet ja eläkkeelle jääneet seitsemältä vuodelta ammattiryhmän mukaan

	SELECT
		tilv, 
		d5.ika_int,
		d6.id as d_elakkeelle_siirtynyt_tai_kuollut_id,
		d1.oef_ammattiryhma2_koodi,
		SUM(COALESCE([lkm_elakkeelle_siirtyneet],[lkm_kuolleet])) as lkm
	INTO [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]
	FROM [VipunenTK].[dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] f
	LEFT JOIN VipunenTK.dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
	LEFT JOIN VipunenTK.dbo.d_tietojen_ajankohta d2 on d2.id=f.tietojen_ajankohta_id
	LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.id=f.ika_id
	LEFT JOIN VipunenTK.dbo.d_elakkeelle_siirtynyt_tai_kuollut d6 on d6.id=f.elakkeelle_siirtynyt_tai_kuollut_id
	WHERE tilv BETWEEN  @alkuVuosi - 6 and @alkuVuosi and d2.tietojen_ajankohta = '1v aiemmin' and d6.elakkeelle_siirtynyt_tai_kuollut in ('Työkyvyttömyyseläke (sis. työuraeläkkeen)', 'Vanhuuseläke', 'Kuollut')
	GROUP BY tilv,d5.ika_int, d6.id, d1.oef_ammattiryhma2_koodi
	
	-- Poistuma kertoimien lasku. Kertoimet lasketaan 3, 5 ja 7 vuoden ajanjaksoilta
	
	WHILE @i <= 7
	BEGIN

		DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_kertoimet] 

		SELECT
			f.ika_int,
			d.id as d_oef_ammatti_id,
			f.d_elakkeelle_siirtynyt_tai_kuollut_id, 
			f.kerroin,
			f.vuodet
		INTO [VipunenTK].[dbo].[temp_poistuma_kertoimet]
		FROM (
			SELECT
				f.ika_int, 
				f.oef_ammattiryhma2_koodi, 
				f2.d_elakkeelle_siirtynyt_tai_kuollut_id, 
				cast(sum(f2.lkm) as float) / cast(sum(f.tyolliset) as float) as kerroin,
				@i as vuodet
			FROM [VipunenTK].[dbo].[temp_tyolliset_5v] f
			LEFT JOIN [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v] f2 on f.oef_ammattiryhma2_koodi = f2.oef_ammattiryhma2_koodi and f.ika_int = f2.ika_int - 1 and f.tilv = f2.tilv
			WHERE f.tilv BETWEEN @alkuVuosi - @i + 1 and @alkuVuosi
			GROUP BY f.ika_int,f.oef_ammattiryhma2_koodi,f2.d_elakkeelle_siirtynyt_tai_kuollut_id
		) f
		OUTER APPLY (
			SELECT MAX(id) as id FROM VipunenTK.dbo.d_oef_ammatti d
			WHERE d.oef_ammattiryhma2_koodi = f.oef_ammattiryhma2_koodi
		) d

		INSERT INTO [VipunenTK].[dbo].[f_poistuma_kertoimet]
		SELECT @alkuVuosi as tilastovuosi, f.* FROM [VipunenTK].[dbo].[temp_poistuma_kertoimet] f

		SET @i = @i + 2

	END


	INSERT INTO [VipunenTK].[dbo].[f_poistuma]
	SELECT
		f.tilastovuosi,
		f.ennustevuosi,  
		d.id as d_oef_ammatti_id,
		f.oef_toimiala_koodi,
		f.ika_int,
		f.tyolliset_3v,
		f.kuolleisuus_3v,
		f.tyokyvyttomyys_3v,
		f.vanhuuselake_3v,
		f.poistuma_3v,
		f.tyolliset_5v,
		f.kuolleisuus_5v,
		f.tyokyvyttomyys_5v,
		f.vanhuuselake_5v,
		f.poistuma_5v,
		f.tyolliset_7v,
		f.kuolleisuus_7v,
		f.tyokyvyttomyys_7v,
		f.vanhuuselake_7v,
		f.poistuma_7v
	FROM (
		SELECT
			@alkuVuosi as tilastovuosi,
			@alkuVuosi as ennustevuosi,  
			d1.oef_ammattiryhma2_koodi,
			d2.oef_toimiala_koodi,
			d3.ika_int,
			SUM(f.lkm) as tyolliset_3v,
			0 as kuolleisuus_3v,
			0 as tyokyvyttomyys_3v,
			0 as vanhuuselake_3v,
			0 as poistuma_3v,
			SUM(f.lkm) as tyolliset_5v,
			0 as kuolleisuus_5v,
			0 as tyokyvyttomyys_5v,
			0 as vanhuuselake_5v,
			0 as poistuma_5v,
			SUM(f.lkm) as tyolliset_7v,
			0 as kuolleisuus_7v,
			0 as tyokyvyttomyys_7v,
			0 as vanhuuselake_7v,
			0 as poistuma_7v
		FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
		LEFT JOIN VipunenTK.dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
		LEFT JOIN  VipunenTK.dbo.d_oef_toimiala d2 on d2.id=f.oef_toimiala_id
		LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
		WHERE tilv = @alkuVuosi and d3.ika_int BETWEEN 1 and 100 
		GROUP BY d1.oef_ammattiryhma2_koodi,d2.oef_toimiala_koodi,d3.ika_int
	) f
	OUTER APPLY (
		SELECT MAX(id) as id FROM VipunenTk.dbo.d_oef_ammatti d
		WHERE d.oef_ammattiryhma2_koodi = f.oef_ammattiryhma2_koodi
	) d

	SELECT
		f.tilastovuosi,
		f.ennustevuosi,  
		d.id as d_oef_ammatti_id,
		f.oef_toimiala_koodi,
		f.ika_int,
		f.tyolliset_3v,
		f.tyolliset_5v,
		f.tyolliset_7v
	INTO [VipunenTK].[dbo].[temp_poistuma_vuosi] 
	FROM (
		SELECT 
			@alkuVuosi as tilastovuosi,
			@alkuVuosi as ennustevuosi,  
			d1.oef_ammattiryhma2_koodi,
			d2.oef_toimiala_koodi,
			d3.ika_int,
			cast(SUM(f.lkm) as float) as tyolliset_3v,
			cast(SUM(f.lkm) as float) as tyolliset_5v,
			cast(SUM(f.lkm) as float) as tyolliset_7v
		FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
		LEFT JOIN VipunenTK.dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
		LEFT JOIN VipunenTK.dbo.d_oef_toimiala d2 on d2.id=f.oef_toimiala_id
		LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
		WHERE tilv = @alkuVuosi and d3.ika_int BETWEEN 1 and 69
		GROUP BY d1.oef_ammattiryhma2_koodi,d2.oef_toimiala_koodi,d3.ika_int
	) f
	OUTER APPLY (
		SELECT MAX(id) as id FROM VipunenTk.dbo.d_oef_ammatti d
		WHERE d.oef_ammattiryhma2_koodi = f.oef_ammattiryhma2_koodi
	) d

	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_tyolliset_5v]
	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]

	SET @alkuVuosiB = @alkuVuosi + 1

	WHILE @alkuVuosiB <= @alkuVuosi + 20
	BEGIN
		
		INSERT INTO [VipunenTK].[dbo].[f_poistuma]
		SELECT
			p.tilastovuosi,
			p.ennustevuosi,
			p.d_oef_ammatti_id,
			p.oef_toimiala_koodi,
			p.ika_int,
			cast(CASE WHEN p.tyolliset_3v - p.kuolleisuus_3v - p.tyokyvyttomyys_3v - p.vanhuuselake_3v < 0 THEN 0 ELSE p.tyolliset_3v - p.kuolleisuus_3v - p.tyokyvyttomyys_3v - p.vanhuuselake_3v END as float) as tyolliset_3v,
			cast(p.kuolleisuus_3v as float) as kuolleisuus_3v,
			cast(p.tyokyvyttomyys_3v as float) as tyokyvyttomyys_3v,
			cast(p.vanhuuselake_3v as float) as vanhuuselake_3v,
			cast(CASE WHEN p.tyolliset_3v - p.kuolleisuus_3v - p.tyokyvyttomyys_3v - p.vanhuuselake_3v < 0 THEN p.tyolliset_3v ELSE p.kuolleisuus_3v + p.tyokyvyttomyys_3v + p.vanhuuselake_3v END as float) as poistuma_3v,
			cast(CASE WHEN p.tyolliset_5v - p.kuolleisuus_5v - p.tyokyvyttomyys_5v - p.vanhuuselake_5v < 0 THEN 0 ELSE p.tyolliset_5v - p.kuolleisuus_5v - p.tyokyvyttomyys_5v - p.vanhuuselake_5v END as float) as tyolliset_5v,
			cast(p.kuolleisuus_5v as float) as kuolleisuus_5v,
			cast(p.tyokyvyttomyys_5v as float) as tyokyvyttomyys_5v,
			cast(p.vanhuuselake_5v as float) as vanhuuselake_5v,
			cast(CASE WHEN p.tyolliset_5v - p.kuolleisuus_5v - p.tyokyvyttomyys_5v - p.vanhuuselake_5v < 0 THEN p.tyolliset_5v ELSE p.kuolleisuus_5v + p.tyokyvyttomyys_5v + p.vanhuuselake_5v END as float) as poistuma_5v,
			cast(CASE WHEN p.tyolliset_7v - p.kuolleisuus_7v - p.tyokyvyttomyys_7v - p.vanhuuselake_7v < 0 THEN 0 ELSE p.tyolliset_7v - p.kuolleisuus_7v - p.tyokyvyttomyys_7v - p.vanhuuselake_7v END as float) as tyolliset_7v,
			cast(p.kuolleisuus_7v as float) as kuolleisuus_7v,
			cast(p.tyokyvyttomyys_7v as float) as tyokyvyttomyys_7v,
			cast(p.vanhuuselake_7v as float) as vanhuuselake_7v,
			cast(CASE WHEN p.tyolliset_7v - p.kuolleisuus_7v - p.tyokyvyttomyys_7v - p.vanhuuselake_7v < 0 THEN p.tyolliset_7v ELSE p.kuolleisuus_7v + p.tyokyvyttomyys_7v + p.vanhuuselake_7v END as float) as poistuma_7v
		FROM (
			SELECT
				@alkuVuosi as tilastovuosi,
				@alkuVuosiB as ennustevuosi,  
				t.d_oef_ammatti_id,
				t.oef_toimiala_koodi,
				t.ika_int + 1 as ika_int,
				t.tyolliset_3v,
				t.tyolliset_5v,
				t.tyolliset_7v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_3v as float) * cast(coalesce(k3.kerroin,0) as float) ELSE 0 END as kuolleisuus_3v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_3v as float) * cast(coalesce(tk3.kerroin,0) as float) ELSE 0 END as tyokyvyttomyys_3v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_3v as float) * cast(coalesce(v3.kerroin,0) as float) ELSE t.tyolliset_3v END as vanhuuselake_3v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_5v as float) * cast(coalesce(k5.kerroin,0) as float) ELSE 0 END as kuolleisuus_5v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_5v as float) * cast(coalesce(tk5.kerroin,0) as float) ELSE 0 END as tyokyvyttomyys_5v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_5v as float) * cast(coalesce(v5.kerroin,0) as float) ELSE t.tyolliset_5v END as vanhuuselake_5v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_7v as float) * cast(coalesce(k7.kerroin,0) as float) ELSE 0 END as kuolleisuus_7v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_7v as float) * cast(coalesce(tk7.kerroin,0) as float) ELSE 0 END as tyokyvyttomyys_7v,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset_7v as float) * cast(coalesce(v7.kerroin,0) as float) ELSE t.tyolliset_7v END as vanhuuselake_7v
			FROM [VipunenTK].[dbo].[temp_poistuma_vuosi] t
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] k3 on k3.ika_int = t.ika_int and k3.d_oef_ammatti_id = t.d_oef_ammatti_id and k3.d_elakkeelle_siirtynyt_tai_kuollut_id = 6 and k3.vuodet = 3 and t.tilastovuosi = k3.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] v3 on v3.ika_int = t.ika_int and v3.d_oef_ammatti_id = t.d_oef_ammatti_id and v3.d_elakkeelle_siirtynyt_tai_kuollut_id = 1 and v3.vuodet = 3 and t.tilastovuosi = v3.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] tk3 on tk3.ika_int = t.ika_int and tk3.d_oef_ammatti_id = t.d_oef_ammatti_id and tk3.d_elakkeelle_siirtynyt_tai_kuollut_id = 2 and tk3.vuodet = 3 and t.tilastovuosi = tk3.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] k5 on k5.ika_int = t.ika_int and k5.d_oef_ammatti_id = t.d_oef_ammatti_id and k5.d_elakkeelle_siirtynyt_tai_kuollut_id = 6 and k5.vuodet = 5 and t.tilastovuosi = k5.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] v5 on v5.ika_int = t.ika_int and v5.d_oef_ammatti_id = t.d_oef_ammatti_id and v5.d_elakkeelle_siirtynyt_tai_kuollut_id = 1 and v5.vuodet = 5 and t.tilastovuosi = v5.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] tk5 on tk5.ika_int = t.ika_int and tk5.d_oef_ammatti_id = t.d_oef_ammatti_id and tk5.d_elakkeelle_siirtynyt_tai_kuollut_id = 2 and tk5.vuodet = 5 and t.tilastovuosi = tk5.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] k7 on k7.ika_int = t.ika_int and k7.d_oef_ammatti_id = t.d_oef_ammatti_id and k7.d_elakkeelle_siirtynyt_tai_kuollut_id = 6 and k7.vuodet = 7 and t.tilastovuosi = k7.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] v7 on v7.ika_int = t.ika_int and v7.d_oef_ammatti_id = t.d_oef_ammatti_id and v7.d_elakkeelle_siirtynyt_tai_kuollut_id = 1 and v7.vuodet = 7 and t.tilastovuosi = v7.tilastovuosi
			LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] tk7 on tk7.ika_int = t.ika_int and tk7.d_oef_ammatti_id = t.d_oef_ammatti_id and tk7.d_elakkeelle_siirtynyt_tai_kuollut_id = 2 and tk7.vuodet = 7 and t.tilastovuosi = tk7.tilastovuosi
		) p

		DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_vuosi]
		SELECT * INTO [VipunenTK].[dbo].[temp_poistuma_vuosi] FROM (SELECT * FROM [VipunenTK].[dbo].[f_poistuma] WHERE ennustevuosi = @alkuVuosiB and tilastovuosi = @alkuVuosi) f

		SET @alkuVuosiB = @alkuVuosiB + 1
	END

	SET @alkuVuosi = @alkuVuosi + 1

END

DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_tyolliset_5v]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_vuosi] 
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_kertoimet] 

GO

USE [ANTERO]