USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_poistuma_ja_f_poistuma_kertoimet]    Script Date: 12.9.2023 9:50:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/

CREATE procedure [dbo].[p_lataa_f_poistuma_ja_f_poistuma_kertoimet] as

DECLARE @alkuVuosi as int
DECLARE @alkuVuosiB as int
DECLARE @loppuVuosi as int
SET @alkuVuosi = 2020
SET @loppuVuosi = (SELECT MAX(tilv) FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v])

TRUNCATE TABLE [VipunenTK].[dbo].[f_poistuma]
TRUNCATE TABLE [VipunenTK].[dbo].[f_poistuma_kertoimet]

WHILE @alkuVuosi <= @loppuVuosi
BEGIN

	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_tyolliset_5v]
	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]
	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_poistuma_kertoimet] 

	-- Työlliset viideltä vuodelta ammattiryhmän mukaan

	SELECT  
		d1.mitenna_ammattiryhma2_koodi,
		--d2.id as d_mitenna_toimiala_id,
		d3.ika_int,
		SUM(f.lkm) as tyolliset
	INTO [VipunenTK].[dbo].[temp_tyolliset_5v]
	FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
	LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
	--LEFT JOIN  dbo.d_mitenna_toimiala d2 on d2.id=f.mitenna_toimiala_id
	LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
	WHERE tilv BETWEEN @alkuVuosi - 4 and @alkuVuosi and d3.ika_int BETWEEN 1 and 69
	GROUP BY d1.mitenna_ammattiryhma2_koodi,d3.ika_int

	-- Kuolleet ja eläkkeelle jääneet viideltä vuodelta ammattiryhmän mukaan

	SELECT 
		d5.ika_int,
		d6.id as d_elakkeelle_siirtynyt_tai_kuollut_id,
		d1.mitenna_ammattiryhma2_koodi,
		SUM(COALESCE([lkm_elakkeelle_siirtyneet],[lkm_kuolleet])) as lkm
	INTO [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]
	FROM [VipunenTK].[dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] f
	LEFT JOIN VipunenTK.dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
	LEFT JOIN VipunenTK.dbo.d_tietojen_ajankohta d2 on d2.id=f.tietojen_ajankohta_id
	LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.id=f.ika_id
	LEFT JOIN VipunenTK.dbo.d_elakkeelle_siirtynyt_tai_kuollut d6 on d6.id=f.elakkeelle_siirtynyt_tai_kuollut_id
	WHERE tilv BETWEEN  @alkuVuosi - 4 and @alkuVuosi and d2.tietojen_ajankohta = '1v aiemmin' and d6.elakkeelle_siirtynyt_tai_kuollut in ('Työkyvyttömyyseläke (sis. työuraeläkkeen)', 'Vanhuuseläke', 'Kuollut')
	GROUP BY d5.ika_int, d6.id, d1.mitenna_ammattiryhma2_koodi
	
	-- Poistuma kertoimien lasku

	SELECT
		f.ika_int, 
		f.mitenna_ammattiryhma2_koodi, 
		f2.d_elakkeelle_siirtynyt_tai_kuollut_id, 
		cast(f2.lkm as float) / cast(f.tyolliset as float) as kerroin
	INTO [VipunenTK].[dbo].[temp_poistuma_kertoimet]  
	FROM [VipunenTK].[dbo].[temp_tyolliset_5v] f
	LEFT JOIN [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v] f2 on f.mitenna_ammattiryhma2_koodi = f2.mitenna_ammattiryhma2_koodi and f.ika_int = f2.ika_int - 1

	INSERT INTO [VipunenTK].[dbo].[f_poistuma_kertoimet]
	SELECT @alkuVuosi as tilastovuosi, f.* FROM [VipunenTK].[dbo].[temp_poistuma_kertoimet] f

	INSERT INTO [VipunenTK].[dbo].[f_poistuma]
	SELECT
		@alkuVuosi as tilastovuosi,
		@alkuVuosi as ennustevuosi,  
		d1.mitenna_ammattiryhma2_koodi,
		d2.mitenna_toimiala1_koodi,
		d3.ika_int,
		SUM(f.lkm) as tyolliset,
		0 as kuolleisuus,
		0 as tyokyvyttomyys,
		0 as vanhuuselake,
		0 as poistuma
	FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
	LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
	LEFT JOIN  dbo.d_mitenna_toimiala d2 on d2.id=f.mitenna_toimiala_id
	LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
	WHERE tilv = @alkuVuosi and d3.ika_int BETWEEN 1 and 100
	GROUP BY d1.mitenna_ammattiryhma2_koodi,d2.mitenna_toimiala1_koodi,d3.ika_int

	SELECT
		@alkuVuosi as tilastovuosi,
		@alkuVuosi as ennustevuosi,  
		d1.mitenna_ammattiryhma2_koodi,
		d2.mitenna_toimiala1_koodi,
		d3.ika_int,
		cast(SUM(f.lkm) as float) as tyolliset
	INTO [VipunenTK].[dbo].[temp_poistuma_vuosi] 
	FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
	LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
	LEFT JOIN  dbo.d_mitenna_toimiala d2 on d2.id=f.mitenna_toimiala_id
	LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
	WHERE tilv = @alkuVuosi and d3.ika_int BETWEEN 1 and 69
	GROUP BY d1.mitenna_ammattiryhma2_koodi,d2.mitenna_toimiala1_koodi,d3.ika_int

	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_tyolliset_5v]
	DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]

	SET @alkuVuosiB = @alkuVuosi + 1

	WHILE @alkuVuosiB <= @alkuVuosi + 20
	BEGIN
		
		INSERT INTO [VipunenTK].[dbo].[f_poistuma]
		SELECT
			p.tilastovuosi,
			p.ennustevuosi,
			p.mitenna_ammattiryhma2_koodi,
			p.mitenna_toimiala1_koodi,
			p.ika_int,
			cast(CASE WHEN p.tyolliset - p.kuolleisuus - p.tyokyvyttomyys - p.vanhuuselake < 0 THEN 0 ELSE p.tyolliset - p.kuolleisuus - p.tyokyvyttomyys - p.vanhuuselake END as float) as tyolliset,
			cast(p.kuolleisuus as float) as kuolleisuus,
			cast(p.tyokyvyttomyys as float) as tyokyvyttomyys,
			cast(p.vanhuuselake as float) as vanhuuselake,
			cast(CASE WHEN p.tyolliset - p.kuolleisuus - p.tyokyvyttomyys - p.vanhuuselake < 0 THEN p.tyolliset ELSE p.kuolleisuus + p.tyokyvyttomyys + p.vanhuuselake END as float) as poistuma
		FROM (
			SELECT
				@alkuVuosi as tilastovuosi,
				@alkuVuosiB as ennustevuosi,  
				t.mitenna_ammattiryhma2_koodi,
				t.mitenna_toimiala1_koodi,
				t.ika_int + 1 as ika_int,
				t.tyolliset,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset as float) * cast(coalesce(k.kerroin,0) as float) ELSE 0 END as kuolleisuus,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset as float) * cast(coalesce(tk.kerroin,0) as float) ELSE 0 END as tyokyvyttomyys,
				CASE WHEN t.ika_int + 1 < 70 THEN cast(t.tyolliset as float) * cast(coalesce(v.kerroin,0) as float) ELSE t.tyolliset END as vanhuuselake
			FROM [VipunenTK].[dbo].[temp_poistuma_vuosi] t
			LEFT JOIN [VipunenTK].[dbo].[temp_poistuma_kertoimet] k on k.ika_int = t.ika_int and k.mitenna_ammattiryhma2_koodi = t.mitenna_ammattiryhma2_koodi and k.d_elakkeelle_siirtynyt_tai_kuollut_id = 6
			LEFT JOIN [VipunenTK].[dbo].[temp_poistuma_kertoimet] v on v.ika_int = t.ika_int and v.mitenna_ammattiryhma2_koodi = t.mitenna_ammattiryhma2_koodi and v.d_elakkeelle_siirtynyt_tai_kuollut_id = 1
			LEFT JOIN [VipunenTK].[dbo].[temp_poistuma_kertoimet] tk on tk.ika_int = t.ika_int and tk.mitenna_ammattiryhma2_koodi = t.mitenna_ammattiryhma2_koodi and tk.d_elakkeelle_siirtynyt_tai_kuollut_id = 2
		) p

		DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_vuosi]
		SELECT * INTO [VipunenTK].[dbo].[temp_poistuma_vuosi] FROM (SELECT * FROM [VipunenTK].[dbo].[f_poistuma] WHERE ennustevuosi = @alkuVuosiB) f

		SET @alkuVuosiB = @alkuVuosiB + 1
	END

	SET @alkuVuosi = @alkuVuosi + 1

END

GO

DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_kertoimet] 
DROP TABLE IF EXISTS [VipunenTK].[dbo].[temp_poistuma_vuosi]
DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_tyolliset_5v]
DROP TABLE IF EXISTS  [VipunenTK].[dbo].[temp_elakkeelle_siirtyneet_ja_kuolleet_5v]

GO		
		
USE [ANTERO]